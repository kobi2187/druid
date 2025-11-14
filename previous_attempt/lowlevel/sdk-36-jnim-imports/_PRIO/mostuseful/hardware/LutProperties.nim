import jnim

jclass android.hardware.LutProperties* of JVMObject:
  proc getDimension*(): jint
  proc getSize*(): jint
  proc getSamplingKeys*(): seq[jint]
  SAMPLING_KEY_RGB*: jint {.`static`.}
  SAMPLING_KEY_MAX_RGB*: jint {.`static`.}
  SAMPLING_KEY_CIE_Y*: jint {.`static`.}
  ONE_DIMENSION*: jint {.`static`.}
  THREE_DIMENSION*: jint {.`static`.}

