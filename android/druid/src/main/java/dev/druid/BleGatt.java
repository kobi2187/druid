package dev.druid;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothGatt;
import android.bluetooth.BluetoothGattCallback;
import android.bluetooth.BluetoothGattCharacteristic;
import android.bluetooth.BluetoothGattDescriptor;
import android.bluetooth.BluetoothGattService;
import android.bluetooth.BluetoothManager;
import android.bluetooth.BluetoothProfile;
import android.content.Context;
import android.os.Build;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

/**
 * Talking to a Bluetooth LE device (GATT): connect, discover its services,
 * read and write characteristics, and be notified when they change. Needs
 * BLUETOOTH_CONNECT on Android 12+. Each connection is a handle; a "gatt"
 * event per step: (handle, what, characteristic, status, value hex), what
 * being "connected", "disconnected", "services" (then "service/char/props"
 * fields), "read", "written", "changed", "mtu".
 *
 * <p>Android runs one GATT operation at a time per connection: wait for the
 * "read" / "written" event before the next one.
 */
public final class BleGatt {
    private BleGatt() {}

    /** The Client Characteristic Configuration descriptor: switches notifications on and off. */
    static final UUID CCCD = UUID.fromString("00002902-0000-1000-8000-00805f9b34fb");

    private static final HashMap<Integer, BluetoothGatt> conns = new HashMap<>();
    private static int next = 1;

    private static BluetoothAdapter adapter() {
        BluetoothManager bm = (BluetoothManager) Druid.context().getSystemService(Context.BLUETOOTH_SERVICE);
        BluetoothAdapter a = bm == null ? null : bm.getAdapter();
        if (a == null) throw new IllegalStateException("this device has no Bluetooth");
        if (!a.isEnabled()) throw new IllegalStateException("Bluetooth is off");
        return a;
    }

    @SuppressWarnings("MissingPermission")
    public static synchronized int connect(String address, boolean autoConnect) {
        if (Build.VERSION.SDK_INT >= 31) Recorder.requirePermission("android.permission.BLUETOOTH_CONNECT");
        BluetoothDevice d = adapter().getRemoteDevice(address);
        int id = next++;
        BluetoothGatt g = Build.VERSION.SDK_INT >= 23
            ? d.connectGatt(Druid.context(), autoConnect, callback(id), BluetoothDevice.TRANSPORT_LE)
            : d.connectGatt(Druid.context(), autoConnect, callback(id));
        if (g == null) throw new IllegalStateException("could not connect to " + address);
        conns.put(id, g);
        return id;
    }

    static synchronized BluetoothGatt gatt(int id) {
        BluetoothGatt g = conns.get(id);
        if (g == null) throw new IllegalArgumentException("no connection " + id);
        return g;
    }

    static String hex(byte[] b) {
        if (b == null) return "";
        StringBuilder s = new StringBuilder();
        for (byte x : b) s.append(String.format("%02x", x & 0xff));
        return s.toString();
    }

    static BluetoothGattCallback callback(int id) {
        return new BluetoothGattCallback() {
            @Override @SuppressWarnings("MissingPermission")
            public void onConnectionStateChange(BluetoothGatt g, int status, int state) {
                if (state == BluetoothProfile.STATE_CONNECTED) {
                    Druid.post("gatt", id, "connected", "", status, "");
                    g.discoverServices();
                } else if (state == BluetoothProfile.STATE_DISCONNECTED) {
                    Druid.post("gatt", id, "disconnected", "", status, "");
                }
            }
            @Override public void onServicesDiscovered(BluetoothGatt g, int status) {
                ArrayList<Object> f = new ArrayList<>();
                f.add(id); f.add("services"); f.add(""); f.add(status); f.add("");
                for (BluetoothGattService s : g.getServices()) {
                    for (BluetoothGattCharacteristic c : s.getCharacteristics()) {
                        f.add(s.getUuid() + "/" + c.getUuid() + "/" + c.getProperties());
                    }
                }
                Druid.post("gatt", f.toArray());
            }
            // Android 13+ calls these with the value; before, the deprecated ones below.
            @Override public void onCharacteristicRead(BluetoothGatt g, BluetoothGattCharacteristic c, byte[] v, int status) {
                Druid.post("gatt", id, "read", c.getUuid(), status, hex(v));
            }
            @Override @SuppressWarnings("deprecation")
            public void onCharacteristicRead(BluetoothGatt g, BluetoothGattCharacteristic c, int status) {
                Druid.post("gatt", id, "read", c.getUuid(), status, hex(c.getValue()));
            }
            @Override public void onCharacteristicChanged(BluetoothGatt g, BluetoothGattCharacteristic c, byte[] v) {
                Druid.post("gatt", id, "changed", c.getUuid(), 0, hex(v));
            }
            @Override @SuppressWarnings("deprecation")
            public void onCharacteristicChanged(BluetoothGatt g, BluetoothGattCharacteristic c) {
                Druid.post("gatt", id, "changed", c.getUuid(), 0, hex(c.getValue()));
            }
            @Override public void onCharacteristicWrite(BluetoothGatt g, BluetoothGattCharacteristic c, int status) {
                Druid.post("gatt", id, "written", c.getUuid(), status, "");
            }
            @Override public void onMtuChanged(BluetoothGatt g, int mtu, int status) {
                Druid.post("gatt", id, "mtu", "", status, mtu);
            }
        };
    }

    private static BluetoothGattCharacteristic characteristic(int id, String service, String characteristic) {
        BluetoothGattService s = gatt(id).getService(UUID.fromString(service));
        if (s == null) throw new IllegalArgumentException("no service " + service + " (discovered?)");
        BluetoothGattCharacteristic c = s.getCharacteristic(UUID.fromString(characteristic));
        if (c == null) throw new IllegalArgumentException("no characteristic " + characteristic);
        return c;
    }

    @SuppressWarnings("MissingPermission")
    public static boolean read(int id, String service, String characteristic) {
        return gatt(id).readCharacteristic(characteristic(id, service, characteristic));
    }

    @SuppressWarnings({"MissingPermission", "deprecation"})
    public static boolean write(int id, String service, String characteristic, byte[] value, boolean withResponse) {
        BluetoothGattCharacteristic c = characteristic(id, service, characteristic);
        int type = withResponse ? BluetoothGattCharacteristic.WRITE_TYPE_DEFAULT
                                : BluetoothGattCharacteristic.WRITE_TYPE_NO_RESPONSE;
        if (Build.VERSION.SDK_INT >= 33) {
            return gatt(id).writeCharacteristic(c, value, type) == BluetoothGatt.GATT_SUCCESS;
        }
        c.setWriteType(type);
        c.setValue(value);
        return gatt(id).writeCharacteristic(c);
    }

    /** Notifications (or indications) of changes on, or off: "changed" events. */
    @SuppressWarnings({"MissingPermission", "deprecation"})
    public static boolean setNotify(int id, String service, String characteristic, boolean on) {
        BluetoothGattCharacteristic c = characteristic(id, service, characteristic);
        BluetoothGatt g = gatt(id);
        if (!g.setCharacteristicNotification(c, on)) return false;
        BluetoothGattDescriptor d = c.getDescriptor(CCCD);
        if (d == null) return true;               // the device notifies without being asked
        boolean indicate = (c.getProperties() & BluetoothGattCharacteristic.PROPERTY_INDICATE) != 0
                        && (c.getProperties() & BluetoothGattCharacteristic.PROPERTY_NOTIFY) == 0;
        byte[] v = !on ? BluetoothGattDescriptor.DISABLE_NOTIFICATION_VALUE
                 : indicate ? BluetoothGattDescriptor.ENABLE_INDICATION_VALUE
                 : BluetoothGattDescriptor.ENABLE_NOTIFICATION_VALUE;
        if (Build.VERSION.SDK_INT >= 33) return g.writeDescriptor(d, v) == BluetoothGatt.GATT_SUCCESS;
        d.setValue(v);
        return g.writeDescriptor(d);
    }

    @SuppressWarnings("MissingPermission")
    public static boolean requestMtu(int id, int mtu) { return gatt(id).requestMtu(mtu); }

    @SuppressWarnings("MissingPermission")
    public static void disconnect(int id) { gatt(id).disconnect(); }

    /** Disconnects and forgets the handle. */
    @SuppressWarnings("MissingPermission")
    public static synchronized void close(int id) {
        BluetoothGatt g = conns.remove(id);
        if (g != null) g.close();
    }

    public static synchronized int count() { return conns.size(); }
}
