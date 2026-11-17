## A live camera preview drawn by the app itself: Druid streams the frames,
## raylib (naylib) shows them as a texture. The same code runs on the desktop,
## where Druid's simulated camera streams a moving test pattern.
##
##   desktop:  nim c -r --path:src examples/camera/camera_preview.nim
##   Android:  build it as an RUI/raylib app's libmain.so (see templates/rui-app)
##
## The steps an app needs:
##   1. ask for CAMERA, and start the frames once it is granted;
##   2. each frame, take the newest camera frame (if there is a new one) and
##      upload it into a texture -- RGBA from `toRgba`;
##   3. draw it turned by `rotation` (the sensor is mounted sideways on phones).

import std/[options, os]
import druid
import raylib

type Preview = object
  texture: Texture2D
  width, height, rotation: int
  lastSeq: int64
  hasTexture: bool

proc upload(p: var Preview, f: CameraFrame) =
  ## The frame into the texture (made, or made again, at the frame's size).
  if not p.hasTexture or p.width != f.width or p.height != f.height:
    p.texture = loadTextureFromImage(genImageColor(int32(f.width), int32(f.height), Black))
    p.width = f.width
    p.height = f.height
    p.hasTexture = true
  let rgba = f.toRgba
  # Color is r, g, b, a bytes: the RGBA buffer as it is.
  updateTexture(p.texture, cast[ptr UncheckedArray[Color]](rgba[0].unsafeAddr).toOpenArray(0, f.width * f.height - 1))
  p.rotation = f.rotation
  p.lastSeq = f.seq

proc draw(p: Preview, screenW, screenH: int) =
  ## Upright, as large as fits, centred.
  let turned = p.rotation mod 180 != 0
  let (w, h) = if turned: (float32(p.height), float32(p.width)) else: (float32(p.width), float32(p.height))
  let scale = min(float32(screenW) / w, float32(screenH) / h)
  let dest = Rectangle(x: float32(screenW) / 2, y: float32(screenH) / 2,
                       width: float32(p.width) * scale, height: float32(p.height) * scale)
  drawTexture(p.texture, Rectangle(x: 0, y: 0, width: float32(p.width), height: float32(p.height)), dest,
              Vector2(x: dest.width / 2, y: dest.height / 2), float32(p.rotation), White)

proc run() =
  var preview: Preview      # its texture is freed when run returns: before the window closes
  var status = "asking for the camera"
  let ask = permissions().request(apCamera)
  var streaming = false
  # CAMERA_PREVIEW_SHOT=file.png: save one screen once frames show, and quit (a test's check).
  let shot = getEnv("CAMERA_PREVIEW_SHOT")
  var shown = 0
  while not windowShouldClose():
    for ev in pollEvents():
      case ev.kind
      of ekPermission:
        if ev.requestId == ask.id:
          if permissions().status(ask) == psGranted:
            discard camera().startFrames(width = 640, height = 480)
            status = "starting the camera"
          else: status = "the camera was not allowed"
      of ekCamera:
        streaming = ev.frames.started
        status = if streaming: $ev.frames.width & " x " & $ev.frames.height else: "camera: " & ev.frames.error
      else: discard
    if streaming:
      let f = camera().latestFrame(since = preview.lastSeq)
      if f.isSome: preview.upload(f.get)
    beginDrawing()
    clearBackground(Black)
    if preview.hasTexture: preview.draw(getScreenWidth(), getScreenHeight())
    drawText(status, 12, 12, 20, RayWhite)
    endDrawing()
    if shot.len > 0 and preview.hasTexture:
      inc shown
      if shown == 10:
        takeScreenshot(shot)
        break
  camera().stopFrames()

proc main() =
  initWindow(480, 800, "Druid camera preview")
  setTargetFPS(60)
  run()
  closeWindow()

when isMainModule:
  main()
