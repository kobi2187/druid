## android/core.nim - Core Android Runtime API

import std/[options, tables, sets]

type
  AndroidError* = object of CatchableError
    kind*: AndroidErrorKind
    code*: int32
    
  AndroidErrorKind* = enum
    aekUnsupported = "Feature not supported"
    aekApiTooOld = "API level too old"
    aekNoPermission = "Permission denied"
    aekNotInitialized = "Runtime not initialized"
    aekJniError = "JNI error"
    aekRuntimeError = "Runtime error"

  AndroidRuntimeMode* = enum
    armAuto = "Automatic selection"
    armNdkOnly = "Pure NDK (maximum performance)"
    armSdkOnly = "Pure SDK (maximum features)"
    armHybrid = "Hybrid (best of both worlds)"

  AndroidFeature* = enum
    # Core features
    afLogging = "Logging system"
    afJNI = "Java Native Interface"
    
    # Audio features
    afAudio = "Basic audio playback"
    afLowLatencyAudio = "Professional low-latency audio"
    afAudioEffects = "Audio effects processing"
    afAudioRecording = "Audio recording"
    
    # Graphics features
    afGraphics = "Basic graphics"
    afOpenGLES2 = "OpenGL ES 2.0"
    afOpenGLES3 = "OpenGL ES 3.0+"
    afVulkan = "Vulkan high-performance graphics"
    
    # Input features
    afInput = "Touch and key input"
    afSensors = "Device sensors"
    afGameController = "Game controller support"
    
    # System features
    afNotifications = "System notifications"
    afVibration = "Device vibration"
    afCamera = "Camera access"
    afStorage = "File and data storage"
    afNetwork = "Network connectivity"
    afLocation = "Location services"
    
    # Advanced features
    afThermal = "Thermal monitoring"
    afPower = "Power management"
    afBluetooth = "Bluetooth connectivity"
    afNFC = "NFC communication"

  DeviceInfo* = object
    apiLevel*: int32
    manufacturer*: string
    model*: string
    buildVersion*: string
    screenDensity*: float32
    
  AndroidCapabilities* = object
    availableFeatures*: set[AndroidFeature]
    supportedApiLevel*: int32
    hasJavaContext*: bool
    deviceInfo*: DeviceInfo

# Global runtime management
proc initAndroid*(mode = armAuto): AndroidCapabilities =
  ## Initialize Android runtime with specified mode
  ## Returns detected capabilities and device info
  discard

proc shutdownAndroid*() =
  ## Clean shutdown of Android runtime
  discard

proc getAndroidCapabilities*(): AndroidCapabilities =
  ## Get current Android capabilities
  discard

proc hasFeature*(feature: AndroidFeature): bool =
  ## Check if a feature is available at runtime
  discard

proc requireFeature*(feature: AndroidFeature) =
  ## Require a feature or raise an exception
  if not hasFeature(feature):
    raise AndroidError(kind: aekUnsupported, msg: $feature & " not available")

# Device information
proc getDeviceInfo*(): DeviceInfo =
  ## Get detailed device information
  discard

proc getApiLevel*(): int32 =
  ## Get current Android API level
  discard

proc getManufacturer*(): string =
  ## Get device manufacturer (e.g., "Samsung", "Google")
  discard

proc getDeviceModel*(): string =
  ## Get device model (e.g., "Pixel 6", "Galaxy S21")
  discard

# Runtime configuration
proc setMinApiLevel*(level: int32) =
  ## Set minimum required API level for feature selection
  discard

proc preferNdkWhenPossible*() =
  ## Prefer NDK implementations for better performance
  discard

proc preferSdkWhenPossible*() =
  ## Prefer SDK implementations for richer features
  discard

# Feature tracking (compile-time)
template trackFeature*(feature: AndroidFeature) =
  ## Track feature usage for compile-time analysis
  static:
    usedFeatures*.incl(feature)

# Logging utilities
proc logDebug*(tag: string, message: string) =
  ## Log debug message
  trackFeature(afLogging)

proc logInfo*(tag: string, message: string) =
  ## Log info message
  trackFeature(afLogging)

proc logWarn*(tag: string, message: string) =
  ## Log warning message
  trackFeature(afLogging)

proc logError*(tag: string, message: string) =
  ## Log error message
  trackFeature(afLogging)

# Convenience logging
proc debug*(message: string) = logDebug("NimApp", message)
proc info*(message: string) = logInfo("NimApp", message)
proc warn*(message: string) = logWarn("NimApp", message)
proc error*(message: string) = logError("NimApp", message)