package dev.druid;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.PowerManager;
import java.util.HashMap;

/** Battery and power state, and wake locks (WAKE_LOCK, a normal permission). */
public final class Power {
    private Power() {}

    private static PowerManager pm() {
        return (PowerManager) Druid.context().getSystemService(Context.POWER_SERVICE);
    }

    private static Intent batteryIntent() {
        return Druid.context().registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
    }

    /** Charge in percent, or -1 when unknown. */
    public static int batteryLevel() {
        BatteryManager bm = (BatteryManager) Druid.context().getSystemService(Context.BATTERY_SERVICE);
        int v = bm == null ? Integer.MIN_VALUE : bm.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        if (v > 0 && v <= 100) return v;
        Intent i = batteryIntent();
        if (i == null) return -1;
        int level = i.getIntExtra(BatteryManager.EXTRA_LEVEL, -1);
        int scale = i.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        return level < 0 || scale <= 0 ? -1 : Math.round(level * 100f / scale);
    }

    public static boolean isCharging() {
        Intent i = batteryIntent();
        if (i == null) return false;
        int s = i.getIntExtra(BatteryManager.EXTRA_STATUS, -1);
        return s == BatteryManager.BATTERY_STATUS_CHARGING || s == BatteryManager.BATTERY_STATUS_FULL;
    }

    /** "ac", "usb", "wireless", "dock" or "" when not plugged in. */
    public static String pluggedInto() {
        Intent i = batteryIntent();
        int p = i == null ? 0 : i.getIntExtra(BatteryManager.EXTRA_PLUGGED, 0);
        switch (p) {
            case BatteryManager.BATTERY_PLUGGED_AC: return "ac";
            case BatteryManager.BATTERY_PLUGGED_USB: return "usb";
            case BatteryManager.BATTERY_PLUGGED_WIRELESS: return "wireless";
            case 8: return "dock";   // BATTERY_PLUGGED_DOCK, API 33
            default: return "";
        }
    }

    /** Battery temperature in degrees Celsius, or NaN. */
    public static float batteryTemperature() {
        Intent i = batteryIntent();
        int t = i == null ? Integer.MIN_VALUE : i.getIntExtra(BatteryManager.EXTRA_TEMPERATURE, Integer.MIN_VALUE);
        return t == Integer.MIN_VALUE ? Float.NaN : t / 10f;
    }

    public static boolean isPowerSaveMode() { return pm().isPowerSaveMode(); }
    public static boolean isInteractive() { return pm().isInteractive(); }
    public static boolean isDeviceIdle() { return Build.VERSION.SDK_INT >= 23 && pm().isDeviceIdleMode(); }

    public static boolean isIgnoringBatteryOptimizations() {
        return Build.VERSION.SDK_INT < 23
            || pm().isIgnoringBatteryOptimizations(Druid.context().getPackageName());
    }

    /** PowerManager.THERMAL_STATUS_* (0 none .. 6 shutdown), or -1 before Android 10. */
    public static int thermalStatus() {
        return Build.VERSION.SDK_INT >= 29 ? pm().getCurrentThermalStatus() : -1;
    }

    private static final HashMap<Integer, PowerManager.WakeLock> locks = new HashMap<>();
    private static int nextLock = 1;

    /** Keeps the CPU running; {@code timeoutMs} 0 means until released. Returns a handle for {@link #releaseWakeLock}. */
    public static synchronized int acquireWakeLock(String tag, long timeoutMs) {
        PowerManager.WakeLock l = pm().newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, tag);
        if (timeoutMs > 0) l.acquire(timeoutMs); else l.acquire();
        int id = nextLock++;
        locks.put(id, l);
        return id;
    }

    public static synchronized boolean releaseWakeLock(int handle) {
        PowerManager.WakeLock l = locks.remove(handle);
        if (l == null) return false;
        if (l.isHeld()) l.release();
        return true;
    }

    public static synchronized boolean isWakeLockHeld(int handle) {
        PowerManager.WakeLock l = locks.get(handle);
        return l != null && l.isHeld();
    }
}
