import jnim

jnimport:
  import android.os.Build
  import android.os.Build$VERSION

type
  AndroidDeviceInfo* = object
    apiLevel*: int
    hasLowLatencyAudio*: bool
    hasAmplitudeControl*: bool
    hasCamera2Api*: bool
    hasGooglePlayServices*: bool
    manufacturer*: string
    model*: string

proc detectApiLevel*(): int =
  ## Get the Android API level
  ## Example: 21 (Lollipop), 26 (Oreo), 30 (Android 11), 34 (Android 14)
  ##
  ## This uses Build.VERSION.SDK_INT
  return Build$VERSION.SDK_INT.int

proc detectDeviceCapabilities*(): AndroidDeviceInfo =
  ## Detect device capabilities and hardware features
  result.apiLevel = detectApiLevel()

  # Camera2 API available on API 21+
  result.hasCamera2Api = result.apiLevel >= 21

  # TODO: Implement other capability detection
  # - hasLowLatencyAudio: Check AudioManager.PROPERTY_OUTPUT_FRAMES_PER_BUFFER
  # - hasAmplitudeControl: Check Vibrator.hasAmplitudeControl()
  # - hasGooglePlayServices: Try to load GoogleApiAvailability
  # - manufacturer/model: Build.MANUFACTURER, Build.MODEL

# Compile-time feature tracking
# Based on the used features, we can:
# - Create only needed managers
# - Generate AndroidManifest.xml with required permissions
# - Decide at compile time whether to use NDK or SDK for various services
# User can choose useNdk = true, or we auto-choose (e.g., if lowLatency is needed)

# TODO: Implement compile-time feature tracking
# template trackPermission
# template trackFeature
