package dev.druid;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;

/**
 * Network state. Needs ACCESS_NETWORK_STATE (normal). {@link #startMonitoring}
 * posts a "connectivity" event (type, connected 1|0, metered 1|0) on every change.
 */
public final class Connectivity {
    private Connectivity() {}

    private static ConnectivityManager cm() {
        return (ConnectivityManager) Druid.context().getSystemService(Context.CONNECTIVITY_SERVICE);
    }

    private static NetworkCapabilities caps() {
        ConnectivityManager m = cm();
        Network n = m.getActiveNetwork();
        return n == null ? null : m.getNetworkCapabilities(n);
    }

    public static boolean isConnected() {
        NetworkCapabilities c = caps();
        return c != null && c.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET);
    }

    /** "wifi", "cellular", "ethernet", "bluetooth", "vpn", "other" or "none". */
    public static String networkType() { return typeOf(caps()); }

    static String typeOf(NetworkCapabilities c) {
        if (c == null) return "none";
        if (c.hasTransport(NetworkCapabilities.TRANSPORT_VPN)) return "vpn";
        if (c.hasTransport(NetworkCapabilities.TRANSPORT_WIFI)) return "wifi";
        if (c.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR)) return "cellular";
        if (c.hasTransport(NetworkCapabilities.TRANSPORT_ETHERNET)) return "ethernet";
        if (c.hasTransport(NetworkCapabilities.TRANSPORT_BLUETOOTH)) return "bluetooth";
        return "other";
    }

    /** Whether data may cost money; true when there is no network to ask. */
    public static boolean isMetered() {
        NetworkCapabilities c = caps();
        return c == null ? cm().isActiveNetworkMetered()
                         : !c.hasCapability(NetworkCapabilities.NET_CAPABILITY_NOT_METERED);
    }

    private static ConnectivityManager.NetworkCallback callback;

    public static synchronized void startMonitoring() {
        if (callback != null) return;
        callback = new ConnectivityManager.NetworkCallback() {
            @Override public void onCapabilitiesChanged(Network n, NetworkCapabilities c) {
                Druid.post("connectivity", typeOf(c),
                    c.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET) ? 1 : 0,
                    c.hasCapability(NetworkCapabilities.NET_CAPABILITY_NOT_METERED) ? 0 : 1);
            }
            @Override public void onLost(Network n) { Druid.post("connectivity", "none", 0, 0); }
        };
        cm().registerDefaultNetworkCallback(callback);
    }

    public static synchronized void stopMonitoring() {
        if (callback == null) return;
        try { cm().unregisterNetworkCallback(callback); } finally { callback = null; }
    }

    public static synchronized boolean isMonitoring() { return callback != null; }
}
