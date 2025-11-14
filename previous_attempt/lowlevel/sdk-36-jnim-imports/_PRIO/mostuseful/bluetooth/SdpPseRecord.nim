import jnim

jclass android.bluetooth.SdpPseRecord* of JVMObject:
  proc describeContents*(): jint
  proc getL2capPsm*(): jint
  proc getRfcommChannelNumber*(): jint
  proc getSupportedFeatures*(): jint
  proc getServiceName*(): string
  proc getProfileVersion*(): jint
  proc getSupportedRepositories*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Parcelable.Creator {.`static`.}

