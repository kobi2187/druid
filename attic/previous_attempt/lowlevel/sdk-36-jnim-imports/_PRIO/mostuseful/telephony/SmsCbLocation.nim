import jnim

jclass android.telephony.SmsCbLocation* of JVMObject:
  proc getPlmn*(): string
  proc getLac*(): jint
  proc getCid*(): jint
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  proc isInLocationArea*(area: SmsCbLocation): jboolean
  proc isInLocationArea*(plmn: string, lac: jint, cid: jint): jboolean
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[SmsCbLocation] {.`static`.}

