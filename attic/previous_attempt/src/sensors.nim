# sensors.nim - Sensor systems

import android, options, times

type
  SensorType* = enum
    Accelerometer,    # Linear acceleration
    Gyroscope,        # Angular velocity
    Magnetometer,     # Magnetic field
    Light,            # Ambient light
    Proximity,        # Distance to objects
    Pressure,         # Barometric pressure
    Temperature,      # Ambient temperature
    Humidity,         # Relative humidity
    StepCounter,      # Number of steps
    StepDetector,     # Step detection events
    SignificantMotion, # Significant device motion
    Gravity,          # Gravity component of acceleration
    LinearAccel,      # Acceleration minus gravity
    RotationVector,   # Device orientation
    GameRotation,     # Rotation for games (no magnetic field)
    GeomagneticRotation # Geomagnetic rotation vector
    
  SensorRate* = enum
    Slow = 3,   # SENSOR_DELAY_NORMAL (~200ms)
    Medium = 2, # SENSOR_DELAY_UI (~60ms)
    Fast = 1,   # SENSOR_DELAY_GAME (~20ms)
    Fastest = 0 # SENSOR_DELAY_FASTEST (0ms)
    
  Vector3D* = object
    x*, y*, z*: float
    
  SensorReading* = object
    timestamp*: Time
    accuracy*: int
    case kind*: SensorType
    of Accelerometer, Gyroscope, Magnetometer, Gravity, LinearAccel:
      vector*: Vector3D
    of Light:
      lux*: float
    of Proximity:
      distance*: float
    of Pressure:
      pressure*: float
    of Temperature:
      temperature*: float
    of Humidity:
      humidity*: float
    of StepCounter:
      steps*: int64
    of StepDetector, SignificantMotion:
      detected*: bool
    of RotationVector, GameRotation, GeomagneticRotation:
      rotation*: array[5, float]  # Quaternion + accuracy
    
  SensorListener* = proc(reading: SensorReading)
  
  SensorBatchConfig* = object
    ## Batching configuration for power efficiency
    maxReportLatencyUs*: int64  # Microseconds; 0 = no batching
    
  SensorManager* = ref object of Manager
    listeners: Table[SensorType, SensorListener]
    activeMonitoring: HashSet[SensorType]
    samplingPeriods: Table[SensorType, int]  # Microseconds
    batchConfigs: Table[SensorType, SensorBatchConfig]
    systemService: pointer  # JNI reference

# Constructor
proc newSensorManager*(context: Context): SensorManager
  ## Creates a new sensor manager

# Sensor availability
proc isSensorAvailable*(m: SensorManager, sensorType: SensorType): bool
  ## Checks if sensor is available on device
  
proc getSensorInfo*(m: SensorManager, sensorType: SensorType): Option[tuple[name: string, vendor: string, power: float, resolution: float]]
  ## Gets detailed sensor information if available

# Sensor monitoring
proc registerListener*(m: SensorManager, 
                      sensorType: SensorType,
                      rate: SensorRate,
                      listener: SensorListener): bool
  ## Registers for sensor updates
  ## API 26+: Uses onSensorChanged with new event API
  ## API 31+: Some sensors require specialized permissions
  
proc registerBatchedListener*(m: SensorManager,
                             sensorType: SensorType,
                             rate: SensorRate,
                             batchConfig: SensorBatchConfig,
                             listener: SensorListener): bool
  ## Registers for batched sensor updates for power efficiency
  ## API 26+: Uses batch mode API for significant power saving
  
proc unregisterListener*(m: SensorManager, sensorType: SensorType)
  ## Unregisters sensor listener

# Composite operations
proc getDeviceOrientation*(m: SensorManager): Option[tuple[azimuth, pitch, roll: float]]
  ## Gets device orientation in degrees
  ## Requires both accelerometer and magnetometer
  
proc getGravityDirection*(m: SensorManager): Option[Vector3D]
  ## Gets normalized gravity vector
  ## Uses Gravity sensor if available, falls back to filtered accelerometer