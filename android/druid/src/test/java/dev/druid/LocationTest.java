package dev.druid;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.Manifest;
import android.content.Context;
import android.location.LocationManager;
import java.util.Arrays;
import org.junit.Before;
import org.junit.Test;

public class LocationTest extends DruidTestBase {
    private LocationManager lm() { return (LocationManager) app.getSystemService(Context.LOCATION_SERVICE); }

    @Before public void granted() {
        shadowOf(app).grantPermissions(Manifest.permission.ACCESS_FINE_LOCATION, Manifest.permission.ACCESS_COARSE_LOCATION);
    }

    private android.location.Location fix(String provider, double lat, double lon) {
        android.location.Location l = new android.location.Location(provider);
        l.setLatitude(lat);
        l.setLongitude(lon);
        l.setTime(1_000L);
        return l;
    }

    @Test public void providersAndSwitches() {
        shadowOf(lm()).setProviderEnabled(LocationManager.GPS_PROVIDER, true);
        shadowOf(lm()).setProviderEnabled(LocationManager.NETWORK_PROVIDER, false);
        assertTrue(Arrays.asList(Location.providers(true)).contains("gps"));
        assertFalse(Arrays.asList(Location.providers(true)).contains("network"));
        assertTrue(Arrays.asList(Location.providers(false)).contains("network"));
        assertTrue(Location.isProviderEnabled("gps"));
        assertFalse(Location.isProviderEnabled("network"));
        assertFalse(Location.isProviderEnabled("no-such-provider"));
        shadowOf(lm()).setLocationEnabled(false);
        assertFalse(Location.isLocationEnabled());
        shadowOf(lm()).setLocationEnabled(true);
        assertTrue(Location.isLocationEnabled());
    }

    @Test public void lastKnownWithUnknownsAsNaN() {
        assertNull(Location.lastKnown("gps"));
        shadowOf(lm()).setLastKnownLocation("gps", fix("gps", 1.5, 2.5));
        double[] v = Location.lastKnown("gps");
        assertEquals(1.5, v[0], 0);
        assertEquals(2.5, v[1], 0);
        assertTrue(Double.isNaN(v[2]));    // no altitude
        assertTrue(Double.isNaN(v[3]));    // no accuracy
        assertEquals(1000, v[4], 0);
        assertTrue(Double.isNaN(v[5]));
        assertTrue(Double.isNaN(v[6]));
    }

    @Test public void updatesBecomeEventsUntilStopped() {
        shadowOf(lm()).setProviderEnabled("gps", true);
        Location.start("gps", 0, 0);
        Location.start("gps", 0, 0);                    // restart, not a second listener
        assertTrue(Location.isRunning("gps"));
        android.location.Location f = fix("gps", 10, 20);
        f.setAltitude(30);
        f.setAccuracy(4);
        f.setSpeed(2);
        f.setBearing(90);
        shadowOf(lm()).simulateLocation(f);
        idle();
        java.util.List<String[]> ev = events("location");
        assertEquals(1, ev.size());
        assertArrayEquals(new String[] { "location", "gps", "10.0", "20.0", "30.0", "4.0", "1000.0", "2.0", "90.0" }, ev.get(0));
        Location.stop("gps");
        assertFalse(Location.isRunning("gps"));
        shadowOf(lm()).simulateLocation(fix("gps", 11, 21));
        idle();
        assertEquals(0, events("location").size());
    }

    @Test public void providerSwitchesBecomeEvents() {
        shadowOf(lm()).setProviderEnabled("gps", true);
        Location.start("gps", 0, 0);
        shadowOf(lm()).setProviderEnabled("gps", false);
        idle();
        shadowOf(lm()).setProviderEnabled("gps", true);
        idle();
        java.util.List<String[]> ev = events("locationProvider");
        assertEquals("0", ev.get(ev.size() - 2)[2]);
        assertEquals("1", ev.get(ev.size() - 1)[2]);
    }

    @Test public void stopAll() {
        shadowOf(lm()).setProviderEnabled("gps", true);
        shadowOf(lm()).setProviderEnabled("network", true);
        Location.start("gps", 0, 0);
        Location.start("network", 0, 0);
        Location.stopAll();
        assertFalse(Location.isRunning("gps"));
        assertFalse(Location.isRunning("network"));
    }

    @Test public void distance() {
        assertEquals(0, Location.distanceBetween(1, 1, 1, 1), 0);
        assertEquals(111_195, Location.distanceBetween(0, 0, 0, 1), 1_000);
    }
}
