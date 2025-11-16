## SDK Display Manager - Screen and display information
##
## Uses Android SDK Display and DisplayMetrics APIs (Java)
##
## Provides:
## - Screen dimensions (width, height in pixels and dp)
## - Screen density (DPI, density multiplier)
## - Screen rotation/orientation
## - Screen refresh rate
## - Display metrics and calculations
##
## Useful for:
## - Responsive layouts
## - Density-independent sizing
## - Detecting screen rotation
## - Optimizing graphics for screen

import ../../../core
import ../../../art  # For API level detection
import jnim
import options

# jnimport:
#   import android.content.Context
#   import android.view.WindowManager
#   import android.view.Display
#   import android.util.DisplayMetrics
#   import android.content.res.Resources
# 
type
  ScreenOrientation* = enum
    ## Screen orientation
    soPortrait = 0        ## Portrait orientation (vertical)
    soLandscape = 1       ## Landscape orientation (horizontal)
    soReversePortrait = 2 ## Reverse portrait (upside down)
    soReverseLandscape = 3 ## Reverse landscape

  ScreenRotation* = enum
    ## Screen rotation in degrees
    srRotation0 = 0       ## 0 degrees (normal)
    srRotation90 = 1      ## 90 degrees
    srRotation180 = 2     ## 180 degrees
    srRotation270 = 3     ## 270 degrees

  DisplayDensity* = enum
    ## Density buckets
    ddLdpi = 120          ## Low density (~120 dpi)
    ddMdpi = 160          ## Medium density (~160 dpi, baseline)
    ddHdpi = 240          ## High density (~240 dpi)
    ddXhdpi = 320         ## Extra high density (~320 dpi)
    ddXxhdpi = 480        ## Extra extra high density (~480 dpi)
    ddXxxhdpi = 640       ## Extra extra extra high density (~640 dpi)

  ScreenInfo* = object
    ## Complete screen information
    widthPixels*: int       ## Width in pixels
    heightPixels*: int      ## Height in pixels
    widthDp*: float         ## Width in density-independent pixels
    heightDp*: float        ## Height in density-independent pixels
    densityDpi*: int        ## Density in DPI
    density*: float         ## Density multiplier (1.0 = mdpi)
    scaledDensity*: float   ## Scaled density for fonts
    xdpi*: float            ## Exact physical pixels per inch (X axis)
    ydpi*: float            ## Exact physical pixels per inch (Y axis)
    rotation*: ScreenRotation
    refreshRate*: float     ## Display refresh rate in Hz

  SdkDisplayManager* = ref object
    context: jobject
    windowManager: jobject
    display: jobject
    displayMetrics: jobject
    apiLevel: int

proc init*(_: typedesc[SdkDisplayManager]): SdkDisplayManager =
  ## Initialize SdkDisplayManager
  result = SdkDisplayManager()
  result.context = getContext()
  result.apiLevel = detectApiLevel()

  # Get WindowManager system service
  let serviceName = "window".toJString
  result.windowManager = result.context.getSystemService(serviceName)

  # Get default display
  result.display = result.windowManager.call("getDefaultDisplay")

  # Create DisplayMetrics
  result.displayMetrics = DisplayMetrics.new()
  result.display.call("getMetrics", result.displayMetrics)

proc getScreenInfo*(dm: SdkDisplayManager): ScreenInfo =
  ## Get complete screen information
  ##
  ## Returns:
  ##   ScreenInfo with all display metrics
  ##
  ## Example:
  ##   let screen = display().getScreenInfo()
  ##   echo "Screen: ", screen.widthPixels, "x", screen.heightPixels
  ##   echo "Density: ", screen.densityDpi, " dpi"

  # Refresh metrics
  dm.display.call("getMetrics", dm.displayMetrics)

  result.widthPixels = dm.displayMetrics.call("widthPixels").intVal
  result.heightPixels = dm.displayMetrics.call("heightPixels").intVal
  result.densityDpi = dm.displayMetrics.call("densityDpi").intVal
  result.density = dm.displayMetrics.call("density").floatVal
  result.scaledDensity = dm.displayMetrics.call("scaledDensity").floatVal
  result.xdpi = dm.displayMetrics.call("xdpi").floatVal
  result.ydpi = dm.displayMetrics.call("ydpi").floatVal

  # Calculate dp dimensions
  result.widthDp = result.widthPixels.float / result.density
  result.heightDp = result.heightPixels.float / result.density

  # Get rotation
  let rotationInt = dm.display.call("getRotation").intVal
  result.rotation = ScreenRotation(rotationInt)

  # Get refresh rate
  result.refreshRate = dm.display.call("getRefreshRate").floatVal

proc getWidthPixels*(dm: SdkDisplayManager): int =
  ## Get screen width in pixels
  ##
  ## Returns:
  ##   Screen width in pixels
  ##
  ## Example:
  ##   let width = display().getWidthPixels()

  dm.display.call("getMetrics", dm.displayMetrics)
  return dm.displayMetrics.call("widthPixels").intVal

proc getHeightPixels*(dm: SdkDisplayManager): int =
  ## Get screen height in pixels
  ##
  ## Returns:
  ##   Screen height in pixels
  ##
  ## Example:
  ##   let height = display().getHeightPixels()

  dm.display.call("getMetrics", dm.displayMetrics)
  return dm.displayMetrics.call("heightPixels").intVal

proc getDensity*(dm: SdkDisplayManager): float =
  ## Get screen density multiplier
  ##
  ## Density multiplier relative to mdpi (160dpi):
  ## - 0.75 = ldpi
  ## - 1.0 = mdpi
  ## - 1.5 = hdpi
  ## - 2.0 = xhdpi
  ## - 3.0 = xxhdpi
  ## - 4.0 = xxxhdpi
  ##
  ## Returns:
  ##   Density multiplier
  ##
  ## Example:
  ##   let density = display().getDensity()
  ##   let dpSize = 48  # 48 dp
  ##   let pxSize = (dpSize.float * density).int  # Convert to pixels

  dm.display.call("getMetrics", dm.displayMetrics)
  return dm.displayMetrics.call("density").floatVal

proc getDensityDpi*(dm: SdkDisplayManager): int =
  ## Get screen density in DPI
  ##
  ## Returns:
  ##   Density in dots per inch
  ##
  ## Example:
  ##   let dpi = display().getDensityDpi()
  ##   echo "Screen DPI: ", dpi

  dm.display.call("getMetrics", dm.displayMetrics)
  return dm.displayMetrics.call("densityDpi").intVal

proc getRotation*(dm: SdkDisplayManager): ScreenRotation =
  ## Get current screen rotation
  ##
  ## Returns:
  ##   Current rotation
  ##
  ## Example:
  ##   case display().getRotation():
  ##   of srRotation0:
  ##     echo "Normal orientation"
  ##   of srRotation90:
  ##     echo "Rotated 90 degrees"
  ##   else:
  ##     echo "Other rotation"

  let rotationInt = dm.display.call("getRotation").intVal
  return ScreenRotation(rotationInt)

proc getRefreshRate*(dm: SdkDisplayManager): float =
  ## Get display refresh rate in Hz
  ##
  ## Returns:
  ##   Refresh rate (typically 60.0 Hz, or 90/120/144 on high-refresh displays)
  ##
  ## Example:
  ##   let refreshRate = display().getRefreshRate()
  ##   echo "Display refresh rate: ", refreshRate, " Hz"

  return dm.display.call("getRefreshRate").floatVal

proc dpToPx*(dm: SdkDisplayManager, dp: float): int =
  ## Convert density-independent pixels (dp) to pixels
  ##
  ## Args:
  ##   dp: Size in density-independent pixels
  ##
  ## Returns:
  ##   Size in pixels for current screen density
  ##
  ## Example:
  ##   let buttonSizePx = display().dpToPx(48.0)  # 48dp button

  let density = dm.getDensity()
  return (dp * density + 0.5).int  # +0.5 for rounding

proc pxToDp*(dm: SdkDisplayManager, px: int): float =
  ## Convert pixels to density-independent pixels (dp)
  ##
  ## Args:
  ##   px: Size in pixels
  ##
  ## Returns:
  ##   Size in density-independent pixels
  ##
  ## Example:
  ##   let sizeDp = display().pxToDp(192)

  let density = dm.getDensity()
  return px.float / density

proc spToPx*(dm: SdkDisplayManager, sp: float): int =
  ## Convert scale-independent pixels (sp) to pixels
  ##
  ## Used for font sizes, respects user's font size preference
  ##
  ## Args:
  ##   sp: Size in scale-independent pixels
  ##
  ## Returns:
  ##   Size in pixels for current screen density and font scale
  ##
  ## Example:
  ##   let fontSizePx = display().spToPx(14.0)  # 14sp text

  dm.display.call("getMetrics", dm.displayMetrics)
  let scaledDensity = dm.displayMetrics.call("scaledDensity").floatVal
  return (sp * scaledDensity + 0.5).int

proc isTablet*(dm: SdkDisplayManager): bool =
  ## Check if device is likely a tablet (heuristic based on screen size)
  ##
  ## Uses smallest screen dimension in dp. Tablets typically > 600dp.
  ##
  ## Returns:
  ##   true if device appears to be a tablet
  ##
  ## Example:
  ##   if display().isTablet():
  ##     showTabletLayout()
  ##   else:
  ##     showPhoneLayout()

  let info = dm.getScreenInfo()
  let smallestDp = min(info.widthDp, info.heightDp)
  return smallestDp >= 600.0

proc isPortrait*(dm: SdkDisplayManager): bool =
  ## Check if screen is in portrait orientation
  ##
  ## Returns:
  ##   true if height > width
  ##
  ## Example:
  ##   if display().isPortrait():
  ##     echo "Portrait mode"

  let info = dm.getScreenInfo()
  return info.heightPixels > info.widthPixels

proc isLandscape*(dm: SdkDisplayManager): bool =
  ## Check if screen is in landscape orientation
  ##
  ## Returns:
  ##   true if width > height
  ##
  ## Example:
  ##   if display().isLandscape():
  ##     echo "Landscape mode"

  let info = dm.getScreenInfo()
  return info.widthPixels > info.heightPixels

# Lazy accessor for AndroidRuntime
proc sdkDisplayManager*(runtime: AndroidRuntime): SdkDisplayManager =
  ## Get or create SdkDisplayManager instance
  if runtime.sdkDisplayManager.isNone:
    runtime.sdkDisplayManager = some(SdkDisplayManager.init())
  return runtime.sdkDisplayManager.get()

# Convenience global accessor
proc display*(): SdkDisplayManager =
  ## Global accessor for SdkDisplayManager
  ## Requires AndroidRuntime to be initialized
  ##
  ## Example:
  ##   # Get screen info
  ##   let screen = display().getScreenInfo()
  ##   echo "Screen: ", screen.widthPixels, "x", screen.heightPixels
  ##   echo "Density: ", screen.densityDpi, " dpi (", screen.density, "x)"
  ##   echo "Refresh rate: ", screen.refreshRate, " Hz"
  ##
  ##   # Convert units
  ##   let buttonSize = display().dpToPx(48.0)  # 48dp → pixels
  ##   let fontSize = display().spToPx(14.0)    # 14sp → pixels
  ##
  ##   # Check orientation
  ##   if display().isPortrait():
  ##     echo "Portrait mode"
  ##
  ##   # Check device type
  ##   if display().isTablet():
  ##     showTabletUI()
  return runtime().sdkDisplayManager()
