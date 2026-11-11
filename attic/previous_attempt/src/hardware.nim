# hardware.nim - Hardware information and sensors

import android, options

type
  CpuInfo* = object
    cores*: int
    architecture*: string
    features*: seq[string]
    minFreqKHz*: int
    maxFreqKHz*: int
    
  MemoryInfo* = object
    totalMem*: int64
    availMem*: int64
    threshold*: int64
    lowMemory*: bool
    
  StorageInfo* = object
    internalTotal*: int64
    internalFree*: int64
    externalTotal*: Option[int64]
    externalFree*: Option[int64]
    
  ThermalStatus* = enum
    None, Light, Moderate, Severe, Critical, Emergency, Shutdown
    
  BatteryStatus* = enum
    Unknown, Charging, Discharging, Full, NotCharging
    
  ThermalStatusListener* = proc(status: ThermalStatus)
    
  HardwareManager* = ref object of Manager
    cpuInfo: Option[CpuInfo]
    memoryInfo: Option[MemoryInfo]
    storageInfo: Option[StorageInfo]
    thermalListeners: seq[ThermalStatusListener]
    activityManager: pointer  # JNI reference

# Constructor
proc newHardwareManager*(context: Context): HardwareManager
  ## Creates a new hardware manager

# CPU information
proc getCpuInfo*(m: HardwareManager): CpuInfo
  ## Gets CPU information
  ## Uses /proc/cpuinfo and sysfs
  
proc getCpuUsage*(m: HardwareManager): float
  ## Gets CPU usage percentage
  ## Uses /proc/stat for calculation
  
proc getProcessCpuUsage*(m: HardwareManager, pid: int = 0): float
  ## Gets process CPU usage percentage
  ## Default pid 0 means current process
  ## Uses /proc/[pid]/stat

# Memory information
proc getMemoryInfo*(m: HardwareManager): MemoryInfo
  ## Gets memory information
  ## API 26+: Uses ActivityManager.MemoryInfo
  
proc getProcessMemoryInfo*(m: HardwareManager, pid: int = 0): int64
  ## Gets process memory usage
  ## Default pid 0 means current process
  ## API 26+: Uses ActivityManager.getProcessMemoryInfo

# Storage information
proc getStorageInfo*(m: HardwareManager): StorageInfo
  ## Gets storage information
  ## API 26+: Uses Environment and StatFs
  
proc getStoragePath*(m: HardwareManager, isExternal: bool): Option[string]
  ## Gets storage directory path
  ## API 29+: Restricted access to external storage
  ## Requires appropriate permissions

# Thermal and power management
proc getThermalStatus*(m: HardwareManager): ThermalStatus
  ## Gets device thermal status
  ## API 29+: Uses PowerManager.getCurrentThermalStatus
  ## Pre-API 29: Uses approximation from CPU temperature
  
proc registerThermalStatusListener*(m: HardwareManager, listener: ThermalStatusListener)
  ## Registers for thermal status changes
  ## API 29+: Uses PowerManager.OnThermalStatusChangedListener
  
proc unregisterThermalStatusListener*(m: HardwareManager, listener: ThermalStatusListener)
  ## Unregisters thermal status listener
  
proc getBatteryTemperature*(m: HardwareManager): Option[float]
  ## Gets battery temperature in Celsius
  ## Uses BatteryManager or system files