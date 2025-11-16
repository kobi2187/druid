## SDK Power Manager - Power and battery management
##
## Uses Android SDK PowerManager and BatteryManager APIs (Java)
##
## Provides:
## - Battery status and level monitoring
## - Wake lock management (keep device awake)
## - Battery optimization detection/request
## - Doze mode detection (API 23+)
## - Thermal status monitoring (API 29+)
## - Charging status and health

import ../../../core
import ../../../art  # For API level detection
import jnim
import options
import tables

# jnimport:
#   import android.content.Context
#   import android.content.IntentFilter
#   import android.content.Intent
#   import android.os.PowerManager as JPM
#   import android.os.BatteryManager as JBM
#   import android.os.Build
# 
type
  WakeLockLevel* = enum
    ## Wake lock levels - what components to keep awake
    wlPartial = 1         ## CPU stays on, screen can turn off
    wlScreenDim = 6       ## Screen stays dim
    wlScreenBright = 10   ## Screen stays bright
    wlFull = 26           ## Screen and keyboard fully on (deprecated API 17+, but still works)

  BatteryHealth* = enum
    bhUnknown = 1
    bhGood = 2
    bhOverheat = 3
    bhDead = 4
    bhOverVoltage = 5
    bhUnspecifiedFailure = 6
    bhCold = 7

  BatteryStatus* = enum
    bsUnknown = 1
    bsCharging = 2
    bsDischarging = 3
    bsNotCharging = 4
    bsFull = 5

  ChargePlug* = enum
    cpNone = 0
    cpAc = 1
    cpUsb = 2
    cpWireless = 4

  ThermalStatus* = enum
    ## API 29+
    tsNone = 0           ## No thermal throttling
    tsLight = 1          ## Light throttling
    tsModerate = 2       ## Moderate throttling
    tsSevere = 3         ## Severe throttling - reduce performance
    tsCritical = 4       ## Critical - shut down heavy operations
    tsEmergency = 5      ## Emergency - system may shut down
    tsShutdown = 6       ## Shutdown imminent

  BatteryInfo* = object
    ## Current battery state
    level*: int                    ## Battery percentage (0-100)
    temperature*: float            ## Temperature in Celsius
    voltage*: int                  ## Voltage in millivolts
    health*: BatteryHealth
    status*: BatteryStatus
    chargePlug*: ChargePlug
    isCharging*: bool
    isPresent*: bool

  WakeLock* = ref object
    ## Wake lock handle
    javaWakeLock: jobject
    id: string
    level: WakeLockLevel
    active: bool

  SdkPowerManager* = ref object
    context: jobject
    powerManager: jobject
    batteryManager: jobject
    apiLevel: int
    activeLocks: Table[string, WakeLock]

proc init*(_: typedesc[SdkPowerManager]): SdkPowerManager =
  ## Initialize SdkPowerManager
  result = SdkPowerManager()
  result.context = getContext()
  result.apiLevel = detectApiLevel()
  result.activeLocks = initTable[string, WakeLock]()

  # Get PowerManager system service
  let powerServiceName = "power".toJString
  result.powerManager = result.context.getSystemService(powerServiceName)

  # Get BatteryManager (API 21+)
  if result.apiLevel >= 21:
    let batteryServiceName = "batterymanager".toJString
    result.batteryManager = result.context.getSystemService(batteryServiceName)

proc getBatteryInfo*(pm: SdkPowerManager): BatteryInfo =
  ## Get comprehensive battery information
  ##
  ## Returns:
  ##   BatteryInfo with current battery state
  ##
  ## Example:
  ##   let battery = power().getBatteryInfo()
  ##   echo "Battery: ", battery.level, "%"
  ##   if battery.isCharging:
  ##     echo "Charging via ", battery.chargePlug

  result = BatteryInfo()

  # Get battery status via Intent (works on all API levels)
  let intentFilter = IntentFilter.new("android.intent.action.BATTERY_CHANGED".toJString)
  let batteryStatus = pm.context.call("registerReceiver",
    jobject(nil),  # null receiver - just get current state
    intentFilter
  )

  if batteryStatus.isNil:
    return  # Battery info unavailable

  # Battery level (0-100)
  let level = batteryStatus.call("getIntExtra",
    "level".toJString, (-1).jint).intVal
  let scale = batteryStatus.call("getIntExtra",
    "scale".toJString, 100.jint).intVal

  if level >= 0 and scale > 0:
    result.level = (level * 100) div scale
  else:
    result.level = 0

  # Temperature (tenths of degrees Celsius)
  let temp = batteryStatus.call("getIntExtra",
    "temperature".toJString, 0.jint).intVal
  result.temperature = temp.float / 10.0

  # Voltage (millivolts)
  result.voltage = batteryStatus.call("getIntExtra",
    "voltage".toJString, 0.jint).intVal

  # Health
  let health = batteryStatus.call("getIntExtra",
    "health".toJString, 1.jint).intVal
  result.health = BatteryHealth(health)

  # Status (charging, discharging, etc.)
  let status = batteryStatus.call("getIntExtra",
    "status".toJString, 1.jint).intVal
  result.status = BatteryStatus(status)
  result.isCharging = (status == 2 or status == 5)  # CHARGING or FULL

  # Charge plug type
  let plugged = batteryStatus.call("getIntExtra",
    "plugged".toJString, 0.jint).intVal
  result.chargePlug = ChargePlug(plugged)

  # Battery present
  result.isPresent = batteryStatus.call("getBooleanExtra",
    "present".toJString, false.jboolean).boolVal

proc getBatteryLevel*(pm: SdkPowerManager): int =
  ## Get current battery percentage (0-100)
  ##
  ## Returns:
  ##   Battery level as percentage
  ##
  ## Example:
  ##   let level = power().getBatteryLevel()
  ##   if level < 20:
  ##     showLowBatteryWarning()
  return pm.getBatteryInfo().level

proc isCharging*(pm: SdkPowerManager): bool =
  ## Check if device is currently charging
  ##
  ## Example:
  ##   if power().isCharging():
  ##     startHeavyProcessing()
  return pm.getBatteryInfo().isCharging

proc acquireWakeLock*(pm: SdkPowerManager, id: string, level: WakeLockLevel = wlPartial) =
  ## Acquire a wake lock to keep device awake
  ##
  ## IMPORTANT: Always pair with releaseWakeLock() when done!
  ## Holding wake locks drains battery significantly.
  ##
  ## Args:
  ##   id: Unique identifier for this wake lock
  ##   level: Wake lock level (what to keep awake)
  ##
  ## Example:
  ##   power().acquireWakeLock("download", wlPartial)
  ##   try:
  ##     downloadLargeFile()
  ##   finally:
  ##     power().releaseWakeLock("download")

  # Release existing lock with same ID if present
  if pm.activeLocks.hasKey(id):
    pm.releaseWakeLock(id)

  # Create new wake lock
  let tag = id.toJString
  let javaLock = pm.powerManager.call("newWakeLock",
    level.int.jint,
    tag
  )

  # Acquire the lock
  javaLock.call("acquire")

  # Store lock reference
  let lock = WakeLock(
    javaWakeLock: javaLock,
    id: id,
    level: level,
    active: true
  )
  pm.activeLocks[id] = lock

proc releaseWakeLock*(pm: SdkPowerManager, id: string) =
  ## Release a previously acquired wake lock
  ##
  ## Safe to call even if lock wasn't acquired
  ##
  ## Args:
  ##   id: ID of wake lock to release
  ##
  ## Example:
  ##   power().releaseWakeLock("download")

  if not pm.activeLocks.hasKey(id):
    return  # Lock not found, nothing to do

  let lock = pm.activeLocks[id]

  if lock.active and not lock.javaWakeLock.isNil:
    # Check if still held before releasing
    let isHeld = lock.javaWakeLock.call("isHeld").boolVal
    if isHeld:
      lock.javaWakeLock.call("release")
    lock.active = false

  pm.activeLocks.del(id)

proc isWakeLockHeld*(pm: SdkPowerManager, id: string): bool =
  ## Check if a wake lock is currently held
  ##
  ## Args:
  ##   id: ID of wake lock to check
  ##
  ## Returns:
  ##   true if lock is active, false otherwise
  if not pm.activeLocks.hasKey(id):
    return false

  let lock = pm.activeLocks[id]
  if lock.active and not lock.javaWakeLock.isNil:
    return lock.javaWakeLock.call("isHeld").boolVal

  return false

proc isIgnoringBatteryOptimizations*(pm: SdkPowerManager): bool =
  ## Check if app is ignoring battery optimizations
  ##
  ## Battery optimizations can kill background processes.
  ## Some apps (e.g., alarm clocks, fitness trackers) need to be exempt.
  ##
  ## API 23+ only, returns false on older versions
  ##
  ## Returns:
  ##   true if app is exempt from battery optimizations
  ##
  ## Example:
  ##   if not power().isIgnoringBatteryOptimizations():
  ##     askUserToDisableOptimizations()

  if pm.apiLevel < 23:
    return false  # Not available before API 23

  let packageName = pm.context.call("getPackageName")
  return pm.powerManager.call("isIgnoringBatteryOptimizations", packageName).boolVal

proc isDeviceIdleMode*(pm: SdkPowerManager): bool =
  ## Check if device is in Doze mode (idle)
  ##
  ## Doze mode severely restricts app activity to save battery.
  ## API 23+ only, returns false on older versions.
  ##
  ## Returns:
  ##   true if device is in Doze mode
  ##
  ## Example:
  ##   if power().isDeviceIdleMode():
  ##     pauseBackgroundSync()

  if pm.apiLevel < 23:
    return false

  return pm.powerManager.call("isDeviceIdleMode").boolVal

proc isInteractive*(pm: SdkPowerManager): bool =
  ## Check if device screen is on and interactive
  ##
  ## Returns:
  ##   true if screen is on, false if off
  ##
  ## Example:
  ##   if not power().isInteractive():
  ##     pauseAnimations()

  if pm.apiLevel >= 20:
    return pm.powerManager.call("isInteractive").boolVal
  else:
    # Legacy API < 20
    return pm.powerManager.call("isScreenOn").boolVal

proc isPowerSaveMode*(pm: SdkPowerManager): bool =
  ## Check if device is in power save mode (battery saver)
  ##
  ## API 21+ only, returns false on older versions
  ##
  ## Returns:
  ##   true if power save mode is enabled
  ##
  ## Example:
  ##   if power().isPowerSaveMode():
  ##     reduceBackgroundActivity()

  if pm.apiLevel < 21:
    return false

  return pm.powerManager.call("isPowerSaveMode").boolVal

proc getThermalStatus*(pm: SdkPowerManager): ThermalStatus =
  ## Get current thermal throttling status
  ##
  ## API 29+ only, returns tsNone on older versions
  ##
  ## Returns:
  ##   Current thermal status
  ##
  ## Example:
  ##   let thermal = power().getThermalStatus()
  ##   if thermal >= tsSevere:
  ##     stopHeavyProcessing()

  if pm.apiLevel < 29:
    return tsNone

  let status = pm.powerManager.call("getCurrentThermalStatus").intVal
  return ThermalStatus(status)

proc reboot*(pm: SdkPowerManager) =
  ## Reboot the device
  ##
  ## REQUIRES android.permission.REBOOT permission!
  ## Most apps won't have this permission (system apps only)
  ##
  ## Example:
  ##   # Only works for system apps
  ##   power().reboot()

  pm.powerManager.call("reboot", jobject(nil))

# Lazy accessor for AndroidRuntime
proc sdkPowerManager*(runtime: AndroidRuntime): SdkPowerManager =
  ## Get or create SdkPowerManager instance
  if runtime.sdkPowerManager.isNone:
    runtime.sdkPowerManager = some(SdkPowerManager.init())
  return runtime.sdkPowerManager.get()

# Convenience global accessor
proc power*(): SdkPowerManager =
  ## Global accessor for SdkPowerManager
  ## Requires AndroidRuntime to be initialized
  ##
  ## Example:
  ##   let battery = power().getBatteryInfo()
  ##   echo "Battery: ", battery.level, "%"
  ##
  ##   # Wake lock for long operation
  ##   power().acquireWakeLock("sync", wlPartial)
  ##   try:
  ##     syncData()
  ##   finally:
  ##     power().releaseWakeLock("sync")
  ##
  ##   # Check device state
  ##   if power().isPowerSaveMode():
  ##     reduceBatteryUsage()
  return runtime().sdkPowerManager()
