import jnim

jclass android.telephony.ModemInfo* of JVMObject:
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  modemId*: jint
  rat*: jint
  isVoiceSupported*: jboolean
  isDataSupported*: jboolean
  CREATOR*: Parcelable.Creator[ModemInfo] {.`static`.}

