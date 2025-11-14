import jnim

jclass android.telephony.UiccPortInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc getIccId*(): string
  proc getPortIndex*(): jint
  proc isActive*(): jboolean
  proc getLogicalSlotIndex*(): jint
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  ICCID_REDACTED*: string {.`static`.}
  CREATOR*: Creator[UiccPortInfo] {.`static`.}

