import jnim

jclass android.telecom.ParcelableConnection* of JVMObject:
  proc getPhoneAccount*(): PhoneAccountHandle
  proc getState*(): jint
  proc getConnectionCapabilities*(): jint
  proc getConnectionProperties*(): jint
  proc getSupportedAudioRoutes*(): jint
  proc getHandle*(): Uri
  proc getHandlePresentation*(): jint
  proc getCallerDisplayName*(): string
  proc getCallerDisplayNamePresentation*(): jint
  proc getVideoProvider*(): IVideoProvider
  proc getVideoState*(): jint
  proc isRingbackRequested*(): jboolean
  proc getIsVoipAudioMode*(): jboolean
  proc getConnectTimeMillis*(): jlong
  proc getConnectElapsedTimeMillis*(): jlong
  proc getStatusHints*(): StatusHints
  proc getDisconnectCause*(): DisconnectCause
  proc getConferenceableConnectionIds*(): List[string]
  proc getExtras*(): Bundle
  proc getParentCallId*(): string
  proc getCallDirection*(): jint
  proc getCallerNumberVerificationStatus*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(destination: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[ParcelableConnection] {.`static`.}

