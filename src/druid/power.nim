## Battery, power saving, and keeping the CPU awake.
##
## ```nim
## echo power().batteryLevel, "%", (if power().isCharging: " charging" else: "")
## let lock = power().acquireWakeLock("sync", timeoutMs = 60_000)
## defer: power().release(lock)
## ```

import bridge, simulator

type
  Power* = object
  WakeLock* = object
    handle*: int
  ThermalStatus* = enum
    tsUnknown = -1, tsNone = 0, tsLight, tsModerate, tsSevere, tsCritical, tsEmergency, tsShutdown

proc power*(): Power = discard

proc batteryLevel*(_: Power): int =
  ## Charge in percent; -1 when unknown.
  bridged(simBattery().level): callStatic(int, "Power", "batteryLevel")
proc isCharging*(_: Power): bool = bridged(simBattery().charging): callStatic(bool, "Power", "isCharging")
proc pluggedInto*(_: Power): string =
  ## "ac", "usb", "wireless", "dock", or "" when on battery.
  bridged(simBattery().plugged): callStatic(string, "Power", "pluggedInto")
proc batteryTemperature*(_: Power): float =
  ## Degrees Celsius; NaN when unknown.
  bridged(simBattery().tempC): float(callStatic(float32, "Power", "batteryTemperature"))
proc isPowerSaveMode*(_: Power): bool =
  bridged(simPower().powerSave): callStatic(bool, "Power", "isPowerSaveMode")
proc isInteractive*(_: Power): bool =
  ## Whether the screen is on.
  bridged(simPower().interactive): callStatic(bool, "Power", "isInteractive")
proc isDeviceIdle*(_: Power): bool =
  ## Doze.
  bridged(simPower().idle): callStatic(bool, "Power", "isDeviceIdle")
proc isIgnoringBatteryOptimizations*(_: Power): bool =
  bridged(true): callStatic(bool, "Power", "isIgnoringBatteryOptimizations")
proc thermalStatus*(_: Power): ThermalStatus =
  block:
    let s = if druidStarted(): callStatic(int, "Power", "thermalStatus")
            elif simulator().profile.apiLevel < 29: -1
            else: simPower().thermal
    if s in ord(tsUnknown)..ord(tsShutdown): ThermalStatus(s) else: tsUnknown

proc acquireWakeLock*(_: Power, tag: string, timeoutMs = 0): WakeLock =
  ## Keeps the CPU running with the screen off. Prefer a `timeoutMs`; 0 holds it
  ## until `release`.
  bridged(WakeLock(handle: simAcquireLock())):
    WakeLock(handle: callStatic(int, "Power", "acquireWakeLock", tag, int64(timeoutMs)))
proc release*(_: Power, lock: WakeLock): bool {.discardable.} =
  bridged(simReleaseLock(lock.handle)): callStatic(bool, "Power", "releaseWakeLock", lock.handle)
proc isHeld*(_: Power, lock: WakeLock): bool =
  bridged(simLockHeld(lock.handle)): callStatic(bool, "Power", "isWakeLockHeld", lock.handle)
