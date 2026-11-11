import jnim

jclass android.telecom.ParcelableConference* of JVMObject:
  proc toString*(): string
  proc getPhoneAccount*(): PhoneAccountHandle
  proc getState*(): jint
  proc getConnectionCapabilities*(): jint
  proc getConnectionProperties*(): jint
  proc getConnectionIds*(): List[string]
  proc getConnectTimeMillis*(): jlong
  proc getConnectElapsedTimeMillis*(): jlong
  proc getVideoProvider*(): IVideoProvider
  proc getVideoState*(): jint
  proc getStatusHints*(): StatusHints
  proc getExtras*(): Bundle
  proc getHandle*(): Uri
  proc getDisconnectCause*(): DisconnectCause
  proc isRingbackRequested*(): jboolean
  proc getHandlePresentation*(): jint
  proc getCallDirection*(): jint
  proc getCallerDisplayName*(): string
  proc getCallerDisplayNamePresentation*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(destination: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[ParcelableConference] {.`static`.}

jclass android.telecom.ParcelableConference.Builder* of JVMObject:
  proc setDisconnectCause*(cause: DisconnectCause): Builder
  proc setRingbackRequested*(requested: jboolean): Builder
  proc setCallerDisplayName*(callerDisplayName: string, callerDisplayNamePresentation: jint): Builder
  proc setAddress*(address: Uri, addressPresentation: jint): Builder
  proc setExtras*(extras: Bundle): Builder
  proc setStatusHints*(hints: StatusHints): Builder
  proc setConnectTimeMillis*(connectTimeMillis: jlong, connectElapsedTimeMillis: jlong): Builder
  proc setVideoAttributes*(provider: IVideoProvider, videoState: jint): Builder
  proc setConnectionIds*(connectionIds: List[string]): Builder
  proc setConnectionProperties*(properties: jint): Builder
  proc setConnectionCapabilities*(capabilities: jint): Builder
  proc setCallDirection*(callDirection: jint): Builder
  proc build*(): ParcelableConference

jclass android.telecom.Builder* of JVMObject:
  proc setDisconnectCause*(cause: DisconnectCause): Builder
  proc setRingbackRequested*(requested: jboolean): Builder
  proc setCallerDisplayName*(callerDisplayName: string, callerDisplayNamePresentation: jint): Builder
  proc setAddress*(address: Uri, addressPresentation: jint): Builder
  proc setExtras*(extras: Bundle): Builder
  proc setStatusHints*(hints: StatusHints): Builder
  proc setConnectTimeMillis*(connectTimeMillis: jlong, connectElapsedTimeMillis: jlong): Builder
  proc setVideoAttributes*(provider: IVideoProvider, videoState: jint): Builder
  proc setConnectionIds*(connectionIds: List[string]): Builder
  proc setConnectionProperties*(properties: jint): Builder
  proc setConnectionCapabilities*(capabilities: jint): Builder
  proc setCallDirection*(callDirection: jint): Builder
  proc build*(): ParcelableConference

