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
    private static void idle() {
        shadowOf(CameraCapture.handler().getLooper()).idle();
        shadowOf(Looper.getMainLooper()).idle();
    }

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
            case "camera": camera(); break;
            case "tap": tap(Integer.parseInt(w[1])); break;
            case "press": press(Integer.parseInt(w[1]), w[2]); break;
            case "dismiss": dismiss(Integer.parseInt(w[1])); break;
            case "reply": reply(Integer.parseInt(w[1]), what.trim().split("\\s+", 3)[2]); break;
            case "share":
                launch(new Intent(Intent.ACTION_SEND).setType("text/plain")
                    .putExtra(Intent.EXTRA_TEXT, what.trim().split("\\s+", 2)[1]));
                break;
            case "link": launch(new Intent(Intent.ACTION_VIEW, android.net.Uri.parse(w[1]))); break;
            case "fire": Alarms.fire(app, Integer.parseInt(w[1])); break;
            case "run": Robolectric.setupService(DruidJobService.class).ran(Integer.parseInt(w[1])); break;
            case "exact": org.robolectric.shadows.ShadowAlarmManager.setCanScheduleExactAlarms(w[1].equals("on")); break;
            case "bluetooth":
                shadowOf(((android.bluetooth.BluetoothManager) app.getSystemService(Context.BLUETOOTH_SERVICE))
                    .getAdapter()).setEnabled(w[1].equals("on"));
                break;
            case "services": services(); break;
            case "software": softwareKeystore(); break;
            case "tts": tts(w); break;
            case "hear": heard = what.trim().split("\\s+", 2)[1]; break;
            case "listened": listened(); break;
            case "nfc": nfc(); break;
            case "tag":
                NfcReader.report(w[1], "NfcA,Ndef", new android.nfc.NdefMessage(
                    w[2].equals("uri") ? android.nfc.NdefRecord.createUri(w[3])
                                       : android.nfc.NdefRecord.createTextRecord("en", w[3])));
                break;
            case "ble": ble(w[1], Integer.parseInt(w[2])); break;
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

    // ---- the camera, notifications, other apps, BLE ----

    private static void camera() {
        android.hardware.camera2.CameraManager cm =
            (android.hardware.camera2.CameraManager) app().getSystemService(Context.CAMERA_SERVICE);
        android.hardware.camera2.CameraCharacteristics c =
            org.robolectric.shadows.ShadowCameraCharacteristics.newCameraCharacteristics();
        shadowOf(c).set(android.hardware.camera2.CameraCharacteristics.LENS_FACING,
                        android.hardware.camera2.CameraCharacteristics.LENS_FACING_BACK);
        shadowOf(c).set(android.hardware.camera2.CameraCharacteristics.SENSOR_ORIENTATION, 90);
        try { shadowOf(cm).addCamera("0", c); }
        catch (IllegalArgumentException alreadyThere) {}
    }

    private static android.app.NotificationManager nm() {
        return (android.app.NotificationManager) app().getSystemService(Context.NOTIFICATION_SERVICE);
    }

    private static android.app.Notification shown(int id) {
        android.app.Notification n = shadowOf(nm()).getNotification(id);
        if (n == null) throw new IllegalStateException("notification " + id + " is not shown");
        return n;
    }

    private static void send(android.app.PendingIntent p, Intent fill) {
        try { p.send(app(), 0, fill); } catch (android.app.PendingIntent.CanceledException e) { throw new RuntimeException(e); }
        idle();
    }

    /** The user taps it: the system opens the app with its content Intent (and takes an autoCancel one down). */
    private static void tap(int id) {
        android.app.Notification n = shown(id);
        if ((n.flags & android.app.Notification.FLAG_AUTO_CANCEL) != 0) nm().cancel(id);
        // Robolectric's test app has no launcher Activity, so no content Intent: the one it would carry.
        launch(n.contentIntent != null ? shadowOf(n.contentIntent).getSavedIntent()
               : new Intent(Intent.ACTION_MAIN).putExtra(Notifications.EXTRA_TAP, id));
    }

    private static void press(int id, String actionId) {
        for (android.app.Notification.Action a : shown(id).actions) {
            Intent saved = shadowOf(a.actionIntent).getSavedIntent();
            if (DruidNotificationReceiver.ACTION.equals(saved.getAction())
                    && actionId.equals(saved.getStringExtra(DruidNotificationReceiver.EXTRA_ACTION))) {
                send(a.actionIntent, null);
                return;
            }
        }
        throw new IllegalStateException("notification " + id + " has no button " + actionId);
    }

    private static void dismiss(int id) {
        android.app.Notification n = shown(id);
        nm().cancel(id);
        send(n.deleteIntent, null);
    }

    private static void reply(int id, String text) {
        for (android.app.Notification.Action a : shown(id).actions) {
            if (a.getRemoteInputs() == null) continue;
            Intent fill = new Intent();
            android.os.Bundle typed = new android.os.Bundle();
            typed.putCharSequence(DruidNotificationReceiver.REPLY_KEY, text);
            android.app.RemoteInput.addResultsToIntent(a.getRemoteInputs(), fill, typed);
            send(a.actionIntent, fill);
            return;
        }
        throw new IllegalStateException("notification " + id + " has no reply");
    }

    /** Another app (or the launcher) starts the app's Activity with {@code i}. */
    private static void launch(Intent i) {
        Robolectric.buildActivity(android.app.Activity.class, i).create().start().resume();
        idle();
    }

    private static void ble(String address, int rssi) {
        android.bluetooth.BluetoothAdapter a =
            ((android.bluetooth.BluetoothManager) app().getSystemService(Context.BLUETOOTH_SERVICE)).getAdapter();
        org.robolectric.shadows.ShadowBluetoothLeScanner sc =
            org.robolectric.shadow.api.Shadow.extract(a.getBluetoothLeScanner());
        for (android.bluetooth.le.ScanCallback cb : sc.getScanCallbacks()) {
            cb.onScanResult(1, new android.bluetooth.le.ScanResult(a.getRemoteDevice(address), null, rssi, 0));
        }
    }

    // ---- services the system runs, the keystore, speech, NFC ----

    private static final java.util.ArrayList<org.robolectric.android.controller.ServiceController<?>> running =
        new java.util.ArrayList<>();

    /** The system starts the services the app asked for, and stops the ones it stopped. */
    private static void services() {
        for (Intent i; (i = shadowOf(app()).getNextStartedService()) != null; ) {
            if (DruidForegroundService.class.getName().equals(i.getComponent().getClassName())) {
                running.add(Robolectric.buildService(DruidForegroundService.class, i).create().startCommand(0, 1));
            }
        }
        if (shadowOf(app()).getNextStoppedService() != null) {
            for (org.robolectric.android.controller.ServiceController<?> c : running) c.destroy();
            running.clear();
        }
        idle();
    }

    private static void softwareKeystore() {
        try {
            javax.crypto.KeyGenerator g = javax.crypto.KeyGenerator.getInstance("AES");
            g.init(256);
            javax.crypto.SecretKey k = g.generateKey();
            SecureStore.keys = () -> k;
        } catch (java.security.GeneralSecurityException e) { throw new RuntimeException(e); }
    }

    private static void tts(String[] w) {
        android.speech.tts.TextToSpeech t = org.robolectric.shadows.ShadowTextToSpeech.getLastTextToSpeechInstance();
        org.robolectric.shadows.ShadowTextToSpeech s = shadowOf(t);
        if (w[1].equals("init")) {
            s.getOnInitListener().onInit(android.speech.tts.TextToSpeech.SUCCESS);
        } else {
            s.getUtteranceProgressListener().onStart(w[2]);
            s.getUtteranceProgressListener().onDone(w[2]);
        }
    }

    private static String heard = "";

    /** The recognizer heard what "hear" said: ready, the first word, the end, the result. */
    private static void listened() {
        idle();
        org.robolectric.shadows.ShadowSpeechRecognizer s = org.robolectric.shadow.api.Shadow.extract(
            org.robolectric.shadows.ShadowSpeechRecognizer.getLatestSpeechRecognizer());
        s.triggerOnReadyForSpeech(new android.os.Bundle());
        s.triggerOnPartialResults(texts(heard.split("\\s+")[0]));
        s.triggerOnEndOfSpeech();
        s.triggerOnResults(texts(heard));
    }

    private static android.os.Bundle texts(String t) {
        android.os.Bundle b = new android.os.Bundle();
        b.putStringArrayList(android.speech.SpeechRecognizer.RESULTS_RECOGNITION,
                             new java.util.ArrayList<>(java.util.Collections.singletonList(t)));
        return b;
    }

    private static void nfc() {
        org.robolectric.shadows.ShadowNfcAdapter.setNfcHardwareExists(true);
        shadowOf(app().getPackageManager()).setSystemFeature(PackageManager.FEATURE_NFC, true);
        Robolectric.buildActivity(android.app.Activity.class).setup();
        shadowOf(android.nfc.NfcAdapter.getDefaultAdapter(app())).setEnabled(true);
    }
}
