## The Nim side of the Robolectric tests (android/druid/src/test/.../NimHarnessTest.java).
##
## tools/build_host_harness.sh compiles this for the host as a shared library.
## Robolectric's JVM loads it, so each Nim API runs for real: Nim -> JNI ->
## dev.druid.* -> Robolectric's Android. The Java test arranges the Android
## side (shadows), runs a command here, and checks both the answer and what
## the Nim call did to Android.
##
## A command is "name|arg|arg...". The answer is the result's fields joined by
## '|', or "ERR <exception type>: <message>".

import std/[strutils, options, tables, sequtils, typedthreads]
import ../../src/druid

type Cmd = proc(a: seq[string]): string

proc b(x: bool): string = (if x: "1" else: "0")
proc opt(x: Option[string]): string = x.get("<none>")
proc j(parts: varargs[string, `$`]): string = parts.toSeq.join("|")

proc permOf(s: string): AndroidPermission =
  for p in AndroidPermission:
    if $p == s: return p
  raise newException(ValueError, "unknown permission " & s)

var commands = initTable[string, Cmd]()
template cmd(name: string, body: untyped) =
  commands[name] = proc(a {.inject.}: seq[string]): string = body

# ---- core ----
cmd "started": b(druidStarted())
cmd "reset":
  resetEventState()
  "ok"
cmd "poll":
  pollEvents().mapIt($it.kind).join(",")
cmd "pending": $pendingEvents()
cmd "device":
  let d = device()
  j(d.apiLevel, d.release, d.manufacturer, d.model, b(d.isAndroid), d.locale, d.timeZone,
    d.abis.join(","), b(d.isNightMode), d.lifecycleState)
cmd "ndk": j(systemProperty("ro.build.version.sdk"), ndkApiLevel())
cmd "app":
  let p = appInfo()
  j(p.packageName, p.versionName, p.versionCode, p.targetSdk, p.label,
    b(p.hasSystemFeature(a[0])), b(p.isInstalled(a[1])), b(p.isDebuggable))
cmd "app.permissions": appInfo().requestedPermissions.join(",")
cmd "lifecycle": lastLifecycleEvent()

# ---- permissions ----
cmd "perm.check": b(permissions().check(a[0]))
cmd "perm.group": b(permissions().check(parseEnum[PermissionGroup](a[0])))
cmd "perm.request":
  $permissions().request(a[0].split(',')).id
cmd "perm.status":
  discard pollEvents()
  let req = PermissionRequest(id: parseInt(a[0]))
  let s = permissions().status(req)
  j($s, permissions().results(req).mapIt(it.permission & "=" & b(it.granted)).join(","))
cmd "perm.rationale": b(permissions().shouldShowRationale(permOf(a[0])))

# ---- clipboard ----
cmd "clip.set":
  clipboard().setText(a[0])
  "ok"
cmd "clip.get": opt(clipboard().text)
cmd "clip.has": b(clipboard().hasText)
cmd "clip.clear":
  clipboard().clear()
  "ok"

# ---- vibration ----
cmd "vib.info": j(b(vibration().hasVibrator), b(vibration().hasAmplitudeControl))
cmd "vib.vibrate":
  vibration().vibrate(parseInt(a[0]), parseInt(a[1]))
  "ok"
cmd "vib.pattern":
  vibration().pattern(a[0].split(',').mapIt(parseInt(it)), parseInt(a[1]))
  "ok"
cmd "vib.effect":
  vibration().effect(parseEnum[HapticEffect](a[0]))
  "ok"
cmd "vib.cancel":
  vibration().cancel()
  "ok"

# ---- notifications ----
cmd "notif.channel":
  notifications().createChannel(a[0], a[1], parseEnum[Importance](a[2]), a[3])
  b(notifications().hasChannel(a[0]))
cmd "notif.deleteChannel":
  notifications().deleteChannel(a[0])
  b(notifications().hasChannel(a[0]))
cmd "notif.show":
  notifications().show(parseInt(a[0]), a[1], a[2], channel = a[3],
                       ongoing = a[4] == "1", progress = parseInt(a[5]))
  "ok"
cmd "notif.notify": $notifications().notify(a[0], a[1])
cmd "notif.active": notifications().active.join(",")
cmd "notif.cancel":
  notifications().cancel(parseInt(a[0]))
  "ok"
cmd "notif.cancelAll":
  notifications().cancelAll()
  "ok"
cmd "notif.enabled": b(notifications().areEnabled)

# ---- connectivity ----
cmd "net": j(b(connectivity().isConnected), $connectivity().networkType, b(connectivity().isMetered))
cmd "net.monitor":
  connectivity().startMonitoring()
  b(connectivity().isMonitoring)
cmd "net.unmonitor":
  connectivity().stopMonitoring()
  b(connectivity().isMonitoring)
cmd "net.latest":
  discard pollEvents()
  let l = connectivity().latest
  if l.isNone: "<none>" else: j($l.get.networkType, b(l.get.connected), b(l.get.metered))

# ---- power ----
cmd "power":
  let p = power()
  j(p.batteryLevel, b(p.isCharging), p.pluggedInto, p.batteryTemperature, b(p.isPowerSaveMode),
    b(p.isInteractive), $p.thermalStatus, b(p.isIgnoringBatteryOptimizations), b(p.isDeviceIdle))
cmd "power.lock":
  let l = power().acquireWakeLock(a[0], parseInt(a[1]))
  j(l.handle, b(power().isHeld(l)))
cmd "power.unlock":
  let l = WakeLock(handle: parseInt(a[0]))
  let r = power().release(l)
  j(b(r), b(power().isHeld(l)))

# ---- storage ----
cmd "storage":
  let s = storage()
  j(s.filesDir, s.cacheDir, s.noBackupDir, s.externalFilesDir("Pictures"), s.externalState, s.dataDir)
cmd "storage.space": j(storage().freeBytes(a[0]), storage().totalBytes(a[0]))
cmd "storage.write":
  writeFile(storage().filesDir & "/" & a[0], a[1])
  readFile(storage().filesDir & "/" & a[0])

# ---- display ----
cmd "display":
  let m = display().metrics
  j(m.widthPx, m.heightPx, m.density, m.dpi, m.fontScale, m.refreshRate, m.rotation, $display().orientation)

# ---- audio ----
cmd "audio":
  let s = parseEnum[AudioStream](a[0])
  j(audio().volume(s), audio().maxVolume(s), audio().minVolume(s), $audio().ringerMode,
    b(audio().isMusicActive), b(audio().isMicrophoneMute), b(audio().headphonesConnected))
cmd "audio.set":
  audio().setVolume(parseEnum[AudioStream](a[0]), parseInt(a[1]))
  $audio().volume(parseEnum[AudioStream](a[0]))
cmd "audio.ringer":
  audio().setRingerMode(parseEnum[RingerMode](a[0]))
  $audio().ringerMode
cmd "audio.mute":
  audio().setMicrophoneMute(a[0] == "1")
  b(audio().isMicrophoneMute)
cmd "audio.hints":
  let h = audio().outputHints
  j(h.sampleRate, h.framesPerBuffer)

# ---- location ----
cmd "loc.providers": location().providers(a[0] == "1").join(",")
cmd "loc.enabled": j(b(location().isLocationEnabled), b(location().isProviderEnabled(a[0])))
cmd "loc.last":
  let f = location().lastKnown(a[0])
  if f.isNone: "<none>" else: j(f.get.provider, f.get.latitude, f.get.longitude, f.get.accuracy, f.get.timeMs)
cmd "loc.start":
  location().start(a[0], parseInt(a[1]), parseFloat(a[2]))
  b(location().isRunning(a[0]))
cmd "loc.stop":
  location().stop(a[0])
  b(location().isRunning(a[0]))
cmd "loc.latest":
  discard pollEvents()
  let f = location().latest
  if f.isNone: "<none>" else: j(f.get.provider, f.get.latitude, f.get.longitude, f.get.accuracy)
cmd "loc.distance":
  $location().distanceBetween(parseFloat(a[0]), parseFloat(a[1]), parseFloat(a[2]), parseFloat(a[3]))

# ---- sensors ----
cmd "sensor.has": b(sensors().has(parseEnum[SensorType](a[0])))
cmd "sensor.info":
  let i = sensors().info(parseEnum[SensorType](a[0]))
  if i.isNone: "<none>" else: j(i.get.name, i.get.vendor, i.get.maxRange)
cmd "sensor.types": sensors().types.join(",")
cmd "sensor.start": j(b(sensors().start(parseEnum[SensorType](a[0]), sdGame)),
                      b(sensors().isRunning(parseEnum[SensorType](a[0]))))
cmd "sensor.stop":
  sensors().stop(parseEnum[SensorType](a[0]))
  b(sensors().isRunning(parseEnum[SensorType](a[0])))
cmd "sensor.latest":
  discard pollEvents()
  let r = sensors().latest(parseEnum[SensorType](a[0]))
  if r.isNone: "<none>" else: j(r.get.accuracy, r.get.timestampNs, r.get.values.mapIt($it).join(","))

# ---- keyboard, intents ----
cmd "kb.show": b(keyboard().show())
cmd "kb.hide": b(keyboard().hide())
cmd "intent.url": b(intents().openUrl(a[0]))
cmd "intent.share": b(intents().shareText(a[0], a[1], a[2]))
cmd "intent.dial": b(intents().dial(a[0]))
cmd "intent.email": b(intents().sendEmail(a[0], a[1], a[2]))
cmd "intent.sms": b(intents().sendSms(a[0], a[1]))
cmd "intent.map": b(intents().openMap(a[0]))
cmd "intent.appSettings": b(intents().openAppSettings())
cmd "intent.canOpen": b(intents().canOpen(a[0]))
cmd "intent.toast":
  intents().toast(a[0], a[1] == "1")
  "ok"

# ---- prefs ----
cmd "prefs.roundtrip":
  let p = prefs(a[0])
  p.clear()
  p.setString("s", a[1])
  p.setInt("i", 9_000_000_000'i64)
  p.setFloat("f", 0.1)
  p.setBool("b", true)
  j(p.getString("s"), p.getInt("i"), p.getFloat("f"), b(p.getBool("b")), b(p.contains("s")),
    p.getInt("s", -5), p.keys.len)
cmd "prefs.get": prefs(a[0]).getString(a[1], "<none>")
cmd "prefs.remove":
  prefs(a[0]).remove(a[1])
  b(prefs(a[0]).contains(a[1]))

# ---- crypto ----
cmd "crypto":
  let c = crypto()
  j(c.sha256Hex(a[0]), c.hmacSha256(a[1], a[0]).toHex, c.digest("MD5", a[0].toBytes).toHex,
    c.randomBytes(24).len, c.uuid.len)

# ---- hardware ----
cmd "tel":
  let t = telephony()
  j(b(t.isSupported), $t.phoneType, $t.simState, t.operatorName, t.networkCountryIso, b(t.isRoaming))
cmd "bt": j(b(bluetooth().isSupported), b(bluetooth().isEnabled), b(bluetooth().hasLowEnergy))
cmd "nfc": j(b(nfc().isSupported), b(nfc().isEnabled))
cmd "cam":
  let c = camera()
  c.ids.mapIt(it & ":" & $c.facing(it) & ":" & b(c.hasFlash(it)) & ":" & $c.sensorOrientation(it)).join(",")
cmd "cam.find": camera().find(parseEnum[CameraFacing](a[0]))
cmd "cam.torch":
  camera().setTorch(a[0], a[1] == "1")
  "ok"

# ---- media ----
cmd "player.open":
  let t = player().open(a[0])
  j(t.id, player().count)
cmd "player.play":
  let t = Track(id: parseInt(a[0]))
  player().play(t)
  j(b(player().isPlaying(t)), player().duration(t))
cmd "player.close":
  player().close(Track(id: parseInt(a[0])))
  $player().count
cmd "player.events":
  pollEvents().filterIt(it.kind == ekPlayer).mapIt(it.playerEvent & ":" & $it.playerDetail).join(",")
cmd "bio.avail": $biometric().availability
cmd "dl.enqueue":
  let d = downloads().enqueue(a[0], a[1], a[2])
  let s = downloads().status(d)
  j(d.id, $s.status)
cmd "dl.events":
  pollEvents().filterIt(it.kind == ekDownload).mapIt($it.downloadId & ":" & $it.downloadStatus).join(",")
cmd "mem":
  let m = memory().info
  j(m.availableBytes, m.totalBytes, m.thresholdBytes, b(m.lowMemory), memory().memoryClassMb,
    b(memory().isLowRamDevice), memory().javaHeap.max > 0)

# ---- wake hook ----
var wakeCount: int
proc countWake() {.nimcall, gcsafe.} =
  {.cast(gcsafe).}: discard atomicInc(wakeCount)
cmd "wake.install":
  setWakeHook(countWake)
  "ok"
cmd "wake.count": $wakeCount

# ---- threads ----
var threadAnswer: int
proc worker() {.thread.} =
  # A thread Java never saw: Druid attaches it, and detaches it when it exits.
  {.cast(gcsafe).}: threadAnswer = device().apiLevel
cmd "thread.call":
  var t: Thread[void]
  createThread(t, worker)
  joinThread(t)
  $threadAnswer

# ---- errors ----
cmd "err.java":
  # A Java exception: Player.play on a handle that does not exist.
  player().play(Track(id: 424242))
  "no exception"
cmd "err.security":
  callStatic(void, "Thrower", "security")
  "no exception"
cmd "err.method":
  callStatic(void, "Druid", "noSuchMethod")
  "no exception"
cmd "err.class":
  callStatic(void, "NoSuchClass", "x")
  "no exception"
cmd "events.kinds":
  pollEvents().mapIt($it.kind & ":" & (if it.kind == ekMemory: $it.trimLevel
                                       elif it.kind == ekLifecycle: it.state
                                       elif it.kind == ekConfiguration: $it.orientation
                                       else: "")).join(",")
cmd "echo":
  # A string through Java and back (Clipboard), to check the UTF-16 path.
  clipboard().setText(a[0])
  clipboard().text.get("")

proc run(command: string): string =
  let parts = command.split('|')
  let name = parts[0]
  if name notin commands: return "ERR unknown command " & name
  try:
    commands[name](parts[1 .. ^1])
  except DruidPermissionError as e: "ERR DruidPermissionError: " & e.msg
  except DruidNotStarted as e: "ERR DruidNotStarted: " & e.msg
  except DruidError as e: "ERR DruidError: " & e.msg
  except CatchableError as e: "ERR " & $e.name & ": " & e.msg

# ---- JNI entry points (dev.druid.NimHarness) ----

proc Java_dev_druid_NimHarness_start(env: JNIEnvPtr, cls: JClass, context: jobject) {.exportc, dynlib, cdecl.} =
  startDruid(env, context)

proc Java_dev_druid_NimHarness_stop(env: JNIEnvPtr, cls: JClass) {.exportc, dynlib, cdecl.} =
  stopDruid()

proc Java_dev_druid_NimHarness_run(env: JNIEnvPtr, cls: JClass, command: jstring): jstring {.exportc, dynlib, cdecl.} =
  newJString(env, run(toNim(env, command)))
