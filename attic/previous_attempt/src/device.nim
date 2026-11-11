# device.nim - Device hardware information

import android, options

type
  DeviceType* = enum
    Phone, Tablet, TV, Watch, Desktop, Automotive, VR
    
  ScreenOrientation* = enum
    Portrait, Landscape, PortraitReverse, LandscapeReverse
    
  DeviceFeature* = enum
    Telephony, Bluetooth, WiFi, NFC, Camera, FingerprintSensor,
    GPS, Accelerometer, Gyroscope, Compass, StepCounter,
    TouchScreen, USBHost, WiFiDirect, Microphone, MultiTouch
    
  ProcessorInfo* = object
    cores*: int
    architecture*: string
    features*: seq[string]
    model*: string
    maxFreqKHz*: int
    
  MemoryInfo* = object
    totalRam*: int64  # bytes
    availableRam*: int64  # bytes
    lowMemory*: bool
    threshold*: int64  # bytes
    
  StorageInfo* = object
    totalInternalStorage*: int64  # bytes
    availableInternalStorage*: int64  # bytes
    totalExternalStorage*: Option[int64]  # bytes
    availableExternalStorage*: Option[int64]  # bytes
    
  BatteryInfo* = object
    level*: int  # 0-100
    isCharging*: bool
    technology*: Option[string]
    temperature*: float  # Celsius
    voltage*: float  # Volts
    
  CameraInfo* = object
    id*: string
    isFront*: bool
    flashSupported*: bool
    maxResolution*: tuple[width: int, height: int]
    focalLengths*: seq[float]
    
  SensorInfo* = object
    name*: string
    type*: int
    vendor*: string
    version*: int
    resolution*: float
    power*: float  # mA
    maxRange*: float
    
  DisplayInfo* = object
    width*: int  # pixels
    height*: int  # pixels
    densityDpi*: int
    density*: float
    refreshRate*: float
    orientation*: ScreenOrientation
    hdr*: bool
    
  DeviceManager* = ref object of Manager
    deviceInfo: Table[string, string]  # Cached device info

# Constructor
proc newDeviceManager*(context: Context): DeviceManager
  ## Creates a new device manager

# Device information
proc getDeviceType*(m: DeviceManager): DeviceType
  ## Gets device type
  ## API 26+: Uses Configuration and UiModeManager
  
proc getDeviceModel*(m: DeviceManager): string
  ## Gets device model
  ## API 26+: Uses Build.MODEL
  
proc getDeviceManufacturer*(m: DeviceManager): string
  ## Gets device manufacturer
  ## API 26+: Uses Build.MANUFACTURER
  
proc getDeviceBrand*(m: DeviceManager): string
  ## Gets device brand
  ## API 26+: Uses Build.BRAND
  
proc getAndroidVersion*(m: DeviceManager): tuple[release: string, sdkInt: int, codename: string]
  ## Gets Android version
  ## API 26+: Uses Build.VERSION

# Screen information
proc getDisplayInfo*(m: DeviceManager): DisplayInfo
  ## Gets display information
  ## API 26+: Uses DisplayMetrics and WindowManager
  
proc getOrientation*(m: DeviceManager): ScreenOrientation
  ## Gets current screen orientation
  ## API 26+: Uses Display.getRotation
  
proc isScreenOn*(m: DeviceManager): bool
  ## Checks if screen is on
  ## API 26+: Uses PowerManager.isInteractive

# Hardware information
proc getProcessorInfo*(m: DeviceManager): ProcessorInfo
  ## Gets processor information
  ## API 26+: Uses system files and Build.SUPPORTED_ABIS
  
proc getMemoryInfo*(m: DeviceManager): MemoryInfo
  ## Gets memory information
  ## API 26+: Uses ActivityManager.MemoryInfo
  
proc getStorageInfo*(m: DeviceManager): StorageInfo
  ## Gets storage information
  ## API 26+: Uses Environment and StatFs
  
proc getBatteryInfo*(m: DeviceManager): BatteryInfo
  ## Gets battery information
  ## API 26+: Uses BatteryManager and intent receiver
  
proc getCameraInfo*(m: DeviceManager): seq[CameraInfo]
  ## Gets camera information
  ## API 26+: Uses Camera2 API with CameraManager
  
proc getSensors*(m: DeviceManager): seq[SensorInfo]
  ## Gets available sensors
  ## API 26+: Uses SensorManager.getSensorList

# Feature detection
proc hasFeature*(m: DeviceManager, feature: DeviceFeature): bool
  ## Checks if device has specific feature
  ## API 26+: Uses PackageManager.hasSystemFeature
  
proc getFeatures*(m: DeviceManager): set[DeviceFeature]
  ## Gets all supported features
  ## API 26+: Uses PackageManager.hasSystemFeature for each feature

# System information
proc getBootTime*(m: DeviceManager): Time
  ## Gets device boot time
  ## API 26+: Uses SystemClock.elapsedRealtime
  
proc getUptime*(m: DeviceManager): Duration
  ## Gets device uptime
  ## API 26+: Uses SystemClock.elapsedRealtime
  
proc getSystemLocale*(m: DeviceManager): string
  ## Gets system locale
  ## API 26+: Uses Locale.getDefault