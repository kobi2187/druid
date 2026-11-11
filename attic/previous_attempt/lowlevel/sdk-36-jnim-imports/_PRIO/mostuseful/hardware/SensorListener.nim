import jnim

jclass android.hardware.SensorListener* of JVMObject:
  proc onSensorChanged*(sensor: jint, values: seq[jfloat])
  proc onAccuracyChanged*(sensor: jint, accuracy: jint)

