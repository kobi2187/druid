## Audio playback, biometric confirmation, background downloads, memory.
##
## ```nim
## let song = player().open(storage().filesDir / "song.mp3")
## # after the ekPlayer "prepared" event:
## player().play(song)
##
## let ask = biometric().authenticate("Unlock notes")
## # ekBiometric event with biometricId == ask.id: "succeeded" / "error"
##
## let dl = downloads().enqueue("https://example.com/a.zip", "a.zip")
## ```

import std/enumutils
import bridge

type
  PlayerApi* = object
  Track* = object
    id*: int
  BiometricApi* = object
  BiometricRequest* = object
    id*: int
  BiometricAvailability* = enum
    baUnsupported = -2   ## before Android 10: unknown, try authenticate
    baUnknown = -1
    baReady = 0
    baHardwareUnavailable = 1
    baNoneEnrolled = 11
    baNoHardware = 12
    baSecurityUpdateRequired = 15
  DownloadsApi* = object
  Download* = object
    id*: int64
  DownloadStatus* = enum
    dsUnknown = 0, dsPending = 1, dsRunning = 2, dsPaused = 4, dsSuccessful = 8, dsFailed = 16
  MemoryApi* = object
  MemoryInfo* = object
    availableBytes*, totalBytes*, thresholdBytes*: int64
    lowMemory*: bool

proc player*(): PlayerApi = discard
proc biometric*(): BiometricApi = discard
proc downloads*(): DownloadsApi = discard
proc memory*(): MemoryApi = discard

# ---- player ----

proc open*(_: PlayerApi, source: string, loop = false): Track =
  ## Prepares `source` (a path, or a file://, content:// or http(s):// URL) in the
  ## background; an `ekPlayer` "prepared" event says when it can play.
  Track(id: callStatic(int, "Player", "open", source, loop))
proc play*(_: PlayerApi, t: Track) = callStatic(void, "Player", "play", t.id)
proc pause*(_: PlayerApi, t: Track) = callStatic(void, "Player", "pause", t.id)
proc seek*(_: PlayerApi, t: Track, ms: int) = callStatic(void, "Player", "seek", t.id, ms)
proc setVolume*(_: PlayerApi, t: Track, volume: float32) =
  ## 0.0 .. 1.0, relative to the stream's volume.
  callStatic(void, "Player", "setVolume", t.id, volume)
proc isPlaying*(_: PlayerApi, t: Track): bool = callStatic(bool, "Player", "isPlaying", t.id)
proc position*(_: PlayerApi, t: Track): int = callStatic(int, "Player", "position", t.id)
  ## Milliseconds.
proc duration*(_: PlayerApi, t: Track): int = callStatic(int, "Player", "duration", t.id)
proc close*(_: PlayerApi, t: Track) =
  if druidStarted(): callStatic(void, "Player", "close", t.id)
proc closeAll*(_: PlayerApi) =
  if druidStarted(): callStatic(void, "Player", "closeAll")
proc count*(_: PlayerApi): int = bridged(0): callStatic(int, "Player", "count")

# ---- biometric ----

proc availability*(_: BiometricApi): BiometricAvailability =
  if not druidStarted(): return baNoHardware
  let c = callStatic(int, "Biometric", "canAuthenticate")
  for a in BiometricAvailability:
    if ord(a) == c: return a
  baUnknown

var nextBio {.threadvar.}: int

proc authenticate*(_: BiometricApi, title: string, subtitle = "", cancelText = "Cancel"): BiometricRequest =
  ## Shows the system's fingerprint/face prompt. The outcome is an
  ## `ekBiometric` event with this request's id. Raises DruidError before Android 9.
  inc nextBio
  result = BiometricRequest(id: nextBio)
  if not callStatic(bool, "Biometric", "authenticate", result.id, title, subtitle, cancelText):
    raise newException(DruidError, "BiometricPrompt needs Android 9")
proc cancel*(_: BiometricApi, r: BiometricRequest) =
  if druidStarted(): callStatic(void, "Biometric", "cancel", r.id)

# ---- downloads ----

proc enqueue*(_: DownloadsApi, url, fileName: string, title = "", wifiOnly = false): Download =
  ## The system downloads `url` into `storage().externalFilesDir` as
  ## `fileName`, even if the app is closed; an `ekDownload` event says when done.
  Download(id: callStatic(int64, "Downloads", "enqueue", url, fileName, title, wifiOnly))
proc status*(_: DownloadsApi, d: Download): tuple[status: DownloadStatus, bytes, total: int64] =
  let s = callStatic(seq[int64], "Downloads", "status", d.id)
  var st = dsUnknown
  for x in DownloadStatus:
    if ord(x) == s[0]: st = x
  (st, s[1], s[2])
proc localUri*(_: DownloadsApi, d: Download): string = callStatic(string, "Downloads", "localUri", d.id)
proc remove*(_: DownloadsApi, d: Download): bool {.discardable.} =
  ## Cancels it and deletes the file.
  callStatic(int, "Downloads", "remove", d.id) > 0

# ---- memory ----

proc info*(_: MemoryApi): MemoryInfo =
  ## The device's memory (ActivityManager.MemoryInfo); zeros on the desktop.
  if not druidStarted(): return
  let v = callStatic(seq[int64], "Memory", "info")
  MemoryInfo(availableBytes: v[0], totalBytes: v[1], thresholdBytes: v[2], lowMemory: v[3] != 0)
proc memoryClassMb*(_: MemoryApi): int =
  ## The app's Java heap budget in MB.
  bridged(0): callStatic(int, "Memory", "memoryClass")
proc isLowRamDevice*(_: MemoryApi): bool = bridged(false): callStatic(bool, "Memory", "isLowRamDevice")
proc javaHeap*(_: MemoryApi): tuple[used, max: int64] =
  bridged((0'i64, 0'i64)):
    let v = callStatic(seq[int64], "Memory", "javaHeap")
    (v[0], v[1])
