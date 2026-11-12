package dev.druid;

import static org.robolectric.Shadows.shadowOf;

import android.app.Application;
import android.os.Looper;
import androidx.test.core.app.ApplicationProvider;
import java.util.ArrayList;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * Druid started on the test Application, its event queue empty, its listeners
 * stopped afterwards. Every test runs on Android 7.0 (API 24, minSdk), 9, 11, 13
 * and 16 (API 36), so the code paths for old and new versions both run.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = { 24, 28, 30, 33, 36 })
public abstract class DruidTestBase {
    protected Application app;

    @Before public void startDruid() {
        app = ApplicationProvider.getApplicationContext();
        Druid.init(app);
        Druid.pollEvents();
    }

    @After public void stopServices() {
        Connectivity.stopMonitoring();
        Location.stopAll();
        Sensors.stopAll();
        Player.closeAll();
    }

    /** The Android version this run is on. */
    protected static int api() { return android.os.Build.VERSION.SDK_INT; }

    protected void idle() { shadowOf(Looper.getMainLooper()).idle(); }

    /** The queued events of `kind`, each split into its fields (the kind first). */
    protected List<String[]> events(String kind) {
        List<String[]> out = new ArrayList<>();
        for (String e : Druid.pollEvents()) {
            String[] f = e.split(String.valueOf(Druid.SEP), -1);
            if (f[0].equals(kind)) out.add(f);
        }
        return out;
    }
}
