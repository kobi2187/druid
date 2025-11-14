import jnim

jclass android.telephony.UiccCardInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc isEuicc*(): jboolean
  proc getCardId*(): jint
  proc getEid*(): string
  proc getIccId*(): string
  proc getSlotIndex*(): jint
  proc getPhysicalSlotIndex*(): jint
  proc isRemovable*(): jboolean
  proc isMultipleEnabledProfilesSupported*(): jboolean
  proc getPorts*(): Collection[UiccPortInfo]
  proc setIccIdAccessRestricted*(iccIdAccessRestricted: jboolean)
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Creator[UiccCardInfo] {.`static`.}

