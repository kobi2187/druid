import jnim

jclass android.telephony.PreciseCallState* of JVMObject:
  proc getRingingCallState*(): jint
  proc getForegroundCallState*(): jint
  proc getBackgroundCallState*(): jint
  proc getDisconnectCause*(): jint
  proc getPreciseDisconnectCause*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  PRECISE_CALL_STATE_NOT_VALID*: jint {.`static`.}
  PRECISE_CALL_STATE_IDLE*: jint {.`static`.}
  PRECISE_CALL_STATE_ACTIVE*: jint {.`static`.}
  PRECISE_CALL_STATE_HOLDING*: jint {.`static`.}
  PRECISE_CALL_STATE_DIALING*: jint {.`static`.}
  PRECISE_CALL_STATE_ALERTING*: jint {.`static`.}
  PRECISE_CALL_STATE_INCOMING*: jint {.`static`.}
  PRECISE_CALL_STATE_WAITING*: jint {.`static`.}
  PRECISE_CALL_STATE_DISCONNECTED*: jint {.`static`.}
  PRECISE_CALL_STATE_DISCONNECTING*: jint {.`static`.}
  PRECISE_CALL_STATE_INCOMING_SETUP*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[PreciseCallState] {.`static`.}

