# battery.nim - Battery and power management

import android, options, times

type
  BatteryState* = enum
    ## Battery charging states
    Unknown, Charging, Discharging, Full, NotCharging
    
  ChargingType* = enum
    ## Power source types
    Unknown, AC, USB, Wireless, Dock
    
  BatteryInfo* = object
    ## Current battery status
    level*: int                # Current level (0-100)
    scale*: int                # Maximum level
    temperature*: float        # In Celsius
    voltage*: float            # In volts
    state*: BatteryState       # Charging state
    chargingType*: ChargingType # Power source
    health*: string            # Battery health status
    present*: bool             # Battery present flag
    timestamp*: Time           # Time of reading
    
  PowerMode* = enum
    ## System power modes
    Normal,        # Full performance
    PowerSaver,    # Battery saver mode
    LowPower,      # Aggressive battery saving
    DozeSuspended, # Doze mode suspended
    DozeIdle,      # Doze mode idle
    
  BatteryChangeListener* = proc(info: BatteryInfo)
  PowerModeListener* = proc(mode: PowerMode)
  
  BatteryOptimizationState* = enum
    Unknown, Optimized, NotOptimized, Exempted
    
  BatteryManager* = ref object of Manager
    batteryListeners: seq[BatteryChangeListener]
    powerModeListeners: seq[PowerModeListener]
    lastBatteryInfo: Option[BatteryInfo]
    systemService: pointer  # JNI reference

# Constructor
proc newBatteryManager*(context: Context): BatteryManager
  ## Creates a new battery manager

# Battery monitoring
proc getCurrentBatteryInfo*(m: BatteryManager): BatteryInfo
  ## Gets current battery information
  ## API 26+: Uses BatteryManager.getIntProperty
  ## Pre-API 26: Uses sticky broadcast intent values

proc registerBatteryListener*(m: BatteryManager, listener: BatteryChangeListener)
  ## Registers for battery updates
  ## Combines both broadcast receiver and ContentObserver approaches

proc unregisterBatteryListener*(m: BatteryManager, listener: BatteryChangeListener)
  ## Unregisters battery listener

# Power management
proc getCurrentPowerMode*(m: BatteryManager): PowerMode
  ## Gets current system power mode
  ## API 28+: Uses PowerManager.getLocationPowerSaveMode
  ## API 26-27: Uses PowerManager.isPowerSaveMode
  ## Pre-API 26: Uses legacy PowerManager.isPowerSaveMode

proc registerPowerModeListener*(m: BatteryManager, listener: PowerModeListener)
  ## Registers for power mode changes

proc unregisterPowerModeListener*(m: BatteryManager, listener: PowerModeListener)
  ## Unregisters power mode listener

# Battery optimization
proc getBatteryOptimizationState*(m: BatteryManager): BatteryOptimizationState
  ## Gets current battery optimization state for app
  ## API 23+: Uses PowerManager.isIgnoringBatteryOptimizations
  ## Not available on earlier API levels

proc requestDisableBatteryOptimization*(m: BatteryManager): bool
  ## Requests to disable battery optimization for app
  ## API 23+: Opens system settings with correct intent
  ## API 31+: May be restricted by system

# Power consumption
proc estimatePowerConsumption*(m: BatteryManager, usageDurationMinutes: int): float
  ## Estimates power consumption in mAh for the app
  ## API 28+: Uses BatteryStatsManager
  ## API 26-27: Uses approximation based on usage stats
  ## Pre-API 26: Returns rough estimate only