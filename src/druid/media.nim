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

import std/[enumutils, tables, os, osproc, strutils]
import bridge, events, simulator

# ---- the desktop's player and downloads (simulator) ----

type SimTrack = object
  source: string
  playing, looping: bool
  position: int

var simTracks {.threadvar.}: Table[int, SimTrack]
var nextSimTrack {.threadvar.}: int

proc simTrack(id: int): var SimTrack =
  if id notin simTracks:
    raise newException(DruidError, "Player.play (simulated): java.lang.IllegalArgumentException: no player " & $id)
  simTracks[id]

type SimDownload = object
  process: Process
  dest: string
  status: int

var simDownloads {.threadvar.}: Table[int64, SimDownload]
var nextSimDownload {.threadvar.}: int64
var downloadsHooked {.threadvar.}: bool

proc finishDownloads() =
  for id, d in simDownloads.mpairs:
    if d.status in [1, 2] and d.process != nil:
      let code = d.process.peekExitCode
      if code == -1: continue
      d.process.close()
      d.process = nil
      d.status = if code == 0: 8 else: 16
      postLocal encodeEvent("download", $id, $d.status, (if code == 0: "file://" & d.dest else: ""))

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
  ##
  ## On the desktop the simulator plays silently: it is prepared at the next
  ## `pollEvents`, plays, pauses and seeks, but never completes on its own.
  if druidStarted(): return Track(id: callStatic(int, "Player", "open", source, loop))
  if "://" notin source and not fileExists(source):
    raise newException(DruidError, "Player.open (simulated): java.io.FileNotFoundException: " & source)
  inc nextSimTrack
  simTracks[nextSimTrack] = SimTrack(source: source, looping: loop)
  postLocal encodeEvent("player", $nextSimTrack, "prepared", "0")
  Track(id: nextSimTrack)
proc play*(_: PlayerApi, t: Track) =
  if druidStarted(): callStatic(void, "Player", "play", t.id) else: simTrack(t.id).playing = true
proc pause*(_: PlayerApi, t: Track) =
  if druidStarted(): callStatic(void, "Player", "pause", t.id) else: simTrack(t.id).playing = false
proc seek*(_: PlayerApi, t: Track, ms: int) =
  if druidStarted(): callStatic(void, "Player", "seek", t.id, ms) else: simTrack(t.id).position = ms
proc setVolume*(_: PlayerApi, t: Track, volume: float32) =
  ## 0.0 .. 1.0, relative to the stream's volume.
  if druidStarted(): callStatic(void, "Player", "setVolume", t.id, volume) else: discard simTrack(t.id)
proc isPlaying*(_: PlayerApi, t: Track): bool =
  bridged(simTrack(t.id).playing): callStatic(bool, "Player", "isPlaying", t.id)
proc position*(_: PlayerApi, t: Track): int =
  ## Milliseconds.
  bridged(simTrack(t.id).position): callStatic(int, "Player", "position", t.id)
proc duration*(_: PlayerApi, t: Track): int =
  bridged((discard simTrack(t.id); 0)): callStatic(int, "Player", "duration", t.id)
proc close*(_: PlayerApi, t: Track) =
  if druidStarted(): callStatic(void, "Player", "close", t.id) else: simTracks.del(t.id)
proc closeAll*(_: PlayerApi) =
  if druidStarted(): callStatic(void, "Player", "closeAll") else: simTracks.clear()
proc count*(_: PlayerApi): int = bridged(simTracks.len): callStatic(int, "Player", "count")

# ---- biometric ----

proc availability*(_: BiometricApi): BiometricAvailability =
  let c = if druidStarted(): callStatic(int, "Biometric", "canAuthenticate")
          else: simulator().profile.biometric
  for a in BiometricAvailability:
    if ord(a) == c: return a
  baUnknown

var nextBio {.threadvar.}: int

proc authenticate*(_: BiometricApi, title: string, subtitle = "", cancelText = "Cancel"): BiometricRequest =
  ## Shows the system's fingerprint/face prompt. The outcome is an
  ## `ekBiometric` event with this request's id. Raises DruidError before Android 9.
  inc nextBio
  result = BiometricRequest(id: nextBio)
  let shown = if druidStarted(): callStatic(bool, "Biometric", "authenticate", result.id, title, subtitle, cancelText)
              else: simulator().profile.apiLevel >= 28
  if not shown:
    raise newException(DruidError, "BiometricPrompt needs Android 9")
  if not druidStarted():
    # The simulated finger: answered at the next poll (`setBiometricOutcome`).
    let id = $result.id
    case simBiometricOutcome()
    of "failed": postLocal encodeEvent("biometric", id, "failed", "0", "")
    of "cancelled": postLocal encodeEvent("biometric", id, "error", "13", "cancelled")
    of "lockout": postLocal encodeEvent("biometric", id, "error", "7", "Too many attempts")
    else: postLocal encodeEvent("biometric", id, "succeeded", "0", "")
proc cancel*(_: BiometricApi, r: BiometricRequest) =
  if druidStarted(): callStatic(void, "Biometric", "cancel", r.id)

# ---- downloads ----

proc enqueue*(_: DownloadsApi, url, fileName: string, title = "", wifiOnly = false): Download =
  ## The system downloads `url` into `storage().externalFilesDir` as
  ## `fileName`, even if the app is closed; an `ekDownload` event says when done.
  ##
  ## On the desktop the file really is downloaded (with curl, in the
  ## background) into the simulated external files directory, and the
  ## `ekDownload` event arrives at the `pollEvents` after it finishes.
  if druidStarted():
    return Download(id: callStatic(int64, "Downloads", "enqueue", url, fileName, title, wifiOnly))
  if wifiOnly and simNetwork().kind != "wifi":
    raise newException(DruidError, "Downloads (simulated): waiting for Wi-Fi is not simulated; the network is " &
                       simNetwork().kind)
  if not downloadsHooked:
    simOnPoll(proc() = finishDownloads())
    downloadsHooked = true
  inc nextSimDownload
  let dir = getHomeDir() / ".local" / "share" / getAppFilename().extractFilename.changeFileExt("") / "external"
  createDir(dir)
  let dest = dir / fileName
  var p: Process = nil
  try:
    p = startProcess("curl", args = ["-sSfL", "-o", dest, url], options = {poUsePath})
  except OSError: discard
  simDownloads[nextSimDownload] = SimDownload(process: p, dest: dest, status: (if p == nil: 16 else: 2))
  if p == nil: postLocal encodeEvent("download", $nextSimDownload, "16", "")
  Download(id: nextSimDownload)
proc status*(_: DownloadsApi, d: Download): tuple[status: DownloadStatus, bytes, total: int64] =
  let s = if druidStarted(): callStatic(seq[int64], "Downloads", "status", d.id)
          elif d.id in simDownloads:
            let sd = simDownloads[d.id]
            @[int64(sd.status), (if fileExists(sd.dest): getFileSize(sd.dest) else: 0'i64),
              (if sd.status == 8: getFileSize(sd.dest) else: -1'i64)]
          else: @[0'i64, 0, -1]
  var st = dsUnknown
  for x in DownloadStatus:
    if ord(x) == s[0]: st = x
  (st, s[1], s[2])
proc localUri*(_: DownloadsApi, d: Download): string =
  if druidStarted(): return callStatic(string, "Downloads", "localUri", d.id)
  if d.id in simDownloads and simDownloads[d.id].status == 8: "file://" & simDownloads[d.id].dest else: ""
proc remove*(_: DownloadsApi, d: Download): bool {.discardable.} =
  ## Cancels it and deletes the file.
  if druidStarted(): return callStatic(int, "Downloads", "remove", d.id) > 0
  if d.id notin simDownloads: return false
  let sd = simDownloads[d.id]
  if sd.process != nil: sd.process.terminate()
  removeFile(sd.dest)
  simDownloads.del(d.id)
  true

# ---- memory ----

proc info*(_: MemoryApi): MemoryInfo =
  ## The device's memory (ActivityManager.MemoryInfo); on the desktop the profile's.
  if not druidStarted():
    let total = simulator().profile.totalMemory
    return MemoryInfo(availableBytes: total * 6 div 10, totalBytes: total,
                      thresholdBytes: total div 16, lowMemory: false)
  let v = callStatic(seq[int64], "Memory", "info")
  MemoryInfo(availableBytes: v[0], totalBytes: v[1], thresholdBytes: v[2], lowMemory: v[3] != 0)
proc memoryClassMb*(_: MemoryApi): int =
  ## The app's Java heap budget in MB.
  bridged(simulator().profile.memoryClassMb): callStatic(int, "Memory", "memoryClass")
proc isLowRamDevice*(_: MemoryApi): bool = bridged(false): callStatic(bool, "Memory", "isLowRamDevice")
proc javaHeap*(_: MemoryApi): tuple[used, max: int64] =
  bridged((int64(getOccupiedMem()), int64(simulator().profile.memoryClassMb) * 1_048_576)):
    let v = callStatic(seq[int64], "Memory", "javaHeap")
    (v[0], v[1])
