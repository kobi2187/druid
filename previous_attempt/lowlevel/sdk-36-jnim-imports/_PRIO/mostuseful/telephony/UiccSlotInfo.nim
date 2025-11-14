import jnim

jclass android.telephony.UiccSlotInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc getIsActive*(): jboolean
  proc getIsEuicc*(): jboolean
  proc getCardId*(): string
  proc getCardStateInfo*(): jint
  proc getLogicalSlotIdx*(): jint
  proc getIsExtendedApduSupported*(): jboolean
  proc isRemovable*(): jboolean
  proc getPorts*(): Collection[UiccPortInfo]
  proc setLogicalSlotAccessRestricted*(logicalSlotAccessRestricted: jboolean)
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CARD_STATE_INFO_ABSENT*: jint {.`static`.}
  CARD_STATE_INFO_PRESENT*: jint {.`static`.}
  CARD_STATE_INFO_ERROR*: jint {.`static`.}
  CARD_STATE_INFO_RESTRICTED*: jint {.`static`.}
  CREATOR*: Creator[UiccSlotInfo] {.`static`.}

