import jnim

jclass android.provider.UpdatableDeviceConfigServiceReadiness* of JVMObject:
  proc shouldStartUpdatableService*(): jboolean {.`static`.}

