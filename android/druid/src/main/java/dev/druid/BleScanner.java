package dev.druid;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothManager;
import android.bluetooth.le.BluetoothLeScanner;
import android.bluetooth.le.ScanCallback;
import android.bluetooth.le.ScanFilter;
import android.bluetooth.le.ScanResult;
import android.bluetooth.le.ScanSettings;
import android.content.Context;
import android.os.ParcelUuid;
import android.os.SystemClock;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Bluetooth Low Energy scanning. Needs BLUETOOTH_SCAN on Android 12+
 * (ACCESS_FINE_LOCATION before), and Bluetooth switched on. Each device seen is
 * a "ble" event: address, name, RSSI dBm, service UUIDs (comma-separated) --
 * at most every {@code minIntervalMs} per device, so a busy room does not
 * flood the queue. A failed scan is a "ble" event ("", "", 0, "error:CODE").
 */
public final class BleScanner {
    private BleScanner() {}

    private static ScanCallback callback;
    private static final HashMap<String, Long> lastSeen = new HashMap<>();
    private static long minInterval;

    private static BluetoothLeScanner scanner() {
        BluetoothManager bm = (BluetoothManager) Druid.context().getSystemService(Context.BLUETOOTH_SERVICE);
        BluetoothAdapter a = bm == null ? null : bm.getAdapter();
        if (a == null) throw new IllegalStateException("this device has no Bluetooth");
        if (!a.isEnabled()) throw new IllegalStateException("Bluetooth is off");
        BluetoothLeScanner s = a.getBluetoothLeScanner();
        if (s == null) throw new IllegalStateException("Bluetooth LE scanning is not available");
        return s;
    }

    /**
     * Starts scanning, restarting one in progress. {@code mode}: 0 low power,
     * 1 balanced, 2 low latency. {@code serviceUuids}: only devices advertising
     * one of these (none: all).
     */
    public static synchronized void start(int mode, String[] serviceUuids, long minIntervalMs) {
        stop();
        BluetoothLeScanner s = scanner();
        List<ScanFilter> filters = new ArrayList<>();
        for (String u : serviceUuids) {
            filters.add(new ScanFilter.Builder().setServiceUuid(ParcelUuid.fromString(u)).build());
        }
        int m = mode == 2 ? ScanSettings.SCAN_MODE_LOW_LATENCY
              : mode == 1 ? ScanSettings.SCAN_MODE_BALANCED : ScanSettings.SCAN_MODE_LOW_POWER;
        ScanSettings settings = new ScanSettings.Builder().setScanMode(m).build();
        minInterval = Math.max(0, minIntervalMs);
        lastSeen.clear();
        ScanCallback cb = new ScanCallback() {
            @Override public void onScanResult(int type, ScanResult r) { seen(r); }
            @Override public void onBatchScanResults(List<ScanResult> results) { for (ScanResult r : results) seen(r); }
            @Override public void onScanFailed(int code) {
                Druid.post("ble", "", "", 0, "error:" + code);
                synchronized (BleScanner.class) { callback = null; }
            }
        };
        s.startScan(filters, settings, cb);   // SecurityException without the permission
        callback = cb;
    }

    @SuppressWarnings("MissingPermission")
    static void seen(ScanResult r) {
        String address = r.getDevice().getAddress();
        long now = SystemClock.elapsedRealtime();
        synchronized (BleScanner.class) {
            Long last = lastSeen.get(address);
            if (last != null && now - last < minInterval) return;
            lastSeen.put(address, now);
        }
        String name = "";
        try {
            if (r.getScanRecord() != null && r.getScanRecord().getDeviceName() != null) {
                name = r.getScanRecord().getDeviceName();
            } else if (r.getDevice().getName() != null) {
                name = r.getDevice().getName();
            }
        } catch (SecurityException ignored) {}     // BLUETOOTH_CONNECT for the cached name
        StringBuilder uuids = new StringBuilder();
        if (r.getScanRecord() != null && r.getScanRecord().getServiceUuids() != null) {
            for (ParcelUuid u : r.getScanRecord().getServiceUuids()) {
                if (uuids.length() > 0) uuids.append(',');
                uuids.append(u.toString());
            }
        }
        Druid.post("ble", address, name, r.getRssi(), uuids.toString());
    }

    public static synchronized void stop() {
        if (callback == null) return;
        try { scanner().stopScan(callback); } catch (RuntimeException ignored) {}
        callback = null;
    }

    public static synchronized boolean isScanning() { return callback != null; }
}
