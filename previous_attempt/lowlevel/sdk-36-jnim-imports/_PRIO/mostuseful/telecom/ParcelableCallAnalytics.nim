import jnim

jclass android.telecom.ParcelableCallAnalytics* of JVMObject:
  proc writeToParcel*(output:Parcel, flags: jint)
  proc setIsVideoCall*(isVideoCall: jboolean)
  proc setVideoEvents*(videoEvents: List[VideoEvent])
  proc setCallSource*(callSource: jint)
  proc getStartTimeMillis*(): jlong
  proc getCallDurationMillis*(): jlong
  proc getCallType*(): jint
  proc isAdditionalCall*(): jboolean
  proc isInterrupted*(): jboolean
  proc getCallTechnologies*(): jint
  proc getCallTerminationCode*(): jint
  proc isEmergencyCall*(): jboolean
  proc getConnectionService*(): string
  proc isCreatedFromExistingConnection*(): jboolean
  proc analyticsEvents*(): List[AnalyticsEvent]
  proc getEventTimings*(): List[EventTiming]
  proc isVideoCall*(): jboolean
  proc getVideoEvents*(): List[VideoEvent]
  proc getCallSource*(): jint
  proc describeContents*(): jint
  CALLTYPE_UNKNOWN*: jint {.`static`.}
  CALLTYPE_INCOMING*: jint {.`static`.}
  CALLTYPE_OUTGOING*: jint {.`static`.}
  CDMA_PHONE*: jint {.`static`.}
  GSM_PHONE*: jint {.`static`.}
  IMS_PHONE*: jint {.`static`.}
  SIP_PHONE*: jint {.`static`.}
  THIRD_PARTY_PHONE*: jint {.`static`.}
  MILLIS_IN_5_MINUTES*: jlong {.`static`.}
  MILLIS_IN_1_SECOND*: jlong {.`static`.}
  STILL_CONNECTED*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[ParcelableCallAnalytics] {.`static`.}

jclass android.telecom.ParcelableCallAnalytics.VideoEvent* of JVMObject:
  proc getEventName*(): jint
  proc getTimeSinceLastEvent*(): jlong
  proc getVideoState*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)

jclass android.telecom.ParcelableCallAnalytics.AnalyticsEvent* of JVMObject:
  proc getEventName*(): jint
  proc getTimeSinceLastEvent*(): jlong
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)

jclass android.telecom.ParcelableCallAnalytics.EventTiming* of JVMObject:
  proc getName*(): jint
  proc getTime*(): jlong
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)

jclass android.telecom.VideoEvent* of JVMObject:
  proc getEventName*(): jint
  proc getTimeSinceLastEvent*(): jlong
  proc getVideoState*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  SEND_LOCAL_SESSION_MODIFY_REQUEST*: jint {.`static`.}
  SEND_LOCAL_SESSION_MODIFY_RESPONSE*: jint {.`static`.}
  RECEIVE_REMOTE_SESSION_MODIFY_REQUEST*: jint {.`static`.}
  RECEIVE_REMOTE_SESSION_MODIFY_RESPONSE*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[VideoEvent] {.`static`.}

jclass android.telecom.AnalyticsEvent* of JVMObject:
  proc getEventName*(): jint
  proc getTimeSinceLastEvent*(): jlong
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  SET_SELECT_PHONE_ACCOUNT*: jint {.`static`.}
  SET_ACTIVE*: jint {.`static`.}
  SET_DISCONNECTED*: jint {.`static`.}
  START_CONNECTION*: jint {.`static`.}
  SET_DIALING*: jint {.`static`.}
  BIND_CS*: jint {.`static`.}
  CS_BOUND*: jint {.`static`.}
  REQUEST_ACCEPT*: jint {.`static`.}
  REQUEST_REJECT*: jint {.`static`.}
  SCREENING_SENT*: jint {.`static`.}
  SCREENING_COMPLETED*: jint {.`static`.}
  DIRECT_TO_VM_INITIATED*: jint {.`static`.}
  DIRECT_TO_VM_FINISHED*: jint {.`static`.}
  BLOCK_CHECK_INITIATED*: jint {.`static`.}
  BLOCK_CHECK_FINISHED*: jint {.`static`.}
  FILTERING_INITIATED*: jint {.`static`.}
  FILTERING_COMPLETED*: jint {.`static`.}
  FILTERING_TIMED_OUT*: jint {.`static`.}
  DND_CHECK_INITIATED*: jint {.`static`.}
  DND_CHECK_COMPLETED*: jint {.`static`.}
  SKIP_RINGING*: jint {.`static`.}
  SILENCE*: jint {.`static`.}
  MUTE*: jint {.`static`.}
  UNMUTE*: jint {.`static`.}
  AUDIO_ROUTE_BT*: jint {.`static`.}
  AUDIO_ROUTE_EARPIECE*: jint {.`static`.}
  AUDIO_ROUTE_HEADSET*: jint {.`static`.}
  AUDIO_ROUTE_SPEAKER*: jint {.`static`.}
  CONFERENCE_WITH*: jint {.`static`.}
  SPLIT_CONFERENCE*: jint {.`static`.}
  SET_PARENT*: jint {.`static`.}
  REQUEST_HOLD*: jint {.`static`.}
  REQUEST_UNHOLD*: jint {.`static`.}
  REMOTELY_HELD*: jint {.`static`.}
  REMOTELY_UNHELD*: jint {.`static`.}
  SET_HOLD*: jint {.`static`.}
  SWAP*: jint {.`static`.}
  REQUEST_PULL*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[AnalyticsEvent] {.`static`.}

jclass android.telecom.EventTiming* of JVMObject:
  proc getName*(): jint
  proc getTime*(): jlong
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  ACCEPT_TIMING*: jint {.`static`.}
  REJECT_TIMING*: jint {.`static`.}
  DISCONNECT_TIMING*: jint {.`static`.}
  HOLD_TIMING*: jint {.`static`.}
  UNHOLD_TIMING*: jint {.`static`.}
  OUTGOING_TIME_TO_DIALING_TIMING*: jint {.`static`.}
  BIND_CS_TIMING*: jint {.`static`.}
  SCREENING_COMPLETED_TIMING*: jint {.`static`.}
  DIRECT_TO_VM_FINISHED_TIMING*: jint {.`static`.}
  BLOCK_CHECK_FINISHED_TIMING*: jint {.`static`.}
  FILTERING_COMPLETED_TIMING*: jint {.`static`.}
  FILTERING_TIMED_OUT_TIMING*: jint {.`static`.}
  DND_PRE_CALL_PRE_CHECK_TIMING*: jint {.`static`.}
  START_CONNECTION_TO_REQUEST_DISCONNECT_TIMING*: jint {.`static`.}
  INVALID*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[EventTiming] {.`static`.}

