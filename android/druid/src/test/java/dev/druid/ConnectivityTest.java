package dev.druid;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkCapabilities;
import org.junit.Test;
import org.robolectric.shadows.ShadowNetwork;
import org.robolectric.shadows.ShadowNetworkCapabilities;

public class ConnectivityTest extends DruidTestBase {
    private ConnectivityManager cm() { return (ConnectivityManager) app.getSystemService(Context.CONNECTIVITY_SERVICE); }

    private NetworkCapabilities caps(int transport, boolean internet, boolean unmetered) {
        NetworkCapabilities c = ShadowNetworkCapabilities.newInstance();
        if (transport >= 0) shadowOf(c).addTransportType(transport);
        if (internet) shadowOf(c).addCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET);
        if (unmetered) shadowOf(c).addCapability(NetworkCapabilities.NET_CAPABILITY_NOT_METERED);
        return c;
    }

    @Test public void everyTransportHasAName() {
        assertEquals("none", Connectivity.typeOf(null));
        assertEquals("wifi", Connectivity.typeOf(caps(NetworkCapabilities.TRANSPORT_WIFI, true, true)));
        assertEquals("cellular", Connectivity.typeOf(caps(NetworkCapabilities.TRANSPORT_CELLULAR, true, false)));
        assertEquals("ethernet", Connectivity.typeOf(caps(NetworkCapabilities.TRANSPORT_ETHERNET, true, true)));
        assertEquals("bluetooth", Connectivity.typeOf(caps(NetworkCapabilities.TRANSPORT_BLUETOOTH, true, true)));
        assertEquals("other", Connectivity.typeOf(caps(-1, true, true)));
        NetworkCapabilities vpn = caps(NetworkCapabilities.TRANSPORT_WIFI, true, true);
        shadowOf(vpn).addTransportType(NetworkCapabilities.TRANSPORT_VPN);
        assertEquals("vpn", Connectivity.typeOf(vpn));    // a VPN over Wi-Fi is a VPN
    }

    @Test public void activeNetwork() {
        shadowOf(cm()).setNetworkCapabilities(cm().getActiveNetwork(), caps(NetworkCapabilities.TRANSPORT_CELLULAR, true, false));
        assertTrue(Connectivity.isConnected());
        assertEquals("cellular", Connectivity.networkType());
        assertTrue(Connectivity.isMetered());
        shadowOf(cm()).setNetworkCapabilities(cm().getActiveNetwork(), caps(NetworkCapabilities.TRANSPORT_WIFI, false, true));
        assertFalse(Connectivity.isConnected());           // no internet capability
        assertFalse(Connectivity.isMetered());
    }

    @Test public void noActiveNetwork() {
        shadowOf(cm()).setDefaultNetworkActive(false);
        shadowOf(cm()).setActiveNetworkInfo(null);
        assertFalse(Connectivity.isConnected());
        assertEquals("none", Connectivity.networkType());
    }

    @Test public void monitoringPostsEventsAndIsIdempotent() {
        Connectivity.startMonitoring();
        Connectivity.startMonitoring();
        assertEquals(1, shadowOf(cm()).getNetworkCallbacks().size());
        assertTrue(Connectivity.isMonitoring());
        for (ConnectivityManager.NetworkCallback cb : shadowOf(cm()).getNetworkCallbacks()) {
            cb.onCapabilitiesChanged(ShadowNetwork.newInstance(7), caps(NetworkCapabilities.TRANSPORT_WIFI, true, true));
            cb.onLost(ShadowNetwork.newInstance(7));
        }
        java.util.List<String[]> ev = events("connectivity");
        assertEquals(2, ev.size());
        assertArrayEquals(new String[] { "connectivity", "wifi", "1", "0" }, ev.get(0));
        assertArrayEquals(new String[] { "connectivity", "none", "0", "0" }, ev.get(1));
        Connectivity.stopMonitoring();
        Connectivity.stopMonitoring();
        assertFalse(Connectivity.isMonitoring());
        assertEquals(0, shadowOf(cm()).getNetworkCallbacks().size());
    }
}
