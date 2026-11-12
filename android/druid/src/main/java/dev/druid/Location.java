package dev.druid;

import android.content.Context;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Looper;
import java.util.HashMap;
import java.util.List;

/**
 * Location through the platform LocationManager (no Play Services). Needs
 * ACCESS_FINE_LOCATION or ACCESS_COARSE_LOCATION, granted at runtime. Updates
 * arrive as "location" events (see {@link #fields}).
 */
public final class Location {
    private Location() {}

    private static LocationManager lm() {
        return (LocationManager) Druid.context().getSystemService(Context.LOCATION_SERVICE);
    }

    public static String[] providers(boolean enabledOnly) {
        List<String> p = lm().getProviders(enabledOnly);
        return p.toArray(new String[0]);
    }

    public static boolean isProviderEnabled(String provider) {
        try { return lm().isProviderEnabled(provider); } catch (IllegalArgumentException e) { return false; }
    }

    public static boolean isLocationEnabled() {
        return android.os.Build.VERSION.SDK_INT >= 28 ? lm().isLocationEnabled()
            : isProviderEnabled(LocationManager.GPS_PROVIDER) || isProviderEnabled(LocationManager.NETWORK_PROVIDER);
    }

    /** {lat, lon, altitude, accuracy m, time ms, speed m/s, bearing deg}, or null when there is none. */
    public static double[] lastKnown(String provider) {
        android.location.Location l = lm().getLastKnownLocation(provider);
        return l == null ? null : values(l);
    }

    static double[] values(android.location.Location l) {
        return new double[] { l.getLatitude(), l.getLongitude(),
            l.hasAltitude() ? l.getAltitude() : Double.NaN,
            l.hasAccuracy() ? l.getAccuracy() : Double.NaN,
            l.getTime(),
            l.hasSpeed() ? l.getSpeed() : Double.NaN,
            l.hasBearing() ? l.getBearing() : Double.NaN };
    }

    /** provider, then {@link #values}. */
    static Object[] fields(android.location.Location l) {
        double[] v = values(l);
        Object[] f = new Object[1 + v.length];
        f[0] = l.getProvider();
        for (int k = 0; k < v.length; k++) f[k + 1] = v[k];
        return f;
    }

    private static final HashMap<String, LocationListener> listeners = new HashMap<>();

    /** Starts updates from {@code provider}, at most every {@code minTimeMs} and {@code minDistanceM}. */
    public static synchronized void start(String provider, long minTimeMs, float minDistanceM) {
        stop(provider);
        LocationListener l = new LocationListener() {
            @Override public void onLocationChanged(android.location.Location loc) { Druid.post("location", fields(loc)); }
            @Override public void onProviderEnabled(String p) { Druid.post("locationProvider", p, 1); }
            @Override public void onProviderDisabled(String p) { Druid.post("locationProvider", p, 0); }
            @Override public void onStatusChanged(String p, int s, android.os.Bundle b) {}
        };
        lm().requestLocationUpdates(provider, minTimeMs, minDistanceM, l, Looper.getMainLooper());
        listeners.put(provider, l);
    }

    public static synchronized void stop(String provider) {
        LocationListener l = listeners.remove(provider);
        if (l != null) lm().removeUpdates(l);
    }

    public static synchronized void stopAll() {
        for (LocationListener l : listeners.values()) lm().removeUpdates(l);
        listeners.clear();
    }

    public static synchronized boolean isRunning(String provider) { return listeners.containsKey(provider); }

    public static float distanceBetween(double lat1, double lon1, double lat2, double lon2) {
        float[] r = new float[1];
        android.location.Location.distanceBetween(lat1, lon1, lat2, lon2, r);
        return r[0];
    }
}
