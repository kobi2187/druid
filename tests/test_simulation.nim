## The desktop's simulated Android (src/druid/simulator.nim): each service
## follows Android's rules, so what works here works on a phone.
## tests/conformance.nim checks the shared scenarios against Robolectric too.

import std/[unittest, options, os, strutils, math, sequtils]
import ../src/druid

putEnv("DRUID_OPEN_LINKS", "0")

suite "simulated device":
  setup:
    simulator().useProfile("phone")
    resetEventState()

  test "device facts come from the profile":
    check device().apiLevel == 34 and device().release == "14"
    check device().model == "Pixel 7 (simulated)" and not device().isAndroid
    check device().isEmulator
    let m = display().metrics
    check m.widthPx == 1080 and m.heightPx == 2400 and m.dpi == 420 and m.density == 2.625
    check display().orientation == orPortrait
    check appInfo().hasSystemFeature(featureNfc) and not appInfo().hasSystemFeature("android.hardware.vr.high_performance")
    simulator().useProfile("tablet")
    check not appInfo().hasSystemFeature(featureTelephony) and not telephony().isSupported
    check not vibration().hasVibrator and biometric().availability == baNoHardware
    simulator().useProfile("small")
    check device().apiLevel == 28 and display().metrics.density == 2
    check biometric().availability == baUnsupported

  test "dangerous permissions are not granted until asked, and answered later":
    check not permissions().check(apCamera)
    check permissions().check(apInternet)                 # normal: always
    let req = permissions().request(apCamera)
    check permissions().status(req) == psPending           # the dialog is up
    check not permissions().check(apCamera)
    discard pollEvents()
    check permissions().status(req) == psGranted
    check permissions().check(apCamera)

  test "denial, rationale, and don't ask again":
    simulator().setPermissionPolicy(ppDeny)
    let r1 = permissions().request(apRecordAudio)
    discard pollEvents()
    check permissions().status(r1) == psDenied
    check permissions().shouldShowRationale(apRecordAudio)   # denied once
    let r2 = permissions().request(apRecordAudio)
    discard pollEvents()
    check permissions().status(r2) == psDenied
    check not permissions().shouldShowRationale(apRecordAudio)  # denied for good
    simulator().setPermissionPolicy(ppGrant)
    let r3 = permissions().request(apRecordAudio)
    discard pollEvents()
    check permissions().status(r3) == psDenied              # no dialog any more
    simulator().grant($apRecordAudio)                       # the user, in Settings
    check permissions().check(apRecordAudio)

  test "asking: requests wait for an answer":
    simulator().setPermissionPolicy(ppAsk)
    let req = permissions().request(pgLocation)
    discard pollEvents()
    check permissions().status(req) == psPending
    check simulator().pendingRequests.len == 1
    simulator().answer(granted = true)
    discard pollEvents()
    check permissions().status(req) == psGranted and permissions().check(pgLocation)

  test "permissions newer than the device are denied, implied ones granted":
    simulator().useProfile("small")                       # API 28
    check permissions().check(apPostNotifications)         # no such permission before 13: allowed
    let req = permissions().request(apMediaImages)          # Android 13+ only
    discard pollEvents()
    check permissions().status(req) == psDenied

  test "notifications need POST_NOTIFICATIONS on Android 13+":
    check not notifications().areEnabled
    notifications().show(1, "Hi", "dropped")
    check notifications().active.len == 0                   # silently dropped, as on a phone
    simulator().grant($apPostNotifications)
    notifications().createChannel("news", "News")
    check notifications().hasChannel("news") and not notifications().hasChannel("other")
    notifications().show(2, "Hi", "shown", channel = "news", progress = 250)
    let id = notifications().notify("Auto", "id")
    check notifications().active == @[2, id]
    check simulator().notificationsShown[0].progress == 100
    notifications().cancel(2)
    check notifications().active == @[id]
    notifications().cancelAll()
    check notifications().active.len == 0

  test "location needs a permission, and fixes arrive while started":
    expect DruidPermissionError: location().start(providerGps)
    expect DruidPermissionError: discard location().lastKnown()
    simulator().grant($apLocationFine)
    check providerGps in location().providers and location().isLocationEnabled
    expect DruidError: location().start("satellite")
    location().start(providerGps)
    check location().isRunning(providerGps)
    simulator().setLocation(48.8584, 2.2945, accuracy = 3)
    let evs = pollEvents()
    check evs.len == 1 and evs[0].kind == ekLocation
    check location().latest.get.latitude == 48.8584
    check location().lastKnown().get.accuracy == 3
    simulator().setProviderEnabled(providerGps, false)
    check pollEvents()[0].kind == ekLocationProvider
    location().stop(providerGps)
    simulator().setLocation(1, 1)
    check pollEvents().len == 0                             # stopped: no events

  test "sensors are the profile's; readings arrive while started":
    check sensors().has(stAccelerometer) and not sensors().has(stHeartRate)
    check not sensors().start(stHeartRate)
    check sensors().info(stLight).get.name == "Simulated Light"
    simulator().setSensor(ord(stLight), [100'f32])
    check pollEvents().len == 0                             # not started yet
    check sensors().start(stLight)
    simulator().setSensor(ord(stLight), [320'f32])
    discard pollEvents()
    check sensors().latest(stLight).get.values == @[320'f32]
    sensors().stopAll()
    check not sensors().isRunning(stLight)

  test "network changes are events while monitored":
    check connectivity().isConnected and connectivity().networkType == ntWifi
    simulator().setNetwork("cellular", metered = true)
    check pollEvents().len == 0                             # not monitoring
    check connectivity().networkType == ntCellular and connectivity().isMetered
    connectivity().startMonitoring()
    simulator().setNetwork("none", connected = false)
    let evs = pollEvents()
    check evs.len == 1 and not evs[0].connected
    check connectivity().networkType == ntNone and not connectivity().isConnected
    connectivity().stopMonitoring()

  test "battery, power and wake locks":
    simulator().setBattery(15, charging = true, plugged = "usb", temperatureC = 31.5)
    check power().batteryLevel == 15 and power().isCharging and power().pluggedInto == "usb"
    check power().batteryTemperature == 31.5
    simulator().setPowerSave(true)
    check power().isPowerSaveMode
    simulator().setThermalStatus(3)
    check power().thermalStatus == tsSevere
    let lock = power().acquireWakeLock("t")
    check power().isHeld(lock)
    check power().release(lock) and not power().isHeld(lock) and not power().release(lock)

  test "vibration, keyboard, toasts and other apps are recorded":
    vibration().vibrate(30)
    vibration().effect(heClick)
    vibration().pattern([0, 10, 20])
    check simulator().vibrations == @["30ms", "effect 0", "pattern 0,10,20"]
    check keyboard().show() and keyboard().isActive
    check keyboard().hide() and not keyboard().isActive
    intents().toast("Saved")
    check simulator().toasts == @["Saved"]
    check intents().openUrl("https://nim-lang.org") and intents().dial("123")
    check intents().canOpen("geo:0,0") and not intents().canOpen("weird:thing")
    check simulator().opened == @["url https://nim-lang.org", "dial 123"]

  test "lifecycle and memory are events":
    simulator().lifecycle("paused")
    simulator().trimMemory(15)
    let evs = pollEvents()
    check evs[0].kind == ekLifecycle and evs[0].state == "paused"
    check evs[1].kind == ekMemory and evs[1].trimLevel == 15
    check device().lifecycleState == "paused"

  test "cameras, torch, radios and audio":
    check camera().ids == @["0", "1"] and camera().find(cfFront) == "1"
    check camera().hasFlash("0") and camera().sensorOrientation("1") == 270
    camera().setTorch("0", true)
    expect DruidError: camera().setTorch("1", true)         # no flash on the front camera
    expect DruidError: discard camera().facing("9")
    check bluetooth().isEnabled and nfc().isEnabled
    audio().setVolume(asMusic, 9)
    audio().adjustVolume(asMusic, vdRaise)
    check audio().volume(asMusic) == 10
    audio().setRingerMode(rmSilent)
    check audio().ringerMode == rmSilent

  test "player, biometric, memory":
    let f = getTempDir() / "druid_sim.ogg"
    writeFile(f, "x")
    let t = player().open(f)
    check pollEvents()[0].playerEvent == "prepared"
    player().play(t)
    check player().isPlaying(t)
    player().seek(t, 500)
    check player().position(t) == 500
    player().close(t)
    expect DruidError: player().play(t)
    expect DruidError: discard player().open("/no/such/file.ogg")
    simulator().setBiometricOutcome("lockout")
    let b = biometric().authenticate("Unlock")
    let ev = pollEvents()[0]
    check ev.biometricId == b.id and ev.outcome == "error" and ev.errorCode == 7
    check memory().info.totalBytes == 8_000_000_000 and memory().memoryClassMb == 256

  test "crypto agrees with Java's providers":
    let c = crypto()
    check c.digest("MD5", "abc".toBytes).toHex == "900150983cd24fb0d6963f7d28e17f72"
    check c.digest("SHA-1", "abc".toBytes).toHex == "a9993e364706816aba3e25717850c26c9cd0d89d"
    check c.sha512("abc").toHex.startsWith("ddaf35a193617aba")
    check c.hmac("HmacSHA256", "Jefe".toBytes, "what do ya want for nothing?".toBytes).toHex ==
      "5bdcc146bf60754e6a042426089575c75a003f089d2739839dec58b964ec3843"

  test "the developer's controls":
    check profileNamed("tablet").name == "tablet" and profileNamed("anything").name == "phone"
    check phoneProfile().apiLevel == 34 and smallProfile().apiLevel == 28 and tabletProfile().apiLevel == 34
    simulator().useProfile(tabletProfile())
    check simulator().profile.name == "tablet"
    simulator().useProfile("phone")
    check simulator().permissionPolicy == ppGrant
    simulator().deny($apCamera)
    check not permissions().check(apCamera)
    simulator().revoke($apCamera)
    let req = permissions().request(apCamera)         # revoked: asked again
    discard pollEvents()
    check permissions().status(req) == psGranted
    simulator().addSensor(ord(stHeartRate))
    check sensors().has(stHeartRate) and sensors().start(stHeartRate)
    simulator().removeSensor(ord(stHeartRate))
    check not sensors().has(stHeartRate) and not sensors().isRunning(stHeartRate)
    simulator().setInteractive(false)
    check not power().isInteractive
    simulator().setNightMode(true)
    let ev = pollEvents()
    check ev[^1].kind == ekConfiguration and ev[^1].nightMode and device().isNightMode
    discard keyboard().show()
    check simulator().keyboardVisible
    check crypto().sha256("abc").len == 32

suite "simulated device: camera, notifications, background work, shares, BLE":
  setup:
    simulator().useProfile("phone")
    resetEventState()

  proc only(kind: DruidEventKind): seq[DruidEvent] =
    for ev in pollEvents():
      if ev.kind == kind: result.add ev

  test "a photo needs CAMERA, then is written and reported":
    let path = getTempDir() / "druid_sim_photo.jpg"
    removeFile(path)
    expect DruidPermissionError: discard camera().takePhoto(path)
    simulator().grant($apCamera)
    expect DruidError: discard camera().takePhoto(path, cameraId = "9")
    let shot = camera().takePhoto(path)
    let ev = only(ekPhoto)
    check ev.len == 1 and ev[0].photo.id == shot.id and ev[0].photo.ok and ev[0].photo.path == path
    let jpeg = readFile(path)
    check jpeg.len > 1000 and jpeg[0] == '\xFF' and jpeg[1] == '\xD8'
    let bad = camera().takePhoto(getTempDir() / "no-such-dir" / "x.jpg")
    let ev2 = only(ekPhoto)
    check ev2.len == 1 and ev2[0].photo.id == bad.id and not ev2[0].photo.ok and
          "FileNotFoundException" in ev2[0].photo.error
    simulator().useProfile(DeviceProfile(name: "none", apiLevel: 34))
    simulator().grant($apCamera)
    expect DruidError: discard camera().takePhoto(path)

  test "frames stream at a camera size, upright angle, and convert to RGBA":
    expect DruidPermissionError: discard camera().startFrames()
    simulator().grant($apCamera)
    check chooseSize([(1920, 1080), (640, 480), (320, 240)], 700) == (640, 480)
    check chooseSize([(1920, 1080), (640, 480)], 100) == (640, 480)
    check chooseSize([(1920, 1080), (640, 480)], 0) == (1920, 1080)
    check camera().latestFrame.isNone
    let req = camera().startFrames(width = 320, height = 240)
    let ev = only(ekCamera)
    check ev.len == 1 and ev[0].frames.id == req.id and ev[0].frames.started and
          ev[0].frames.width == 320 and ev[0].frames.height == 240
    check camera().isStreaming
    let f = camera().latestFrame
    check f.isSome and f.get.width == 320 and f.get.height == 240 and f.get.rotation == 90
    check f.get.i420.len == 320 * 240 * 3 div 2
    check camera().latestFrame(since = f.get.seq + 1_000_000).isNone
    let rgba = f.get.toRgba
    check rgba.len == 320 * 240 * 4 and rgba[3] == 255
    # The first bar is white-ish (Y 235, neutral chroma).
    check rgba[4 * 10] > 200 and rgba[4 * 10 + 1] > 200 and rgba[4 * 10 + 2] > 200
    discard camera().startFrames(cameraId = "1")
    check camera().latestFrame.get.rotation == 270
    camera().stopFrames()
    check not camera().isStreaming and camera().latestFrame.isNone

  test "notification taps, buttons, replies and dismissals are events":
    simulator().grant($apPostNotifications)
    notifications().show(7, "Message", "Hi", actions = [("read", "Mark read")], reply = "Reply")
    let n = simulator().notificationsShown[0]
    check n.actions == @[(id: "read", label: "Mark read")] and n.replyLabel == "Reply"
    simulator().pressAction(7, "read")
    expect ValueError: simulator().pressAction(7, "nope")
    simulator().reply(7, "on my way")
    check notifications().active.len == 0       # a reply closes it
    var ev = only(ekNotification)
    check ev.len == 2 and ev[0].notification.kind == ikAction and ev[0].notification.actionId == "read"
    check ev[1].notification.kind == ikReply and ev[1].notification.reply == "on my way" and ev[1].notification.id == 7
    notifications().show(8, "Tap me", "")
    simulator().tapNotification(8)
    check 8 notin notifications().active        # autoCancel
    notifications().show(9, "Stays", "", autoCancel = false)
    simulator().tapNotification(9)
    check 9 in notifications().active
    notifications().show(10, "Upload", "", ongoing = true)
    expect ValueError: simulator().dismissNotification(10)
    simulator().dismissNotification(9)
    ev = only(ekNotification)
    check ev.mapIt((it.notification.id, it.notification.kind)) == @[(8, ikTap), (9, ikTap), (9, ikDismissed)]
    expect ValueError: simulator().reply(10, "x")   # no reply field
    simulator().useProfile("small")                  # API 28
    notifications().show(1, "Old", "", reply = "Reply")
    check simulator().notificationsShown[0].replyLabel == "Reply"

  test "alarms fire when due, with their notification":
    simulator().grant($apPostNotifications)
    check not alarms().canBeExact                    # API 34: needs the user's grant
    let t = nowMs() + 60_000
    check not alarms().set(1, t, "Stretch", "Get up", exact = true)
    simulator().setExactAlarmsAllowed(true)
    check alarms().canBeExact and alarms().set(2, t + 1000, exact = true)
    check alarms().pending == @[1, 2]
    check only(ekAlarm).len == 0
    simulator().advanceClock(60_500)
    var ev = only(ekAlarm)
    check ev.len == 1 and ev[0].alarm.id == 1 and ev[0].alarm.atMs == t
    check simulator().notificationsShown.mapIt(it.title) == @["Stretch"]
    check alarms().pending == @[2]
    alarms().cancel(2)
    simulator().advanceClock(10_000)
    check only(ekAlarm).len == 0 and alarms().pending.len == 0
    alarms().set(3, nowMs() + 3_600_000)
    simulator().fireAlarm(3)
    ev = only(ekAlarm)
    check ev.len == 1 and ev[0].alarm.id == 3 and simulator().notificationsShown.len == 1  # no title: no notification
    simulator().useProfile("small")
    check alarms().canBeExact                         # before Android 12

  test "jobs run when their conditions hold":
    check jobs().schedule(1, delayMs = 5000, network = jnUnmetered)
    check jobs().schedule(2, periodMinutes = 5, charging = true)     # 15 at least
    check jobs().scheduled == @[1, 2]
    simulator().setNetwork("cellular", metered = true)
    simulator().advanceClock(10_000)
    check only(ekJob).len == 0                        # waiting for Wi-Fi
    simulator().setNetwork("wifi")
    var ev = only(ekJob)
    check ev.len == 1 and ev[0].job.id == 1 and ev[0].job.atMs > 0
    check jobs().scheduled == @[2]                    # once: done
    simulator().advanceClock(15 * 60_000)
    check only(ekJob).len == 0                        # not charging
    simulator().setBattery(50, charging = true)
    check only(ekJob).mapIt(it.job.id) == @[2]
    check jobs().scheduled == @[2]                    # periodic: again later
    check only(ekJob).len == 0
    simulator().runJob(2)
    check only(ekJob).len == 1
    jobs().cancelAll()
    check jobs().scheduled.len == 0

  test "shares and links from other apps":
    let src = getTempDir() / "druid_share_src.txt"
    writeFile(src, "hello")
    incoming().clearCopies()
    simulator().share(text = "look", subject = "S", mime = "image/*", files = [src, src])
    simulator().openLink("https://example.com/x")
    let ev = only(ekIncoming)
    check ev.len == 2
    check ev[0].incoming.action == iaSend and ev[0].incoming.text == "look" and ev[0].incoming.subject == "S"
    check ev[0].incoming.files.len == 2 and ev[0].incoming.files[0] != ev[0].incoming.files[1]
    check readFile(ev[0].incoming.files[1]) == "hello"
    check ev[0].incoming.files[0].startsWith(incoming().copiesDir)
    check ev[1].incoming.action == iaView and ev[1].incoming.url == "https://example.com/x"
    incoming().clearCopies()
    check not fileExists(ev[0].incoming.files[0])

  test "BLE scans need a permission and Bluetooth, and report matching devices":
    expect DruidPermissionError: bluetooth().startScan()
    simulator().grant($apBluetoothScan)
    simulator().addBleDevice("AA:BB:CC:00:00:01", "Band", -50, ["0000180d-0000-1000-8000-00805f9b34fb"])
    simulator().addBleDevice("AA:BB:CC:00:00:02", "Tag", -80)
    bluetooth().startScan()
    check bluetooth().isScanning
    var ev = only(ekBle)
    check ev.mapIt(it.ble.name) == @["Band", "Tag"]
    check ev[0].ble.services == @["0000180d-0000-1000-8000-00805f9b34fb"] and ev[0].ble.rssi == -50
    check only(ekBle).len == 0                        # throttled: seen already
    simulator().addBleDevice("AA:BB:CC:00:00:02", "Tag", -40)     # moved closer
    ev = only(ekBle)
    check ev.len == 1 and ev[0].ble.rssi == -40
    bluetooth().startScan(services = ["0000180D-0000-1000-8000-00805F9B34FB"])
    check only(ekBle).mapIt(it.ble.name) == @["Band"]
    simulator().removeBleDevice("AA:BB:CC:00:00:01")
    bluetooth().startScan()
    check only(ekBle).mapIt(it.ble.name) == @["Tag"]
    bluetooth().stopScan()
    check not bluetooth().isScanning
    simulator().setBluetoothEnabled(false)
    expect DruidError: bluetooth().startScan()
    simulator().useProfile("small")                   # API 28, no BLE feature
    expect DruidError: bluetooth().startScan()
    simulator().useProfile("tablet")
    expect DruidPermissionError: bluetooth().startScan()          # BLUETOOTH_SCAN on 31+
    simulator().grant($apBluetoothScan)
    bluetooth().startScan()
    bluetooth().stopScan()

  test "the new events parse from the Java side's encoding":
    check parseEvent(encodeEvent("photo", 3, "ok", "/p.jpg")).photo.path == "/p.jpg"
    let c = parseEvent(encodeEvent("camera", 4, "started", "1280x720"))
    check c.kind == ekCamera and c.frames.width == 1280 and c.frames.height == 720
    check not parseEvent(encodeEvent("camera", 4, "error", "boom")).frames.started
    check parseEvent(encodeEvent("ble", "", "", 0, "error:2")).ble.error == 2
    check parseEvent(encodeEvent("job", 1, 1700000000000'i64)).job.atMs == 1700000000000'i64
    check parseEvent(encodeEvent("incoming", "send", "text/plain", "", "t", "")).incoming.files.len == 0
    check parseEvent(encodeEvent("alarm", "x", 1)).kind == ekUnknown
    let n = parseEvent(encodeEvent("notification", 3, "reply", "ok"))
    check n.notification.kind == ikReply and n.notification.detail == "ok" and n.notification.actionId == ""
    check parseEvent(encodeEvent("notification", 3, "wiggled", "")).kind == ekUnknown
    check parseEvent(encodeEvent("incoming", "edit", "", "", "", "")).kind == ekUnknown

suite "simulated device: foreground, voice, secure store, GATT, NFC, push":
  setup:
    simulator().useProfile("phone")
    resetEventState()

  proc only(kind: DruidEventKind): seq[DruidEvent] =
    for ev in pollEvents():
      if ev.kind == kind: result.add ev

  test "a foreground service needs a type on 14+, and the app in front on 12+":
    simulator().grant($apPostNotifications)
    foreground().start("Tracking", "0 km")                      # API 34, no type
    var ev = only(ekForeground)
    check ev.len == 1 and ev[0].foreground.state == fsError and "type" in ev[0].foreground.error
    check not foreground().isRunning
    simulator().lifecycle("paused")
    expect DruidError: foreground().start("Tracking", "0 km", types = {ftLocation})
    simulator().lifecycle("resumed")
    foreground().start("Tracking", "0 km", types = {ftLocation})
    check foreground().isRunning
    check simulator().notificationsShown.anyIt(it.title == "Tracking" and it.ongoing)
    foreground().update("Tracking", "1.2 km", progress = 40)
    check simulator().notificationsShown.anyIt(it.text == "1.2 km" and it.progress == 40)
    ev = only(ekForeground)
    check ev.len == 1 and ev[0].foreground.state == fsStarted      # once, not per update
    foreground().stop()
    check not foreground().isRunning and simulator().notificationsShown.len == 0
    check only(ekForeground).mapIt(it.foreground.state) == @[fsStopped]
    expect DruidError: foreground().update("x", "y")
    simulator().useProfile("small")                                   # API 28: no type needed
    simulator().lifecycle("paused")
    foreground().start("Upload", "")                                  # and allowed in the background
    check foreground().isRunning

  test "recording needs RECORD_AUDIO and ends by stop or limit":
    let path = getTempDir() / "druid_memo.m4a"
    removeFile(path)
    expect DruidPermissionError: recorder().start(path)
    simulator().grant($apRecordAudio)
    expect DruidError: recorder().start(getTempDir() / "nope-dir" / "x.m4a")
    recorder().start(path)
    check recorder().isRecording
    expect DruidError: recorder().start(path)                         # one at a time
    simulator().setMicLevel(12000)
    check recorder().amplitude == 12000
    simulator().advanceClock(2500)
    check recorder().stop() == 2500
    check not recorder().isRecording and recorder().amplitude == 0
    var ev = only(ekRecording)
    check ev.len == 1 and ev[0].recording.outcome == roStopped and ev[0].recording.durationMs == 2500
    check fileExists(path) and readFile(path)[4 .. 7] == "ftyp"
    expect DruidError: recorder().stop()
    recorder().start(path, maxDurationMs = 1000)
    simulator().advanceClock(1500)
    ev = only(ekRecording)
    check ev.len == 1 and ev[0].recording.outcome == roLimit and not recorder().isRecording

  test "text to speech opens, speaks, and knows its languages":
    expect DruidError: discard tts().speak("too early")
    tts().open()
    var ev = only(ekTts)
    check ev.len == 1 and ev[0].tts.step == tsReady and tts().isReady
    check tts().setLanguage("fr-FR") == lsCountry and tts().setLanguage("en") == lsAvailable
    check tts().setLanguage("xx-YY") == lsNotSupported
    let u = tts().speak("Hello from Nim", rate = 1.2)
    check simulator().spoken == @["Hello from Nim"] and not tts().isSpeaking
    ev = only(ekTts)
    check ev.mapIt((it.tts.step, it.tts.utteranceId)) == @[(tsStart, u), (tsDone, u)]
    tts().stop()
    tts().close()
    check not tts().isReady

  test "speech recognition hears what the simulator says":
    check recognizer().isAvailable
    expect DruidPermissionError: discard recognizer().start()
    simulator().grant($apRecordAudio)
    simulator().setHeard("turn on the lights", "turn off the lights")
    let r = recognizer().start(language = "en-US")
    var ev = only(ekSpeech)
    check ev.mapIt(it.speech.kind) == @[skReady, skPartial, skEnd, skResult]
    check ev[1].speech.texts == @["turn"] and ev[3].speech.id == r.id
    check ev[3].speech.texts == @["turn on the lights", "turn off the lights"]
    discard recognizer().start(partial = false)                       # heard once: now nothing
    ev = only(ekSpeech)
    check ev.mapIt(it.speech.kind) == @[skReady, skError] and ev[1].speech.errorCode == 7
    recognizer().stop()
    recognizer().cancel()
    check not recognizer().isListening

  test "the secure store keeps strings and bytes":
    let s = secureStore()
    s.clear()
    check s.getString("token").isNone and not s.contains("token")
    s.setString("token", "abc.def")
    s.setBytes("key", [0'u8, 255, 7])
    check s.getString("token") == some("abc.def")
    check s.getBytes("key") == some(@[0'u8, 255, 7])
    s.setString("empty", "")
    check s.getString("empty") == some("")
    check s.names == @["empty", "key", "token"]
    s.remove("token")
    check not s.contains("token")
    s.clear()
    check s.names.len == 0

  test "GATT: connect, discover, read, write, notify":
    const svc = "0000180d-0000-1000-8000-00805f9b34fb"
    const hr = "00002a37-0000-1000-8000-00805f9b34fb"
    const ctl = "00002a39-0000-1000-8000-00805f9b34fb"
    const name = "00002a00-0000-1000-8000-00805f9b34fb"
    simulator().addGattCharacteristic("AA:00:00:00:00:01", svc, hr, [0'u8, 72], properties = 2 or 16)
    simulator().addGattCharacteristic("AA:00:00:00:00:01", svc, ctl, [], properties = 8)
    simulator().addGattCharacteristic("AA:00:00:00:00:01", svc, name, [], properties = 0)
    expect DruidPermissionError: discard bluetooth().connect("AA:00:00:00:00:01")
    simulator().grant($apBluetoothConnect)
    let c = bluetooth().connect("AA:00:00:00:00:01")
    var ev = only(ekGatt)
    check ev.mapIt(it.gatt.kind) == @[gkConnected, gkServices]
    check ev[1].gatt.characteristics.mapIt(it.uuid) == @[hr, ctl, name]
    check ev[1].gatt.characteristics[0].properties == 18 and ev[1].gatt.connection == c.id
    bluetooth().read(c, svc, hr)
    bluetooth().write(c, svc, ctl, [1'u8])
    bluetooth().read(c, svc, ctl)                                     # write-only
    bluetooth().write(c, svc, name, [1'u8])                           # not writable
    ev = only(ekGatt)
    check ev.mapIt((it.gatt.kind, it.gatt.status)) == @[(gkRead, 0), (gkWritten, 0), (gkRead, 2), (gkWritten, 3)]
    check ev[0].gatt.value == @[0'u8, 72]
    check bluetooth().setNotify(c, svc, hr) and not bluetooth().setNotify(c, svc, ctl)
    simulator().notifyGatt("AA:00:00:00:00:01", hr, [0'u8, 80])
    simulator().notifyGatt("AA:00:00:00:00:01", ctl, [9'u8])         # not notifying: nothing
    ev = only(ekGatt)
    check ev.len == 1 and ev[0].gatt.kind == gkChanged and ev[0].gatt.value == @[0'u8, 80]
    bluetooth().setNotify(c, svc, hr, on = false)
    simulator().notifyGatt("AA:00:00:00:00:01", hr, [0'u8, 81])
    check only(ekGatt).len == 0
    bluetooth().requestMtu(c, 1000)
    check only(ekGatt)[0].gatt.mtu == 517
    expect DruidError: bluetooth().read(c, svc, "00000000-0000-0000-0000-000000000000")
    check bluetooth().connections == 1
    simulator().disconnectGatt("AA:00:00:00:00:01")
    ev = only(ekGatt)
    check ev.len == 1 and ev[0].gatt.kind == gkDisconnected and ev[0].gatt.status == 8
    expect DruidError: bluetooth().read(c, svc, hr)
    bluetooth().disconnect(c)                                          # already: nothing more
    check only(ekGatt).len == 0
    bluetooth().close(c)
    check bluetooth().connections == 0
    let unknown = bluetooth().connect("FF:FF:FF:FF:FF:FF")
    ev = only(ekGatt)
    check ev.len == 1 and ev[0].gatt.kind == gkDisconnected and ev[0].gatt.status == 133
    bluetooth().close(unknown)
    let again = bluetooth().connect("AA:00:00:00:00:01")
    discard pollEvents()
    bluetooth().disconnect(again)
    check only(ekGatt).mapIt(it.gatt.kind) == @[gkDisconnected]
    simulator().setBluetoothEnabled(false)
    expect DruidError: discard bluetooth().connect("AA:00:00:00:00:01")

  test "NFC tags while reading":
    simulator().tapNfcTag("04a1")                                   # not reading: missed
    check nfc().startReading() and nfc().isReading
    simulator().tapNfcTag("04a2b3", [("uri", "https://nim-lang.org"), ("text:en", "hi")])
    let ev = only(ekNfc)
    check ev.len == 1 and ev[0].nfc.id == "04a2b3" and ev[0].nfc.techs == @["NfcA", "Ndef"]
    check ev[0].nfc.records == @[NdefEntry(kind: "uri", value: "https://nim-lang.org"),
                                 NdefEntry(kind: "text:en", value: "hi")]
    nfc().stopReading()
    simulator().tapNfcTag("04a3")
    check only(ekNfc).len == 0 and not nfc().isReading
    simulator().useProfile("small")                                  # no NFC
    expect DruidError: discard nfc().startReading()

  test "push: a token, messages, and taps on their notifications":
    check push().isAvailable
    push().requestToken()
    simulator().pushMessage([("chat", "42")], title = "Hi", body = "there")
    simulator().openPushNotification([("chat", "43")])
    let ev = only(ekPush)
    check ev.mapIt(it.push.kind) == @[pkToken, pkMessage, pkOpened]
    check ev[0].push.token == "simulated-token"
    check ev[1].push.title == "Hi" and ev[1].push.data == @[(key: "chat", value: "42")]
    check ev[2].push.data == @[(key: "chat", value: "43")]
    push().subscribe("news")
    push().unsubscribe("news")
    push().deleteToken()
    check parseEvent(encodeEvent("push", "error", "boom")).push.error == "boom"

  test "the newest events parse":
    let g = parseEvent(encodeEvent("gatt", 1, "read", "c", 0, "0aff"))
    check g.gatt.value == @[10'u8, 255]
    check parseEvent(encodeEvent("gatt", 1, "read", "c", 0, "0af")).kind == ekUnknown
    check parseEvent(encodeEvent("tts", "error", "", -1)).tts.step == tsFailed
    check parseEvent(encodeEvent("tts", "error", "u1", -3)).tts.step == tsError
    check parseEvent(encodeEvent("recording", "limit", "/a.m4a", 1000, "")).recording.durationMs == 1000
    check parseEvent(encodeEvent("nfc", "01", "")).nfc.techs.len == 0
    check parseHexBytes("") == newSeq[byte]()
