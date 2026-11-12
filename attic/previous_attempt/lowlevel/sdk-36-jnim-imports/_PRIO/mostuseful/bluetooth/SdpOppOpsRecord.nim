import jnim

jclass android.bluetooth.SdpOppOpsRecord* of JVMObject:
  proc getServiceName*(): string
  proc getRfcommChannel*(): jint
  proc getL2capPsm*(): jint
  proc getProfileVersion*(): jint
  proc getFormatsList*(): seq[jbyte]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Parcelable.Creator {.`static`.}

