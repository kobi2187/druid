import jnim

jclass android.ranging.RangingPreference* of JVMObject:
  proc getDeviceRole*(): jint
  proc getRangingParams*(): RangingConfig
  proc getSessionConfig*(): SessionConfig
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  DEVICE_ROLE_RESPONDER*: jint {.`static`.}
  DEVICE_ROLE_INITIATOR*: jint {.`static`.}
  CREATOR*: Creator[RangingPreference] {.`static`.}

jclass android.ranging.RangingPreference.Builder* of JVMObject:
  proc setSessionConfig*(config: SessionConfig): Builder
  proc build*(): RangingPreference

jclass android.ranging.Builder* of JVMObject:
  proc setSessionConfig*(config: SessionConfig): Builder
  proc build*(): RangingPreference

