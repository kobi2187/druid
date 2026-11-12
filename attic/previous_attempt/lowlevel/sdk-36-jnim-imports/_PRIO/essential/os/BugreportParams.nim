import jnim

jclass android.os.BugreportParams* of JVMObject:
  proc getMode*(): jint
  proc getFlags*(): jint
  BUGREPORT_MODE_FULL*: jint {.`static`.}
  BUGREPORT_MODE_INTERACTIVE*: jint {.`static`.}
  BUGREPORT_MODE_REMOTE*: jint {.`static`.}
  BUGREPORT_MODE_WEAR*: jint {.`static`.}
  BUGREPORT_MODE_TELEPHONY*: jint {.`static`.}
  BUGREPORT_MODE_WIFI*: jint {.`static`.}
  BUGREPORT_MODE_ONBOARDING*: jint {.`static`.}
  BUGREPORT_MODE_MAX_VALUE*: jint {.`static`.}
  BUGREPORT_FLAG_USE_PREDUMPED_UI_DATA*: jint {.`static`.}
  BUGREPORT_FLAG_DEFER_CONSENT*: jint {.`static`.}
  BUGREPORT_FLAG_KEEP_BUGREPORT_ON_RETRIEVAL*: jint {.`static`.}

