import jnim

jclass android.telephony.UiccSlotMapping* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc getPortIndex*(): jint
  proc getPhysicalSlotIndex*(): jint
  proc getLogicalSlotIndex*(): jint
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Creator[UiccSlotMapping] {.`static`.}

