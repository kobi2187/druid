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
    check ev.len == 1 and ev[0].photoId == shot.id and ev[0].photoOk and ev[0].photoPath == path
    let jpeg = readFile(path)
    check jpeg.len > 1000 and jpeg[0] == '\xFF' and jpeg[1] == '\xD8'
    let bad = camera().takePhoto(getTempDir() / "no-such-dir" / "x.jpg")
    let ev2 = only(ekPhoto)
    check ev2.len == 1 and ev2[0].photoId == bad.id and not ev2[0].photoOk and
          "FileNotFoundException" in ev2[0].photoError
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
    check ev.len == 1 and ev[0].cameraRequestId == req.id and ev[0].cameraStarted and
          ev[0].frameWidth == 320 and ev[0].frameHeight == 240
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
    check ev.len == 2 and ev[0].interaction == "action" and ev[0].notificationDetail == "read"
    check ev[1].interaction == "reply" and ev[1].notificationDetail == "on my way" and ev[1].notificationId == 7
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
    check ev.mapIt((it.notificationId, it.interaction)) == @[(8, "tap"), (9, "tap"), (9, "dismissed")]
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
    check ev.len == 1 and ev[0].alarmId == 1 and ev[0].alarmAtMs == t
    check simulator().notificationsShown.mapIt(it.title) == @["Stretch"]
    check alarms().pending == @[2]
    alarms().cancel(2)
    simulator().advanceClock(10_000)
    check only(ekAlarm).len == 0 and alarms().pending.len == 0
    alarms().set(3, nowMs() + 3_600_000)
    simulator().fireAlarm(3)
    ev = only(ekAlarm)
    check ev.len == 1 and ev[0].alarmId == 3 and simulator().notificationsShown.len == 1  # no title: no notification
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
    check ev.len == 1 and ev[0].jobId == 1 and ev[0].jobRanAtMs > 0
    check jobs().scheduled == @[2]                    # once: done
    simulator().advanceClock(15 * 60_000)
    check only(ekJob).len == 0                        # not charging
    simulator().setBattery(50, charging = true)
    check only(ekJob).mapIt(it.jobId) == @[2]
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
    check ev[0].incomingAction == "send" and ev[0].incomingText == "look" and ev[0].incomingSubject == "S"
    check ev[0].incomingFiles.len == 2 and ev[0].incomingFiles[0] != ev[0].incomingFiles[1]
    check readFile(ev[0].incomingFiles[1]) == "hello"
    check ev[0].incomingFiles[0].startsWith(incoming().copiesDir)
    check ev[1].incomingAction == "view" and ev[1].incomingUrl == "https://example.com/x"
    incoming().clearCopies()
    check not fileExists(ev[0].incomingFiles[0])

  test "BLE scans need a permission and Bluetooth, and report matching devices":
    expect DruidPermissionError: bluetooth().startScan()
    simulator().grant($apBluetoothScan)
    simulator().addBleDevice("AA:BB:CC:00:00:01", "Band", -50, ["0000180d-0000-1000-8000-00805f9b34fb"])
    simulator().addBleDevice("AA:BB:CC:00:00:02", "Tag", -80)
    bluetooth().startScan()
    check bluetooth().isScanning
    var ev = only(ekBle)
    check ev.mapIt(it.bleName) == @["Band", "Tag"]
    check ev[0].bleServices == @["0000180d-0000-1000-8000-00805f9b34fb"] and ev[0].bleRssi == -50
    check only(ekBle).len == 0                        # throttled: seen already
    simulator().addBleDevice("AA:BB:CC:00:00:02", "Tag", -40)     # moved closer
    ev = only(ekBle)
    check ev.len == 1 and ev[0].bleRssi == -40
    bluetooth().startScan(services = ["0000180D-0000-1000-8000-00805F9B34FB"])
    check only(ekBle).mapIt(it.bleName) == @["Band"]
    simulator().removeBleDevice("AA:BB:CC:00:00:01")
    bluetooth().startScan()
    check only(ekBle).mapIt(it.bleName) == @["Tag"]
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
    check parseEvent(encodeEvent("photo", 3, "ok", "/p.jpg")).photoPath == "/p.jpg"
    let c = parseEvent(encodeEvent("camera", 4, "started", "1280x720"))
    check c.kind == ekCamera and c.frameWidth == 1280 and c.frameHeight == 720
    check not parseEvent(encodeEvent("camera", 4, "error", "boom")).cameraStarted
    check parseEvent(encodeEvent("ble", "", "", 0, "error:2")).bleError == 2
    check parseEvent(encodeEvent("job", 1, 1700000000000'i64)).jobRanAtMs == 1700000000000'i64
    check parseEvent(encodeEvent("incoming", "send", "text/plain", "", "t", "")).incomingFiles.len == 0
    check parseEvent(encodeEvent("alarm", "x", 1)).kind == ekUnknown
