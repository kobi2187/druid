import jnim

jclass android.hardware.SensorEventListener* of JVMObject:
  proc onSensorChanged*(event: SensorEvent)
  proc onAccuracyChanged*(sensor: Sensor, accuracy: jint)

