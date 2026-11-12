package dev.druid;

import static org.junit.Assert.*;

import android.content.res.Configuration;
import org.junit.Test;
import org.robolectric.annotation.Config;

/** Druid itself: device facts and the callbacks that become events. */
public class DruidCoreTest extends DruidTestBase {
    @Test public void deviceFacts() {
        assertEquals(android.os.Build.VERSION.RELEASE, Druid.release());
        assertEquals(android.os.Build.BRAND, Druid.brand());
        assertEquals(android.os.Build.DEVICE, Druid.device());
        assertFalse(Druid.locale().isEmpty());
        assertFalse(Druid.timeZone().isEmpty());
        Druid.isEmulator();
    }

    @Test @Config(qualifiers = "night")
    public void nightMode() { assertTrue(Druid.isNightMode()); }

    @Test @Config(qualifiers = "notnight")
    public void dayMode() { assertFalse(Druid.isNightMode()); }

    @Test public void configurationChangesAreEvents() {
        Configuration c = new Configuration(app.getResources().getConfiguration());
        c.orientation = Configuration.ORIENTATION_LANDSCAPE;
        c.uiMode = Configuration.UI_MODE_NIGHT_YES;
        c.fontScale = 1.15f;
        app.onConfigurationChanged(c);
        String[] ev = events("configuration").get(0);
        assertEquals("2", ev[1]);
        assertEquals(String.valueOf(Configuration.UI_MODE_NIGHT_YES), ev[2]);
        assertEquals("1.15", ev[3]);
    }

    @Test public void lowMemoryIsTheHighestTrimLevel() {
        app.onLowMemory();
        assertEquals("80", events("memory").get(0)[1]);
    }

    @Test public void contextBeforeInitIsAnError() {
        // A fresh class loader would be needed to see "not initialised"; at least
        // init(null) is refused and leaves Druid as it was.
        try { Druid.init(null); fail(); } catch (IllegalArgumentException expected) {}
        assertTrue(Druid.isInitialized());
    }
}
