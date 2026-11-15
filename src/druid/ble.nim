## Bluetooth Low Energy: finding the devices around (beacons, sensors,
## wearables) by their advertisements.
##
## ```nim
## # Android 12+: BLUETOOTH_SCAN ("nearby devices"); before: ACCESS_FINE_LOCATION.
## discard permissions().request(if device().apiLevel >= 31: pgNearbyDevices else: pgLocation)
## bluetooth().startScan(services = ["0000180d-0000-1000-8000-00805f9b34fb"])  # heart rate
## for ev in pollEvents():
##   if ev.kind == ekBle and ev.bleAddress.len > 0:
##     echo ev.bleName, " ", ev.bleRssi, " dBm"
## bluetooth().stopScan()
## ```
##
## Each device is reported at most every `minIntervalMs` (it advertises many
## times a second). Scanning drains the battery: stop when done. Raises
## `DruidPermissionError` without the permission, `DruidError` when Bluetooth
## is off or missing.
##
## On the desktop: the devices given to `simulator().addBleDevice`.

import bridge, simulator, hardware

type ScanMode* = enum
  smLowPower = 0, smBalanced = 1, smLowLatency = 2

proc startScan*(b: Bluetooth, services: openArray[string] = [], mode = smBalanced,
                minIntervalMs = 1000) =
  ## Starts scanning (restarting one already running), for devices that
  ## advertise one of `services` (UUIDs; none: every device). Each is an
  ## `ekBle` event; a failed scan is one with `bleError` set.
  if druidStarted():
    callStatic(void, "BleScanner", "start", ord(mode), @services, int64(minIntervalMs))
    return
  if not b.hasLowEnergy:
    raise newException(DruidError, "BleScanner (simulated): java.lang.IllegalStateException: Bluetooth LE scanning is not available")
  if not b.isEnabled:
    raise newException(DruidError, "BleScanner (simulated): java.lang.IllegalStateException: Bluetooth is off")
  let perm = if simulator().profile.apiLevel >= 31: "android.permission.BLUETOOTH_SCAN"
             else: "android.permission.ACCESS_FINE_LOCATION"
  if not simPermissionGranted(perm):
    raise newException(DruidPermissionError,
      "BleScanner (simulated): java.lang.SecurityException: needs " & perm)
  simStartBleScan(services)

proc stopScan*(_: Bluetooth) =
  if druidStarted(): callStatic(void, "BleScanner", "stop")
  else: simStopBleScan()

proc isScanning*(_: Bluetooth): bool =
  bridged(simBleScanning()): callStatic(bool, "BleScanner", "isScanning")
