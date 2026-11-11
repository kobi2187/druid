import jnim

jclass android.hardware.SensorManager* of JVMObject:
  proc getSensors*(): jint
  proc getSensorList*(type: jint): List[Sensor]
  proc getSensorByHandle*(sensorHandle: jint): Sensor
  proc getDynamicSensorList*(type: jint): List[Sensor]
  proc getDefaultSensor*(type: jint): Sensor
  proc getDefaultSensor*(type: jint, wakeUp: jboolean): Sensor
  proc registerListener*(listener: SensorListener, sensors: jint): jboolean
  proc registerListener*(listener: SensorListener, sensors: jint, rate: jint): jboolean
  proc unregisterListener*(listener: SensorListener)
  proc unregisterListener*(listener: SensorListener, sensors: jint)
  proc unregisterListener*(listener: SensorEventListener, sensor: Sensor)
  proc unregisterListener*(listener: SensorEventListener)
  proc registerListener*(listener: SensorEventListener, sensor: Sensor, samplingPeriodUs: jint): jboolean
  proc registerListener*(listener: SensorEventListener, sensor: Sensor, samplingPeriodUs: jint, maxReportLatencyUs: jint): jboolean
  proc registerListener*(listener: SensorEventListener, sensor: Sensor, samplingPeriodUs: jint, handler: Handler): jboolean
  proc registerListener*(listener: SensorEventListener, sensor: Sensor, samplingPeriodUs: jint, maxReportLatencyUs: jint, handler: Handler): jboolean
  proc flush*(listener: SensorEventListener): jboolean
  proc createDirectChannel*(mem: MemoryFile): SensorDirectChannel
  proc createDirectChannel*(mem: HardwareBuffer): SensorDirectChannel
  proc registerDynamicSensorCallback*(callback: DynamicSensorCallback)
  proc registerDynamicSensorCallback*(callback: DynamicSensorCallback, handler: Handler)
  proc unregisterDynamicSensorCallback*(callback: DynamicSensorCallback)
  proc isDynamicSensorDiscoverySupported*(): jboolean
  proc getRotationMatrix*(R: seq[jfloat], I: seq[jfloat], gravity: seq[jfloat], geomagnetic: seq[jfloat]): jboolean {.`static`.}
  proc getInclination*(I: seq[jfloat]): jfloat {.`static`.}
  proc remapCoordinateSystem*(inR: seq[jfloat], X: jint, Y: jint, outR: seq[jfloat]): jboolean {.`static`.}
  proc getOrientation*(R: seq[jfloat], values: seq[jfloat]): seq[jfloat] {.`static`.}
  proc getAltitude*(p0: jfloat, p: jfloat): jfloat {.`static`.}
  proc getAngleChange*(angleChange: seq[jfloat], R: seq[jfloat], prevR: seq[jfloat]) {.`static`.}
  proc getRotationMatrixFromVector*(R: seq[jfloat], rotationVector: seq[jfloat]) {.`static`.}
  proc getQuaternionFromVector*(Q: seq[jfloat], rv: seq[jfloat]) {.`static`.}
  proc requestTriggerSensor*(listener: TriggerEventListener, sensor: Sensor): jboolean
  proc cancelTriggerSensor*(listener: TriggerEventListener, sensor: Sensor): jboolean
  proc initDataInjection*(enable: jboolean): jboolean
  proc initDataInjection*(enable: jboolean, mode: jint): jboolean
  proc injectSensorData*(sensor: Sensor, values: seq[jfloat], accuracy: jint, timestamp: jlong): jboolean
  proc setOperationParameter*(parameter: SensorAdditionalInfo): jboolean
  SENSOR_ORIENTATION*: jint {.`static`.}
  SENSOR_ACCELEROMETER*: jint {.`static`.}
  SENSOR_TEMPERATURE*: jint {.`static`.}
  SENSOR_MAGNETIC_FIELD*: jint {.`static`.}
  SENSOR_LIGHT*: jint {.`static`.}
  SENSOR_PROXIMITY*: jint {.`static`.}
  SENSOR_TRICORDER*: jint {.`static`.}
  SENSOR_ORIENTATION_RAW*: jint {.`static`.}
  SENSOR_ALL*: jint {.`static`.}
  SENSOR_MIN*: jint {.`static`.}
  SENSOR_MAX*: jint {.`static`.}
  DATA_X*: jint {.`static`.}
  DATA_Y*: jint {.`static`.}
  DATA_Z*: jint {.`static`.}
  RAW_DATA_INDEX*: jint {.`static`.}
  RAW_DATA_X*: jint {.`static`.}
  RAW_DATA_Y*: jint {.`static`.}
  RAW_DATA_Z*: jint {.`static`.}
  STANDARD_GRAVITY*: jfloat {.`static`.}
  GRAVITY_SUN*: jfloat {.`static`.}
  GRAVITY_MERCURY*: jfloat {.`static`.}
  GRAVITY_VENUS*: jfloat {.`static`.}
  GRAVITY_EARTH*: jfloat {.`static`.}
  GRAVITY_MOON*: jfloat {.`static`.}
  GRAVITY_MARS*: jfloat {.`static`.}
  GRAVITY_JUPITER*: jfloat {.`static`.}
  GRAVITY_SATURN*: jfloat {.`static`.}
  GRAVITY_URANUS*: jfloat {.`static`.}
  GRAVITY_NEPTUNE*: jfloat {.`static`.}
  GRAVITY_PLUTO*: jfloat {.`static`.}
  GRAVITY_DEATH_STAR_I*: jfloat {.`static`.}
  GRAVITY_THE_ISLAND*: jfloat {.`static`.}
  MAGNETIC_FIELD_EARTH_MAX*: jfloat {.`static`.}
  MAGNETIC_FIELD_EARTH_MIN*: jfloat {.`static`.}
  PRESSURE_STANDARD_ATMOSPHERE*: jfloat {.`static`.}
  LIGHT_SUNLIGHT_MAX*: jfloat {.`static`.}
  LIGHT_SUNLIGHT*: jfloat {.`static`.}
  LIGHT_SHADE*: jfloat {.`static`.}
  LIGHT_OVERCAST*: jfloat {.`static`.}
  LIGHT_SUNRISE*: jfloat {.`static`.}
  LIGHT_CLOUDY*: jfloat {.`static`.}
  LIGHT_FULLMOON*: jfloat {.`static`.}
  LIGHT_NO_MOON*: jfloat {.`static`.}
  SENSOR_DELAY_FASTEST*: jint {.`static`.}
  SENSOR_DELAY_GAME*: jint {.`static`.}
  SENSOR_DELAY_UI*: jint {.`static`.}
  SENSOR_DELAY_NORMAL*: jint {.`static`.}
  SENSOR_STATUS_NO_CONTACT*: jint {.`static`.}
  SENSOR_STATUS_UNRELIABLE*: jint {.`static`.}
  SENSOR_STATUS_ACCURACY_LOW*: jint {.`static`.}
  SENSOR_STATUS_ACCURACY_MEDIUM*: jint {.`static`.}
  SENSOR_STATUS_ACCURACY_HIGH*: jint {.`static`.}
  AXIS_X*: jint {.`static`.}
  AXIS_Y*: jint {.`static`.}
  AXIS_Z*: jint {.`static`.}
  AXIS_MINUS_X*: jint {.`static`.}
  AXIS_MINUS_Y*: jint {.`static`.}
  AXIS_MINUS_Z*: jint {.`static`.}
  DATA_INJECTION*: jint {.`static`.}
  REPLAY_DATA_INJECTION*: jint {.`static`.}
  HAL_BYPASS_REPLAY_DATA_INJECTION*: jint {.`static`.}

jclass android.hardware.SensorManager.DynamicSensorCallback* of JVMObject:
  proc onDynamicSensorConnected*(sensor: Sensor)
  proc onDynamicSensorDisconnected*(sensor: Sensor)

jclass android.hardware.DynamicSensorCallback* of JVMObject:
  proc onDynamicSensorConnected*(sensor: Sensor)
  proc onDynamicSensorDisconnected*(sensor: Sensor)

