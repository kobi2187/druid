import jnim

jclass android.media.MediaActionSound* of JVMObject:
  proc mustPlayShutterSound*(): jboolean {.`static`.}
  proc load*(soundName: jint)
  proc play*(soundName: jint)
  proc release*()
  SHUTTER_CLICK*: jint {.`static`.}
  FOCUS_COMPLETE*: jint {.`static`.}
  START_VIDEO_RECORDING*: jint {.`static`.}
  STOP_VIDEO_RECORDING*: jint {.`static`.}

