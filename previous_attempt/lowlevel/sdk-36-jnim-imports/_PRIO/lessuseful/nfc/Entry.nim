import jnim

jclass android.nfc.Entry* of JVMObject:
  proc getType*(): jbyte
  proc getNfceeId*(): jbyte
  proc getEntry*(): string
  proc getRoutingType*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[Entry] {.`static`.}

