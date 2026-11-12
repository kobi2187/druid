## Druid on the desktop: no JVM. Checks the parts that are pure Nim (event
## decoding, UTF-16, JNI signatures, prefs on disk). How the services behave
## on the desktop -- the simulated device -- is tests/test_simulation.nim.

import std/[unittest, options, os, math, json, algorithm]
import ../src/druid

suite "bridge":
  test "UTF-16 round trip, including astral characters":
    for s in ["", "abc", "héllo", "日本語", "emoji 😀 and 🇫🇷", "nul\0inside", "\u{10FFFF}"]:
      check fromUtf16(toUtf16(s)) == s
    check toUtf16("😀") == @[0xD83D'u16, 0xDE00'u16]
    check toUtf16("é") == @[0xE9'u16]

  test "lone surrogates and bad UTF-8 become U+FFFD":
    check fromUtf16([0xD83D'u16]) == "\u{FFFD}"
    check fromUtf16([0xDE00'u16, 0x41'u16]) == "\u{FFFD}A"
    check fromUtf16(toUtf16("a\xFFb")) == "a\u{FFFD}b"
    check fromUtf16(toUtf16("\xC3")) == "\u{FFFD}"           # truncated
    check fromUtf16(toUtf16("\xC0\xAF")) == "\u{FFFD}"        # overlong '/'
    check fromUtf16(toUtf16("\xED\xA0\x80x")) == "\u{FFFD}x" # an encoded surrogate

  test "signatures follow the Nim types":
    check jniSignature([toJArg(true), toJArg(3), toJArg(4'i64)], "V") == "(ZIJ)V"
    check jniSignature([toJArg(1.5'f32), toJArg(2.5), toJArg("s"), jnull], "Z") ==
      "(FDLjava/lang/String;Ljava/lang/String;)Z"
    check jniSignature([toJArg(@[1'u8]), toJArg(@[1'i32]), toJArg(@[1'i64]), toJArg(@["a"])],
                       "[Ljava/lang/String;") == "([B[I[J[Ljava/lang/String;)[Ljava/lang/String;"
    check jniSignature([toJArg(none(string)), toJArg(some("x"))], "I") ==
      "(Ljava/lang/String;Ljava/lang/String;)I"

  test "not started: callStatic raises DruidNotStarted, bridged answers the default":
    check not druidStarted()
    expect DruidNotStarted:
      discard callStatic(int, "Druid", "apiLevel")
    check bridged(42, callStatic(int, "Druid", "apiLevel")) == 42

suite "events":
  setup: resetEventState()

  test "permission":
    let e = parseEvent(encodeEvent("permission", "7", $apCamera, "1", $apRecordAudio, "0"))
    check e.kind == ekPermission
    check e.requestId == 7
    check e.results == @[(permission: $apCamera, granted: true), (permission: $apRecordAudio, granted: false)]

  test "location, with NaN for what is unknown":
    let e = parseEvent(encodeEvent("location", "gps", "48.85", "2.35", "NaN", "5.0", "1700000000000", "1.5E-1", "NaN"))
    check e.kind == ekLocation
    check e.fix.provider == "gps"
    check e.fix.latitude == 48.85 and e.fix.longitude == 2.35
    check e.fix.altitude.isNaN and e.fix.bearing.isNaN
    check e.fix.accuracy == 5.0
    check e.fix.timeMs == 1700000000000'i64
    check abs(e.fix.speed - 0.15) < 1e-9

  test "sensor":
    let e = parseEvent(encodeEvent("sensor", "1", "3", "123456789012", "0.1", "9.81", "-0.5"))
    check e.kind == ekSensor
    check e.reading.sensorType == ord(stAccelerometer)
    check e.reading.accuracy == 3
    check e.reading.timestampNs == 123456789012'i64
    check e.reading.values.len == 3
    check abs(e.reading.values[1] - 9.81'f32) < 1e-5

  test "the other kinds":
    check parseEvent(encodeEvent("lifecycle", "resumed", "a.B")).state == "resumed"
    let c = parseEvent(encodeEvent("connectivity", "wifi", "1", "0"))
    check c.kind == ekConnectivity and c.networkType == "wifi" and c.connected and not c.metered
    check parseEvent(encodeEvent("memory", "15")).trimLevel == 15
    let cfg = parseEvent(encodeEvent("configuration", "2", "32", "1.3"))
    check cfg.orientation == 2 and cfg.nightMode and abs(cfg.fontScale - 1.3) < 1e-6
    let p = parseEvent(encodeEvent("player", "4", "prepared", "1200"))
    check p.playerId == 4 and p.playerEvent == "prepared" and p.playerDetail == 1200
    let b = parseEvent(encodeEvent("biometric", "2", "error", "13", "cancelled"))
    check b.biometricId == 2 and b.outcome == "error" and b.errorCode == 13 and b.message == "cancelled"
    let d = parseEvent(encodeEvent("download", "9000000000", "8", "file:///x"))
    check d.downloadId == 9000000000'i64 and d.downloadStatus == 8 and d.localUri == "file:///x"
    let lp = parseEvent(encodeEvent("locationProvider", "gps", "0"))
    check lp.provider == "gps" and not lp.enabled

  test "unknown and malformed events do not raise":
    check parseEvent("somethingNew\x1fx").kind == ekUnknown
    check parseEvent("").kind == ekUnknown
    check parseEvent("location\x1fgps").kind == ekUnknown
    check parseEvent("sensor").kind == ekUnknown
    check parseEvent("permission\x1fnotanumber").kind == ekUnknown

  test "pollEvents applies latest values and drains local events":
    postLocal encodeEvent("location", "network", "1", "2", "NaN", "NaN", "5", "NaN", "NaN")
    postLocal encodeEvent("sensor", "5", "3", "1", "321")
    postLocal encodeEvent("connectivity", "cellular", "1", "1")
    check pendingEvents() == 3
    let evs = pollEvents()
    check evs.len == 3
    check pendingEvents() == 0
    check pollEvents().len == 0
    check location().latest.get.latitude == 1
    check sensors().latest(stLight).get.values == @[321'f32]
    check sensors().latest(stProximity).isNone
    check connectivity().latest.get.networkType == ntCellular
    check connectivity().latest.get.metered

suite "event state":
  setup: resetEventState()

  test "applyEvent records the latest of each kind":
    check latestFix().isNone and latestNetwork().isNone and latestReading(5).isNone
    check permissionResult(3).isNone
    applyEvent parseEvent(encodeEvent("location", "gps", "1", "2", "NaN", "NaN", "0", "NaN", "NaN"))
    applyEvent parseEvent(encodeEvent("connectivity", "ethernet", "1", "0"))
    applyEvent parseEvent(encodeEvent("sensor", "5", "3", "9", "42"))
    applyEvent parseEvent(encodeEvent("permission", "3", $apCamera, "1"))
    applyEvent parseEvent(encodeEvent("lifecycle", "paused", "A"))
    check latestFix().get.longitude == 2
    check latestNetwork().get.networkType == "ethernet"
    check latestReading(5).get.values == @[42'f32]
    check permissionResult(3).get == @[(permission: $apCamera, granted: true)]
    check lastLifecycleEvent() == "paused"

  test "network type names":
    for t in NetworkType: check parseNetworkType($t) == t
    check parseNetworkType("satellite") == ntOther

  test "distance between fixes":
    let a = LocationFix(latitude: 0, longitude: 0)
    let b = LocationFix(latitude: 0, longitude: 1)
    check abs(a.distanceTo(b) - 111_195) < 10

suite "desktop":
  setup: resetEventState()

  test "permission groups":
    check pgLocation.members == @[apLocationFine, apLocationCoarse]
    check $apPostNotifications == "android.permission.POST_NOTIFICATIONS"

  test "clipboard is process-local":
    clipboard().clear()
    check not clipboard().hasText and clipboard().text.isNone
    clipboard().setText("hi 😀")
    check clipboard().hasText and clipboard().text == some("hi 😀")
    clipboard().clear()
    check clipboard().text.isNone

  test "prefs persist to a JSON file":
    putEnv("XDG_CONFIG_HOME", getTempDir() / "druid_test_config")
    removeDir(getTempDir() / "druid_test_config")
    let p = prefs("unit")
    p.clear()
    check not p.contains("n")
    p.setInt("n", 41)
    p.setInt("n", p.getInt("n") + 1)
    p.setString("s", "x")
    p.setFloat("f", 2.5)
    p.setBool("b", true)
    check p.getInt("n") == 42 and p.getString("s") == "x" and p.getFloat("f") == 2.5 and p.getBool("b")
    check p.getString("missing", "dflt") == "dflt"
    check p.getInt("s", 7) == 7          # wrong type: the default
    check sorted(p.keys) == @["b", "f", "n", "s"]
    p.remove("s")
    check not p.contains("s")
    let onDisk = parseFile(getConfigDir() / "druid" / (getAppFilename().extractFilename.changeFileExt("") & "-unit.json"))
    check onDisk["n"].getInt == 42

  test "crypto that needs no JVM":
    let c = crypto()
    let u = c.uuid
    check u.len == 36 and u[14] == '4' and u[19] in {'8', '9', 'a', 'b'}
    check c.uuid != u
    check c.randomBytes(16).len == 16
    check c.base64Encode("hello?>".toBytes) == "aGVsbG8/Pg=="
    check c.base64Encode("hello?>".toBytes, urlSafe = true) == "aGVsbG8_Pg"
    check c.base64Decode("aGVsbG8_Pg") == "hello?>".toBytes
    check c.base64Decode("aGVsbG8/Pg==") == "hello?>".toBytes
    check toHex([0x00'u8, 0xff, 0x1a]) == "00ff1a"
    check c.sha256Hex("") == "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    expect DruidError:
      discard c.digest("SHA-999", @[])

  test "geometry":
    check haversine(0, 0, 0, 0) == 0
    let paris2london = haversine(48.8566, 2.3522, 51.5074, -0.1278)
    check abs(paris2london - 343_500) < 1500
    check abs(location().distanceBetween(0, 0, 0, 1) - 111_195) < 10
    let phone = DisplayMetrics(density: 2.625, fontScale: 1.15)
    check abs(phone.dpToPx(16) - 42) < 1e-9
    check abs(phone.pxToDp(42) - 16) < 1e-9
    check abs(phone.spToPx(16) - 48.3) < 1e-4

  test "the NDK answers nothing off Android":
    check systemProperty("ro.build.version.sdk") == "" and ndkApiLevel() == 0

  test "logging goes to stderr off Android":
    logInfo "hello ", 42
    logDebug "debug ", 1
    logWarn "warn ", 2
    logError "error ", 3
    log(llVerbose, "dropped below minLevel")
    check concatArgs(["a", "b"]) == "ab"
