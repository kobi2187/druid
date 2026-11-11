import jnim

jclass android.nfc.TechListParcel* of JVMObject:
  proc getTechLists*(): seq[seq[string]]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[TechListParcel] {.`static`.}

