package dev.druid;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.NotificationManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Build;
import android.util.DisplayMetrics;
import androidx.test.core.app.ActivityScenario;
import androidx.test.core.app.ApplicationProvider;
import androidx.test.ext.junit.runners.AndroidJUnit4;
import androidx.test.platform.app.InstrumentationRegistry;
import java.util.concurrent.atomic.AtomicReference;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;

/**
 * The Nim harness (tests/robolectric/harness.nim), built with the NDK, on a
 * real device or emulator: Nim -> JNI -> dev.druid.* -> the real system
 * services, under ART and CheckJNI (debuggable test APK).
 */
@RunWith(AndroidJUnit4.class)
public class DeviceTest {
    static { System.loadLibrary("druid_harness"); }

    static native void start(Context context);
    static native void stop();
    static native String run(String command);

    static String cmd(String name, Object... args) {
        StringBuilder b = new StringBuilder(name);
        for (Object a : args) b.append('|').append(a);
        return run(b.toString());
    }

    private Context app;

    @Before public void setUp() {
        app = ApplicationProvider.getApplicationContext();
        start(app);
        assertEquals("1", cmd("started"));
        cmd("reset");
        Druid.pollEvents();
    }

    @After public void tearDown() {
        stop();
    }

    @Test public void deviceFactsMatchBuild() {
        String[] f = cmd("device").split("\\|", -1);
        assertEquals(String.valueOf(Build.VERSION.SDK_INT), f[0]);
        assertEquals(Build.MODEL, f[3]);
        assertEquals("1", f[4]);
        // The NDK path reads the same API level without JNI.
        assertEquals(String.valueOf(Build.VERSION.SDK_INT) + "|" + Build.VERSION.SDK_INT, cmd("ndk"));
    }

    @Test public void stringsSurviveCheckJni() {
        // NewStringUTF with these would abort under CheckJNI; Druid uses UTF-16.
        String s = "héllo 日本 😀🇫🇷 end";
        assertEquals(s, cmd("prefs.roundtrip", "device_utf", s).split("\\|")[0]);
    }

    @Test public void appAndStorage() {
        assertTrue(cmd("app", "android.hardware.touchscreen", "android").startsWith(app.getPackageName() + "|"));
        String[] st = cmd("storage").split("\\|", -1);
        assertEquals(app.getFilesDir().getAbsolutePath(), st[0]);
        assertEquals("from nim on a device", cmd("storage.write", "d.txt", "from nim on a device"));
        String[] space = cmd("storage.space", st[0]).split("\\|");
        assertTrue(Long.parseLong(space[0]) > 0);
        assertTrue(Long.parseLong(space[1]) >= Long.parseLong(space[0]));
    }

    @Test public void displayMatchesResources() {
        DisplayMetrics m = app.getResources().getDisplayMetrics();
        String[] f = cmd("display").split("\\|");
        assertEquals(m.densityDpi, Integer.parseInt(f[3]));
        assertEquals(m.density, Float.parseFloat(f[2]), 1e-4);
        assertTrue(Integer.parseInt(f[0]) > 0 && Integer.parseInt(f[1]) > 0);
    }

    @Test public void prefsCryptoMemoryPower() {
        assertEquals("v|9000000000|0.1|1|1|-5|4", cmd("prefs.roundtrip", "device", "v"));
        SharedPreferences sp = app.getSharedPreferences("device", Context.MODE_PRIVATE);
        assertEquals("v", sp.getString("s", null));
        assertTrue(cmd("crypto", "hello", "key").startsWith(
            "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824|"));
        String[] mem = cmd("mem").split("\\|");
        assertTrue(Long.parseLong(mem[1]) > 0);
        String[] p = cmd("power").split("\\|", -1);
        int level = Integer.parseInt(p[0]);
        assertTrue(p[0], level >= -1 && level <= 100);
        String[] lock = cmd("power.lock", "druid:test", 5000).split("\\|");
        assertEquals("1", lock[1]);
        assertEquals("1|0", cmd("power.unlock", lock[0]));
    }

    @Test public void notifications() {
        NotificationManager nm = app.getSystemService(NotificationManager.class);
        assertEquals("1", cmd("notif.channel", "device", "Device", "imDefault", ""));
        assertTrue(nm.getNotificationChannel("device") != null);
        cmd("notif.cancelAll");
        if (nm.areNotificationsEnabled()) {
            assertEquals("ok", cmd("notif.show", 42, "Druid", "on a device", "device", 0, -1));
            assertEquals("42", cmd("notif.active"));
            cmd("notif.cancel", 42);
        }
    }

    @Test public void connectivitySensorsAudioCamera() {
        assertTrue(cmd("net"), cmd("net").matches("[01]\\|\\w+\\|[01]"));
        assertEquals("1", cmd("net.monitor"));
        assertEquals("0", cmd("net.unmonitor"));
        assertTrue(cmd("sensor.types").matches("[0-9,]*"));
        assertTrue(cmd("audio", "asMusic").matches("\\d+\\|\\d+\\|\\d+\\|rm\\w+\\|[01]\\|[01]\\|[01]"));
        assertTrue(cmd("audio.hints"), cmd("audio.hints").matches("\\d+\\|\\d+"));
        assertTrue(!cmd("cam").startsWith("ERR"));
        assertTrue(!cmd("bt").startsWith("ERR"));
        assertTrue(!cmd("tel").startsWith("ERR"));
    }

    @Test public void clipboardInTheForeground() {
        // Android 10+ lets only the focused app read the clipboard.
        try (ActivityScenario<DruidTestActivity> s = ActivityScenario.launch(DruidTestActivity.class)) {
            AtomicReference<String> got = new AtomicReference<>();
            s.onActivity(a -> { Druid.init(a); });
            InstrumentationRegistry.getInstrumentation().waitForIdleSync();
            assertEquals("ok", cmd("clip.set", "copied on a device ✓"));
            s.onActivity(a -> got.set(cmd("clip.get")));
            assertEquals("copied on a device ✓", got.get());
        }
    }

    @Test public void errorsAndThreads() {
        assertTrue(cmd("err.java").startsWith("ERR DruidError: Player.play: java.lang.IllegalArgumentException"));
        assertTrue(cmd("err.method").startsWith("ERR DruidError: no Java method"));
        // A thread Nim creates is attached for the call and detached when it exits
        // (ART aborts the process on a thread that exits attached).
        for (int k = 0; k < 5; k++) assertEquals(String.valueOf(Build.VERSION.SDK_INT), cmd("thread.call"));
    }

    @Test public void eventsAndWake() {
        assertEquals("ok", cmd("wake.install"));
        int before = Integer.parseInt(cmd("wake.count"));
        Druid.post("memory", 20);
        assertEquals(before + 1, Integer.parseInt(cmd("wake.count")));
        assertEquals("ekMemory:20", cmd("events.kinds"));
    }
}
