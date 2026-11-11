import jnim

jclass android.nfc.ApduList* of JVMObject:
  proc add*(command: seq[jbyte])
  proc get*(): List[seq[jbyte]]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[ApduList] {.`static`.}

