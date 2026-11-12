package dev.druid;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothManager;
import android.content.Context;
import android.content.Intent;

/** The Bluetooth adapter's presence and state (no scanning: that needs runtime permissions and a design of its own). */
public final class Bluetooth {
    private Bluetooth() {}

    private static BluetoothAdapter adapter() {
        BluetoothManager bm = (BluetoothManager) Druid.context().getSystemService(Context.BLUETOOTH_SERVICE);
        return bm == null ? null : bm.getAdapter();
    }

    public static boolean isSupported() { return adapter() != null; }

    public static boolean isEnabled() {
        BluetoothAdapter a = adapter();
        return a != null && a.isEnabled();
    }

    public static boolean hasLowEnergy() {
        return Druid.context().getPackageManager().hasSystemFeature("android.hardware.bluetooth_le");
    }

    /** Asks the user to turn Bluetooth on (BLUETOOTH_CONNECT on Android 12+). */
    public static boolean requestEnable() { return Intents.start(new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE)); }
}
