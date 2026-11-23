package dev.druid;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import static org.robolectric.Shadows.shadowOf;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothGatt;
import android.bluetooth.BluetoothGattCallback;
import android.bluetooth.BluetoothGattCharacteristic;
import android.bluetooth.BluetoothGattDescriptor;
import android.bluetooth.BluetoothGattService;
import android.bluetooth.BluetoothManager;
import android.bluetooth.BluetoothProfile;
import android.content.Context;
import java.util.List;
import java.util.UUID;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.robolectric.shadow.api.Shadow;
import org.robolectric.shadows.ShadowBluetoothGatt;

public class BleGattTest extends DruidTestBase {
    static final String SVC = "0000180d-0000-1000-8000-00805f9b34fb";
    static final String HR = "00002a37-0000-1000-8000-00805f9b34fb";
    static final String ADDR = "AA:BB:CC:DD:EE:01";

    private BluetoothAdapter adapter() {
        return ((BluetoothManager) app.getSystemService(Context.BLUETOOTH_SERVICE)).getAdapter();
    }

    @Before public void on() {
        shadowOf(adapter()).setEnabled(true);
        shadowOf(app).grantPermissions("android.permission.BLUETOOTH_CONNECT");
    }

    @After public void closeAll() { for (int k = 1; k < 50; k++) BleGatt.close(k); }

    private BluetoothGattCharacteristic heartRate(BluetoothGatt g) {
        BluetoothGattService s = new BluetoothGattService(UUID.fromString(SVC), BluetoothGattService.SERVICE_TYPE_PRIMARY);
        BluetoothGattCharacteristic c = new BluetoothGattCharacteristic(UUID.fromString(HR),
            BluetoothGattCharacteristic.PROPERTY_READ | BluetoothGattCharacteristic.PROPERTY_NOTIFY
                | BluetoothGattCharacteristic.PROPERTY_WRITE,
            BluetoothGattCharacteristic.PERMISSION_READ | BluetoothGattCharacteristic.PERMISSION_WRITE);
        c.addDescriptor(new BluetoothGattDescriptor(BleGatt.CCCD,
            BluetoothGattDescriptor.PERMISSION_READ | BluetoothGattDescriptor.PERMISSION_WRITE));
        s.addCharacteristic(c);
        ShadowBluetoothGatt sg = Shadow.extract(g);
        sg.addDiscoverableService(s);
        return c;
    }

    @Test @SuppressWarnings("deprecation") public void connectDiscoverReadWriteNotify() {
        int id = BleGatt.connect(ADDR, false);
        BluetoothGatt g = BleGatt.gatt(id);
        ShadowBluetoothGatt sg = Shadow.extract(g);
        BluetoothGattCallback cb = sg.getGattCallback();
        BluetoothGattCharacteristic c = heartRate(g);
        cb.onConnectionStateChange(g, 0, BluetoothProfile.STATE_CONNECTED);
        g.discoverServices();
        cb.onServicesDiscovered(g, 0);
        List<String[]> ev = events("gatt");
        assertArrayEquals(new String[] { "gatt", String.valueOf(id), "connected", "", "0", "" }, ev.get(0));
        String[] svc = ev.get(1);
        assertEquals("services", svc[2]);
        // Robolectric hands discovered services back from Android 16's shadow only.
        if (api() >= 36) assertEquals(SVC + "/" + HR + "/" + c.getProperties(), svc[6]);

        if (api() < 28) return;                  // Robolectric's GATT finds no services before 9
        boolean valueCallbacks = api() >= 33;    // Android 13 added callbacks that carry the value
        BleGatt.read(id, SVC, HR);
        if (valueCallbacks) cb.onCharacteristicRead(g, c, new byte[] { 0, 72 }, 0);
        else { c.setValue(new byte[] { 0, 72 }); cb.onCharacteristicRead(g, c, 0); }
        c.setValue(new byte[] { 0, 73 });
        cb.onCharacteristicRead(g, c, 0);
        BleGatt.write(id, SVC, HR, new byte[] { 1 }, true);
        BleGatt.write(id, SVC, HR, new byte[] { 2 }, false);
        cb.onCharacteristicWrite(g, c, 0);
        sg.allowCharacteristicNotification(c);
        assertTrue(BleGatt.setNotify(id, SVC, HR, true));
        if (valueCallbacks) cb.onCharacteristicChanged(g, c, new byte[] { (byte) 0xff });
        else { c.setValue(new byte[] { (byte) 0xff }); cb.onCharacteristicChanged(g, c); }
        c.setValue(new byte[] { 0x10 });
        cb.onCharacteristicChanged(g, c);
        BleGatt.setNotify(id, SVC, HR, false);
        BleGatt.requestMtu(id, 247);
        // Robolectric's GATT also answers writes itself: more "written" events than ours.
        List<String> seen = new java.util.ArrayList<>();
        for (String[] e : events("gatt")) seen.add(e[2] + "|" + e[5]);
        assertTrue(seen.toString(), seen.contains("written|"));
        seen.removeIf(x -> x.equals("written|"));
        assertEquals(java.util.Arrays.asList("read|0048", "read|0049", "changed|ff", "changed|10", "mtu|247"), seen);
        assertEquals(1, BleGatt.count());
        BleGatt.disconnect(id);
        cb.onConnectionStateChange(g, 0, BluetoothProfile.STATE_DISCONNECTED);
        assertEquals("disconnected", events("gatt").get(0)[2]);
        BleGatt.close(id);
        assertEquals(0, BleGatt.count());
    }

    @Test public void unknownCharacteristicsAndConnectionsThrow() {
        int id = BleGatt.connect(ADDR, true);
        try {
            BleGatt.read(id, SVC, HR);
            fail();
        } catch (IllegalArgumentException expected) {}
        heartRate(BleGatt.gatt(id));
        if (api() < 28) return;
        try {
            BleGatt.read(id, SVC, "00000000-0000-0000-0000-000000000001");
            fail();
        } catch (IllegalArgumentException expected) {}
        try {
            BleGatt.read(77, SVC, HR);
            fail();
        } catch (IllegalArgumentException expected) {}
    }

    @Test public void needsBluetoothOnAndThePermission() {
        shadowOf(adapter()).setEnabled(false);
        try {
            BleGatt.connect(ADDR, false);
            fail();
        } catch (IllegalStateException expected) {}
        if (api() >= 31) {
            shadowOf(adapter()).setEnabled(true);
            shadowOf(app).denyPermissions("android.permission.BLUETOOTH_CONNECT");
            try {
                BleGatt.connect(ADDR, false);
                fail();
            } catch (SecurityException expected) {}
        }
    }

    @Test public void hex() {
        assertEquals("00ff7f", BleGatt.hex(new byte[] { 0, (byte) 255, 127 }));
        assertEquals("", BleGatt.hex(null));
    }
}
