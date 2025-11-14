import jnim

jclass android.view.OrientationListener* of JVMObject:
  proc enable*()
  proc disable*()
  proc onAccuracyChanged*(sensor: jint, accuracy: jint)
  proc onSensorChanged*(sensor: jint, values: seq[jfloat])
  proc onOrientationChanged*(orientation: jint)
  ORIENTATION_UNKNOWN*: jint {.`static`.}

