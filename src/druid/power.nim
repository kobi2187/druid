## Battery, power saving, and keeping the CPU awake.
##
## ```nim
## echo power().batteryLevel, "%", (if power().isCharging: " charging" else: "")
## let lock = power().acquireWakeLock("sync", timeoutMs = 60_000)
## defer: power().release(lock)
## ```

import bridge

type
  Power* = object
  WakeLock* = object
    handle*: int
  ThermalStatus* = enum
    tsUnknown = -1, tsNone = 0, tsLight, tsModerate, tsSevere, tsCritical, tsEmergency, tsShutdown

proc power*(): Power = discard

proc batteryLevel*(_: Power): int =
  ## Charge in percent; -1 when unknown (and on the desktop).
  bridged(-1): callStatic(int, "Power", "batteryLevel")
proc isCharging*(_: Power): bool = bridged(false): callStatic(bool, "Power", "isCharging")
proc pluggedInto*(_: Power): string =
  ## "ac", "usb", "wireless", "dock", or "" when on battery.
  bridged(""): callStatic(string, "Power", "pluggedInto")
proc batteryTemperature*(_: Power): float =
  ## Degrees Celsius; NaN when unknown.
  bridged(NaN): float(callStatic(float32, "Power", "batteryTemperature"))
proc isPowerSaveMode*(_: Power): bool = bridged(false): callStatic(bool, "Power", "isPowerSaveMode")
proc isInteractive*(_: Power): bool =
  ## Whether the screen is on.
  bridged(true): callStatic(bool, "Power", "isInteractive")
proc isDeviceIdle*(_: Power): bool =
  ## Doze.
  bridged(false): callStatic(bool, "Power", "isDeviceIdle")
proc isIgnoringBatteryOptimizations*(_: Power): bool =
  bridged(true): callStatic(bool, "Power", "isIgnoringBatteryOptimizations")
proc thermalStatus*(_: Power): ThermalStatus =
  bridged(tsUnknown):
    let s = callStatic(int, "Power", "thermalStatus")
    if s in ord(tsUnknown)..ord(tsShutdown): ThermalStatus(s) else: tsUnknown

proc acquireWakeLock*(_: Power, tag: string, timeoutMs = 0): WakeLock =
  ## Keeps the CPU running with the screen off. Prefer a `timeoutMs`; 0 holds it
  ## until `release`. A no-op lock on the desktop.
  bridged(WakeLock(handle: 0)):
    WakeLock(handle: callStatic(int, "Power", "acquireWakeLock", tag, int64(timeoutMs)))
proc release*(_: Power, lock: WakeLock): bool {.discardable.} =
  bridged(false): callStatic(bool, "Power", "releaseWakeLock", lock.handle)
proc isHeld*(_: Power, lock: WakeLock): bool =
  bridged(false): callStatic(bool, "Power", "isWakeLockHeld", lock.handle)
