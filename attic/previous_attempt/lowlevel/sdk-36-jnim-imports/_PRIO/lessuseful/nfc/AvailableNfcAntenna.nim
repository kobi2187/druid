import jnim

jclass android.nfc.AvailableNfcAntenna* of JVMObject:
  proc getLocationX*(): jint
  proc getLocationY*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  CREATOR*: Parcelable.Creator[AvailableNfcAntenna] {.`static`.}

