import jnim

jclass android.devicelock.DeviceId* of JVMObject:
  proc getType*(): jint
  proc getId*(): string
  DEVICE_ID_TYPE_IMEI*: jint {.`static`.}
  DEVICE_ID_TYPE_MEID*: jint {.`static`.}

