## The desktop's simulated Android (src/druid/simulator.nim): each service
## follows Android's rules, so what works here works on a phone.
## tests/conformance.nim checks the shared scenarios against Robolectric too.

import std/[unittest, options, os, strutils, math]
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
