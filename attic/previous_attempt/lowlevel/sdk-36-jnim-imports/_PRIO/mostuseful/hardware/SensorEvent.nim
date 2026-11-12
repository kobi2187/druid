import jnim

jclass android.hardware.SensorEvent* of JVMObject:
  values*: jfloat
  sensor*: Sensor
  accuracy*: jint
  timestamp*: jlong
  firstEventAfterDiscontinuity*: jboolean

