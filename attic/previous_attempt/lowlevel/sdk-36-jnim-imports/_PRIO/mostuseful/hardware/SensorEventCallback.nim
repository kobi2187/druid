import jnim

jclass android.hardware.SensorEventCallback* of JVMObject:
  proc onSensorChanged*(event: SensorEvent)
  proc onAccuracyChanged*(sensor: Sensor, accuracy: jint)
  proc onFlushCompleted*(sensor: Sensor)
  proc onSensorAdditionalInfo*(info: SensorAdditionalInfo)

