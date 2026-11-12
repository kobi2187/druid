import jnim

jclass android.bluetooth.SdpSapsRecord* of JVMObject:
  proc describeContents*(): jint
  proc getRfcommCannelNumber*(): jint
  proc getProfileVersion*(): jint
  proc getServiceName*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Parcelable.Creator {.`static`.}

