package dev.druid;

import static dev.druid.NimHarness.cmd;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.Manifest;
import android.app.Activity;
import android.app.ActivityManager;
import android.app.Application;
import android.app.DownloadManager;
import android.app.Notification;
import android.app.NotificationManager;
import android.bluetooth.BluetoothManager;
import android.content.ClipboardManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorManager;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraManager;
import android.location.Location;
import android.location.LocationManager;
import android.media.AudioManager;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.os.BatteryManager;
import android.os.Looper;
import android.os.PowerManager;
import android.os.VibrationEffect;
import android.telephony.TelephonyManager;
import androidx.test.core.app.ApplicationProvider;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowActivity;
import org.robolectric.shadows.ShadowCameraCharacteristics;
import org.robolectric.shadows.ShadowMediaPlayer;
import org.robolectric.shadows.ShadowNetwork;
import org.robolectric.shadows.ShadowNetworkCapabilities;
import org.robolectric.shadows.ShadowSensor;
import org.robolectric.shadows.ShadowSensorManager;
import org.robolectric.shadows.ShadowToast;
import org.robolectric.shadows.util.DataSource;

/**
 * The whole path, Nim to Android: each test arranges Android with Robolectric,
 * runs Nim code (tests/robolectric/harness.nim) that calls Druid's Nim API,
 * and checks Nim's answer and what the call did to Android.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36)
public class NimHarnessTest {
    private Application app;

    @Before public void setUp() {
        NimHarness.load();
        app = ApplicationProvider.getApplicationContext();
        Druid.pollEvents();                     // nothing left from an earlier test
        NimHarness.start(app);
        assertEquals("1", cmd("started"));
        assertEquals("ok", cmd("reset"));
    }

    @After public void tearDown() {
        Connectivity.stopMonitoring();
        dev.druid.Location.stopAll();
        Sensors.stopAll();
        Player.closeAll();
        NimHarness.stop();
        assertEquals("0", cmd("started"));
    }

    private void idle() { shadowOf(Looper.getMainLooper()).idle(); }

    // ---- core ----

    @Test public void deviceFactsComeFromBuild() {
        String[] f = cmd("device").split("\\|", -1);
        assertEquals("36", f[0]);
        assertEquals(android.os.Build.VERSION.RELEASE, f[1]);
        assertEquals(android.os.Build.MANUFACTURER, f[2]);
        assertEquals(android.os.Build.MODEL, f[3]);
        assertEquals("1", f[4]);                 // isAndroid
        assertFalse(f[5].isEmpty());             // locale
        assertEquals(android.os.Build.BRAND, f[10]);
        assertEquals(android.os.Build.DEVICE, f[11]);
        assertTrue(f[12].equals("0") || f[12].equals("1"));
    }

    @Test public void stopThenCallsAnswerDefaults() {
        NimHarness.stop();
        assertEquals("0", cmd("started"));
        assertEquals("1|1", cmd("vib.info"));    // the desktop simulator's phone, not a crash
        NimHarness.start(app);
        assertEquals("1", cmd("started"));
    }

    @Test public void appInfo() {
        shadowOf(app.getPackageManager()).setSystemFeature(PackageManager.FEATURE_NFC, true);
        String[] f = cmd("app", PackageManager.FEATURE_NFC, "com.nope").split("\\|", -1);
        assertEquals(app.getPackageName(), f[0]);
        assertEquals("1", f[5]);
        assertEquals("0", f[6]);
        assertEquals("1", cmd("app", PackageManager.FEATURE_NFC, app.getPackageName()).split("\\|")[6]);
        String[] times = cmd("app.times").split("\\|");
        assertEquals(2, times.length);
        assertTrue(Long.parseLong(times[1]) >= Long.parseLong(times[0]));
    }

    @Test public void stringsCrossAsUtf16() {
        String s = "héllo 日本 😀🇫🇷 \u0000 end";
        assertEquals(s, cmd("echo", s));
        ClipboardManager cm = (ClipboardManager) app.getSystemService(Context.CLIPBOARD_SERVICE);
        assertEquals(s, cm.getPrimaryClip().getItemAt(0).getText().toString());
    }

    @Test public void javaExceptionsBecomeDruidErrors() {
        String r = cmd("err.java");
        assertTrue(r, r.startsWith("ERR DruidError: Player.play: java.lang.IllegalArgumentException: no player 424242"));
        r = cmd("err.method");
        assertTrue(r, r.startsWith("ERR DruidError: no Java method dev.druid.Druid.noSuchMethod()V"));
        r = cmd("err.class");
        assertTrue(r, r.startsWith("ERR DruidError: class dev.druid.NoSuchClass"));
        assertEquals("1", cmd("started"));       // and Druid still works
        assertEquals("ok", cmd("clip.set", "after"));
    }

    @Test public void explicitDetachThenAttachAgain() throws Exception {
        int before = Thread.getAllStackTraces().size();
        assertEquals("36", cmd("thread.detach"));
        for (int k = 0; k < 50 && Thread.getAllStackTraces().size() > before; k++) Thread.sleep(10);
        assertEquals(before, Thread.getAllStackTraces().size());
    }

    @Test public void nativeThreadsAreAttachedAndDetachedOnExit() throws Exception {
        int before = Thread.getAllStackTraces().size();
        assertEquals("36", cmd("thread.call"));
        // The Nim thread was attached to call Java; once it exited, its
        // pthread-key destructor detached it, so the JVM no longer lists it.
        for (int k = 0; k < 50 && Thread.getAllStackTraces().size() > before; k++) Thread.sleep(10);
        assertEquals(before, Thread.getAllStackTraces().size());
        assertEquals("36", cmd("thread.call"));   // and again: a fresh attach works
    }

    @Test public void eventsWakeTheNimLoop() {
        assertEquals("ok", cmd("wake.install"));
        int before = Integer.parseInt(cmd("wake.count"));
        Druid.post("memory", 10);
        Druid.post("memory", 15);
        assertEquals(before + 2, Integer.parseInt(cmd("wake.count")));
        assertEquals("2", cmd("pending"));
        assertEquals("ekMemory:10,ekMemory:15", cmd("events.kinds"));
    }

    @Test public void lifecycleAndTrimMemoryArriveAsEvents() {
        ActivityController<Activity> c = Robolectric.buildActivity(Activity.class).setup();
        app.onTrimMemory(android.content.ComponentCallbacks2.TRIM_MEMORY_RUNNING_CRITICAL);
        String kinds = cmd("events.kinds");
        assertTrue(kinds, kinds.startsWith("ekLifecycle:created,ekLifecycle:started,ekLifecycle:resumed"));
        assertTrue(kinds, kinds.endsWith("ekMemory:15"));
        assertEquals("resumed", cmd("lifecycle"));
        c.pause();
        cmd("poll");
        assertEquals("paused", cmd("lifecycle"));
    }

    // ---- conformance: the same scenarios the desktop simulator passes ----

    @Test public void conformance() {
        String[] names = cmd("conf.list").split(",");
        assertTrue(names.length >= 14);
        StringBuilder failures = new StringBuilder();
        for (String name : names) {
            String r = cmd("conf", name);
            if (!r.equals("ok")) failures.append(name).append(": ").append(r).append('\n');
        }
        assertEquals("", failures.toString());
    }

    // ---- permissions ----

    @Test public void permissionAlreadyGrantedIsAnsweredWithoutADialog() {
        shadowOf(app).grantPermissions(Manifest.permission.CAMERA);
        assertEquals("1", cmd("perm.check", Manifest.permission.CAMERA));
        String id = cmd("perm.request", Manifest.permission.CAMERA);
        assertEquals("psGranted|android.permission.CAMERA=1", cmd("perm.status", id));
        assertEquals(null, shadowOf(app).getNextStartedActivity());
    }

    @Test public void permissionRequestGoesThroughDruidPermissionActivity() {
        shadowOf(app).denyPermissions(Manifest.permission.CAMERA, Manifest.permission.RECORD_AUDIO);
        String id = cmd("perm.request", Manifest.permission.CAMERA + "," + Manifest.permission.RECORD_AUDIO);
        assertEquals("psPending|", cmd("perm.status", id));

        Intent started = shadowOf(app).getNextStartedActivity();
        assertEquals(DruidPermissionActivity.class.getName(), started.getComponent().getClassName());
        ActivityController<DruidPermissionActivity> c =
            Robolectric.buildActivity(DruidPermissionActivity.class, started).setup();
        ShadowActivity.PermissionsRequest asked = shadowOf(c.get()).getLastRequestedPermission();
        assertEquals(2, asked.requestedPermissions.length);

        // The user allows the camera, denies the microphone.
        shadowOf(app).grantPermissions(Manifest.permission.CAMERA);
        c.get().onRequestPermissionsResult(asked.requestCode, asked.requestedPermissions,
            new int[] { PackageManager.PERMISSION_GRANTED, PackageManager.PERMISSION_DENIED });
        assertTrue(c.get().isFinishing());
        assertEquals("psDenied|android.permission.CAMERA=1,android.permission.RECORD_AUDIO=0",
                     cmd("perm.status", id));
    }

    @Test public void permissionDialogLeftWithoutAnswerIsDenied() {
        shadowOf(app).denyPermissions(Manifest.permission.ACCESS_FINE_LOCATION);
        String id = cmd("perm.request", Manifest.permission.ACCESS_FINE_LOCATION);
        Intent started = shadowOf(app).getNextStartedActivity();
        ActivityController<DruidPermissionActivity> c =
            Robolectric.buildActivity(DruidPermissionActivity.class, started).setup();
        c.get().finish();
        c.pause().stop().destroy();
        assertEquals("psDenied|android.permission.ACCESS_FINE_LOCATION=0", cmd("perm.status", id));
    }

    @Test public void permissionGroups() {
        shadowOf(app).grantPermissions(Manifest.permission.ACCESS_FINE_LOCATION);
        assertEquals("0", cmd("perm.group", "pgLocation"));      // coarse still missing
        shadowOf(app).grantPermissions(Manifest.permission.ACCESS_COARSE_LOCATION);
        assertEquals("1", cmd("perm.group", "pgLocation"));
    }

    // ---- clipboard, vibration, notifications ----

    @Test public void clipboard() {
        assertEquals("ok", cmd("clip.set", "from nim"));
        ClipboardManager cm = (ClipboardManager) app.getSystemService(Context.CLIPBOARD_SERVICE);
        assertEquals("from nim", cm.getPrimaryClip().getItemAt(0).getText().toString());
        assertEquals("1", cmd("clip.has"));
        cm.setPrimaryClip(android.content.ClipData.newPlainText("x", "from java"));
        assertEquals("from java", cmd("clip.get"));
        assertEquals("ok", cmd("clip.clear"));
        assertEquals("0", cmd("clip.has"));
    }

    @Test public void vibration() {
        shadowOf(Vibration.vibrator()).setHasVibrator(true);
        shadowOf(Vibration.vibrator()).setHasAmplitudeControl(true);
        assertEquals("1|1", cmd("vib.info"));
        assertEquals("ok", cmd("vib.vibrate", 250, 128));
        assertTrue(shadowOf(Vibration.vibrator()).isVibrating());
        assertEquals(250, shadowOf(Vibration.vibrator()).getMilliseconds());
        assertEquals("ok", cmd("vib.pattern", "0,100,50,200", -1));
        long[] p = shadowOf(Vibration.vibrator()).getPattern();
        assertEquals(4, p.length);
        assertEquals(200, p[3]);
        assertEquals("ok", cmd("vib.effect", "heClick"));
        assertEquals("ok", cmd("vib.cancel"));
        assertFalse(shadowOf(Vibration.vibrator()).isVibrating());
        assertTrue(cmd("vib.vibrate", 10, 0).startsWith("ERR ValueError"));
    }

    @Test public void notifications() {
        NotificationManager nm = (NotificationManager) app.getSystemService(Context.NOTIFICATION_SERVICE);
        assertEquals("1", cmd("notif.channel", "news", "News", "imHigh", "Daily news"));
        assertEquals(NotificationManager.IMPORTANCE_HIGH, nm.getNotificationChannel("news").getImportance());
        assertEquals("ok", cmd("notif.show", 7, "Hello", "From Nim 😀", "news", 1, 40));
        Notification n = shadowOf(nm).getNotification(7);
        assertNotNull(n);
        assertEquals("Hello", n.extras.getString(Notification.EXTRA_TITLE));
        assertEquals("From Nim 😀", n.extras.getCharSequence(Notification.EXTRA_TEXT).toString());
        assertEquals("news", n.getChannelId());
        assertTrue((n.flags & Notification.FLAG_ONGOING_EVENT) != 0);
        assertEquals(40, n.extras.getInt(Notification.EXTRA_PROGRESS));

        String auto = cmd("notif.notify", "Second", "default channel");
        assertNotNull(nm.getNotificationChannel(Notifications.DEFAULT_CHANNEL));
        assertEquals("7," + auto, cmd("notif.active"));
        assertEquals("ok", cmd("notif.cancel", 7));
        assertEquals(auto, cmd("notif.active"));
        assertEquals("ok", cmd("notif.cancelAll"));
        assertEquals("", cmd("notif.active"));
        assertEquals("0", cmd("notif.deleteChannel", "news"));
        shadowOf(nm).setNotificationsEnabled(false);
        assertEquals("0", cmd("notif.enabled"));
    }

    // ---- connectivity, power, storage, display, audio ----

    @Test public void connectivity() {
        ConnectivityManager cm = (ConnectivityManager) app.getSystemService(Context.CONNECTIVITY_SERVICE);
        Network net = cm.getActiveNetwork();
        NetworkCapabilities wifi = ShadowNetworkCapabilities.newInstance();
        shadowOf(wifi).addTransportType(NetworkCapabilities.TRANSPORT_WIFI);
        shadowOf(wifi).addCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET);
        shadowOf(wifi).addCapability(NetworkCapabilities.NET_CAPABILITY_NOT_METERED);
        shadowOf(cm).setNetworkCapabilities(net, wifi);
        assertEquals("1|wifi|0", cmd("net"));

        assertEquals("1", cmd("net.monitor"));
        assertEquals(1, shadowOf(cm).getNetworkCallbacks().size());
        NetworkCapabilities cell = ShadowNetworkCapabilities.newInstance();
        shadowOf(cell).addTransportType(NetworkCapabilities.TRANSPORT_CELLULAR);
        shadowOf(cell).addCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET);
        for (ConnectivityManager.NetworkCallback cb : shadowOf(cm).getNetworkCallbacks()) {
            cb.onCapabilitiesChanged(ShadowNetwork.newInstance(2), cell);
        }
        assertEquals("cellular|1|1", cmd("net.latest"));
        for (ConnectivityManager.NetworkCallback cb : shadowOf(cm).getNetworkCallbacks()) {
            cb.onLost(ShadowNetwork.newInstance(2));
        }
        assertEquals("none|0|0", cmd("net.latest"));
        assertEquals("0", cmd("net.unmonitor"));
        assertEquals(0, shadowOf(cm).getNetworkCallbacks().size());
    }

    @Test public void power() {
        BatteryManager bm = (BatteryManager) app.getSystemService(Context.BATTERY_SERVICE);
        shadowOf(bm).setIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY, 77);
        Intent battery = new Intent(Intent.ACTION_BATTERY_CHANGED)
            .putExtra(BatteryManager.EXTRA_STATUS, BatteryManager.BATTERY_STATUS_CHARGING)
            .putExtra(BatteryManager.EXTRA_PLUGGED, BatteryManager.BATTERY_PLUGGED_USB)
            .putExtra(BatteryManager.EXTRA_TEMPERATURE, 312);
        app.sendStickyBroadcast(battery);
        PowerManager pm = (PowerManager) app.getSystemService(Context.POWER_SERVICE);
        shadowOf(pm).setIsPowerSaveMode(true);
        shadowOf(pm).setIsInteractive(false);
        String[] f = cmd("power").split("\\|", -1);
        assertEquals("77", f[0]);
        assertEquals("1", f[1]);
        assertEquals("usb", f[2]);
        assertEquals(31.2, Double.parseDouble(f[3]), 1e-4);
        assertEquals("1", f[4]);
        assertEquals("0", f[5]);
        assertEquals("tsNone", f[6]);

        String[] lock = cmd("power.lock", "test:sync", 0).split("\\|");
        assertEquals("1", lock[1]);
        assertTrue(shadowOf(pm).getLatestWakeLock().isHeld());
        assertEquals("1|0", cmd("power.unlock", lock[0]));
        assertFalse(shadowOf(pm).getLatestWakeLock().isHeld());
        assertEquals("0|0", cmd("power.unlock", lock[0]));       // twice: no-op
    }

    @Test public void storage() {
        String[] f = cmd("storage").split("\\|", -1);
        assertEquals(app.getFilesDir().getAbsolutePath(), f[0]);
        assertEquals(app.getCacheDir().getAbsolutePath(), f[1]);
        assertEquals(app.getNoBackupFilesDir().getAbsolutePath(), f[2]);
        assertTrue(f[3], f[3].endsWith("Pictures"));
        assertEquals("written by nim", cmd("storage.write", "n.txt", "written by nim"));
        assertEquals(app.getExternalCacheDir().getAbsolutePath(), f[6]);
        org.robolectric.shadows.ShadowStatFs.registerStats(f[0], 1000, 400, 300);
        String[] space = cmd("storage.space", f[0]).split("\\|");
        assertEquals(300L * 4096, Long.parseLong(space[0]));
        assertEquals(1000L * 4096, Long.parseLong(space[1]));
    }

    @Test @Config(qualifiers = "w360dp-h640dp-xhdpi")
    public void display() {
        String[] f = cmd("display").split("\\|");
        assertEquals("720", f[0]);
        assertEquals("1280", f[1]);
        assertEquals(2.0, Double.parseDouble(f[2]), 1e-6);
        assertEquals("320", f[3]);
        assertEquals("orPortrait", f[7]);
    }

    @Test public void audio() {
        AudioManager am = (AudioManager) app.getSystemService(Context.AUDIO_SERVICE);
        String[] f = cmd("audio", "asMusic").split("\\|");
        assertEquals(String.valueOf(am.getStreamMaxVolume(AudioManager.STREAM_MUSIC)), f[1]);
        assertEquals("5", cmd("audio.set", "asMusic", 5));
        assertEquals(5, am.getStreamVolume(AudioManager.STREAM_MUSIC));
        assertEquals("rmVibrate", cmd("audio.ringer", "rmVibrate"));
        assertEquals(AudioManager.RINGER_MODE_VIBRATE, am.getRingerMode());
        assertEquals("1", cmd("audio.mute", "1"));
        assertTrue(am.isMicrophoneMute());
        assertEquals("6|0", cmd("audio.adjust", "asMusic", "vdRaise"));
        assertEquals(6, am.getStreamVolume(AudioManager.STREAM_MUSIC));
    }

    // ---- location, sensors ----

    @Test public void securityExceptionsBecomeDruidPermissionErrors() {
        String r = cmd("err.security");
        assertEquals("ERR DruidPermissionError: Thrower.security: java.lang.SecurityException: needs CAMERA", r);
    }

    @Test public void location() {
        shadowOf(app).grantPermissions(Manifest.permission.ACCESS_FINE_LOCATION, Manifest.permission.ACCESS_COARSE_LOCATION);
        LocationManager lm = (LocationManager) app.getSystemService(Context.LOCATION_SERVICE);
        shadowOf(lm).setProviderEnabled(LocationManager.GPS_PROVIDER, true);
        assertTrue(cmd("loc.providers", 1).contains("gps"));
        assertEquals("<none>", cmd("loc.last", "gps"));
        Location last = new Location("gps");
        last.setLatitude(48.8566);
        last.setLongitude(2.3522);
        last.setAccuracy(12);
        last.setTime(1_700_000_000_000L);
        shadowOf(lm).setLastKnownLocation("gps", last);
        assertEquals("gps|48.8566|2.3522|12.0|1700000000000", cmd("loc.last", "gps"));

        assertEquals("1", cmd("loc.start", "gps", 500, 0.0));
        Location fix = new Location("gps");
        fix.setLatitude(51.5074);
        fix.setLongitude(-0.1278);
        fix.setAccuracy(4);
        shadowOf(lm).simulateLocation(fix);
        idle();
        assertEquals("gps|51.5074|-0.1278|4.0", cmd("loc.latest"));
        assertEquals("0", cmd("loc.stop", "gps"));

        double d = Double.parseDouble(cmd("loc.distance", 48.8566, 2.3522, 51.5074, -0.1278));
        assertEquals(343_500, d, 2_000);
    }

    @Test public void sensors() {
        SensorManager sm = (SensorManager) app.getSystemService(Context.SENSOR_SERVICE);
        assertEquals("0", cmd("sensor.has", "stAccelerometer"));
        assertEquals("0|0", cmd("sensor.start", "stAccelerometer"));
        Sensor accel = ShadowSensor.newInstance(Sensor.TYPE_ACCELEROMETER);
        shadowOf(sm).addSensor(accel);
        assertEquals("1", cmd("sensor.has", "stAccelerometer"));
        assertTrue(cmd("sensor.types").contains(String.valueOf(Sensor.TYPE_ACCELEROMETER)));
        assertEquals("1|1", cmd("sensor.start", "stAccelerometer"));

        SensorEvent e = org.robolectric.shadows.SensorEventBuilder.newBuilder()
            .setSensor(accel).setValues(new float[] { 0.5f, 9.81f, -1f })
            .setAccuracy(SensorManager.SENSOR_STATUS_ACCURACY_HIGH).setTimestamp(123_456_789L).build();
        shadowOf(sm).sendSensorEventToListeners(e);
        assertEquals("3|123456789|0.5,9.81,-1.0", cmd("sensor.latest", "stAccelerometer"));
        assertEquals("0", cmd("sensor.stop", "stAccelerometer"));
        assertEquals("<none>", cmd("sensor.latest", "stLight"));
    }

    // ---- keyboard, intents, toast ----

    @Test public void keyboardNeedsAnActivity() {
        assertEquals("0", cmd("kb.show"));          // the Application has no window
        Activity a = Robolectric.buildActivity(Activity.class).setup().get();
        Druid.init(a);
        assertEquals("1", cmd("kb.show"));
        android.view.inputmethod.InputMethodManager imm = (android.view.inputmethod.InputMethodManager)
            app.getSystemService(Context.INPUT_METHOD_SERVICE);
        assertTrue(shadowOf(imm).isSoftInputVisible());
        cmd("kb.hide");
        assertFalse(shadowOf(imm).isSoftInputVisible());
    }

    @Test public void intentsStartTheRightActivity() {
        Activity a = Robolectric.buildActivity(Activity.class).setup().get();
        Druid.init(a);
        assertEquals("1", cmd("intent.url", "https://nim-lang.org"));
        Intent i = shadowOf(a).getNextStartedActivity();
        assertEquals(Intent.ACTION_VIEW, i.getAction());
        assertEquals("https://nim-lang.org", i.getDataString());

        assertEquals("1", cmd("intent.share", "some text", "subj", "Share via"));
        i = shadowOf(a).getNextStartedActivity();
        assertEquals(Intent.ACTION_CHOOSER, i.getAction());
        Intent send = i.getParcelableExtra(Intent.EXTRA_INTENT, Intent.class);
        assertEquals("some text", send.getStringExtra(Intent.EXTRA_TEXT));
        assertEquals("subj", send.getStringExtra(Intent.EXTRA_SUBJECT));

        assertEquals("1", cmd("intent.dial", "+33 1 23"));
        assertEquals("tel:%2B33%201%2023", shadowOf(a).getNextStartedActivity().getDataString());
        assertEquals("1", cmd("intent.email", "a@b.c", "Hi", "Body"));
        assertEquals(Intent.ACTION_SENDTO, shadowOf(a).getNextStartedActivity().getAction());
        assertEquals("1", cmd("intent.settings", android.provider.Settings.ACTION_WIFI_SETTINGS));
        assertEquals(android.provider.Settings.ACTION_WIFI_SETTINGS, shadowOf(a).getNextStartedActivity().getAction());
        assertEquals("ok", cmd("perm.settings"));
        assertEquals(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS, shadowOf(a).getNextStartedActivity().getAction());
        assertEquals("1", cmd("bt.enable"));
        assertEquals(android.bluetooth.BluetoothAdapter.ACTION_REQUEST_ENABLE, shadowOf(a).getNextStartedActivity().getAction());
        assertEquals("1", cmd("nfc.settings"));
        assertEquals(android.provider.Settings.ACTION_NFC_SETTINGS, shadowOf(a).getNextStartedActivity().getAction());
        assertEquals("1", cmd("intent.appSettings"));
        assertEquals("package:" + app.getPackageName(), shadowOf(a).getNextStartedActivity().getDataString());

        assertEquals("0", cmd("intent.canOpen", "geo:0,0"));
        Intent geo = new Intent(Intent.ACTION_VIEW, android.net.Uri.parse("geo:0,0"));
        ResolveInfo ri = new ResolveInfo();
        ri.activityInfo = new android.content.pm.ActivityInfo();
        ri.activityInfo.packageName = "com.maps";
        ri.activityInfo.name = "Maps";
        shadowOf(app.getPackageManager()).addResolveInfoForIntent(geo, ri);
        assertEquals("1", cmd("intent.canOpen", "geo:0,0"));
    }

    @Test public void intentWithoutActivityStartsANewTask() {
        assertEquals("1", cmd("intent.url", "https://example.com"));
        Intent i = shadowOf(app).getNextStartedActivity();
        assertTrue((i.getFlags() & Intent.FLAG_ACTIVITY_NEW_TASK) != 0);
    }

    @Test public void toast() {
        assertEquals("ok", cmd("intent.toast", "Saved ✓", 0));
        assertEquals("Saved ✓", ShadowToast.getTextOfLatestToast());
    }

    // ---- prefs, crypto ----

    @Test public void prefs() throws Exception {
        assertEquals("v ü|9000000000|0.1|1|1|-5|4", cmd("prefs.roundtrip", "settings", "v ü"));
        assertEquals("v ü", app.getSharedPreferences("settings", Context.MODE_PRIVATE).getString("s", null));
        app.getSharedPreferences("settings", Context.MODE_PRIVATE).edit().putString("fromJava", "j").commit();
        assertEquals("j", cmd("prefs.get", "settings", "fromJava"));
        assertEquals("0", cmd("prefs.remove", "settings", "fromJava"));
        assertEquals("<none>", cmd("prefs.get", "", "nothing"));
    }

    @Test public void crypto() throws Exception {
        String[] f = cmd("crypto", "hello", "key").split("\\|");
        assertEquals("2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824", f[0]);
        javax.crypto.Mac mac = javax.crypto.Mac.getInstance("HmacSHA256");
        mac.init(new javax.crypto.spec.SecretKeySpec("key".getBytes(StandardCharsets.UTF_8), "HmacSHA256"));
        assertEquals(hex(mac.doFinal("hello".getBytes(StandardCharsets.UTF_8))), f[1]);
        assertEquals(hex(MessageDigest.getInstance("MD5").digest("hello".getBytes(StandardCharsets.UTF_8))), f[2]);
        assertEquals("24", f[3]);
        assertEquals("36", f[4]);
        assertEquals(hex(MessageDigest.getInstance("SHA-512").digest("hello".getBytes(StandardCharsets.UTF_8))), f[5]);
        javax.crypto.Mac mac512 = javax.crypto.Mac.getInstance("HmacSHA512");
        mac512.init(new javax.crypto.spec.SecretKeySpec("key".getBytes(StandardCharsets.UTF_8), "HmacSHA512"));
        assertEquals(hex(mac512.doFinal("hello".getBytes(StandardCharsets.UTF_8))), f[6]);
    }

    private static String hex(byte[] b) {
        StringBuilder s = new StringBuilder();
        for (byte x : b) s.append(String.format("%02x", x));
        return s.toString();
    }

    // ---- hardware ----

    @Test public void telephony() {
        shadowOf(app.getPackageManager()).setSystemFeature("android.hardware.telephony", true);
        TelephonyManager tm = (TelephonyManager) app.getSystemService(Context.TELEPHONY_SERVICE);
        shadowOf(tm).setNetworkOperatorName("Druid Mobile");
        shadowOf(tm).setNetworkCountryIso("fr");
        shadowOf(tm).setPhoneType(TelephonyManager.PHONE_TYPE_GSM);
        shadowOf(tm).setSimState(TelephonyManager.SIM_STATE_READY);
        shadowOf(tm).setSimOperatorName("Druid SIM");
        shadowOf(tm).setSimCountryIso("il");
        assertEquals("1|ptGsm|ssReady|Druid Mobile|fr|0|Druid SIM|il", cmd("tel"));
    }

    @Test public void bluetoothAndNfc() {
        android.bluetooth.BluetoothManager bm = (android.bluetooth.BluetoothManager)
            app.getSystemService(Context.BLUETOOTH_SERVICE);
        shadowOf(bm.getAdapter()).setEnabled(true);
        shadowOf(app.getPackageManager()).setSystemFeature(PackageManager.FEATURE_BLUETOOTH_LE, true);
        assertEquals("1|1|1", cmd("bt"));
        shadowOf(bm.getAdapter()).setEnabled(false);
        assertEquals("1|0|1", cmd("bt"));
        assertEquals("0|0", cmd("nfc"));
    }

    @Test public void cameras() throws Exception {
        CameraManager cm = (CameraManager) app.getSystemService(Context.CAMERA_SERVICE);
        CameraCharacteristics back = ShadowCameraCharacteristics.newCameraCharacteristics();
        shadowOf(back).set(CameraCharacteristics.LENS_FACING, CameraCharacteristics.LENS_FACING_BACK);
        shadowOf(back).set(CameraCharacteristics.FLASH_INFO_AVAILABLE, true);
        shadowOf(back).set(CameraCharacteristics.SENSOR_ORIENTATION, 90);
        CameraCharacteristics front = ShadowCameraCharacteristics.newCameraCharacteristics();
        shadowOf(front).set(CameraCharacteristics.LENS_FACING, CameraCharacteristics.LENS_FACING_FRONT);
        shadowOf(front).set(CameraCharacteristics.FLASH_INFO_AVAILABLE, false);
        shadowOf(front).set(CameraCharacteristics.SENSOR_ORIENTATION, 270);
        shadowOf(cm).addCamera("0", back);
        shadowOf(cm).addCamera("1", front);
        assertEquals("0:cfBack:1:90,1:cfFront:0:270", cmd("cam"));
        assertEquals("1", cmd("cam.find", "cfFront"));
        assertEquals("ok", cmd("cam.torch", "0", 1));
        assertTrue(shadowOf(cm).getTorchMode("0"));
    }

    // ---- media, downloads, memory ----

    @Test public void player() {
        String path = "/sdcard/song.mp3";
        ShadowMediaPlayer.addMediaInfo(DataSource.toDataSource(path), new ShadowMediaPlayer.MediaInfo(4000, 0));
        String[] opened = cmd("player.open", path).split("\\|");
        assertEquals("1", opened[1]);
        idle();
        assertEquals("prepared:4000", cmd("player.events"));
        assertEquals("1|4000", cmd("player.play", opened[0]));
        assertTrue(cmd("player.control", opened[0], 1500).startsWith("0|"));   // paused
        idle();                                  // a seek completes on the main looper
        assertEquals(1500, Player.position(Integer.parseInt(opened[0])));
        assertEquals("0", cmd("player.close", opened[0]));
        cmd("player.open", path);
        cmd("player.open", path);
        assertEquals("0", cmd("player.closeAll"));
    }

    @Test public void biometricAvailability() {
        android.hardware.biometrics.BiometricManager bm = app.getSystemService(android.hardware.biometrics.BiometricManager.class);
        ((org.robolectric.shadows.ShadowBiometricManager) Shadow.extract(bm)).setCanAuthenticate(false);
        assertNotEquals("baReady", cmd("bio.avail"));
        ((org.robolectric.shadows.ShadowBiometricManager) Shadow.extract(bm)).setCanAuthenticate(true);
        assertEquals("baReady", cmd("bio.avail"));
        String id = cmd("bio.auth", "Unlock", "sub", "Cancel");
        assertFalse(id, id.startsWith("ERR"));
        assertFalse(Biometric.isRunning(Integer.parseInt(id)));     // cancelled by the command
    }

    @Test public void downloads() {
        String[] f = cmd("dl.enqueue", "https://example.com/a.zip", "a.zip", "A").split("\\|");
        long id = Long.parseLong(f[0]);
        DownloadManager dm = (DownloadManager) app.getSystemService(Context.DOWNLOAD_SERVICE);
        assertNotNull(shadowOf(dm).getRequest(id));
        app.sendBroadcast(new Intent(DownloadManager.ACTION_DOWNLOAD_COMPLETE).putExtra(DownloadManager.EXTRA_DOWNLOAD_ID, id));
        idle();
        assertTrue(cmd("dl.events").startsWith(id + ":"));
    }

    @Test public void memory() {
        ActivityManager am = (ActivityManager) app.getSystemService(Context.ACTIVITY_SERVICE);
        ActivityManager.MemoryInfo mi = new ActivityManager.MemoryInfo();
        mi.availMem = 1_000_000L;
        mi.totalMem = 8_000_000L;
        mi.threshold = 200_000L;
        mi.lowMemory = true;
        shadowOf(am).setMemoryInfo(mi);
        String[] f = cmd("mem").split("\\|");
        assertEquals("1000000", f[0]);
        assertEquals("8000000", f[1]);
        assertEquals("200000", f[2]);
        assertEquals("1", f[3]);
    }

    // ---- camera capture, notification interactions, alarms, jobs, incoming, BLE ----

    private void addBackCamera() {
        CameraManager cm = (CameraManager) app.getSystemService(Context.CAMERA_SERVICE);
        CameraCharacteristics back = ShadowCameraCharacteristics.newCameraCharacteristics();
        shadowOf(back).set(CameraCharacteristics.LENS_FACING, CameraCharacteristics.LENS_FACING_BACK);
        shadowOf(back).set(CameraCharacteristics.SENSOR_ORIENTATION, 90);
        shadowOf(cm).addCamera("0", back);
    }

    @Test public void cameraCapture() throws Exception {
        addBackCamera();
        String path = new java.io.File(app.getCacheDir(), "nim.jpg").getPath();
        assertTrue(cmd("cam.photo", path, "", 0).startsWith("ERR DruidPermissionError"));
        shadowOf(app).grantPermissions(Manifest.permission.CAMERA);
        String id = cmd("cam.photo", path, "", 800);
        assertFalse(id, id.startsWith("ERR"));
        assertTrue(cmd("cam.photo", path, "9", 0).startsWith("ERR"));       // no such camera

        String req = cmd("cam.frames", "", 640, 480);
        shadowOf(CameraCapture.handler().getLooper()).idle();
        idle();
        assertEquals("1", cmd("cam.streaming"));
        assertTrue(cmd("cam.events").contains("camera:" + req + ":1:640x480"));
        assertEquals("<none>", cmd("cam.latest", 0));
        // A 2x2 frame, white: Y 235, neutral chroma.
        byte[] packed = new byte[CameraCapture.FRAME_HEADER + 6];
        for (int k = 0; k < 4; k++) packed[CameraCapture.FRAME_HEADER + k] = (byte) 235;
        packed[CameraCapture.FRAME_HEADER + 4] = (byte) 128;
        packed[CameraCapture.FRAME_HEADER + 5] = (byte) 128;
        CameraCapture.store(CameraCapture.currentStream(), 2, 2, packed);
        assertEquals("1|2|2|90|6|255|255|255|255", cmd("cam.latest", 0));
        assertEquals("<none>", cmd("cam.latest", 1));
        assertEquals("0", cmd("cam.stop"));
    }

    @Test public void notificationInteractions() throws Exception {
        NotificationManager nm = (NotificationManager) app.getSystemService(Context.NOTIFICATION_SERVICE);
        assertEquals("ok", cmd("notif.full", 12, "Ping", "Are you there?", "Answer"));
        Notification n = shadowOf(nm).getNotification(12);
        assertEquals(3, n.actions.length);
        n.actions[0].actionIntent.send();
        idle();
        n.deleteIntent.send();
        idle();
        assertEquals("12:action:yes,12:dismissed:", cmd("notif.events"));
        Intent tap = new Intent(Intent.ACTION_MAIN).putExtra(Notifications.EXTRA_TAP, 12);
        ActivityController<Activity> c = Robolectric.buildActivity(Activity.class, tap).create();
        assertEquals("12:tap:", cmd("notif.events"));
        c.destroy();
    }

    @Test public void alarmsAndJobs() {
        long now = Long.parseLong(cmd("now"));
        assertTrue(Math.abs(now - System.currentTimeMillis()) < 60_000);
        org.robolectric.shadows.ShadowAlarmManager.setCanScheduleExactAlarms(false);
        assertEquals("0", cmd("alarm.exact"));                    // Android 12+: the user grants it
        org.robolectric.shadows.ShadowAlarmManager.setCanScheduleExactAlarms(true);
        assertEquals("1", cmd("alarm.exact"));
        assertEquals("1", cmd("alarm.set", 3, now + 60_000, "Stretch", "Get up", 1));
        assertEquals("0", cmd("alarm.set", 4, now + 120_000, "", "", 0));
        assertEquals("3,4", cmd("alarm.pending"));
        Alarms.fire(app, 3);
        assertEquals("3:" + (now + 60_000), cmd("alarm.events"));
        assertEquals("4", cmd("alarm.pending"));
        assertEquals("", cmd("alarm.cancel", 4));

        assertEquals("1", cmd("job.schedule", 7, 30, 0, "jnUnmetered", 1, 1));
        assertEquals("1", cmd("job.schedule", 8, 0, 1000, "jnNone", 0, 0));
        assertEquals("7,8", cmd("job.scheduled"));
        Robolectric.setupService(DruidJobService.class).ran(7);
        assertEquals("7", cmd("job.events"));
        assertEquals("8", cmd("job.cancel", 7));
        assertEquals("", cmd("job.cancelAll"));
    }

    @Test public void incomingShares() throws Exception {
        Intent share = new Intent(Intent.ACTION_SEND).setType("text/plain")
            .putExtra(Intent.EXTRA_TEXT, "from another app").putExtra(Intent.EXTRA_SUBJECT, "Hi");
        ActivityController<Activity> c = Robolectric.buildActivity(Activity.class, share).create();
        assertEquals("send|text/plain|Hi|from another app||", cmd("incoming.events"));
        Druid.newIntent(c.get(), new Intent(Intent.ACTION_VIEW, android.net.Uri.parse("https://nim-lang.org")));
        assertEquals("view||||https://nim-lang.org|", cmd("incoming.events"));
        c.destroy();
        assertEquals(new java.io.File(app.getCacheDir(), Incoming.DIR).getPath(), cmd("incoming.dir"));
        assertEquals("ok", cmd("incoming.clear"));
    }

    @Test public void bleScanning() {
        BluetoothManager bm = (BluetoothManager) app.getSystemService(Context.BLUETOOTH_SERVICE);
        shadowOf(bm.getAdapter()).setEnabled(true);
        String heart = "0000180d-0000-1000-8000-00805f9b34fb";
        assertEquals("1", cmd("ble.start", "smLowLatency", heart, 0));
        org.robolectric.shadows.ShadowBluetoothLeScanner sc = Shadow.extract(bm.getAdapter().getBluetoothLeScanner());
        android.bluetooth.le.ScanCallback cb = sc.getScanCallbacks().iterator().next();
        cb.onScanResult(1, new android.bluetooth.le.ScanResult(bm.getAdapter().getRemoteDevice("AA:BB:CC:00:00:01"),
            null, -42, 0));
        cb.onScanFailed(2);
        assertEquals("AA:BB:CC:00:00:01||-42||0,||0||2", cmd("ble.events"));
        assertEquals("0", cmd("ble.stop"));
        shadowOf(bm.getAdapter()).setEnabled(false);
        assertTrue(cmd("ble.start", "smBalanced", "", 1000).startsWith("ERR DruidError"));
    }

    // ---- foreground, voice, secure store, GATT, NFC, push ----

    @Test public void foregroundService() {
        assertEquals("ok", cmd("fg.start", "Tracking", "0 km", "ftLocation;ftDataSync"));
        Intent started = shadowOf(app).getNextStartedService();
        assertEquals(8 | 1, started.getIntExtra(Foreground.EXTRA_TYPES, 0));
        org.robolectric.android.controller.ServiceController<DruidForegroundService> c =
            Robolectric.buildService(DruidForegroundService.class, started).create().startCommand(0, 1);
        assertEquals("1", cmd("fg.running"));
        assertEquals("ok", cmd("fg.update", "Tracking", "2 km", 50));
        assertEquals("ok", cmd("fg.stop"));
        c.destroy();
        assertEquals("started,stopped", cmd("fg.events"));
        assertEquals("0", cmd("fg.running"));
    }

    @Test public void recording() {
        String path = new java.io.File(app.getCacheDir(), "nim.m4a").getPath();
        assertTrue(cmd("rec.start", path, 0).startsWith("ERR DruidPermissionError"));
        shadowOf(app).grantPermissions(Manifest.permission.RECORD_AUDIO);
        assertTrue(cmd("rec.start", path, 0).startsWith("1|"));
        assertTrue(cmd("rec.start", path, 0).startsWith("ERR DruidError"));      // one at a time
        assertEquals("true", cmd("rec.stop"));
        assertEquals("0", cmd("rec.recording"));
        assertEquals("stopped:" + path, cmd("rec.events"));
    }

    @Test public void textToSpeech() {
        assertEquals("0", cmd("tts.open"));
        android.speech.tts.TextToSpeech t = org.robolectric.shadows.ShadowTextToSpeech.getLastTextToSpeechInstance();
        org.robolectric.shadows.ShadowTextToSpeech st = shadowOf(t);
        st.getOnInitListener().onInit(android.speech.tts.TextToSpeech.SUCCESS);
        assertEquals("1|0", cmd("tts.state"));
        org.robolectric.shadows.ShadowTextToSpeech.addLanguageAvailability(java.util.Locale.GERMANY);
        assertFalse(cmd("tts.lang", "de-DE").equals("lsNotSupported"));
        String u = cmd("tts.speak", "Hallo", 1);
        assertEquals("Hallo", st.getLastSpokenText());
        st.getUtteranceProgressListener().onDone(u);
        assertEquals("ready:,done:" + u, cmd("tts.events"));
        assertEquals("ok", cmd("tts.stop"));
        assertEquals("0", cmd("tts.close"));
        org.robolectric.shadows.ShadowTextToSpeech.reset();
    }

    @Test public void speechRecognition() throws Exception {
        assertTrue(cmd("sr.available").matches("[01]"));
        shadowOf(app).grantPermissions(Manifest.permission.RECORD_AUDIO);
        String id = cmd("sr.start", "en-US", 1);
        idle();
        org.robolectric.shadows.ShadowSpeechRecognizer s =
            Shadow.extract(org.robolectric.shadows.ShadowSpeechRecognizer.getLatestSpeechRecognizer());
        android.os.Bundle r = new android.os.Bundle();
        r.putStringArrayList(android.speech.SpeechRecognizer.RESULTS_RECOGNITION,
                             new java.util.ArrayList<>(java.util.Arrays.asList("hello", "yellow")));
        s.triggerOnResults(r);
        s.triggerOnError(6);
        assertEquals(id + ":result:hello;yellow:0," + id + ":error::6", cmd("sr.events"));
        assertEquals("1", cmd("sr.stop"));
        assertEquals("0", cmd("sr.cancel"));
    }

    @Test public void secureStore() throws Exception {
        javax.crypto.KeyGenerator g = javax.crypto.KeyGenerator.getInstance("AES");
        g.init(256);
        javax.crypto.SecretKey k = g.generateKey();
        SecureStore.Keys real = SecureStore.keys;
        SecureStore.keys = () -> k;
        try {
            assertEquals("", cmd("sec.clear"));
            assertEquals("<none>", cmd("sec.get", "token"));
            assertEquals("ok", cmd("sec.set", "token", "s3cr3t ✓"));
            assertEquals("s3cr3t ✓", cmd("sec.get", "token"));
            assertEquals("ok", cmd("sec.setBytes", "empty", ""));
            assertEquals("", cmd("sec.getBytes", "empty"));         // present, empty
            assertEquals("ok", cmd("sec.setBytes", "raw", "00ff10"));
            assertEquals("00ff10", cmd("sec.getBytes", "raw"));
            assertEquals("empty,raw,token", cmd("sec.names"));
            assertEquals("1", cmd("sec.has", "raw"));
            app.getSharedPreferences("dev.druid.secure", 0).edit().putString("bad", "AAAA").commit();
            assertEquals("<none>", cmd("sec.getBytes", "bad"));       // undecryptable: absent
            assertEquals("empty,token", cmd("sec.remove", "raw"));
            assertEquals("", cmd("sec.clear"));
        } finally {
            SecureStore.keys = real;
        }
    }

    @Test public void gatt() {
        BluetoothManager bm = (BluetoothManager) app.getSystemService(Context.BLUETOOTH_SERVICE);
        shadowOf(bm.getAdapter()).setEnabled(true);
        String addr = "AA:BB:CC:DD:EE:02";
        assertTrue(cmd("gatt.connect", addr).startsWith("ERR DruidPermissionError"));
        shadowOf(app).grantPermissions("android.permission.BLUETOOTH_CONNECT");
        String id = cmd("gatt.connect", addr);
        android.bluetooth.BluetoothGatt g = BleGatt.gatt(Integer.parseInt(id));
        org.robolectric.shadows.ShadowBluetoothGatt sg = Shadow.extract(g);
        String svc = "0000180d-0000-1000-8000-00805f9b34fb", hr = "00002a37-0000-1000-8000-00805f9b34fb";
        android.bluetooth.BluetoothGattService s = new android.bluetooth.BluetoothGattService(
            java.util.UUID.fromString(svc), android.bluetooth.BluetoothGattService.SERVICE_TYPE_PRIMARY);
        android.bluetooth.BluetoothGattCharacteristic c = new android.bluetooth.BluetoothGattCharacteristic(
            java.util.UUID.fromString(hr), 2 | 8 | 16, 1 | 16);
        s.addCharacteristic(c);
        sg.addDiscoverableService(s);
        android.bluetooth.BluetoothGattCallback cb = sg.getGattCallback();
        // Connected: Druid asks for the services, and Robolectric's GATT answers.
        cb.onConnectionStateChange(g, 0, android.bluetooth.BluetoothProfile.STATE_CONNECTED);
        assertEquals("connected::0:::0,services::0::" + hr + "/26:0", cmd("gatt.events"));
        assertEquals("1", cmd("gatt.read", id, svc, hr));
        cb.onCharacteristicRead(g, c, new byte[] { 0x0a, (byte) 0xff }, 0);
        assertTrue(cmd("gatt.events").startsWith("read:" + hr + ":0:0aff:"));
        assertTrue(cmd("gatt.write", id, svc, hr, "01", 1).matches("[01]"));
        sg.allowCharacteristicNotification(c);
        assertEquals("1", cmd("gatt.notify", id, svc, hr, 1));
        assertEquals("ok", cmd("gatt.disconnect", id));
        assertEquals("0", cmd("gatt.close", id));
    }

    @Test public void nfcTags() {
        org.robolectric.shadows.ShadowNfcAdapter.setNfcHardwareExists(true);
        shadowOf(app.getPackageManager()).setSystemFeature(PackageManager.FEATURE_NFC, true);
        ActivityController<Activity> c = Robolectric.buildActivity(Activity.class).setup();
        android.nfc.NfcAdapter a = android.nfc.NfcAdapter.getDefaultAdapter(app);
        shadowOf(a).setEnabled(true);
        assertEquals("1", cmd("nfc.start"));
        NfcReader.report("04a1", "NfcA,Ndef", new android.nfc.NdefMessage(
            android.nfc.NdefRecord.createUri("https://nim-lang.org")));
        assertEquals("04a1:NfcA;Ndef:uri=https://nim-lang.org", cmd("nfc.events"));
        assertEquals("0", cmd("nfc.stop"));
        c.pause().stop().destroy();
        org.robolectric.shadows.ShadowNfcAdapter.reset();
    }

    @Test public void pushWithoutTheModule() {
        assertEquals("0", cmd("push.available"));                  // druid-fcm is not in this app
        // Firebase put a message in the launch Intent; the user tapped its notification.
        Intent tap = new Intent(Intent.ACTION_MAIN).putExtra("google.message_id", "m-7")
            .putExtra("from", "123").putExtra("chat", "42").putExtra("gcm.n.e", "1");
        ActivityController<Activity> c = Robolectric.buildActivity(Activity.class, tap).create();
        assertEquals("opened:m-7:chat=42", cmd("push.events"));
        c.destroy();
    }
}
