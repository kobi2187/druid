import jnim

jclass android.ranging.RangingConfig* of JVMObject:
  proc getRangingSessionType*(): jint
  proc toString*(): string
  RANGING_SESSION_RAW*: jint {.`static`.}
  RANGING_SESSION_OOB*: jint {.`static`.}

