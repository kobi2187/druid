## The desktop's Android: a simulated device that behaves the way a phone does,
## so an app that works on the desktop works the same on Android.
##
## Without a JVM (a desktop build) every Druid service talks to this simulator
## instead of answering neutral defaults. It keeps Android's rules:
##
## - Dangerous permissions start un-granted. `request` returns at once and the
##   answer arrives later, as an `ekPermission` event at the next
##   `pollEvents` -- granted, denied or left for you to answer, per
##   `setPermissionPolicy`. Normal permissions (INTERNET, VIBRATE, ...) are
##   always granted; permissions newer than the device's API level are denied.
## - Location needs a location permission, or it raises `DruidPermissionError`
##   (Android's SecurityException).
## - On API 33+ notifications need POST_NOTIFICATIONS, or they are silently
##   dropped -- the classic "works on my old phone" bug, caught on the desktop.
## - Changes (network, sensors, location, lifecycle) are events only while
##   being monitored, delivered at the next `pollEvents`.
##
## The device itself comes from a profile (`DRUID_DEVICE` = phone, small,
## tablet; phone by default): model, API level, screen and density, features,
## sensors, cameras. `DRUID_PERMISSIONS` (grant, deny, ask) sets how
## permission requests are answered. Everything else -- the network, the battery, a GPS fix,
## a sensor reading, the Activity going to the background -- is yours to set,
## from the app's debug code or from tests:
##
## ```nim
## simulator().setNetwork("cellular", connected = true, metered = true)
## simulator().setLocation(48.8584, 2.2945)
## simulator().setSensor(stLight, [320'f32])
## simulator().lifecycle("paused")
## ```
##
## tests/conformance.nim runs the same scenarios here and on Android
## (Robolectric) and requires the same results.

import std/[tables, os, strutils, sets, sequtils]
import events, bridge

type
  PermissionPolicy* = enum
    ppGrant     ## every request is granted (the default)
    ppDeny      ## every request is denied
    ppAsk       ## requests wait until `answer` is called (or a UI asks the developer)

  PermissionState = enum
    psNotAsked, psGrantedSim, psDeniedSim

  SimNotification* = object
    id*: int
    channel*, title*, text*: string
    ongoing*: bool
    progress*: int

  SimCamera* = object
    id*: string
    facing*: int          ## 0 front, 1 back, 2 external
    flash*: bool
    orientation*: int

  DeviceProfile* = object
    name*: string
    manufacturer*, brand*, model*, codename*, release*: string
    apiLevel*: int
    widthPx*, heightPx*, dpi*: int
    density*, refreshRate*: float32
    features*: seq[string]
    sensors*: seq[int]     ## Sensor.TYPE_*
    cameras*: seq[SimCamera]
    hasVibrator*, amplitudeControl*: bool
    biometric*: int        ## BiometricManager code: 0 ready, 11 none enrolled, 12 no hardware, -2 before Android 10
    telephony*: bool
    operatorName*, countryIso*: string
    totalMemory*: int64
    memoryClassMb*: int

  PendingRequest = object
    id: int
    perms: seq[string]

  SimState = object
    profile: DeviceProfile
    policy: PermissionPolicy
    perms: Table[string, PermissionState]
    denials: Table[string, int]
    pending: seq[PendingRequest]
    notifications: OrderedTable[int, SimNotification]
    channels: HashSet[string]
    vibrations: seq[string]
    vibrating: bool
    network: tuple[kind: string, connected, metered: bool]
    monitoring: bool
    battery: tuple[level: int, charging: bool, plugged: string, tempC: float]
    powerSave, idle: bool
    interactive: bool
    thermal: int
    wakeLocks: Table[int, bool]
    nextLock: int
    providers: Table[string, bool]
    lastFix: Table[string, seq[float64]]
    runningProviders: HashSet[string]
    readings: Table[int, seq[float32]]
    runningSensors: HashSet[int]
    keyboard: bool
    toasts: seq[string]
    opened: seq[string]
    torch: Table[string, bool]
    bluetoothOn, nfcOn: bool
    ringer: int
    volumes: Table[int, int]
    micMute: bool
    nightMode: bool
    lifecycle: string
    biometricOutcome: string
    pollHooks: seq[proc() {.closure.}]

const
  normalPermissions* = ["android.permission.INTERNET", "android.permission.ACCESS_NETWORK_STATE",
    "android.permission.ACCESS_WIFI_STATE", "android.permission.CHANGE_WIFI_STATE",
    "android.permission.VIBRATE", "android.permission.WAKE_LOCK", "android.permission.BLUETOOTH",
    "android.permission.BLUETOOTH_ADMIN", "android.permission.NFC"]
    ## Granted at install: never asked, never denied.
  minApi = {"android.permission.POST_NOTIFICATIONS": 33, "android.permission.READ_MEDIA_IMAGES": 33,
            "android.permission.READ_MEDIA_VIDEO": 33, "android.permission.READ_MEDIA_AUDIO": 33,
            "android.permission.NEARBY_WIFI_DEVICES": 33, "android.permission.BLUETOOTH_CONNECT": 31,
            "android.permission.BLUETOOTH_SCAN": 31, "android.permission.BLUETOOTH_ADVERTISE": 31,
            "android.permission.ACTIVITY_RECOGNITION": 29,
            "android.permission.ACCESS_BACKGROUND_LOCATION": 29}.toTable
    ## Permissions that do not exist before an API level.

proc phoneProfile*(): DeviceProfile =
  DeviceProfile(name: "phone", manufacturer: "Google", brand: "google", model: "Pixel 7 (simulated)",
    codename: "panther", release: "14", apiLevel: 34, widthPx: 1080, heightPx: 2400, dpi: 420,
    density: 2.625, refreshRate: 90,
    features: @["android.hardware.camera.any", "android.hardware.bluetooth", "android.hardware.bluetooth_le",
      "android.hardware.nfc", "android.hardware.location.gps", "android.hardware.telephony",
      "android.hardware.touchscreen", "android.hardware.fingerprint", "android.hardware.microphone",
      "android.hardware.wifi", "android.hardware.sensor.accelerometer", "android.hardware.sensor.gyroscope"],
    sensors: @[1, 2, 4, 5, 6, 8, 9, 10, 11, 18, 19],
    cameras: @[SimCamera(id: "0", facing: 1, flash: true, orientation: 90),
               SimCamera(id: "1", facing: 0, flash: false, orientation: 270)],
    hasVibrator: true, amplitudeControl: true, biometric: 0, telephony: true,
    operatorName: "Simulated Mobile", countryIso: "us", totalMemory: 8_000_000_000, memoryClassMb: 256)

proc smallProfile*(): DeviceProfile =
  DeviceProfile(name: "small", manufacturer: "Generic", brand: "generic", model: "Small phone (simulated)",
    codename: "small", release: "9", apiLevel: 28, widthPx: 720, heightPx: 1280, dpi: 320,
    density: 2, refreshRate: 60,
    features: @["android.hardware.camera.any", "android.hardware.bluetooth", "android.hardware.location.gps",
      "android.hardware.telephony", "android.hardware.touchscreen", "android.hardware.microphone",
      "android.hardware.wifi", "android.hardware.sensor.accelerometer"],
    sensors: @[1, 5, 8],
    cameras: @[SimCamera(id: "0", facing: 1, flash: true, orientation: 90)],
    hasVibrator: true, amplitudeControl: true, biometric: -2, telephony: true,
    operatorName: "Simulated Mobile", countryIso: "us", totalMemory: 2_000_000_000, memoryClassMb: 128)

proc tabletProfile*(): DeviceProfile =
  DeviceProfile(name: "tablet", manufacturer: "Generic", brand: "generic", model: "Tablet (simulated)",
    codename: "tablet", release: "14", apiLevel: 34, widthPx: 1600, heightPx: 2560, dpi: 320,
    density: 2, refreshRate: 60,
    features: @["android.hardware.camera.any", "android.hardware.bluetooth", "android.hardware.bluetooth_le",
      "android.hardware.touchscreen", "android.hardware.microphone", "android.hardware.wifi",
      "android.hardware.sensor.accelerometer"],
    sensors: @[1, 5],
    cameras: @[SimCamera(id: "0", facing: 1, flash: false, orientation: 0),
               SimCamera(id: "1", facing: 0, flash: false, orientation: 0)],
    hasVibrator: false, amplitudeControl: false, biometric: 12, telephony: false,
    totalMemory: 6_000_000_000, memoryClassMb: 256)

proc profileNamed*(name: string): DeviceProfile =
  case name.toLowerAscii
  of "small": smallProfile()
  of "tablet": tabletProfile()
  else: phoneProfile()

var sim {.threadvar.}: SimState
var simReady {.threadvar.}: bool

proc resolvePending()

proc freshState(p: DeviceProfile): SimState =
  result.profile = p
  result.policy = case getEnv("DRUID_PERMISSIONS", "grant").toLowerAscii
                  of "deny": ppDeny
                  of "ask": ppAsk
                  else: ppGrant
  result.network = ("wifi", true, false)
  result.battery = (80, false, "", 30.0)
  result.interactive = true
  result.nextLock = 1
  result.providers = {"gps": "android.hardware.location.gps" in p.features, "network": true,
                      "passive": true}.toTable
  result.ringer = 2
  result.bluetoothOn = true
  result.nfcOn = "android.hardware.nfc" in p.features
  result.biometricOutcome = "succeeded"

proc state*(): var SimState =
  ## The simulator's state, created on first use from `DRUID_DEVICE`.
  if not simReady:
    sim = freshState(profileNamed(getEnv("DRUID_DEVICE", "phone")))
    simReady = true
    beforeLocalPoll = proc() {.nimcall, gcsafe.} =
      {.cast(gcsafe).}:
        resolvePending()
        for hook in sim.pollHooks: hook()
  sim

# ---- the control API: what a developer or a test sets ----

type Simulator* = object
proc simulator*(): Simulator = discard

proc useProfile*(_: Simulator, p: DeviceProfile) =
  ## Start over as device `p`: everything else back to its defaults.
  discard state()
  sim = freshState(p)
proc useProfile*(s: Simulator, name: string) = s.useProfile(profileNamed(name))
proc reset*(s: Simulator) =
  ## Back to the profile's defaults (permissions not asked, Wi-Fi, 80 % battery, ...).
  s.useProfile(state().profile)
proc profile*(_: Simulator): DeviceProfile = state().profile

proc setPermissionPolicy*(_: Simulator, p: PermissionPolicy) = state().policy = p
proc permissionPolicy*(_: Simulator): PermissionPolicy = state().policy
proc grant*(_: Simulator, permission: string) = state().perms[permission] = psGrantedSim
  ## As if the user had granted it in Settings.
proc deny*(_: Simulator, permission: string) = state().perms[permission] = psDeniedSim
proc revoke*(_: Simulator, permission: string) = state().perms.del(permission)
proc pendingRequests*(_: Simulator): seq[tuple[id: int, permissions: seq[string]]] =
  for r in state().pending: result.add (r.id, r.perms)

proc setNetwork*(_: Simulator, kind: string, connected = true, metered = false) =
  ## "wifi", "cellular", "ethernet", "vpn", "bluetooth", "none". Reported as
  ## an `ekConnectivity` event while connectivity is monitored.
  let s = addr state()
  s.network = (kind, connected and kind != "none", metered)
  if s.monitoring:
    postLocal encodeEvent("connectivity", kind, (if s.network.connected: "1" else: "0"),
                          (if metered: "1" else: "0"))

proc setBattery*(_: Simulator, level: int, charging = false, plugged = "", temperatureC = 30.0) =
  state().battery = (clamp(level, 0, 100), charging, plugged, temperatureC)
proc setPowerSave*(_: Simulator, on: bool) = state().powerSave = on
proc setInteractive*(_: Simulator, on: bool) = state().interactive = on
proc setThermalStatus*(_: Simulator, status: int) = state().thermal = status
proc setNightMode*(_: Simulator, on: bool) =
  let s = addr state()
  s.nightMode = on
  postLocal encodeEvent("configuration", 1, (if on: 32 else: 16), "1.0")

proc setProviderEnabled*(_: Simulator, provider: string, on: bool) =
  let s = addr state()
  s.providers[provider] = on
  if provider in s.runningProviders:
    postLocal encodeEvent("locationProvider", provider, (if on: "1" else: "0"))

proc setLocation*(_: Simulator, latitude, longitude: float64, accuracy = 5.0,
                  altitude = NaN, provider = "gps", timeMs = 0'i64, speed = NaN, bearing = NaN) =
  ## A fix from `provider`: its last known location, and an `ekLocation` event
  ## if the app started it.
  let s = addr state()
  let t = if timeMs != 0: timeMs else: 1_700_000_000_000'i64
  s.lastFix[provider] = @[latitude, longitude, altitude, accuracy, float64(t), speed, bearing]
  if provider in s.runningProviders and s.providers.getOrDefault(provider):
    postLocal encodeEvent("location", provider, $latitude, $longitude, $altitude, $accuracy,
                          $t, $speed, $bearing)

proc setSensor*(_: Simulator, sensorType: int, values: openArray[float32], accuracy = 3) =
  ## A reading: an `ekSensor` event if the app started that sensor.
  let s = addr state()
  s.readings[sensorType] = @values
  if sensorType in s.runningSensors:
    var f = @[$sensorType, $accuracy, "0"]
    for v in values: f.add $v
    postLocal encodeEvent("sensor", f)

proc addSensor*(_: Simulator, sensorType: int) =
  if sensorType notin state().profile.sensors: state().profile.sensors.add sensorType
proc removeSensor*(_: Simulator, sensorType: int) =
  let s = addr state()
  s.profile.sensors.keepItIf(it != sensorType)
  s.runningSensors.excl sensorType

proc lifecycle*(_: Simulator, what: string) =
  ## "paused", "resumed", "stopped", ...: an `ekLifecycle` event, as when the
  ## user switches apps.
  state().lifecycle = what
  postLocal encodeEvent("lifecycle", what, "SimulatedActivity")

proc setBiometricOutcome*(_: Simulator, outcome: string) =
  ## What the next fingerprint prompt answers: "succeeded" (the default),
  ## "failed" (one bad try, the prompt stays), "cancelled" or "lockout".
  state().biometricOutcome = outcome

proc trimMemory*(_: Simulator, level: int) =
  postLocal encodeEvent("memory", level)

proc answer*(_: Simulator, granted: bool) =
  ## Answer every waiting request (policy ppAsk), as the user would in the dialog.
  let s = addr state()
  let old = s.policy
  s.policy = if granted: ppGrant else: ppDeny
  resolvePending()
  s.policy = old

# What the app did, for tests and a debug overlay.
proc notificationsShown*(_: Simulator): seq[SimNotification] =
  for n in state().notifications.values: result.add n
proc vibrations*(_: Simulator): seq[string] = state().vibrations
  ## Each vibration asked for, e.g. "30ms", "effect 5", "pattern 0,100,50,100".
proc keyboardVisible*(_: Simulator): bool = state().keyboard
proc toasts*(_: Simulator): seq[string] = state().toasts
proc opened*(_: Simulator): seq[string] = state().opened
  ## What was handed to other apps: "url https://...", "share ...", "dial ...".

# ---- for the service modules ----

proc isNormalPermission*(p: string): bool = p in normalPermissions

proc simPermissionGranted*(p: string): bool =
  let s = addr state()
  if isNormalPermission(p): return true
  if p in minApi and s.profile.apiLevel < minApi[p]:
    # Did not exist yet: notifications were allowed, the rest was implied.
    return p == "android.permission.POST_NOTIFICATIONS" or
           p == "android.permission.ACTIVITY_RECOGNITION" or
           p.startsWith("android.permission.BLUETOOTH")
  s.perms.getOrDefault(p, psNotAsked) == psGrantedSim

proc simShouldShowRationale*(p: string): bool =
  ## Android: true after one denial, false again once denied for good (twice).
  state().denials.getOrDefault(p) == 1 and not simPermissionGranted(p)

proc simRequest*(id: int, perms: openArray[string]) =
  state().pending.add PendingRequest(id: id, perms: @perms)

proc resolvePending() =
  ## Answer the waiting requests per the policy (ppAsk leaves them waiting).
  let s = addr state()
  if s.pending.len == 0: return
  var keep: seq[PendingRequest]
  for r in s.pending:
    var fields = @[$r.id]
    var waiting = false
    for p in r.perms:
      var granted: bool
      if simPermissionGranted(p): granted = true
      elif p in minApi and s.profile.apiLevel < minApi[p]: granted = false   # unknown to this Android
      elif s.denials.getOrDefault(p) >= 2: granted = false                   # "don't ask again"
      else:
        case s.policy
        of ppGrant: granted = true
        of ppDeny: granted = false
        of ppAsk: waiting = true
        if not waiting:
          if granted: s.perms[p] = psGrantedSim
          else:
            s.perms[p] = psDeniedSim
            s.denials[p] = s.denials.getOrDefault(p) + 1
      fields.add p
      fields.add (if granted: "1" else: "0")
    if waiting: keep.add r
    else: postLocal encodeEvent("permission", fields)
  s.pending = keep

proc simNotify*(n: SimNotification): bool =
  ## Shown, unless Android 13+ would drop it for want of POST_NOTIFICATIONS.
  let s = addr state()
  if not simPermissionGranted("android.permission.POST_NOTIFICATIONS"): return false
  s.notifications[n.id] = n
  stderr.writeLine "[notification ", n.id, "] ", n.title, ": ", n.text
  true
proc simCancelNotification*(id: int) = state().notifications.del(id)
proc simCancelAll*() = state().notifications.clear()
proc simActiveNotifications*(): seq[int] =
  for id in state().notifications.keys: result.add id
proc simChannels*(): var HashSet[string] = state().channels

proc simVibrate*(what: string) =
  let s = addr state()
  if not s.profile.hasVibrator: return
  s.vibrations.add what
  s.vibrating = what != "cancel"

proc simNetwork*(): tuple[kind: string, connected, metered: bool] = state().network
proc simSetMonitoring*(on: bool) = state().monitoring = on
proc simMonitoring*(): bool = state().monitoring

proc simBattery*(): tuple[level: int, charging: bool, plugged: string, tempC: float] = state().battery
proc simPower*(): tuple[powerSave, idle, interactive: bool, thermal: int] =
  let s = addr state()
  (s.powerSave, s.idle, s.interactive, s.thermal)
proc simAcquireLock*(): int =
  let s = addr state()
  result = s.nextLock
  inc s.nextLock
  s.wakeLocks[result] = true
proc simReleaseLock*(h: int): bool =
  let s = addr state()
  result = s.wakeLocks.getOrDefault(h)
  s.wakeLocks.del(h)
proc simLockHeld*(h: int): bool = state().wakeLocks.getOrDefault(h)

proc requireLocationPermission*() =
  ## Android throws a SecurityException; so does the simulator.
  if not (simPermissionGranted("android.permission.ACCESS_FINE_LOCATION") or
          simPermissionGranted("android.permission.ACCESS_COARSE_LOCATION")):
    raise newException(DruidPermissionError,
      "Location (simulated): java.lang.SecurityException: needs ACCESS_FINE_LOCATION or ACCESS_COARSE_LOCATION")
proc simProviders*(): Table[string, bool] = state().providers
proc simLastFix*(provider: string): seq[float64] = state().lastFix.getOrDefault(provider)
proc simStartProvider*(provider: string) = state().runningProviders.incl provider
proc simStopProvider*(provider: string) = state().runningProviders.excl provider
proc simStopAllProviders*() = state().runningProviders.clear()
proc simProviderRunning*(provider: string): bool = provider in state().runningProviders

proc simStartSensor*(t: int): bool =
  let s = addr state()
  if t notin s.profile.sensors: return false
  s.runningSensors.incl t
  true
proc simStopSensor*(t: int) = state().runningSensors.excl t
proc simStopAllSensors*() = state().runningSensors.clear()
proc simSensorRunning*(t: int): bool = t in state().runningSensors

proc simKeyboard*(visible: bool) = state().keyboard = visible
proc simToast*(text: string) =
  state().toasts.add text
  stderr.writeLine "[toast] ", text
proc simOpened*(what: string) = state().opened.add what
proc simTorch*(): var Table[string, bool] = state().torch
proc simBluetoothOn*(): bool = state().bluetoothOn
proc simNfcOn*(): bool = state().nfcOn
proc simAudio*(): tuple[ringer: int, micMute: bool] = (state().ringer, state().micMute)
proc simSetRinger*(m: int) = state().ringer = m
proc simSetMicMute*(on: bool) = state().micMute = on
proc simVolume*(stream: int): int = state().volumes.getOrDefault(stream, 7)
proc simSetVolume*(stream, v: int) = state().volumes[stream] = clamp(v, 0, 15)
proc simNightMode*(): bool = state().nightMode
proc simBiometricOutcome*(): string = state().biometricOutcome
proc simOnPoll*(hook: proc() {.closure.}) =
  ## Run `hook` at every `pollEvents` (before the queue is drained): how a
  ## simulated service finishes work in the background.
  state().pollHooks.add hook
proc simLifecycle*(): string = state().lifecycle
