package dev.druid;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.content.Context;
import android.content.Intent;
import android.os.BatteryManager;
import android.os.PowerManager;
import org.junit.Test;

public class PowerTest extends DruidTestBase {
    private PowerManager pm() { return (PowerManager) app.getSystemService(Context.POWER_SERVICE); }

    private void battery(int status, int plugged, int level, int scale, Integer tenthsC) {
        Intent i = new Intent(Intent.ACTION_BATTERY_CHANGED)
            .putExtra(BatteryManager.EXTRA_STATUS, status)
            .putExtra(BatteryManager.EXTRA_PLUGGED, plugged)
            .putExtra(BatteryManager.EXTRA_LEVEL, level)
            .putExtra(BatteryManager.EXTRA_SCALE, scale);
        if (tenthsC != null) i.putExtra(BatteryManager.EXTRA_TEMPERATURE, tenthsC);
        app.sendStickyBroadcast(i);
    }

    @Test public void levelFromTheBatteryManagerProperty() {
        shadowOf((BatteryManager) app.getSystemService(Context.BATTERY_SERVICE))
            .setIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY, 64);
        assertEquals(64, Power.batteryLevel());
    }

    @Test public void levelFromTheStickyIntentWhenThePropertyIsUnknown() {
        shadowOf((BatteryManager) app.getSystemService(Context.BATTERY_SERVICE))
            .setIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY, Integer.MIN_VALUE);
        battery(BatteryManager.BATTERY_STATUS_DISCHARGING, 0, 3, 4, null);
        assertEquals(75, Power.batteryLevel());
    }

    @Test public void chargingAndPluggedInto() {
        battery(BatteryManager.BATTERY_STATUS_FULL, BatteryManager.BATTERY_PLUGGED_AC, 100, 100, 250);
        assertTrue(Power.isCharging());
        assertEquals("ac", Power.pluggedInto());
        assertEquals(25.0f, Power.batteryTemperature(), 1e-4);
        battery(BatteryManager.BATTERY_STATUS_CHARGING, BatteryManager.BATTERY_PLUGGED_WIRELESS, 50, 100, null);
        assertEquals("wireless", Power.pluggedInto());
        assertTrue(Float.isNaN(Power.batteryTemperature()));
        battery(BatteryManager.BATTERY_STATUS_CHARGING, 8, 50, 100, null);
        assertEquals("dock", Power.pluggedInto());
        battery(BatteryManager.BATTERY_STATUS_DISCHARGING, 0, 50, 100, null);
        assertFalse(Power.isCharging());
        assertEquals("", Power.pluggedInto());
    }

    @Test public void powerStates() {
        shadowOf(pm()).setIsPowerSaveMode(true);
        shadowOf(pm()).setIsInteractive(false);
        shadowOf(pm()).setIsDeviceIdleMode(true);
        shadowOf(pm()).setIgnoringBatteryOptimizations(app.getPackageName(), true);
        shadowOf(pm()).setCurrentThermalStatus(PowerManager.THERMAL_STATUS_SEVERE);
        assertTrue(Power.isPowerSaveMode());
        assertFalse(Power.isInteractive());
        assertTrue(Power.isDeviceIdle());
        assertTrue(Power.isIgnoringBatteryOptimizations());
        assertEquals(api() >= 29 ? PowerManager.THERMAL_STATUS_SEVERE : -1, Power.thermalStatus());
    }

    @Test public void wakeLocksAreHandles() {
        int a = Power.acquireWakeLock("t:a", 0);
        int b = Power.acquireWakeLock("t:b", 60_000);
        assertNotEquals(a, b);
        assertTrue(Power.isWakeLockHeld(a));
        assertTrue(Power.isWakeLockHeld(b));
        assertTrue(Power.releaseWakeLock(a));
        assertFalse(Power.isWakeLockHeld(a));
        assertFalse(Power.releaseWakeLock(a));
        assertFalse(Power.releaseWakeLock(9999));
        assertFalse(Power.isWakeLockHeld(9999));
        Power.releaseWakeLock(b);
    }
}
