## Radios and cameras: telephony, Bluetooth, NFC, camera facts and the torch.
##
## ```nim
## if bluetooth().isSupported and not bluetooth().isEnabled: bluetooth().requestEnable()
## for id in camera().ids:
##   echo id, " faces ", camera().facing(id)
## camera().setTorch("0", true)
## ```
##
## Everything reports "absent" on the desktop.

import bridge

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

proc isSupported*(_: Telephony): bool = bridged(false): callStatic(bool, "Telephony", "isSupported")
proc phoneType*(_: Telephony): PhoneType =
  bridged(ptNone):
    let t = callStatic(int, "Telephony", "phoneType")
    if t in 0..3: PhoneType(t) else: ptNone
proc simState*(_: Telephony): SimState =
  bridged(ssUnknown):
    let s = callStatic(int, "Telephony", "simState")
    if s in 0..9: SimState(s) else: ssUnknown
proc operatorName*(_: Telephony): string = bridged(""): callStatic(string, "Telephony", "operatorName")
proc simOperatorName*(_: Telephony): string = bridged(""): callStatic(string, "Telephony", "simOperatorName")
proc networkCountryIso*(_: Telephony): string = bridged(""): callStatic(string, "Telephony", "networkCountryIso")
proc simCountryIso*(_: Telephony): string = bridged(""): callStatic(string, "Telephony", "simCountryIso")
proc isRoaming*(_: Telephony): bool = bridged(false): callStatic(bool, "Telephony", "isNetworkRoaming")

# ---- Bluetooth ----

proc isSupported*(_: Bluetooth): bool = bridged(false): callStatic(bool, "Bluetooth", "isSupported")
proc isEnabled*(_: Bluetooth): bool = bridged(false): callStatic(bool, "Bluetooth", "isEnabled")
proc hasLowEnergy*(_: Bluetooth): bool = bridged(false): callStatic(bool, "Bluetooth", "hasLowEnergy")
proc requestEnable*(_: Bluetooth): bool {.discardable.} =
  ## Asks the user to switch Bluetooth on (needs BLUETOOTH_CONNECT granted on Android 12+).
  bridged(false): callStatic(bool, "Bluetooth", "requestEnable")

# ---- NFC ----

proc isSupported*(_: Nfc): bool = bridged(false): callStatic(bool, "Nfc", "isSupported")
proc isEnabled*(_: Nfc): bool = bridged(false): callStatic(bool, "Nfc", "isEnabled")
proc openSettings*(_: Nfc): bool {.discardable.} = bridged(false): callStatic(bool, "Nfc", "openSettings")

# ---- camera ----

proc ids*(_: Camera): seq[string] =
  ## Camera2 ids ("0", "1", ...).
  bridged(newSeq[string]()): callStatic(seq[string], "Camera", "ids")
proc facing*(_: Camera, id: string): CameraFacing =
  bridged(cfUnknown):
    let f = callStatic(int, "Camera", "facing", id)
    if f in -1..2: CameraFacing(f) else: cfUnknown
proc hasFlash*(_: Camera, id: string): bool = bridged(false): callStatic(bool, "Camera", "hasFlash", id)
proc sensorOrientation*(_: Camera, id: string): int =
  ## Degrees to rotate the sensor's image to be upright on the natural display orientation.
  bridged(-1): callStatic(int, "Camera", "sensorOrientation", id)
proc setTorch*(_: Camera, id: string, on: bool) =
  ## The flash of `id` as a torch (no CAMERA permission needed).
  if druidStarted(): callStatic(void, "Camera", "setTorch", id, on)
proc find*(c: Camera, facing: CameraFacing): string =
  ## The first camera facing `facing`, or "".
  for id in c.ids:
    if c.facing(id) == facing: return id
