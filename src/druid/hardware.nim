## Radios and cameras: telephony, Bluetooth, NFC, camera facts and the torch.
##
## ```nim
## if bluetooth().isSupported and not bluetooth().isEnabled: bluetooth().requestEnable()
## for id in camera().ids:
##   echo id, " faces ", camera().facing(id)
## camera().setTorch("0", true)
## ```
##
## On the desktop: the simulated device's (its profile's radios and cameras).

import std/tables
import bridge, simulator

proc feature(name: string): bool = name in simulator().profile.features
proc simCam(id: string): SimCamera =
  for c in simulator().profile.cameras:
    if c.id == id: return c
  raise newException(DruidError, "Camera (simulated): java.lang.IllegalArgumentException: no camera " & id)

type
  Telephony* = object
  Bluetooth* = object
  Nfc* = object
  Camera* = object
  PhoneType* = enum
    ptNone = 0, ptGsm = 1, ptCdma = 2, ptSip = 3
  SimState* = enum
    ssUnknown = 0, ssAbsent = 1, ssPinRequired = 2, ssPukRequired = 3,
    ssNetworkLocked = 4, ssReady = 5, ssNotReady = 6, ssPermDisabled = 7,
    ssCardIoError = 8, ssCardRestricted = 9
  CameraFacing* = enum
    cfUnknown = -1, cfFront = 0, cfBack = 1, cfExternal = 2

proc telephony*(): Telephony = discard
proc bluetooth*(): Bluetooth = discard
proc nfc*(): Nfc = discard
proc camera*(): Camera = discard

# ---- telephony ----

proc isSupported*(_: Telephony): bool =
  bridged(simulator().profile.telephony): callStatic(bool, "Telephony", "isSupported")
proc phoneType*(_: Telephony): PhoneType =
  block:
    let t = if druidStarted(): callStatic(int, "Telephony", "phoneType")
            elif simulator().profile.telephony: 1 else: 0
    if t in 0..3: PhoneType(t) else: ptNone
proc simState*(_: Telephony): SimState =
  block:
    let s = if druidStarted(): callStatic(int, "Telephony", "simState")
            elif simulator().profile.telephony: 5 else: 1
    if s in 0..9: SimState(s) else: ssUnknown
proc operatorName*(_: Telephony): string =
  bridged(simulator().profile.operatorName): callStatic(string, "Telephony", "operatorName")
proc simOperatorName*(_: Telephony): string =
  bridged(simulator().profile.operatorName): callStatic(string, "Telephony", "simOperatorName")
proc networkCountryIso*(_: Telephony): string =
  bridged(simulator().profile.countryIso): callStatic(string, "Telephony", "networkCountryIso")
proc simCountryIso*(_: Telephony): string =
  bridged(simulator().profile.countryIso): callStatic(string, "Telephony", "simCountryIso")
proc isRoaming*(_: Telephony): bool = bridged(false): callStatic(bool, "Telephony", "isNetworkRoaming")

# ---- Bluetooth ----

proc isSupported*(_: Bluetooth): bool =
  bridged(feature("android.hardware.bluetooth")): callStatic(bool, "Bluetooth", "isSupported")
proc isEnabled*(_: Bluetooth): bool =
  bridged(feature("android.hardware.bluetooth") and simBluetoothOn()): callStatic(bool, "Bluetooth", "isEnabled")
proc hasLowEnergy*(_: Bluetooth): bool =
  bridged(feature("android.hardware.bluetooth_le")): callStatic(bool, "Bluetooth", "hasLowEnergy")
proc requestEnable*(_: Bluetooth): bool {.discardable.} =
  ## Asks the user to switch Bluetooth on (needs BLUETOOTH_CONNECT granted on Android 12+).
  bridged(feature("android.hardware.bluetooth")): callStatic(bool, "Bluetooth", "requestEnable")

# ---- NFC ----

proc isSupported*(_: Nfc): bool = bridged(feature("android.hardware.nfc")): callStatic(bool, "Nfc", "isSupported")
proc isEnabled*(_: Nfc): bool =
  bridged(feature("android.hardware.nfc") and simNfcOn()): callStatic(bool, "Nfc", "isEnabled")
proc openSettings*(_: Nfc): bool {.discardable.} = bridged(true): callStatic(bool, "Nfc", "openSettings")

# ---- camera ----

proc ids*(_: Camera): seq[string] =
  ## Camera2 ids ("0", "1", ...).
  if druidStarted(): return callStatic(seq[string], "Camera", "ids")
  for c in simulator().profile.cameras: result.add c.id
proc facing*(_: Camera, id: string): CameraFacing =
  block:
    let f = if druidStarted(): callStatic(int, "Camera", "facing", id) else: simCam(id).facing
    if f in -1..2: CameraFacing(f) else: cfUnknown
proc hasFlash*(_: Camera, id: string): bool = bridged(simCam(id).flash): callStatic(bool, "Camera", "hasFlash", id)
proc sensorOrientation*(_: Camera, id: string): int =
  ## Degrees to rotate the sensor's image to be upright on the natural display orientation.
  bridged(simCam(id).orientation): callStatic(int, "Camera", "sensorOrientation", id)
proc setTorch*(_: Camera, id: string, on: bool) =
  ## The flash of `id` as a torch (no CAMERA permission needed).
  if druidStarted(): callStatic(void, "Camera", "setTorch", id, on)
  elif simCam(id).flash: simTorch()[id] = on
  else: raise newException(DruidError, "Camera (simulated): torch not available on camera " & id)
proc find*(c: Camera, facing: CameraFacing): string =
  ## The first camera facing `facing`, or "".
  for id in c.ids:
    if c.facing(id) == facing: return id
