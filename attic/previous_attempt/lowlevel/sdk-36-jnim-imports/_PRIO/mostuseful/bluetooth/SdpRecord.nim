import jnim

jclass android.bluetooth.SdpRecord* of JVMObject:
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getRawData*(): seq[jbyte]
  proc getRawSize*(): jint
  CREATOR*: Parcelable.Creator {.`static`.}

