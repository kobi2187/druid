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
import ../conformance

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
    d.abis.join(","), b(d.isNightMode), d.lifecycleState, d.brand, d.codename, b(d.isEmulator))
cmd "ndk": j(systemProperty("ro.build.version.sdk"), ndkApiLevel())
cmd "app":
  let p = appInfo()
  j(p.packageName, p.versionName, p.versionCode, p.targetSdk, p.label,
    b(p.hasSystemFeature(a[0])), b(p.isInstalled(a[1])), b(p.isDebuggable))
cmd "app.permissions": appInfo().requestedPermissions.join(",")
cmd "app.times": j(appInfo().firstInstallTime, appInfo().lastUpdateTime)
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
cmd "perm.settings":
  permissions().openSettings()
  "ok"

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
  j(s.filesDir, s.cacheDir, s.noBackupDir, s.externalFilesDir("Pictures"), s.externalState, s.dataDir,
    s.externalCacheDir)
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
cmd "audio.adjust":
  audio().adjustVolume(parseEnum[AudioStream](a[0]), parseEnum[VolumeDirection](a[1]), showUi = false)
  j(audio().volume(parseEnum[AudioStream](a[0])), b(audio().isSpeakerphoneOn))
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
cmd "intent.settings": b(intents().openSettings(a[0]))
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
    c.randomBytes(24).len, c.uuid.len, c.sha512(a[0]).toHex,
    c.hmac("HmacSHA512", a[1].toBytes, a[0].toBytes).toHex)

# ---- hardware ----
cmd "tel":
  let t = telephony()
  j(b(t.isSupported), $t.phoneType, $t.simState, t.operatorName, t.networkCountryIso, b(t.isRoaming),
    t.simOperatorName, t.simCountryIso)
cmd "bt": j(b(bluetooth().isSupported), b(bluetooth().isEnabled), b(bluetooth().hasLowEnergy))
cmd "bt.enable": b(bluetooth().requestEnable())
cmd "nfc.settings": b(nfc().openSettings())
cmd "nfc": j(b(nfc().isSupported), b(nfc().isEnabled))
cmd "cam":
  let c = camera()
  c.ids.mapIt(it & ":" & $c.facing(it) & ":" & b(c.hasFlash(it)) & ":" & $c.sensorOrientation(it)).join(",")
cmd "cam.find": camera().find(parseEnum[CameraFacing](a[0]))
cmd "cam.torch":
  camera().setTorch(a[0], a[1] == "1")
  "ok"

# ---- camera capture ----
cmd "cam.photo": $camera().takePhoto(a[0], a[1], parseInt(a[2])).id
cmd "cam.frames": $camera().startFrames(a[0], parseInt(a[1]), parseInt(a[2])).id
cmd "cam.streaming": b(camera().isStreaming)
cmd "cam.stop":
  camera().stopFrames()
  b(camera().isStreaming)
cmd "cam.latest":
  let f = camera().latestFrame(parseBiggestInt(a[0]))
  if f.isNone: "<none>"
  else:
    let rgba = f.get.toRgba
    j(f.get.seq, f.get.width, f.get.height, f.get.rotation, f.get.i420.len, rgba[0], rgba[1], rgba[2], rgba[3])
cmd "cam.events":
  pollEvents().filterIt(it.kind in {ekPhoto, ekCamera}).mapIt(
    if it.kind == ekPhoto: "photo:" & $it.photo.id & ":" & b(it.photo.ok) & ":" & it.photo.path & it.photo.error
    else: "camera:" & $it.frames.id & ":" & b(it.frames.started) & ":" & $it.frames.width & "x" & $it.frames.height).join(",")

# ---- notification interactions, alarms, jobs, incoming, BLE ----
cmd "notif.full":
  notifications().show(parseInt(a[0]), a[1], a[2], actions = [("yes", "Yes"), ("no", "No")], reply = a[3])
  "ok"
proc interactions(): string =
  pollEvents().filterIt(it.kind == ekNotification).mapIt(
    $it.notification.id & ":" & $it.notification.kind & ":" & it.notification.detail).join(",")
cmd "notif.events": interactions()
cmd "now": $nowMs()
cmd "alarm.exact": b(alarms().canBeExact)
cmd "alarm.set": b(alarms().set(parseInt(a[0]), parseBiggestInt(a[1]), a[2], a[3], exact = a[4] == "1"))
cmd "alarm.pending": alarms().pending.join(",")
cmd "alarm.cancel":
  alarms().cancel(parseInt(a[0]))
  alarms().pending.join(",")
cmd "alarm.events":
  pollEvents().filterIt(it.kind == ekAlarm).mapIt($it.alarm.id & ":" & $it.alarm.atMs).join(",")
cmd "job.schedule":
  b(jobs().schedule(parseInt(a[0]), periodMinutes = parseInt(a[1]), delayMs = parseBiggestInt(a[2]),
                    network = parseEnum[JobNetwork](a[3]), charging = a[4] == "1", persisted = a[5] == "1"))
cmd "job.scheduled": jobs().scheduled.join(",")
cmd "job.cancel":
  jobs().cancel(parseInt(a[0]))
  jobs().scheduled.join(",")
cmd "job.cancelAll":
  jobs().cancelAll()
  jobs().scheduled.join(",")
cmd "job.events": pollEvents().filterIt(it.kind == ekJob).mapIt($it.job.id).join(",")
cmd "incoming.events":
  pollEvents().filterIt(it.kind == ekIncoming).mapIt(
    j($it.incoming.action, it.incoming.mime, it.incoming.subject, it.incoming.text, it.incoming.url,
      it.incoming.files.join(";"))).join(",")
cmd "incoming.dir": incoming().copiesDir
cmd "incoming.clear":
  incoming().clearCopies()
  "ok"
cmd "ble.start":
  bluetooth().startScan(services = (if a[1].len > 0: a[1].split(';') else: @[]),
                        mode = parseEnum[ScanMode](a[0]), minIntervalMs = parseInt(a[2]))
  b(bluetooth().isScanning)
cmd "ble.stop":
  bluetooth().stopScan()
  b(bluetooth().isScanning)
cmd "ble.events":
  pollEvents().filterIt(it.kind == ekBle).mapIt(
    j(it.ble.address, it.ble.name, it.ble.rssi, it.ble.services.join(";"), it.ble.error)).join(",")

# ---- foreground, voice, secure store, GATT, NFC, push ----
proc kinds[T](evs: seq[DruidEvent], k: DruidEventKind, f: proc(e: DruidEvent): T): string =
  evs.filterIt(it.kind == k).mapIt($f(it)).join(",")
cmd "fg.start":
  var types: set[ForegroundType]
  for t in a[2].split(';'):
    if t.len > 0: types.incl parseEnum[ForegroundType](t)
  foreground().start(a[0], a[1], types = types)
  "ok"
cmd "fg.update":
  foreground().update(a[0], a[1], parseInt(a[2]))
  "ok"
cmd "fg.stop":
  foreground().stop()
  "ok"
cmd "fg.running": b(foreground().isRunning)
cmd "fg.events": pollEvents().kinds(ekForeground, proc(e: DruidEvent): string = $e.foreground.state)
cmd "rec.start":
  recorder().start(a[0], maxDurationMs = parseInt(a[1]))
  j(b(recorder().isRecording), recorder().amplitude)
cmd "rec.stop": $(recorder().stop() >= 0)
cmd "rec.recording": b(recorder().isRecording)
cmd "rec.events":
  pollEvents().kinds(ekRecording, proc(e: DruidEvent): string = $e.recording.outcome & ":" & e.recording.path)
cmd "tts.open":
  tts().open()
  b(tts().isReady)
cmd "tts.lang": $tts().setLanguage(a[0])
cmd "tts.speak": tts().speak(a[0], flush = a[1] == "1")
cmd "tts.state": j(b(tts().isReady), b(tts().isSpeaking))
cmd "tts.stop":
  tts().stop()
  "ok"
cmd "tts.close":
  tts().close()
  b(tts().isReady)
cmd "tts.events":
  pollEvents().kinds(ekTts, proc(e: DruidEvent): string = $e.tts.step & ":" & e.tts.utteranceId)
cmd "sr.available": b(recognizer().isAvailable)
cmd "sr.start": $recognizer().start(a[0], a[1] == "1").id
cmd "sr.stop":
  recognizer().stop()
  b(recognizer().isListening)
cmd "sr.cancel":
  recognizer().cancel()
  b(recognizer().isListening)
cmd "sr.events":
  pollEvents().kinds(ekSpeech, proc(e: DruidEvent): string =
    $e.speech.id & ":" & $e.speech.kind & ":" & e.speech.texts.join(";") & ":" & $e.speech.errorCode)
cmd "sec.set":
  secureStore().setString(a[0], a[1])
  "ok"
cmd "sec.setBytes":
  secureStore().setBytes(a[0], parseHexBytes(a[1]))
  "ok"
cmd "sec.get": secureStore().getString(a[0]).get("<none>")
cmd "sec.getBytes":
  let v = secureStore().getBytes(a[0])
  if v.isNone: "<none>" else: v.get.toHex
cmd "sec.has": b(secureStore().contains(a[0]))
cmd "sec.names": secureStore().names.join(",")
cmd "sec.remove":
  secureStore().remove(a[0])
  secureStore().names.join(",")
cmd "sec.clear":
  secureStore().clear()
  secureStore().names.join(",")
cmd "gatt.connect": $bluetooth().connect(a[0]).id
cmd "gatt.read": b(bluetooth().read(GattConnection(id: parseInt(a[0])), a[1], a[2]))
cmd "gatt.write":
  b(bluetooth().write(GattConnection(id: parseInt(a[0])), a[1], a[2], parseHexBytes(a[3]), a[4] == "1"))
cmd "gatt.notify": b(bluetooth().setNotify(GattConnection(id: parseInt(a[0])), a[1], a[2], a[3] == "1"))
cmd "gatt.mtu": b(bluetooth().requestMtu(GattConnection(id: parseInt(a[0])), parseInt(a[1])))
cmd "gatt.disconnect":
  bluetooth().disconnect(GattConnection(id: parseInt(a[0])))
  "ok"
cmd "gatt.close":
  bluetooth().close(GattConnection(id: parseInt(a[0])))
  $bluetooth().connections
cmd "gatt.events":
  pollEvents().kinds(ekGatt, proc(e: DruidEvent): string =
    $e.gatt.kind & ":" & e.gatt.characteristic & ":" & $e.gatt.status & ":" & e.gatt.value.toHex &
      ":" & e.gatt.characteristics.mapIt(it.uuid & "/" & $it.properties).join(";") & ":" & $e.gatt.mtu)
cmd "nfc.start": b(nfc().startReading())
cmd "nfc.stop":
  nfc().stopReading()
  b(nfc().isReading)
cmd "nfc.events":
  pollEvents().kinds(ekNfc, proc(e: DruidEvent): string =
    e.nfc.id & ":" & e.nfc.techs.join(";") & ":" & e.nfc.records.mapIt(it.kind & "=" & it.value).join(";"))
cmd "push.available": b(push().isAvailable)
cmd "push.events":
  pollEvents().kinds(ekPush, proc(e: DruidEvent): string =
    $e.push.kind & ":" & e.push.messageId & ":" & e.push.data.mapIt(it.key & "=" & it.value).join(";"))

# ---- media ----
cmd "player.open":
  let t = player().open(a[0])
  j(t.id, player().count)
cmd "player.play":
  let t = Track(id: parseInt(a[0]))
  player().play(t)
  j(b(player().isPlaying(t)), player().duration(t))
cmd "player.control":
  let t = Track(id: parseInt(a[0]))
  player().seek(t, parseInt(a[1]))
  player().pause(t)
  j(b(player().isPlaying(t)), player().position(t))
cmd "player.closeAll":
  player().closeAll()
  $player().count
cmd "player.close":
  player().close(Track(id: parseInt(a[0])))
  $player().count
cmd "player.events":
  pollEvents().filterIt(it.kind == ekPlayer).mapIt(it.playerEvent & ":" & $it.playerDetail).join(",")
cmd "bio.avail": $biometric().availability
cmd "bio.auth":
  let r = biometric().authenticate(a[0], a[1], a[2])
  biometric().cancel(r)
  $r.id
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
var detachedAnswer: int
proc detachingWorker() {.thread.} =
  # Attached by the first call, detached explicitly; the next call attaches again.
  {.cast(gcsafe).}:
    discard currentEnv()
    detachThread()
    detachedAnswer = device().apiLevel
    detachThread()
cmd "thread.detach":
  var t: Thread[void]
  createThread(t, detachingWorker)
  joinThread(t)
  $detachedAnswer
var threadAnswer: int
proc worker() {.thread.} =
  # A thread Java never saw: Druid attaches it, and detaches it when it exits.
  {.cast(gcsafe).}: threadAnswer = device().apiLevel
cmd "thread.call":
  var t: Thread[void]
  createThread(t, worker)
  joinThread(t)
  $threadAnswer

# ---- conformance (tests/conformance.nim): the world changed by dev.druid.Arranger ----
cmd "conf.list":
  var names: seq[string]
  for n in scenarios.keys: names.add n
  names.join(",")
cmd "conf":
  runScenario(a[0], proc(what: string) = callStatic(void, "Arranger", "arrange", what))

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

# The same entry points under the instrumented test's class (android/druid/src/androidTest).
proc Java_dev_druid_DeviceTest_start(env: JNIEnvPtr, cls: JClass, context: jobject) {.exportc, dynlib, cdecl.} =
  startDruid(env, context)
proc Java_dev_druid_DeviceTest_stop(env: JNIEnvPtr, cls: JClass) {.exportc, dynlib, cdecl.} =
  stopDruid()

proc Java_dev_druid_NimHarness_start(env: JNIEnvPtr, cls: JClass, context: jobject) {.exportc, dynlib, cdecl.} =
  startDruid(env, context)

proc Java_dev_druid_NimHarness_stop(env: JNIEnvPtr, cls: JClass) {.exportc, dynlib, cdecl.} =
  stopDruid()

proc Java_dev_druid_NimHarness_run(env: JNIEnvPtr, cls: JClass, command: jstring): jstring {.exportc, dynlib, cdecl.} =
  newJString(env, run(toNim(env, command)))

proc Java_dev_druid_DeviceTest_run(env: JNIEnvPtr, cls: JClass, command: jstring): jstring {.exportc, dynlib, cdecl.} =
  newJString(env, run(toNim(env, command)))
