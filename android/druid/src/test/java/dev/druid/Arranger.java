package dev.druid;

import static org.robolectric.Shadows.shadowOf;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.location.LocationManager;
import android.net.ConnectivityManager;
import android.net.NetworkCapabilities;
import android.os.BatteryManager;
import android.os.Looper;
import androidx.test.core.app.ApplicationProvider;
import org.robolectric.Robolectric;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.shadows.SensorEventBuilder;
import org.robolectric.shadows.ShadowActivity;
import org.robolectric.shadows.ShadowNetwork;
import org.robolectric.shadows.ShadowNetworkCapabilities;
import org.robolectric.shadows.ShadowSensor;

/**
 * The Android side of tests/conformance.nim's `arrange` words, with
 * Robolectric's shadows. The desktop side is the simulator
 * (tests/test_conformance.nim); a scenario must come out the same on both.
 * Called from Nim through JNI (Druid.cls finds it in the test class loader).
 */
public final class Arranger {
    private Arranger() {}

    private static Application app() { return ApplicationProvider.getApplicationContext(); }
    private static void idle() { shadowOf(Looper.getMainLooper()).idle(); }

    public static void arrange(String what) {
        String[] w = what.trim().split("\\s+");
        Application app = app();
        switch (w[0]) {
            case "deny": shadowOf(app).denyPermissions("android.permission." + w[1]); break;
            case "grant": shadowOf(app).grantPermissions("android.permission." + w[1]); break;
            case "ask": break;                                   // Android always shows the dialog
            case "answer": answer(w[1].equals("allow")); break;
            case "network": network(w[1], w[2].equals("1"), w[3].equals("1")); break;
            case "battery": battery(Integer.parseInt(w[1]), w[2].equals("1"), w[3]); break;
            case "sensor": sensor(w); break;
            case "provider":
                shadowOf((LocationManager) app.getSystemService(Context.LOCATION_SERVICE))
                    .setProviderEnabled(w[1], w[2].equals("on"));
                break;
            case "fix": fix(Double.parseDouble(w[1]), Double.parseDouble(w[2]), Float.parseFloat(w[3])); break;
            case "idle": idle(); break;
            case "disk":
                org.robolectric.shadows.ShadowStatFs.registerStats(app.getFilesDir(), 1000, 500, 400);
                break;
            default: throw new IllegalArgumentException("unknown arrangement " + what);
        }
    }

    /** The user answers the dialog DruidPermissionActivity shows. */
    private static void answer(boolean allow) {
        Intent asked = shadowOf(app()).getNextStartedActivity();
        if (asked == null) throw new IllegalStateException("no permission dialog was started");
        ActivityController<DruidPermissionActivity> c =
            Robolectric.buildActivity(DruidPermissionActivity.class, asked).setup();
        ShadowActivity.PermissionsRequest req = shadowOf(c.get()).getLastRequestedPermission();
        int[] results = new int[req.requestedPermissions.length];
        for (int k = 0; k < results.length; k++) {
            if (allow) shadowOf(app()).grantPermissions(req.requestedPermissions[k]);
            results[k] = allow ? PackageManager.PERMISSION_GRANTED : PackageManager.PERMISSION_DENIED;
        }
        c.get().onRequestPermissionsResult(req.requestCode, req.requestedPermissions, results);
    }

    private static void network(String kind, boolean connected, boolean metered) {
        ConnectivityManager cm = (ConnectivityManager) app().getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkCapabilities caps = ShadowNetworkCapabilities.newInstance();
        switch (kind) {
            case "wifi": shadowOf(caps).addTransportType(NetworkCapabilities.TRANSPORT_WIFI); break;
            case "cellular": shadowOf(caps).addTransportType(NetworkCapabilities.TRANSPORT_CELLULAR); break;
            case "ethernet": shadowOf(caps).addTransportType(NetworkCapabilities.TRANSPORT_ETHERNET); break;
            default: break;
        }
        if (connected) shadowOf(caps).addCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET);
        if (!metered) shadowOf(caps).addCapability(NetworkCapabilities.NET_CAPABILITY_NOT_METERED);
        shadowOf(cm).setNetworkCapabilities(cm.getActiveNetwork(), caps);
        for (ConnectivityManager.NetworkCallback cb : shadowOf(cm).getNetworkCallbacks()) {
            if (kind.equals("none")) cb.onLost(ShadowNetwork.newInstance(1));
            else cb.onCapabilitiesChanged(ShadowNetwork.newInstance(1), caps);
        }
    }

    private static void battery(int level, boolean charging, String plugged) {
        shadowOf((BatteryManager) app().getSystemService(Context.BATTERY_SERVICE))
            .setIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY, level);
        int plug = plugged.equals("usb") ? BatteryManager.BATTERY_PLUGGED_USB
                 : plugged.equals("ac") ? BatteryManager.BATTERY_PLUGGED_AC
                 : plugged.equals("wireless") ? BatteryManager.BATTERY_PLUGGED_WIRELESS : 0;
        app().sendStickyBroadcast(new Intent(Intent.ACTION_BATTERY_CHANGED)
            .putExtra(BatteryManager.EXTRA_STATUS, charging ? BatteryManager.BATTERY_STATUS_CHARGING
                                                            : BatteryManager.BATTERY_STATUS_DISCHARGING)
            .putExtra(BatteryManager.EXTRA_PLUGGED, plug));
    }

    private static void sensor(String[] w) {
        SensorManager sm = (SensorManager) app().getSystemService(Context.SENSOR_SERVICE);
        if (w[1].equals("add")) {
            int type = Integer.parseInt(w[2]);
            if (sm.getDefaultSensor(type) == null) shadowOf(sm).addSensor(ShadowSensor.newInstance(type));
            return;
        }
        Sensor s = sm.getDefaultSensor(Integer.parseInt(w[1]));
        float[] v = new float[w.length - 2];
        for (int k = 0; k < v.length; k++) v[k] = Float.parseFloat(w[k + 2]);
        shadowOf(sm).sendSensorEventToListeners(SensorEventBuilder.newBuilder()
            .setSensor(s).setValues(v).setAccuracy(SensorManager.SENSOR_STATUS_ACCURACY_HIGH).setTimestamp(1).build());
    }

    private static void fix(double lat, double lon, float accuracy) {
        android.location.Location l = new android.location.Location("gps");
        l.setLatitude(lat);
        l.setLongitude(lon);
        l.setAccuracy(accuracy);
        l.setTime(System.currentTimeMillis());
        shadowOf((LocationManager) app().getSystemService(Context.LOCATION_SERVICE)).simulateLocation(l);
        idle();
    }
}
