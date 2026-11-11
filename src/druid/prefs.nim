## Small settings that survive restarts (SharedPreferences).
##
## ```nim
## let p = prefs()
## p.setInt("launches", p.getInt("launches") + 1)
## p.setString("theme", "dark")
## ```
##
## Writes are on disk when the call returns. On the desktop a JSON file in the
## user's config directory stands in, one per `file`.

import std/[json, os, tables]
import bridge

type Prefs* = object
  file*: string   ## "" for the app's default file

proc prefs*(file = ""): Prefs = Prefs(file: file)

var desktop {.threadvar.}: Table[string, JsonNode]

proc desktopPath(p: Prefs): string =
  let app = getAppFilename().extractFilename.changeFileExt("")
  getConfigDir() / "druid" / (app & (if p.file.len > 0: "-" & p.file else: "") & ".json")

proc load(p: Prefs): JsonNode =
  if p.file notin desktop:
    let path = p.desktopPath
    desktop[p.file] = (try: parseFile(path) except CatchableError: newJObject())
    if desktop[p.file].kind != JObject: desktop[p.file] = newJObject()
  desktop[p.file]

proc save(p: Prefs) =
  let path = p.desktopPath
  createDir(path.parentDir)
  writeFile(path, pretty(p.load))

proc contains*(p: Prefs, key: string): bool =
  bridged(p.load.hasKey(key)): callStatic(bool, "Prefs", "contains", p.file, key)

proc getString*(p: Prefs, key: string, default = ""): string =
  if druidStarted(): return callStatic(string, "Prefs", "getString", p.file, key, default)
  let n = p.load.getOrDefault(key)
  if n != nil and n.kind == JString: n.getStr else: default

proc getInt*(p: Prefs, key: string, default = 0'i64): int64 =
  if druidStarted(): return callStatic(int64, "Prefs", "getLong", p.file, key, default)
  let n = p.load.getOrDefault(key)
  if n != nil and n.kind == JInt: n.getBiggestInt else: default

proc getFloat*(p: Prefs, key: string, default = 0.0): float64 =
  if druidStarted(): return callStatic(float64, "Prefs", "getDouble", p.file, key, default)
  let n = p.load.getOrDefault(key)
  if n != nil and n.kind in {JFloat, JInt}: n.getFloat else: default

proc getBool*(p: Prefs, key: string, default = false): bool =
  if druidStarted(): return callStatic(bool, "Prefs", "getBool", p.file, key, default)
  let n = p.load.getOrDefault(key)
  if n != nil and n.kind == JBool: n.getBool else: default

template put(p: Prefs, key: string, javaName: string, v: typed, j: JsonNode) =
  if druidStarted():
    if not callStatic(bool, "Prefs", javaName, p.file, key, v):
      raise newException(DruidError, "Prefs: could not write " & key)
  else:
    p.load[key] = j
    p.save

proc setString*(p: Prefs, key, value: string) = p.put(key, "putString", value, %value)
proc setInt*(p: Prefs, key: string, value: int64) = p.put(key, "putLong", value, %value)
proc setFloat*(p: Prefs, key: string, value: float64) = p.put(key, "putDouble", value, %value)
proc setBool*(p: Prefs, key: string, value: bool) = p.put(key, "putBool", value, %value)

proc remove*(p: Prefs, key: string) =
  if druidStarted(): discard callStatic(bool, "Prefs", "remove", p.file, key)
  else:
    p.load.delete(key)
    p.save

proc clear*(p: Prefs) =
  if druidStarted(): discard callStatic(bool, "Prefs", "clear", p.file)
  else:
    desktop[p.file] = newJObject()
    p.save

proc keys*(p: Prefs): seq[string] =
  if druidStarted(): return callStatic(seq[string], "Prefs", "keys", p.file)
  for k in p.load.keys: result.add k
