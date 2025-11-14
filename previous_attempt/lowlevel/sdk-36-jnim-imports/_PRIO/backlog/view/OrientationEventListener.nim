import jnim

jclass android.view.OrientationEventListener* of JVMObject:
  proc enable*()
  proc disable*()
  proc canDetectOrientation*(): jboolean
  proc onOrientationChanged*(orientation: jint)
  ORIENTATION_UNKNOWN*: jint {.`static`.}

