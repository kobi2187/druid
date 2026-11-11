import jnim

jclass android.telephony.CallAttributes* of JVMObject:
  proc toString*(): string
  proc getPreciseCallState*(): PreciseCallState
  proc getNetworkType*(): jint
  proc getCallQuality*(): CallQuality
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[CallAttributes] {.`static`.}

