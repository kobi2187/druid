import jnim

jclass android.telecom.ParcelableCall* of JVMObject:
  proc getId*(): string
  proc getState*(): jint
  proc getDisconnectCause*(): DisconnectCause
  proc getCannedSmsResponses*(): List[string]
  proc getCapabilities*(): jint
  proc getProperties*(): jint
  proc getSupportedAudioRoutes*(): jint
  proc getConnectTimeMillis*(): jlong
  proc getHandle*(): Uri
  proc getHandlePresentation*(): jint
  proc getCallerDisplayName*(): string
  proc getCallerDisplayNamePresentation*(): jint
  proc getGatewayInfo*(): GatewayInfo
  proc getAccountHandle*(): PhoneAccountHandle
  proc getVideoCallImpl*(callingPackageName: string, targetSdkVersion: jint): VideoCallImpl
  proc getVideoProvider*(): IVideoProvider
  proc getIsRttCallChanged*(): jboolean
  proc getParcelableRttCall*(): ParcelableRttCall
  proc getParentCallId*(): string
  proc getChildCallIds*(): List[string]
  proc getConferenceableCallIds*(): List[string]
  proc getStatusHints*(): StatusHints
  proc getVideoState*(): jint
  proc getExtras*(): Bundle
  proc getIntentExtras*(): Bundle
  proc isVideoCallProviderChanged*(): jboolean
  proc getCreationTimeMillis*(): jlong
  proc getCallDirection*(): jint
  proc getCallerNumberVerificationStatus*(): jint
  proc getContactDisplayName*(): string
  proc getContactPhotoUri*(): Uri
  proc getAssociatedUser*(): UserHandle
  proc getActiveChildCallId*(): string
  proc describeContents*(): jint
  proc writeToParcel*(destination: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Parcelable.Creator[ParcelableCall] {.`static`.}

jclass android.telecom.ParcelableCall.ParcelableCallBuilder* of JVMObject:
  proc setId*(id: string): ParcelableCallBuilder
  proc setState*(state: jint): ParcelableCallBuilder
  proc setDisconnectCause*(disconnectCause: DisconnectCause): ParcelableCallBuilder
  proc setCannedSmsResponses*(cannedSmsResponses: List[string]): ParcelableCallBuilder
  proc setCapabilities*(capabilities: jint): ParcelableCallBuilder
  proc setProperties*(properties: jint): ParcelableCallBuilder
  proc setSupportedAudioRoutes*(supportedAudioRoutes: jint): ParcelableCallBuilder
  proc setConnectTimeMillis*(connectTimeMillis: jlong): ParcelableCallBuilder
  proc setHandle*(handle: Uri): ParcelableCallBuilder
  proc setHandlePresentation*(handlePresentation: jint): ParcelableCallBuilder
  proc setCallerDisplayName*(callerDisplayName: string): ParcelableCallBuilder
  proc setCallerDisplayNamePresentation*(callerDisplayNamePresentation: jint): ParcelableCallBuilder
  proc setGatewayInfo*(gatewayInfo: GatewayInfo): ParcelableCallBuilder
  proc setAccountHandle*(accountHandle: PhoneAccountHandle): ParcelableCallBuilder
  proc setIsVideoCallProviderChanged*(isVideoCallProviderChanged: jboolean): ParcelableCallBuilder
  proc setVideoCallProvider*(videoCallProvider: IVideoProvider): ParcelableCallBuilder
  proc setIsRttCallChanged*(isRttCallChanged: jboolean): ParcelableCallBuilder
  proc setRttCall*(rttCall: ParcelableRttCall): ParcelableCallBuilder
  proc setParentCallId*(parentCallId: string): ParcelableCallBuilder
  proc setChildCallIds*(childCallIds: List[string]): ParcelableCallBuilder
  proc setStatusHints*(statusHints: StatusHints): ParcelableCallBuilder
  proc setVideoState*(videoState: jint): ParcelableCallBuilder
  proc setConferenceableCallIds*(conferenceableCallIds: List[string]): ParcelableCallBuilder
  proc setIntentExtras*(intentExtras: Bundle): ParcelableCallBuilder
  proc setExtras*(extras: Bundle): ParcelableCallBuilder
  proc setCreationTimeMillis*(creationTimeMillis: jlong): ParcelableCallBuilder
  proc setCallDirection*(callDirection: jint): ParcelableCallBuilder
  proc setCallerNumberVerificationStatus*(callerNumberVerificationStatus: jint): ParcelableCallBuilder
  proc setContactDisplayName*(contactDisplayName: string): ParcelableCallBuilder
  proc setActiveChildCallId*(activeChildCallId: string): ParcelableCallBuilder
  proc setContactPhotoUri*(contactPhotoUri: Uri): ParcelableCallBuilder
  proc setAssociatedUser*(user: UserHandle): ParcelableCallBuilder
  proc createParcelableCall*(): ParcelableCall
  proc fromParcelableCall*(parcelableCall: ParcelableCall): ParcelableCallBuilder {.`static`.}

jclass android.telecom.ParcelableCallBuilder* of JVMObject:
  proc setId*(id: string): ParcelableCallBuilder
  proc setState*(state: jint): ParcelableCallBuilder
  proc setDisconnectCause*(disconnectCause: DisconnectCause): ParcelableCallBuilder
  proc setCannedSmsResponses*(cannedSmsResponses: List[string]): ParcelableCallBuilder
  proc setCapabilities*(capabilities: jint): ParcelableCallBuilder
  proc setProperties*(properties: jint): ParcelableCallBuilder
  proc setSupportedAudioRoutes*(supportedAudioRoutes: jint): ParcelableCallBuilder
  proc setConnectTimeMillis*(connectTimeMillis: jlong): ParcelableCallBuilder
  proc setHandle*(handle: Uri): ParcelableCallBuilder
  proc setHandlePresentation*(handlePresentation: jint): ParcelableCallBuilder
  proc setCallerDisplayName*(callerDisplayName: string): ParcelableCallBuilder
  proc setCallerDisplayNamePresentation*(callerDisplayNamePresentation: jint): ParcelableCallBuilder
  proc setGatewayInfo*(gatewayInfo: GatewayInfo): ParcelableCallBuilder
  proc setAccountHandle*(accountHandle: PhoneAccountHandle): ParcelableCallBuilder
  proc setIsVideoCallProviderChanged*(isVideoCallProviderChanged: jboolean): ParcelableCallBuilder
  proc setVideoCallProvider*(videoCallProvider: IVideoProvider): ParcelableCallBuilder
  proc setIsRttCallChanged*(isRttCallChanged: jboolean): ParcelableCallBuilder
  proc setRttCall*(rttCall: ParcelableRttCall): ParcelableCallBuilder
  proc setParentCallId*(parentCallId: string): ParcelableCallBuilder
  proc setChildCallIds*(childCallIds: List[string]): ParcelableCallBuilder
  proc setStatusHints*(statusHints: StatusHints): ParcelableCallBuilder
  proc setVideoState*(videoState: jint): ParcelableCallBuilder
  proc setConferenceableCallIds*(conferenceableCallIds: List[string]): ParcelableCallBuilder
  proc setIntentExtras*(intentExtras: Bundle): ParcelableCallBuilder
  proc setExtras*(extras: Bundle): ParcelableCallBuilder
  proc setCreationTimeMillis*(creationTimeMillis: jlong): ParcelableCallBuilder
  proc setCallDirection*(callDirection: jint): ParcelableCallBuilder
  proc setCallerNumberVerificationStatus*(callerNumberVerificationStatus: jint): ParcelableCallBuilder
  proc setContactDisplayName*(contactDisplayName: string): ParcelableCallBuilder
  proc setActiveChildCallId*(activeChildCallId: string): ParcelableCallBuilder
  proc setContactPhotoUri*(contactPhotoUri: Uri): ParcelableCallBuilder
  proc setAssociatedUser*(user: UserHandle): ParcelableCallBuilder
  proc createParcelableCall*(): ParcelableCall
  proc fromParcelableCall*(parcelableCall: ParcelableCall): ParcelableCallBuilder {.`static`.}

