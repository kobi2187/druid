## SensorManager - Access to Device Sensors
##
## Provides access to Android's sensor APIs:
## - Accelerometer (device motion)
## - Gyroscope (rotation)
## - Magnetometer (compass)
## - Light sensor
## - Proximity sensor
## - Temperature, pressure, humidity
## - And many more...
##
## Android Background:
##   - SensorManager provides access to all device sensors
##   - Sensors deliver events via SensorEventListener
##   - Sampling rates: SENSOR_DELAY_FASTEST/GAME/UI/NORMAL
##   - Not all devices have all sensors
##
## Druid's Approach:
##   - Type-safe sensor types and data structures
##   - Easy capability detection
##   - Callback-based event delivery
##   - Automatic rate limiting
##
## Usage:
##   var sm = sensorManager()
##
##   # Check availability
##   if sm.hasAccelerometer():
##     echo "Accelerometer available"
##
##   # Register listener
##   sm.onAccelerometer(proc(x, y, z: float32) =
##     echo "Acceleration: x=", x, " y=", y, " z=", z
##   )
##
##   # Start listening
##   sm.startAccelerometer()
##
##   # Later: stop listening
##   sm.stopAccelerometer()

import jnim
import options
import tables
import hashes
import ../../../core

# JNI bindings for sensors
jnimport:
  import android.content.Context
  import android.hardware.SensorManager as JSM
  import android.hardware.Sensor as JSensor
  import android.hardware.SensorEvent
  import android.hardware.SensorEventListener

type
  SensorType* = enum
    ## Available sensor types
    stAccelerometer = "accelerometer"         # TYPE_ACCELEROMETER = 1
    stMagneticField = "magnetic_field"        # TYPE_MAGNETIC_FIELD = 2
    stGyroscope = "gyroscope"                 # TYPE_GYROSCOPE = 4
    stLight = "light"                         # TYPE_LIGHT = 5
    stPressure = "pressure"                   # TYPE_PRESSURE = 6
    stProximity = "proximity"                 # TYPE_PROXIMITY = 8
    stGravity = "gravity"                     # TYPE_GRAVITY = 9
    stLinearAcceleration = "linear_accel"     # TYPE_LINEAR_ACCELERATION = 10
    stRotationVector = "rotation_vector"      # TYPE_ROTATION_VECTOR = 11
    stHumidity = "humidity"                   # TYPE_RELATIVE_HUMIDITY = 12
    stAmbientTemperature = "ambient_temp"     # TYPE_AMBIENT_TEMPERATURE = 13
    stStepCounter = "step_counter"            # TYPE_STEP_COUNTER = 19
    stStepDetector = "step_detector"          # TYPE_STEP_DETECTOR = 18
    stHeartRate = "heart_rate"                # TYPE_HEART_RATE = 21

  SensorRate* = enum
    ## Sensor sampling rate
    srFastest = "fastest"   # ~200 Hz (fastest possible)
    srGame = "game"         # ~50 Hz (suitable for games)
    srUI = "ui"             # ~16 Hz (suitable for UI updates)
    srNormal = "normal"     # ~5 Hz (normal rate)

  SensorData* = object
    ## Generic sensor data
    sensorType*: SensorType
    timestamp*: int64  # nanoseconds since boot
    values*: array[0..15, float32]  # Sensor values (up to 16)
    accuracy*: int  # Sensor accuracy level

  AccelerometerData* = object
    ## Accelerometer data (m/s²)
    x*: float32  # X axis (positive = right)
    y*: float32  # Y axis (positive = up)
    z*: float32  # Z axis (positive = towards user)
    timestamp*: int64

  GyroscopeData* = object
    ## Gyroscope data (rad/s)
    x*: float32  # X axis rotation
    y*: float32  # Y axis rotation
    z*: float32  # Z axis rotation
    timestamp*: int64

  MagnetometerData* = object
    ## Magnetometer data (μT - microtesla)
    x*: float32  # X axis magnetic field
    y*: float32  # Y axis magnetic field
    z*: float32  # Z axis magnetic field
    timestamp*: int64

  LightData* = object
    ## Light sensor data (lux)
    illuminance*: float32  # Ambient light level in lux
    timestamp*: int64

  ProximityData* = object
    ## Proximity sensor data (cm)
    distance*: float32  # Distance to object
    isNear*: bool       # True if object is near
    timestamp*: int64

  SensorInfo* = object
    ## Information about a sensor
    name*: string
    vendor*: string
    version*: int
    sensorType*: SensorType
    maxRange*: float32
    resolution*: float32
    power*: float32  # mA
    minDelay*: int   # microseconds (min sampling interval)

  SensorCallback* = proc(data: SensorData) {.closure.}

  SdkSensorManager* = ref object
    ## Manager for device sensors
    sensorManager: JObject
    availableSensors: Table[SensorType, JObject]  # Sensor objects
    activeSensors: Table[SensorType, bool]  # Which sensors are listening
    callbacks: Table[SensorType, SensorCallback]

#
# Sensor type ID mapping (Android constants)
#

proc getSensorTypeId(sensorType: SensorType): int =
  ## Map SensorType to Android TYPE_* constant
  case sensorType:
  of stAccelerometer: return 1
  of stMagneticField: return 2
  of stGyroscope: return 4
  of stLight: return 5
  of stPressure: return 6
  of stProximity: return 8
  of stGravity: return 9
  of stLinearAcceleration: return 10
  of stRotationVector: return 11
  of stHumidity: return 12
  of stAmbientTemperature: return 13
  of stStepDetector: return 18
  of stStepCounter: return 19
  of stHeartRate: return 21

proc getSensorRateDelay(rate: SensorRate): int =
  ## Map SensorRate to Android SENSOR_DELAY_* constant
  case rate:
  of srFastest: return 0  # SENSOR_DELAY_FASTEST
  of srGame: return 1     # SENSOR_DELAY_GAME
  of srUI: return 2       # SENSOR_DELAY_UI
  of srNormal: return 3   # SENSOR_DELAY_NORMAL

#
# Initialization
#

proc newSdkSensorManager*(): SdkSensorManager =
  let ctx = getContext()
  let sm = ctx.call("getSystemService", "sensor".toJString)

  result = SdkSensorManager(
    sensorManager: sm,
    availableSensors: initTable[SensorType, JObject](),
    activeSensors: initTable[SensorType, bool](),
    callbacks: initTable[SensorType, SensorCallback]()
  )

  # Query available sensors
  for sensorType in SensorType:
    let typeId = getSensorTypeId(sensorType)
    let sensor = sm.call("getDefaultSensor", typeId.jint)
    if not sensor.isNull:
      result.availableSensors[sensorType] = sensor

#
# Sensor Availability
#

proc hasSensor*(sm: SdkSensorManager, sensorType: SensorType): bool =
  ## Check if sensor is available on device
  return sm.availableSensors.hasKey(sensorType)

proc hasAccelerometer*(sm: SdkSensorManager): bool =
  ## Check if accelerometer is available
  return sm.hasSensor(stAccelerometer)

proc hasGyroscope*(sm: SdkSensorManager): bool =
  ## Check if gyroscope is available
  return sm.hasSensor(stGyroscope)

proc hasMagnetometer*(sm: SdkSensorManager): bool =
  ## Check if magnetometer is available
  return sm.hasSensor(stMagneticField)

proc hasProximity*(sm: SdkSensorManager): bool =
  ## Check if proximity sensor is available
  return sm.hasSensor(stProximity)

proc hasLightSensor*(sm: SdkSensorManager): bool =
  ## Check if light sensor is available
  return sm.hasSensor(stLight)

proc getAvailableSensors*(sm: SdkSensorManager): seq[SensorType] =
  ## Get list of all available sensors
  result = @[]
  for sensorType in sm.availableSensors.keys:
    result.add(sensorType)

#
# Sensor Information
#

proc getSensorInfo*(sm: SdkSensorManager, sensorType: SensorType): Option[SensorInfo] =
  ## Get detailed information about a sensor
  if not sm.availableSensors.hasKey(sensorType):
    return none(SensorInfo)

  let sensor = sm.availableSensors[sensorType]

  try:
    let info = SensorInfo(
      name: $sensor.call("getName"),
      vendor: $sensor.call("getVendor"),
      version: sensor.call("getVersion").intValue,
      sensorType: sensorType,
      maxRange: sensor.call("getMaximumRange").floatValue,
      resolution: sensor.call("getResolution").floatValue,
      power: sensor.call("getPower").floatValue,
      minDelay: sensor.call("getMinDelay").intValue
    )
    return some(info)
  except:
    return none(SensorInfo)

#
# Sensor Listening (Callback-Based)
#
# CRITICAL LIMITATION:
#   Sensor event delivery requires SensorEventListener implementation
#   that calls back to Nim. This needs the callback bridge.
#
#   For now, we provide the API structure and document the requirement.
#

proc startSensor*(sm: SdkSensorManager,
                 sensorType: SensorType,
                 rate: SensorRate = srNormal,
                 callback: SensorCallback) =
  ## Start listening to sensor events
  ##
  ## Args:
  ##   sensorType: Which sensor to listen to
  ##   rate: Sampling rate
  ##   callback: Proc called for each sensor event
  ##
  ## ⚠️ Requires: SensorEventListener callback bridge

  if not sm.availableSensors.hasKey(sensorType):
    echo "Warning: Sensor ", sensorType, " not available"
    return

  # Store callback
  sm.callbacks[sensorType] = callback

  # TODO: Implement SensorEventListener that calls callback
  # Requires:
  # 1. Java class implementing SensorEventListener
  # 2. onSensorChanged() method that calls Nim proc
  # 3. Proper lifecycle management

  let sensor = sm.availableSensors[sensorType]
  let rateDelay = getSensorRateDelay(rate)

  echo "Warning: startSensor requires SensorEventListener callback bridge"
  echo "  Sensor: ", sensorType
  echo "  Rate: ", rate

  # sm.sensorManager.call("registerListener", listener, sensor, rateDelay.jint)

  sm.activeSensors[sensorType] = true

proc stopSensor*(sm: SdkSensorManager, sensorType: SensorType) =
  ## Stop listening to sensor events

  if not sm.activeSensors.hasKey(sensorType):
    return

  # TODO: Unregister listener
  echo "Warning: stopSensor requires SensorEventListener callback bridge"

  # sm.sensorManager.call("unregisterListener", listener)

  sm.activeSensors.del(sensorType)
  sm.callbacks.del(sensorType)

proc stopAllSensors*(sm: SdkSensorManager) =
  ## Stop listening to all sensors

  # TODO: Unregister all listeners
  echo "Warning: stopAllSensors requires SensorEventListener callback bridge"

  # sm.sensorManager.call("unregisterListener", listener)

  sm.activeSensors.clear()
  sm.callbacks.clear()

#
# Convenience API for Common Sensors
#

proc onAccelerometer*(sm: SdkSensorManager,
                     rate: SensorRate = srNormal,
                     callback: proc(x, y, z: float32)) =
  ## Convenience: Listen to accelerometer
  ##
  ## Callback receives x, y, z acceleration in m/s²

  sm.startSensor(stAccelerometer, rate, proc(data: SensorData) =
    callback(data.values[0], data.values[1], data.values[2])
  )

proc onGyroscope*(sm: SdkSensorManager,
                 rate: SensorRate = srNormal,
                 callback: proc(x, y, z: float32)) =
  ## Convenience: Listen to gyroscope
  ##
  ## Callback receives x, y, z rotation rate in rad/s

  sm.startSensor(stGyroscope, rate, proc(data: SensorData) =
    callback(data.values[0], data.values[1], data.values[2])
  )

proc onMagnetometer*(sm: SdkSensorManager,
                    rate: SensorRate = srNormal,
                    callback: proc(x, y, z: float32)) =
  ## Convenience: Listen to magnetometer
  ##
  ## Callback receives x, y, z magnetic field in μT

  sm.startSensor(stMagneticField, rate, proc(data: SensorData) =
    callback(data.values[0], data.values[1], data.values[2])
  )

proc onLight*(sm: SdkSensorManager,
             rate: SensorRate = srNormal,
             callback: proc(lux: float32)) =
  ## Convenience: Listen to light sensor
  ##
  ## Callback receives illuminance in lux

  sm.startSensor(stLight, rate, proc(data: SensorData) =
    callback(data.values[0])
  )

proc onProximity*(sm: SdkSensorManager,
                 rate: SensorRate = srNormal,
                 callback: proc(distance: float32, isNear: bool)) =
  ## Convenience: Listen to proximity sensor
  ##
  ## Callback receives distance in cm and near/far boolean

  sm.startSensor(stProximity, rate, proc(data: SensorData) =
    let distance = data.values[0]
    # Proximity sensor returns max range when far, smaller value when near
    let sensor = sm.availableSensors[stProximity]
    let maxRange = sensor.call("getMaximumRange").floatValue
    let isNear = distance < maxRange
    callback(distance, isNear)
  )

#
# Sensor Fusion (Derived Values)
#

proc getOrientation*(accelerometer, magnetometer: array[0..2, float32]): array[0..2, float32] =
  ## Calculate device orientation from accelerometer and magnetometer
  ##
  ## Returns [azimuth, pitch, roll] in radians
  ##
  ## This is a simplified version. Android provides SensorManager.getOrientation()
  ## for more accurate fusion.

  # TODO: Implement proper sensor fusion
  # This requires rotation matrix calculation
  result = [0.0'f32, 0.0'f32, 0.0'f32]

proc getTiltAngle*(x, y, z: float32): float32 =
  ## Calculate tilt angle from accelerometer data
  ##
  ## Returns angle in degrees (0 = flat, 90 = vertical)

  import math
  let g = sqrt(x*x + y*y + z*z)
  return arccos(z / g) * 180.0 / PI

#
# Query Active State
#

proc isListening*(sm: SdkSensorManager, sensorType: SensorType): bool =
  ## Check if currently listening to a sensor
  return sm.activeSensors.get Key(sensorType, false)

proc getActiveSensors*(sm: SdkSensorManager): seq[SensorType] =
  ## Get list of sensors currently being listened to
  result = @[]
  for sensorType in sm.activeSensors.keys:
    result.add(sensorType)

#
# Debugging
#

proc debugPrintSensorInfo*(sm: SdkSensorManager): string =
  ## Get debug representation of sensor manager state
  result = "SensorManager - Status:\n"
  result &= "  Available Sensors: " & $sm.availableSensors.len & "\n"

  for sensorType in sm.availableSensors.keys:
    result &= "    - " & $sensorType
    if sm.isListening(sensorType):
      result &= " (LISTENING)"
    result &= "\n"

    let info = sm.getSensorInfo(sensorType)
    if info.isSome:
      let i = info.get()
      result &= "      Name: " & i.name & "\n"
      result &= "      Vendor: " & i.vendor & "\n"
      result &= "      Max Range: " & $i.maxRange & "\n"
      result &= "      Resolution: " & $i.resolution & "\n"
      result &= "      Power: " & $i.power & " mA\n"

#
# Implementation Notes & TODOs
#
# CRITICAL LIMITATION:
#   SensorManager requires SensorEventListener callbacks for event delivery.
#   This needs the Java→Nim callback bridge.
#
# What's Needed:
#   1. Java class implementing SensorEventListener
#   2. onSensorChanged(SensorEvent event) method that calls Nim proc
#   3. Proper sensor value parsing and type conversion
#   4. Lifecycle management (unregister on destroy)
#
# Workarounds:
#   - Implement SensorEventListener in Java/Kotlin
#   - Have it call exported Nim functions with sensor data
#   - Use sensor type ID to route to correct Nim callback
#
# Current Status:
#   - API design complete
#   - Sensor availability queries work
#   - Sensor info queries work
#   - Event delivery awaits callback bridge
#
# Future Enhancements:
#   - Sensor fusion (orientation, gravity-free acceleration)
#   - Gesture detection (shake, tilt, etc.)
#   - Calibration helpers
#   - Energy-efficient batching (SensorManager.registerListener with batch parameters)
#

#
# Runtime Integration
#

proc sdkSensorManager*(runtime: AndroidRuntime): SdkSensorManager =
  ## Get or create the SdkSensorManager instance
  ## Lazy initialization pattern
  if runtime.sdkSensorManager.isNone:
    runtime.sdkSensorManager = some(newSdkSensorManager())
  return runtime.sdkSensorManager.get()

# Convenience global accessor
proc sensorManager*(): SdkSensorManager =
  ## Global accessor for SdkSensorManager
  ## Requires AndroidRuntime to be initialized
  ##
  ## Usage:
  ##   if sensorManager().hasAccelerometer():
  ##     sensorManager().onAccelerometer(proc(x, y, z: float32) =
  ##       echo "Accel: ", x, ", ", y, ", ", z
  ##     )
  return runtime().sdkSensorManager()
