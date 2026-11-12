## Scenarios that must give the same results on the desktop simulator and on
## Android. Each runs Druid's public API and changes the world only through
## `arrange`, whose words each side implements its own way:
##
##   desktop   tests/test_conformance.nim  -> the simulator (simulator.nim)
##   Android   tests/robolectric/harness.nim "conf|<name>" -> dev.druid.Arranger
##             (Robolectric's shadows: the permission dialog, network callbacks,
##             sensor events, a GPS fix, the battery)
##
## A scenario returns its problems; none means it behaved as Android does.
##
## The words: "deny P" / "grant P" (P a permission's short name), "ask" (the
## next request shows a dialog), "answer allow" / "answer deny", "network KIND
## CONNECTED METERED", "battery LEVEL CHARGING PLUGGED", "sensor add TYPE",
## "sensor TYPE V...", "provider NAME on|off", "fix LAT LON ACCURACY", "disk"
## (a disk with free space: Robolectric has none until told), "idle".

import std/[options, strutils, tables, os]
import ../src/druid

type
  Arrange* = proc(what: string) {.closure.}
  Scenario = proc(arrange: Arrange): seq[string] {.closure.}

var scenarios*: OrderedTable[string, Scenario]

template scenario(name: string, body: untyped) =
  scenarios[name] = proc(arrange {.inject.}: Arrange): seq[string] =
    var problems {.inject.}: seq[string]
    template expect(cond: bool, what: string) {.inject.} =
      if not cond: problems.add what
    body
    problems

const camera = "android.permission.CAMERA"

scenario "permission-allow":
  arrange("deny CAMERA")
  expect(not permissions().check(apCamera), "camera granted before asking")
  arrange("ask")
  let req = permissions().request(apCamera)
  expect(permissions().status(req) == psPending, "answered before the dialog: " & $permissions().status(req))
  arrange("answer allow")
  discard pollEvents()
  expect(permissions().status(req) == psGranted, "status after allowing: " & $permissions().status(req))
  expect(permissions().results(req) == @[(permission: camera, granted: true)], "results: " & $permissions().results(req))
  expect(permissions().check(apCamera), "not granted after allowing")

scenario "permission-deny":
  arrange("deny CAMERA")
  arrange("ask")
  let req = permissions().request(apCamera)
  arrange("answer deny")
  discard pollEvents()
  expect(permissions().status(req) == psDenied, "status after denying: " & $permissions().status(req))
  expect(not permissions().check(apCamera), "granted after denying")

scenario "permission-already-granted":
  arrange("grant CAMERA")
  let req = permissions().request(apCamera)
  arrange("idle")
  discard pollEvents()
  expect(permissions().status(req) == psGranted, "a granted permission was not answered: " & $permissions().status(req))

scenario "notifications":
  arrange("grant POST_NOTIFICATIONS")
  notifications().cancelAll()
  notifications().createChannel("conf", "Conformance")
  expect(notifications().hasChannel("conf"), "channel missing")
  notifications().show(5, "Title", "Text ✓", channel = "conf")
  notifications().show(5, "Title 2", "replaced", channel = "conf")
  notifications().show(6, "Other", "x", channel = "conf")
  expect(notifications().active == @[5, 6], "active: " & $notifications().active)
  notifications().cancel(5)
  expect(notifications().active == @[6], "after cancel: " & $notifications().active)
  notifications().cancelAll()
  expect(notifications().active.len == 0, "after cancelAll: " & $notifications().active)

scenario "clipboard":
  clipboard().setText("héllo 😀")
  expect(clipboard().text == some("héllo 😀"), "text: " & $clipboard().text)
  expect(clipboard().hasText, "hasText false")
  clipboard().clear()
  expect(clipboard().text.isNone, "text after clear: " & $clipboard().text)
  expect(not clipboard().hasText, "hasText after clear")

scenario "prefs":
  let p = prefs("conformance")
  p.clear()
  p.setString("s", "v ü")
  p.setInt("i", 9_000_000_000'i64)
  p.setFloat("f", 0.1)
  p.setBool("b", true)
  expect(p.getString("s") == "v ü", "string")
  expect(p.getInt("i") == 9_000_000_000'i64, "int")
  expect(p.getFloat("f") == 0.1, "float")
  expect(p.getBool("b"), "bool")
  expect(p.getInt("s", -5) == -5, "wrong type should give the default")
  expect(p.getString("missing", "d") == "d", "missing should give the default")
  p.remove("s")
  expect(not p.contains("s"), "removed key still there")
  expect(p.keys.len == 3, "keys: " & $p.keys)

scenario "crypto":
  let c = crypto()
  expect(c.sha256Hex("hello") == "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824", "sha256")
  expect(c.digest("MD5", "abc".toBytes).toHex == "900150983cd24fb0d6963f7d28e17f72", "md5")
  expect(c.digest("SHA-1", "abc".toBytes).toHex == "a9993e364706816aba3e25717850c26c9cd0d89d", "sha1")
  expect(c.sha512("abc").toHex.startsWith("ddaf35a193617abacc417349ae204131"), "sha512")
  expect(c.hmacSha256("key", "hello").toHex == "9307b3b915efb5171ff14d8cb55fbcc798c6c0ef1456d66ded1a6aa723a58b7b", "hmac")
  expect(c.uuid.len == 36 and c.uuid[14] == '4', "uuid")
  expect(c.randomBytes(32).len == 32, "random")
  var raised = false
  try: discard c.digest("SHA-999", @[])
  except DruidError: raised = true
  expect(raised, "an unknown digest did not raise DruidError")

scenario "connectivity":
  arrange("network wifi 1 0")
  expect(connectivity().isConnected and connectivity().networkType == ntWifi and not connectivity().isMetered,
         "wifi: " & $connectivity().networkType)
  connectivity().startMonitoring()
  expect(connectivity().isMonitoring, "not monitoring")
  arrange("network cellular 1 1")
  let evs = pollEvents()
  var seen = false
  for e in evs:
    if e.kind == ekConnectivity and e.networkType == "cellular" and e.connected and e.metered: seen = true
  expect(seen, "no cellular event: " & $evs.len & " events")
  expect(connectivity().latest.get.networkType == ntCellular, "latest")
  connectivity().stopMonitoring()
  expect(not connectivity().isMonitoring, "still monitoring")

scenario "sensors":
  arrange("sensor add 5")
  expect(sensors().has(stLight), "no light sensor")
  expect(sensors().start(stLight, sdGame), "could not start")
  arrange("sensor 5 320")
  discard pollEvents()
  let r = sensors().latest(stLight)
  expect(r.isSome and r.get.values == @[320'f32], "reading: " & $r)
  sensors().stop(stLight)
  expect(not sensors().isRunning(stLight), "still running")

scenario "location":
  arrange("grant ACCESS_FINE_LOCATION")
  arrange("provider gps on")
  expect(location().isProviderEnabled(providerGps), "gps off")
  location().start(providerGps, minTimeMs = 0)
  expect(location().isRunning(providerGps), "not running")
  arrange("fix 48.8584 2.2945 3")
  discard pollEvents()
  let f = location().latest
  expect(f.isSome and f.get.latitude == 48.8584 and f.get.longitude == 2.2945 and f.get.accuracy == 3,
         "fix: " & $f)
  location().stop(providerGps)
  expect(not location().isRunning(providerGps), "still running")

scenario "battery":
  arrange("battery 42 1 usb")
  expect(power().batteryLevel == 42, "level " & $power().batteryLevel)
  expect(power().isCharging, "not charging")
  expect(power().pluggedInto == "usb", "plugged " & power().pluggedInto)

scenario "wakelocks":
  let a = power().acquireWakeLock("conf:a")
  let b = power().acquireWakeLock("conf:b", timeoutMs = 60_000)
  expect(a.handle != b.handle, "same handle")
  expect(power().isHeld(a) and power().isHeld(b), "not held")
  expect(power().release(a) and not power().isHeld(a), "release")
  expect(not power().release(a), "released twice")
  power().release(b)

scenario "vibration-rules":
  var raised = 0
  try: vibration().vibrate(10, amplitude = 0)
  except ValueError: inc raised
  try: vibration().pattern([0, 10], repeat = 2)
  except ValueError: inc raised
  expect(raised == 2, "invalid arguments accepted")
  vibration().vibrate(10)
  vibration().cancel()

scenario "storage":
  arrange("disk")
  let path = storage().filesDir / "conformance.txt"
  writeFile(path, "same everywhere")
  expect(readFile(path) == "same everywhere", "file")
  expect(storage().freeBytes(storage().filesDir) > 0, "free bytes")
  expect(storage().totalBytes(storage().filesDir) >= storage().freeBytes(storage().filesDir), "total bytes")

proc runScenario*(name: string, arrange: Arrange): string =
  ## "ok", or the problems, one per line.
  if name notin scenarios: return "no scenario " & name
  resetEventState()
  let problems = scenarios[name](arrange)
  if problems.len == 0: "ok" else: problems.join("\n")
