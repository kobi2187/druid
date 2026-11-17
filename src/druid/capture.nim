## Taking pictures and reading the camera's frames, without any camera UI.
##
## ```nim
## if not permissions().check(apCamera): discard permissions().request(apCamera)
## let shot = camera().takePhoto(storage().cacheDir / "shot.jpg")
## # later: an ekPhoto event with photo.id == shot.id, photo.ok, photo.path
##
## discard camera().startFrames(width = 640, height = 480)
## # each frame of the app:
## let f = camera().latestFrame(since = lastSeq)
## if f.isSome:
##   lastSeq = f.get.seq
##   upload(f.get.toRgba, f.get.width, f.get.height)  # rotate by f.get.rotation to show upright
## camera().stopFrames()
## ```
##
## Both need the CAMERA permission (`DruidPermissionError` without it, as
## Android's SecurityException). On the desktop the simulated camera takes a
## 640x480 test card and streams a moving test pattern; it keeps Android's
## rules (the permission, the camera ids of the device profile).

import std/[options, times]
import bridge, events, simulator, hardware

type
  PhotoRequest* = object
    id*: int               ## the `photo.id` of its ekPhoto event
  FrameRequest* = object
    id*: int               ## the `frames.id` of its ekCamera event
  CameraFrame* = object
    seq*: int64            ## increases with each frame
    width*, height*: int
    rotation*: int         ## degrees clockwise to turn it upright on a portrait screen (the sensor's orientation)
    i420*: seq[byte]       ## Y plane (width*height), then U and V (each a quarter of that)

const frameHeader = 20
const testCard = when defined(android): "" else: staticRead("assets/testcard.jpg")
  ## What the simulated camera sees (not in Android builds, which have a camera).

var nextRequest {.threadvar.}: int

# ---- the simulated camera ----

type SimStream = object
  on: bool
  width, height, rotation: int
  startedAt: float

var simStream {.threadvar.}: SimStream

proc simCameraFor(id: string): SimCamera =
  let cams = simulator().profile.cameras
  if cams.len == 0:
    raise newException(DruidError, "CameraCapture (simulated): java.lang.IllegalStateException: this device has no camera")
  if id.len == 0:
    for c in cams:
      if c.facing == 1: return c
    return cams[0]
  for c in cams:
    if c.id == id: return c
  raise newException(DruidError, "CameraCapture (simulated): java.lang.IllegalArgumentException: no camera " & id)

proc requireCameraPermission(what: string) =
  if not simPermissionGranted("android.permission.CAMERA"):
    raise newException(DruidPermissionError,
      what & " (simulated): java.lang.SecurityException: needs the CAMERA permission")

proc chooseSize*(sizes: openArray[(int, int)], maxEdge: int): (int, int) =
  ## The largest of `sizes` whose longer side is at most `maxEdge` (0: the
  ## largest), else the smallest -- how both sides pick a stream size.
  if sizes.len == 0: return (640, 480)
  var best = -1
  var smallest = 0
  for k, s in sizes:
    if s[0] * s[1] < sizes[smallest][0] * sizes[smallest][1]: smallest = k
    if maxEdge > 0 and max(s[0], s[1]) > maxEdge: continue
    if best < 0 or s[0] * s[1] > sizes[best][0] * sizes[best][1]: best = k
  sizes[if best >= 0: best else: smallest]

const simFrameSizes = [(1920, 1080), (1280, 720), (640, 480), (320, 240)]

proc testPattern(w, h: int, seq: int64): seq[byte] =
  ## Colour bars with a bright bar sweeping across: I420.
  result = newSeq[byte](w * h * 3 div 2)
  const bars = [(235, 128, 128), (210, 16, 146), (170, 166, 16), (145, 54, 34),
                (106, 202, 222), (81, 90, 240), (41, 240, 110), (16, 128, 128)]   # YUV
  let sweep = int(seq * 8 mod int64(w))
  let uOff = w * h
  let vOff = uOff + (w div 2) * (h div 2)
  for y in 0 ..< h:
    for x in 0 ..< w:
      let b = bars[x * bars.len div w]
      result[y * w + x] = byte(if abs(x - sweep) < 6: 255 else: b[0])
  for y in 0 ..< h div 2:
    for x in 0 ..< w div 2:
      let b = bars[(x * 2) * bars.len div w]
      result[uOff + y * (w div 2) + x] = byte(b[1])
      result[vOff + y * (w div 2) + x] = byte(b[2])

# ---- photos ----

proc takePhoto*(_: Camera, path: string, cameraId = "", maxEdge = 0): PhotoRequest =
  ## Takes a picture with `cameraId` ("": the first back camera) and writes it
  ## to `path` as JPEG, at most `maxEdge` pixels on its longer side (0: the
  ## camera's largest), turned upright for the camera's mounting. Returns at
  ## once; an `ekPhoto` event says when it is written (after auto-exposure
  ## settles: a second or so), or why not.
  inc nextRequest
  result = PhotoRequest(id: nextRequest)
  if druidStarted():
    callStatic(void, "CameraCapture", "takePhoto", cameraId, path, maxEdge, result.id)
    return
  discard simCameraFor(cameraId)
  requireCameraPermission("CameraCapture.takePhoto")
  try:
    writeFile(path, testCard)
    postLocal encodeEvent("photo", result.id, "ok", path)
  except IOError as e:
    postLocal encodeEvent("photo", result.id, "error", "java.io.FileNotFoundException: " & path & " (" & e.msg & ")")

# ---- frames ----

proc startFrames*(_: Camera, cameraId = "", width = 640, height = 480): FrameRequest =
  ## Streams frames from `cameraId` ("": the first back camera) at the
  ## largest size within `max(width, height)`. An `ekCamera` event says
  ## "started" with the size, or why it failed; `latestFrame` reads the
  ## newest. Stops a stream already running.
  inc nextRequest
  result = FrameRequest(id: nextRequest)
  if druidStarted():
    callStatic(void, "CameraCapture", "startFrames", cameraId, width, height, result.id)
    return
  simStream.on = false
  let cam = simCameraFor(cameraId)
  requireCameraPermission("CameraCapture.startFrames")
  let (w, h) = chooseSize(simFrameSizes, max(width, height))
  simStream = SimStream(on: true, width: w, height: h, rotation: cam.orientation, startedAt: epochTime())
  postLocal encodeEvent("camera", result.id, "started", $w & "x" & $h)

proc isStreaming*(_: Camera): bool =
  bridged(simStream.on): callStatic(bool, "CameraCapture", "isStreaming")

proc stopFrames*(_: Camera) =
  if druidStarted(): callStatic(void, "CameraCapture", "stopFrames")
  else: simStream.on = false

proc beInt(b: openArray[byte], at: int): int64 =
  for k in 0 ..< 4: result = (result shl 8) or int64(b[at + k])
  if result >= 0x8000_0000: result -= 0x1_0000_0000

proc latestFrame*(_: Camera, since = 0'i64): Option[CameraFrame] =
  ## The newest frame, if it is newer than frame `since` (pass the last one's
  ## `seq`): none when nothing new arrived, or nothing streams. Frames that
  ## came and went between two calls are skipped, not queued.
  if druidStarted():
    let raw = callStatic(seq[byte], "CameraCapture", "latestFrame", since)
    if raw.len < frameHeader: return none(CameraFrame)
    let s = (beInt(raw, 0) shl 32) or (beInt(raw, 4) and 0xFFFF_FFFF'i64)
    return some(CameraFrame(seq: s, width: int(beInt(raw, 8)), height: int(beInt(raw, 12)),
                            rotation: int(beInt(raw, 16)), i420: raw[frameHeader .. ^1]))
  if not simStream.on: return none(CameraFrame)
  let s = 1 + int64((epochTime() - simStream.startedAt) * 30)     # 30 frames a second
  if s <= since: return none(CameraFrame)
  some(CameraFrame(seq: s, width: simStream.width, height: simStream.height,
                   rotation: simStream.rotation, i420: testPattern(simStream.width, simStream.height, s)))

proc toRgba*(f: CameraFrame): seq[byte] =
  ## The frame as RGBA bytes (BT.601, video range), row by row.
  let w = f.width
  let h = f.height
  result = newSeq[byte](w * h * 4)
  if f.i420.len < w * h * 3 div 2: return
  let uOff = w * h
  let vOff = uOff + (w div 2) * (h div 2)
  for y in 0 ..< h:
    for x in 0 ..< w:
      let c = int(f.i420[y * w + x]) - 16
      let ci = (y div 2) * (w div 2) + (x div 2)
      let d = int(f.i420[uOff + ci]) - 128
      let e = int(f.i420[vOff + ci]) - 128
      let o = (y * w + x) * 4
      result[o] = byte(clamp((298 * c + 409 * e + 128) shr 8, 0, 255))
      result[o + 1] = byte(clamp((298 * c - 100 * d - 208 * e + 128) shr 8, 0, 255))
      result[o + 2] = byte(clamp((298 * c + 516 * d + 128) shr 8, 0, 255))
      result[o + 3] = 255
