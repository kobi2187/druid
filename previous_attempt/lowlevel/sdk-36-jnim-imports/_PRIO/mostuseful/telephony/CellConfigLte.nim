import jnim

jclass android.telephony.CellConfigLte* of JVMObject:
  proc describeContents*(): jint
  proc hashCode*(): jint
  proc equals*(other: JObject): jboolean
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[CellConfigLte] {.`static`.}

