## The screen: size in pixels, density, refresh rate, rotation.
##
## ```nim
## let m = display().metrics
## echo m.widthPx, "x", m.heightPx, " at ", m.dpi, " dpi (", m.density, "x)"
## ```
##
## RUI scales its layout by `density` (Android's 1x is 160 dpi).

import bridge, simulator

type
  Display* = object
  DisplayMetrics* = object
    widthPx*, heightPx*: int    ## the whole display, in its current rotation
    density*: float32           ## 1.0 at 160 dpi, 2.625 at 420 dpi
    dpi*: int                   ## the density bucket (160, 240, 320, 420, 480, 640, ...)
    fontScale*: float32         ## the user's text size setting (1.0 default)
    refreshRate*: float32       ## Hz
    rotation*: int              ## 0, 90, 180, 270
    xdpi*, ydpi*: float32       ## physical dots per inch

  Orientation* = enum
    orUndefined = 0, orPortrait = 1, orLandscape = 2

proc display*(): Display = discard

proc metrics*(_: Display): DisplayMetrics =
  ## On the desktop: the simulated device's screen.
  if not druidStarted():
    let p = simulator().profile
    return DisplayMetrics(widthPx: p.widthPx, heightPx: p.heightPx, density: p.density, dpi: p.dpi,
                          fontScale: 1, refreshRate: p.refreshRate,
                          xdpi: p.dpi.float32, ydpi: p.dpi.float32)
  let v = callStatic(seq[float32], "Display", "metrics")
  if v.len < 9: raise newException(DruidError, "Display.metrics: " & $v.len & " values")
  DisplayMetrics(widthPx: int(v[0]), heightPx: int(v[1]), density: v[2], dpi: int(v[3]),
                 fontScale: v[4], refreshRate: v[5], rotation: int(v[6]), xdpi: v[7], ydpi: v[8])

proc orientation*(_: Display): Orientation =
  block:
    let p = simulator().profile
    let o = if druidStarted(): callStatic(int, "Display", "orientation")
            elif p.heightPx >= p.widthPx: 1 else: 2
    if o in 0..2: Orientation(o) else: orUndefined

proc dpToPx*(m: DisplayMetrics, dp: float): float = dp * float(m.density)
  ## Density-independent pixels to pixels.
proc pxToDp*(m: DisplayMetrics, px: float): float = px / float(m.density)
proc spToPx*(m: DisplayMetrics, sp: float): float = sp * float(m.density) * float(m.fontScale)
  ## Text size (sp: dp times the user's font scale) to pixels.
