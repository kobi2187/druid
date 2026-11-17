## Bluetooth Low Energy: finding the devices around (beacons, sensors,
## wearables) by their advertisements.
##
## ```nim
## # Android 12+: BLUETOOTH_SCAN ("nearby devices"); before: ACCESS_FINE_LOCATION.
## discard permissions().request(if device().apiLevel >= 31: pgNearbyDevices else: pgLocation)
## bluetooth().startScan(services = ["0000180d-0000-1000-8000-00805f9b34fb"])  # heart rate
## for ev in pollEvents():
##   if ev.kind == ekBle and ev.ble.address.len > 0:
##     echo ev.ble.name, " ", ev.ble.rssi, " dBm"
## bluetooth().stopScan()
## ```
##
## Each device is reported at most every `minIntervalMs` (it advertises many
## times a second). Scanning drains the battery: stop when done. Raises
## `DruidPermissionError` without the permission, `DruidError` when Bluetooth
## is off or missing.
##
## On the desktop: the devices given to `simulator().addBleDevice`.

import std/sets
import bridge, simulator, hardware, events

type ScanMode* = enum
  smLowPower = 0, smBalanced = 1, smLowLatency = 2

proc startScan*(b: Bluetooth, services: openArray[string] = [], mode = smBalanced,
                minIntervalMs = 1000) =
  ## Starts scanning (restarting one already running), for devices that
  ## advertise one of `services` (UUIDs; none: every device). Each is an
  ## `ekBle` event; a failed scan is one with `ble.error` set.
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

# ---- connecting: GATT ----

type GattConnection* = object
  id*: int                 ## the `gatt.connection` of its ekGatt events

proc requireConnect() =
  if simulator().profile.apiLevel >= 31 and not simPermissionGranted("android.permission.BLUETOOTH_CONNECT"):
    raise newException(DruidPermissionError,
      "BleGatt (simulated): java.lang.SecurityException: needs the BLUETOOTH_CONNECT permission")

proc connect*(b: Bluetooth, address: string, autoConnect = false): GattConnection =
  ## Connects to the device at `address` (from a scan). `ekGatt` events
  ## follow: gkConnected, then gkServices with its characteristics -- or
  ## gkDisconnected with a status when it fails. Needs BLUETOOTH_CONNECT on
  ## Android 12+. `close` it when done.
  if druidStarted():
    return GattConnection(id: callStatic(int, "BleGatt", "connect", address, autoConnect))
  if not b.isEnabled:
    raise newException(DruidError, "BleGatt (simulated): java.lang.IllegalStateException: Bluetooth is off")
  requireConnect()
  let id = simGattOpen(address)
  result = GattConnection(id: id)
  if not simKnowsDevice(address):
    simGattConn(id).simSetOpen(false)
    postLocal encodeEvent("gatt", id, "disconnected", "", 133, "")             # GATT_ERROR
    return
  postLocal encodeEvent("gatt", id, "connected", "", 0, "")
  var f = @[$id, "services", "", "0", ""]
  for c in simGattChars(address): f.add c.service & "/" & c.uuid & "/" & $c.properties
  postLocal encodeEvent("gatt", f)

proc simChar(c: GattConnection, service, uuid: string): ptr SimGattChar =
  let conn = simGattConn(c.id)
  if not conn.simIsOpen:
    raise newException(DruidError, "BleGatt (simulated): not connected")
  for ch in simGattChars(conn.simAddress).mitems:
    if ch.service == service and ch.uuid == uuid: return addr ch
  raise newException(DruidError, "BleGatt (simulated): java.lang.IllegalArgumentException: no characteristic " & uuid)

proc hexOf(b: openArray[byte]): string =
  const digits = "0123456789abcdef"
  for x in b:
    result.add digits[int(x) shr 4]
    result.add digits[int(x) and 15]

proc read*(_: Bluetooth, c: GattConnection, service, characteristic: string): bool {.discardable.} =
  ## Asks for the value: a gkRead event brings it. One operation at a time:
  ## wait for its event before the next.
  if druidStarted(): return callStatic(bool, "BleGatt", "read", c.id, service, characteristic)
  let ch = simChar(c, service, characteristic)
  let status = if (ch.properties and 2) != 0: 0 else: 2                     # GATT_READ_NOT_PERMITTED
  postLocal encodeEvent("gatt", c.id, "read", characteristic, status, (if status == 0: hexOf(ch.value) else: ""))
  true

proc write*(_: Bluetooth, c: GattConnection, service, characteristic: string, value: openArray[byte],
            withResponse = true): bool {.discardable.} =
  ## Writes `value`; a gkWritten event confirms it.
  if druidStarted():
    return callStatic(bool, "BleGatt", "write", c.id, service, characteristic, @value, withResponse)
  let ch = simChar(c, service, characteristic)
  let status = if (ch.properties and (4 or 8)) != 0: 0 else: 3               # GATT_WRITE_NOT_PERMITTED
  if status == 0: ch.value = @value
  postLocal encodeEvent("gatt", c.id, "written", characteristic, status, "")
  true

proc setNotify*(_: Bluetooth, c: GattConnection, service, characteristic: string, on = true): bool {.discardable.} =
  ## Changes of the characteristic as gkChanged events, or no more.
  if druidStarted(): return callStatic(bool, "BleGatt", "setNotify", c.id, service, characteristic, on)
  let ch = simChar(c, service, characteristic)
  if (ch.properties and (16 or 32)) == 0: return false
  if on: simGattConn(c.id).simNotifying.incl characteristic
  else: simGattConn(c.id).simNotifying.excl characteristic
  true

proc requestMtu*(_: Bluetooth, c: GattConnection, mtu: int): bool {.discardable.} =
  ## A larger packet size (gkMtu event with what the device agreed to; up to 517).
  if druidStarted(): return callStatic(bool, "BleGatt", "requestMtu", c.id, mtu)
  discard simGattConn(c.id)
  postLocal encodeEvent("gatt", c.id, "mtu", "", 0, min(mtu, 517))
  true

proc disconnect*(_: Bluetooth, c: GattConnection) =
  ## A gkDisconnected event follows; `close` frees the connection.
  if druidStarted():
    callStatic(void, "BleGatt", "disconnect", c.id)
    return
  if simGattConn(c.id).simIsOpen:
    simGattConn(c.id).simSetOpen(false)
    postLocal encodeEvent("gatt", c.id, "disconnected", "", 0, "")

proc close*(_: Bluetooth, c: GattConnection) =
  if druidStarted(): callStatic(void, "BleGatt", "close", c.id) else: simGattClose(c.id)

proc connections*(_: Bluetooth): int =
  ## How many are open (not closed).
  bridged(simGattCount()): callStatic(int, "BleGatt", "count")
