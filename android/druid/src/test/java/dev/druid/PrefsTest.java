package dev.druid;

import static org.junit.Assert.*;

import android.content.Context;
import java.util.Arrays;
import org.junit.Test;

public class PrefsTest extends DruidTestBase {
    @Test public void everyTypeRoundTrips() {
        assertTrue(Prefs.putString("f", "s", "text"));
        assertTrue(Prefs.putLong("f", "l", Long.MIN_VALUE));
        assertTrue(Prefs.putDouble("f", "d", Math.PI));
        assertTrue(Prefs.putBool("f", "b", true));
        assertEquals("text", Prefs.getString("f", "s", "x"));
        assertEquals(Long.MIN_VALUE, Prefs.getLong("f", "l", 0));
        assertEquals(Math.PI, Prefs.getDouble("f", "d", 0), 0);       // exact: stored as bits
        assertTrue(Prefs.getBool("f", "b", false));
    }

    @Test public void defaultsForMissingAndWrongTypes() {
        assertEquals("dflt", Prefs.getString("g", "missing", "dflt"));
        assertEquals(-1.5, Prefs.getDouble("g", "missing", -1.5), 0);
        Prefs.putString("g", "s", "x");
        Prefs.putLong("g", "l", 5);
        assertEquals(7, Prefs.getLong("g", "s", 7));
        assertEquals("d", Prefs.getString("g", "l", "d"));
        assertFalse(Prefs.getBool("g", "s", false));
        assertEquals(1.0, Prefs.getDouble("g", "s", 1.0), 0);
    }

    @Test public void filesAreSeparateAndTheDefaultHasAName() {
        Prefs.putString("", "k", "default file");
        Prefs.putString("other", "k", "other file");
        assertEquals("default file", Prefs.getString("", "k", ""));
        assertEquals("other file", Prefs.getString("other", "k", ""));
        assertEquals("default file", app.getSharedPreferences(app.getPackageName() + "_druid", Context.MODE_PRIVATE).getString("k", null));
        assertEquals("default file", Prefs.getString(null, "k", ""));
    }

    @Test public void containsRemoveClearKeys() {
        Prefs.putString("h", "a", "1");
        Prefs.putString("h", "b", "2");
        assertTrue(Prefs.contains("h", "a"));
        String[] keys = Prefs.keys("h");
        Arrays.sort(keys);
        assertArrayEquals(new String[] { "a", "b" }, keys);
        assertTrue(Prefs.remove("h", "a"));
        assertFalse(Prefs.contains("h", "a"));
        assertTrue(Prefs.clear("h"));
        assertEquals(0, Prefs.keys("h").length);
    }
}
