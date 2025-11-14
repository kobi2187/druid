import jnim

jclass android.telecom.TelecomAnalytics* of JVMObject:
  proc getSessionTimings*(): List[SessionTiming]
  proc getCallAnalytics*(): List[ParcelableCallAnalytics]
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[TelecomAnalytics] {.`static`.}

jclass android.telecom.TelecomAnalytics.SessionTiming* of JVMObject:
  proc getKey*(): Integer
  proc getTime*(): jlong
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)

jclass android.telecom.SessionTiming* of TimedEvent:
  proc getKey*(): Integer
  proc getTime*(): jlong
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[SessionTiming] {.`static`.}
  ICA_ANSWER_CALL*: jint {.`static`.}
  ICA_REJECT_CALL*: jint {.`static`.}
  ICA_DISCONNECT_CALL*: jint {.`static`.}
  ICA_HOLD_CALL*: jint {.`static`.}
  ICA_UNHOLD_CALL*: jint {.`static`.}
  ICA_MUTE*: jint {.`static`.}
  ICA_SET_AUDIO_ROUTE*: jint {.`static`.}
  ICA_CONFERENCE*: jint {.`static`.}
  CSW_HANDLE_CREATE_CONNECTION_COMPLETE*: jint {.`static`.}
  CSW_SET_ACTIVE*: jint {.`static`.}
  CSW_SET_RINGING*: jint {.`static`.}
  CSW_SET_DIALING*: jint {.`static`.}
  CSW_SET_DISCONNECTED*: jint {.`static`.}
  CSW_SET_ON_HOLD*: jint {.`static`.}
  CSW_REMOVE_CALL*: jint {.`static`.}
  CSW_SET_IS_CONFERENCED*: jint {.`static`.}
  CSW_ADD_CONFERENCE_CALL*: jint {.`static`.}

