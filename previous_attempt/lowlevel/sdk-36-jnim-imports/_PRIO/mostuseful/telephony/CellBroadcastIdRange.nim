import jnim

jclass android.telephony.CellBroadcastIdRange* of JVMObject:
  proc getStartId*(): jint
  proc getEndId*(): jint
  proc getType*(): jint
  proc isEnabled*(): jboolean
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  CREATOR*: Parcelable.Creator[CellBroadcastIdRange] {.`static`.}

