import jnim

jclass android.telephony.CallForwardingInfo* of JVMObject:
  proc isEnabled*(): jboolean
  proc getReason*(): jint
  proc getNumber*(): string
  proc getTimeoutSeconds*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  REASON_UNCONDITIONAL*: jint {.`static`.}
  REASON_BUSY*: jint {.`static`.}
  REASON_NO_REPLY*: jint {.`static`.}
  REASON_NOT_REACHABLE*: jint {.`static`.}
  REASON_ALL*: jint {.`static`.}
  REASON_ALL_CONDITIONAL*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[CallForwardingInfo] {.`static`.}

