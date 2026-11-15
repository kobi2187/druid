package dev.druid;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import static org.robolectric.Shadows.shadowOf;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothManager;
import android.bluetooth.le.ScanCallback;
import android.bluetooth.le.ScanFilter;
import android.bluetooth.le.ScanResult;
import android.content.Context;
import android.os.ParcelUuid;
import android.os.SystemClock;
import java.util.List;
import java.util.Set;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowBluetoothLeScanner;

public class BleScannerTest extends DruidTestBase {
    static final String HEART = "0000180d-0000-1000-8000-00805f9b34fb";

    private BluetoothAdapter adapter() {
        return ((BluetoothManager) app.getSystemService(Context.BLUETOOTH_SERVICE)).getAdapter();
    }

    private ShadowBluetoothLeScanner scanner() {
        return Shadow.extract(adapter().getBluetoothLeScanner());
    }

    @Before public void on() { shadowOf(adapter()).setEnabled(true); }
    @After public void off() { BleScanner.stop(); }

    private ScanResult result(String address, int rssi) {
        BluetoothDevice d = adapter().getRemoteDevice(address);
        return new ScanResult(d, null, rssi, SystemClock.elapsedRealtimeNanos());
    }

    @Test public void startsWithFiltersAndStops() {
        BleScanner.start(2, new String[] { HEART }, 0);
        assertTrue(BleScanner.isScanning());
        Set<ScanCallback> cbs = scanner().getScanCallbacks();
        assertEquals(1, cbs.size());
        List<ScanFilter> filters = scanner().getActiveScans().get(0).scanFilters();
        assertEquals(ParcelUuid.fromString(HEART), filters.get(0).getServiceUuid());
        assertEquals(android.bluetooth.le.ScanSettings.SCAN_MODE_LOW_LATENCY,
                     scanner().getActiveScans().get(0).scanSettings().getScanMode());
        BleScanner.stop();
        assertFalse(BleScanner.isScanning());
        assertEquals(0, scanner().getScanCallbacks().size());
    }

    @Test public void devicesAreEventsThrottledPerDevice() {
        BleScanner.start(1, new String[0], 60_000);
        ScanCallback cb = scanner().getScanCallbacks().iterator().next();
        cb.onScanResult(ScanSettingsCallbackType.ALL, result("AA:BB:CC:00:00:01", -50));
        cb.onScanResult(ScanSettingsCallbackType.ALL, result("AA:BB:CC:00:00:01", -45));   // too soon
        cb.onScanResult(ScanSettingsCallbackType.ALL, result("AA:BB:CC:00:00:02", -70));
        List<String[]> ev = events("ble");
        assertEquals(2, ev.size());
        assertEquals("AA:BB:CC:00:00:01", ev.get(0)[1]);
        assertEquals("-50", ev.get(0)[3]);
        assertEquals("AA:BB:CC:00:00:02", ev.get(1)[1]);
    }

    @Test public void aFailedScanIsAnEvent() {
        BleScanner.start(0, new String[0], 0);
        scanner().getScanCallbacks().iterator().next().onScanFailed(ScanCallback.SCAN_FAILED_INTERNAL_ERROR);
        assertArrayEquals(new String[] { "ble", "", "", "0", "error:3" }, events("ble").get(0));
        assertFalse(BleScanner.isScanning());
    }

    @Test public void bluetoothOffIsAnError() {
        shadowOf(adapter()).setEnabled(false);
        try {
            BleScanner.start(0, new String[0], 0);
            fail();
        } catch (IllegalStateException e) {
            assertTrue(e.getMessage().contains("off"));
        }
        assertFalse(BleScanner.isScanning());
    }

    /** ScanSettings.CALLBACK_TYPE_ALL_MATCHES, named. */
    static final class ScanSettingsCallbackType { static final int ALL = 1; }
}
