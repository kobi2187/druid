import jnim

jclass android.telecom.Connection* of Conferenceable:
  proc capabilitiesToString*(capabilities: jint): string {.`static`.}
  proc capabilitiesToStringShort*(capabilities: jint): string {.`static`.}
  proc propertiesToString*(properties: jint): string {.`static`.}
  proc propertiesToStringShort*(properties: jint): string {.`static`.}
  proc getTelecomCallId*(): string
  proc getAddress*(): Uri
  proc getAddressPresentation*(): jint
  proc getCallerDisplayName*(): string
  proc getCallerDisplayNamePresentation*(): jint
  proc getState*(): jint
  proc getVideoState*(): jint
  proc getAudioState*(): AudioState
  proc getCallAudioState*(): CallAudioState
  proc getConference*(): Conference
  proc isRingbackRequested*(): jboolean
  proc getAudioModeIsVoip*(): jboolean
  proc getConnectTimeMillis*(): jlong
  proc getConnectionStartElapsedRealtimeMillis*(): jlong
  proc getStatusHints*(): StatusHints
  proc getExtras*(): Bundle
  proc getDisconnectCause*(): DisconnectCause
  proc setTelecomCallId*(callId: string)
  proc stateToString*(state: jint): string {.`static`.}
  proc getConnectionCapabilities*(): jint
  proc getConnectionProperties*(): jint
  proc getSupportedAudioRoutes*(): jint
  proc setAddress*(address: Uri, presentation: jint)
  proc setCallerDisplayName*(callerDisplayName: string, presentation: jint)
  proc setVideoState*(videoState: jint)
  proc setActive*()
  proc setRinging*()
  proc setInitializing*()
  proc setInitialized*()
  proc setDialing*()
  proc setPulling*()
  proc setOnHold*()
  proc setVideoProvider*(videoProvider: VideoProvider)
  proc getVideoProvider*(): VideoProvider
  proc setDisconnected*(disconnectCause: DisconnectCause)
  proc setPostDialWait*(remaining: string)
  proc setNextPostDialChar*(nextChar: jchar)
  proc setRingbackRequested*(ringback: jboolean)
  proc setConnectionCapabilities*(connectionCapabilities: jint)
  proc setConnectionProperties*(connectionProperties: jint)
  proc setSupportedAudioRoutes*(supportedAudioRoutes: jint)
  proc destroy*()
  proc setAudioModeIsVoip*(isVoip: jboolean)
  proc setConnectTimeMillis*(connectTimeMillis: jlong)
  proc setConnectionStartElapsedRealtimeMillis*(connectElapsedTimeMillis: jlong)
  proc setStatusHints*(statusHints: StatusHints)
  proc setConferenceableConnections*(conferenceableConnections: List[Connection])
  proc setConferenceables*(conferenceables: List[Conferenceable])
  proc resetConnectionTime*()
  proc getConferenceables*(): List[Conferenceable]
  proc setConnectionService*(connectionService: ConnectionService)
  proc unsetConnectionService*(connectionService: ConnectionService)
  proc setConference*(conference: Conference): jboolean
  proc resetConference*()
  proc setExtras*(extras: Bundle)
  proc putExtras*(extras: Bundle)
  proc removeExtras*(keys: List[string])
  proc removeExtras*(keys: string)
  proc setAudioRoute*(route: jint)
  proc requestBluetoothAudio*(bluetoothDevice: BluetoothDevice)
  proc requestCallEndpointChange*(endpoint: CallEndpoint, executor: Executor, callback: OutcomeReceiver[Void, CallEndpointException])
  proc getCurrentCallEndpoint*(): CallEndpoint
  proc sendRttInitiationSuccess*()
  proc sendRttInitiationFailure*(reason: jint)
  proc sendRttSessionRemotelyTerminated*()
  proc sendRemoteRttRequest*()
  proc queryLocationForEmergency*(timeoutMillis: jlong, provider: string, executor: Executor, callback: OutcomeReceiver[Location, QueryLocationException])
  proc onAudioStateChanged*(state: AudioState)
  proc onCallAudioStateChanged*(state: CallAudioState)
  proc onCallEndpointChanged*(callEndpoint: CallEndpoint)
  proc onAvailableCallEndpointsChanged*(availableEndpoints: List[CallEndpoint])
  proc onMuteStateChanged*(isMuted: jboolean)
  proc onUsingAlternativeUi*(isUsingAlternativeUi: jboolean)
  proc onTrackedByNonUiService*(isTracked: jboolean)
  proc onStateChanged*(state: jint)
  proc onPlayDtmfTone*(c: jchar)
  proc onStopDtmfTone*()
  proc onDisconnect*()
  proc onSeparate*()
  proc onAddConferenceParticipants*(participants: List[Uri])
  proc onAbort*()
  proc onHold*()
  proc onUnhold*()
  proc onAnswer*(videoState: jint)
  proc onAnswer*()
  proc onDeflect*(address: Uri)
  proc onReject*()
  proc onReject*(rejectReason: jint)
  proc onReject*(replyMessage: string)
  proc onTransfer*(number: Uri, isConfirmationRequired: jboolean)
  proc onTransfer*(otherConnection: Connection)
  proc onSilence*()
  proc onPostDialContinue*(proceed: jboolean)
  proc onPullExternalCall*()
  proc onCallEvent*(event: string, extras: Bundle)
  proc onHandoverComplete*()
  proc onExtrasChanged*(extras: Bundle)
  proc onShowIncomingCallUi*()
  proc onStartRtt*(rttTextStream: RttTextStream)
  proc onStopRtt*()
  proc handleRttUpgradeResponse*(rttTextStream: RttTextStream)
  proc onCallFilteringCompleted*(callFilteringCompletionInfo: CallFilteringCompletionInfo)
  proc createFailedConnection*(disconnectCause: DisconnectCause): Connection {.`static`.}
  proc checkImmutable*()
  proc createCanceledConnection*(): Connection {.`static`.}
  proc notifyConferenceMergeFailed*()
  proc notifyPhoneAccountChanged*(pHandle: PhoneAccountHandle)
  proc setPhoneAccountHandle*(phoneAccountHandle: PhoneAccountHandle)
  proc getPhoneAccountHandle*(): PhoneAccountHandle
  proc sendConnectionEvent*(event: string, extras: Bundle)
  proc getCallDirection*(): jint
  proc setCallDirection*(callDirection: jint)
  proc getCallerNumberVerificationStatus*(): jint
  proc setCallerNumberVerificationStatus*(callerNumberVerificationStatus: jint)
  STATE_INITIALIZING*: jint {.`static`.}
  STATE_NEW*: jint {.`static`.}
  STATE_RINGING*: jint {.`static`.}
  STATE_DIALING*: jint {.`static`.}
  STATE_ACTIVE*: jint {.`static`.}
  STATE_HOLDING*: jint {.`static`.}
  STATE_DISCONNECTED*: jint {.`static`.}
  STATE_PULLING_CALL*: jint {.`static`.}
  VERIFICATION_STATUS_NOT_VERIFIED*: jint {.`static`.}
  VERIFICATION_STATUS_PASSED*: jint {.`static`.}
  VERIFICATION_STATUS_FAILED*: jint {.`static`.}
  CAPABILITY_HOLD*: jint {.`static`.}
  CAPABILITY_SUPPORT_HOLD*: jint {.`static`.}
  CAPABILITY_MERGE_CONFERENCE*: jint {.`static`.}
  CAPABILITY_SWAP_CONFERENCE*: jint {.`static`.}
  CAPABILITY_UNUSED*: jint {.`static`.}
  CAPABILITY_RESPOND_VIA_TEXT*: jint {.`static`.}
  CAPABILITY_MUTE*: jint {.`static`.}
  CAPABILITY_MANAGE_CONFERENCE*: jint {.`static`.}
  CAPABILITY_SUPPORTS_VT_LOCAL_RX*: jint {.`static`.}
  CAPABILITY_SUPPORTS_VT_LOCAL_TX*: jint {.`static`.}
  CAPABILITY_SUPPORTS_VT_LOCAL_BIDIRECTIONAL*: jint {.`static`.}
  CAPABILITY_SUPPORTS_VT_REMOTE_RX*: jint {.`static`.}
  CAPABILITY_SUPPORTS_VT_REMOTE_TX*: jint {.`static`.}
  CAPABILITY_SUPPORTS_VT_REMOTE_BIDIRECTIONAL*: jint {.`static`.}
  CAPABILITY_SEPARATE_FROM_CONFERENCE*: jint {.`static`.}
  CAPABILITY_DISCONNECT_FROM_CONFERENCE*: jint {.`static`.}
  CAPABILITY_UNUSED_2*: jint {.`static`.}
  CAPABILITY_UNUSED_3*: jint {.`static`.}
  CAPABILITY_UNUSED_4*: jint {.`static`.}
  CAPABILITY_UNUSED_5*: jint {.`static`.}
  CAPABILITY_SPEED_UP_MT_AUDIO*: jint {.`static`.}
  CAPABILITY_CAN_UPGRADE_TO_VIDEO*: jint {.`static`.}
  CAPABILITY_CAN_PAUSE_VIDEO*: jint {.`static`.}
  CAPABILITY_CONFERENCE_HAS_NO_CHILDREN*: jint {.`static`.}
  CAPABILITY_CAN_SEND_RESPONSE_VIA_CONNECTION*: jint {.`static`.}
  CAPABILITY_CANNOT_DOWNGRADE_VIDEO_TO_AUDIO*: jint {.`static`.}
  CAPABILITY_CAN_PULL_CALL*: jint {.`static`.}
  CAPABILITY_SUPPORT_DEFLECT*: jint {.`static`.}
  CAPABILITY_ADD_PARTICIPANT*: jint {.`static`.}
  CAPABILITY_TRANSFER*: jint {.`static`.}
  CAPABILITY_TRANSFER_CONSULTATIVE*: jint {.`static`.}
  CAPABILITY_REMOTE_PARTY_SUPPORTS_RTT*: jint {.`static`.}
  PROPERTY_EMERGENCY_CALLBACK_MODE*: jint {.`static`.}
  PROPERTY_GENERIC_CONFERENCE*: jint {.`static`.}
  PROPERTY_HIGH_DEF_AUDIO*: jint {.`static`.}
  PROPERTY_WIFI*: jint {.`static`.}
  PROPERTY_IS_EXTERNAL_CALL*: jint {.`static`.}
  PROPERTY_HAS_CDMA_VOICE_PRIVACY*: jint {.`static`.}
  PROPERTY_IS_DOWNGRADED_CONFERENCE*: jint {.`static`.}
  PROPERTY_SELF_MANAGED*: jint {.`static`.}
  PROPERTY_IS_RTT*: jint {.`static`.}
  PROPERTY_ASSISTED_DIALING*: jint {.`static`.}
  PROPERTY_NETWORK_IDENTIFIED_EMERGENCY_CALL*: jint {.`static`.}
  PROPERTY_REMOTELY_HOSTED*: jint {.`static`.}
  PROPERTY_IS_ADHOC_CONFERENCE*: jint {.`static`.}
  PROPERTY_CROSS_SIM*: jint {.`static`.}
  AUDIO_CODEC_NONE*: jint {.`static`.}
  AUDIO_CODEC_AMR*: jint {.`static`.}
  AUDIO_CODEC_AMR_WB*: jint {.`static`.}
  AUDIO_CODEC_QCELP13K*: jint {.`static`.}
  AUDIO_CODEC_EVRC*: jint {.`static`.}
  AUDIO_CODEC_EVRC_B*: jint {.`static`.}
  AUDIO_CODEC_EVRC_WB*: jint {.`static`.}
  AUDIO_CODEC_EVRC_NW*: jint {.`static`.}
  AUDIO_CODEC_GSM_EFR*: jint {.`static`.}
  AUDIO_CODEC_GSM_FR*: jint {.`static`.}
  AUDIO_CODEC_GSM_HR*: jint {.`static`.}
  AUDIO_CODEC_G711U*: jint {.`static`.}
  AUDIO_CODEC_G723*: jint {.`static`.}
  AUDIO_CODEC_G711A*: jint {.`static`.}
  AUDIO_CODEC_G722*: jint {.`static`.}
  AUDIO_CODEC_G711AB*: jint {.`static`.}
  AUDIO_CODEC_G729*: jint {.`static`.}
  AUDIO_CODEC_EVS_NB*: jint {.`static`.}
  AUDIO_CODEC_EVS_WB*: jint {.`static`.}
  AUDIO_CODEC_EVS_SWB*: jint {.`static`.}
  AUDIO_CODEC_EVS_FB*: jint {.`static`.}
  EXTRA_CALLER_NUMBER_VERIFICATION_STATUS*: string {.`static`.}
  EXTRA_LAST_FORWARDED_NUMBER*: string {.`static`.}
  EXTRA_CHILD_ADDRESS*: string {.`static`.}
  EXTRA_CALL_SUBJECT*: string {.`static`.}
  EXTRA_ANSWERING_DROPS_FG_CALL*: string {.`static`.}
  EXTRA_ANSWERING_DROPS_FG_CALL_APP_NAME*: string {.`static`.}
  EXTRA_DISABLE_ADD_CALL*: string {.`static`.}
  EXTRA_ORIGINAL_CONNECTION_ID*: string {.`static`.}
  EXTRA_REMOTE_PHONE_ACCOUNT_HANDLE*: string {.`static`.}
  EXTRA_ADD_TO_CONFERENCE_ID*: string {.`static`.}
  EXTRA_REMOTE_CONNECTION_ORIGINATING_PACKAGE_NAME*: string {.`static`.}
  EXTRA_IS_RTT_AUDIO_PRESENT*: string {.`static`.}
  EXTRA_AUDIO_CODEC*: string {.`static`.}
  EXTRA_AUDIO_CODEC_BITRATE_KBPS*: string {.`static`.}
  EXTRA_AUDIO_CODEC_BANDWIDTH_KHZ*: string {.`static`.}
  EXTRA_LAST_KNOWN_CELL_IDENTITY*: string {.`static`.}
  EXTRA_IS_DEVICE_TO_DEVICE_COMMUNICATION_AVAILABLE*: string {.`static`.}
  EVENT_ON_HOLD_TONE_START*: string {.`static`.}
  EVENT_ON_HOLD_TONE_END*: string {.`static`.}
  EVENT_CALL_PULL_FAILED*: string {.`static`.}
  EVENT_CALL_MERGE_FAILED*: string {.`static`.}
  EVENT_CALL_HOLD_FAILED*: string {.`static`.}
  EVENT_CALL_RESUME_FAILED*: string {.`static`.}
  EVENT_CALL_SWITCH_FAILED*: string {.`static`.}
  EVENT_MERGE_START*: string {.`static`.}
  EVENT_MERGE_COMPLETE*: string {.`static`.}
  EVENT_CALL_REMOTELY_HELD*: string {.`static`.}
  EVENT_CALL_REMOTELY_UNHELD*: string {.`static`.}
  EXTRA_SIP_INVITE*: string {.`static`.}
  EVENT_RTT_AUDIO_INDICATION_CHANGED*: string {.`static`.}
  EVENT_DEVICE_TO_DEVICE_MESSAGE*: string {.`static`.}
  EXTRA_DEVICE_TO_DEVICE_MESSAGE_TYPE*: string {.`static`.}
  EXTRA_DEVICE_TO_DEVICE_MESSAGE_VALUE*: string {.`static`.}
  EVENT_CALL_QUALITY_REPORT*: string {.`static`.}
  EXTRA_CALL_QUALITY_REPORT*: string {.`static`.}
  EXTRA_KEY_QUERY_LOCATION*: string {.`static`.}

jclass android.telecom.Connection.RttTextStream* of JVMObject:
  proc write*(input: string)
  proc read*(): string
  proc readImmediately*(): string
  proc getFdFromInCall*(): ParcelFileDescriptor
  proc getFdToInCall*(): ParcelFileDescriptor

jclass android.telecom.Connection.VideoProvider* of JVMObject:
  proc getInterface*(): IVideoProvider
  proc onSetCamera*(cameraId: string)
  proc onSetCamera*(cameraId: string, callingPackageName: string, callingUid: jint, callingPid: jint, targetSdkVersion: jint)
  proc onSetPreviewSurface*(surface: Surface)
  proc onSetDisplaySurface*(surface: Surface)
  proc onSetDeviceOrientation*(rotation: jint)
  proc onSetZoom*(value: jfloat)
  proc onSendSessionModifyRequest*(fromProfile: VideoProfile, toProfile: VideoProfile)
  proc onSendSessionModifyResponse*(responseProfile: VideoProfile)
  proc onRequestCameraCapabilities*()
  proc onRequestConnectionDataUsage*()
  proc onSetPauseImage*(uri: Uri)
  proc receiveSessionModifyRequest*(videoProfile: VideoProfile)
  proc receiveSessionModifyResponse*(status: jint, requestedProfile: VideoProfile, responseProfile: VideoProfile)
  proc handleCallSessionEvent*(event: jint)
  proc changePeerDimensions*(width: jint, height: jint)
  proc setCallDataUsage*(dataUsage: jlong)
  proc changeCallDataUsage*(dataUsage: jlong)
  proc changeCameraCapabilities*(cameraCapabilities: VideoProfile.CameraCapabilities)
  proc changeVideoQuality*(videoQuality: jint)
  proc sessionEventToString*(event: jint): string {.`static`.}

jclass android.telecom.Connection.CallFilteringCompletionInfo* of JVMObject:
  proc isBlocked*(): jboolean
  proc isInContacts*(): jboolean
  proc getCallResponse*(): CallScreeningService.CallResponse
  proc getCallScreeningComponent*(): ComponentName
  proc describeContents*(): jint
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)

jclass android.telecom.RttTextStream* of JVMObject:
  proc write*(input: string)
  proc read*(): string
  proc readImmediately*(): string
  proc getFdFromInCall*(): ParcelFileDescriptor
  proc getFdToInCall*(): ParcelFileDescriptor

jclass android.telecom.RttModifyStatus* of JVMObject:
  SESSION_MODIFY_REQUEST_SUCCESS*: jint {.`static`.}
  SESSION_MODIFY_REQUEST_FAIL*: jint {.`static`.}
  SESSION_MODIFY_REQUEST_INVALID*: jint {.`static`.}
  SESSION_MODIFY_REQUEST_TIMED_OUT*: jint {.`static`.}
  SESSION_MODIFY_REQUEST_REJECTED_BY_REMOTE*: jint {.`static`.}

jclass android.telecom.VideoProvider* of JVMObject:
  proc getInterface*(): IVideoProvider
  proc onSetCamera*(cameraId: string)
  proc onSetCamera*(cameraId: string, callingPackageName: string, callingUid: jint, callingPid: jint, targetSdkVersion: jint)
  proc onSetPreviewSurface*(surface: Surface)
  proc onSetDisplaySurface*(surface: Surface)
  proc onSetDeviceOrientation*(rotation: jint)
  proc onSetZoom*(value: jfloat)
  proc onSendSessionModifyRequest*(fromProfile: VideoProfile, toProfile: VideoProfile)
  proc onSendSessionModifyResponse*(responseProfile: VideoProfile)
  proc onRequestCameraCapabilities*()
  proc onRequestConnectionDataUsage*()
  proc onSetPauseImage*(uri: Uri)
  proc receiveSessionModifyRequest*(videoProfile: VideoProfile)
  proc receiveSessionModifyResponse*(status: jint, requestedProfile: VideoProfile, responseProfile: VideoProfile)
  proc handleCallSessionEvent*(event: jint)
  proc changePeerDimensions*(width: jint, height: jint)
  proc setCallDataUsage*(dataUsage: jlong)
  proc changeCallDataUsage*(dataUsage: jlong)
  proc changeCameraCapabilities*(cameraCapabilities: VideoProfile.CameraCapabilities)
  proc changeVideoQuality*(videoQuality: jint)
  proc sessionEventToString*(event: jint): string {.`static`.}
  SESSION_EVENT_RX_PAUSE*: jint {.`static`.}
  SESSION_EVENT_RX_RESUME*: jint {.`static`.}
  SESSION_EVENT_TX_START*: jint {.`static`.}
  SESSION_EVENT_TX_STOP*: jint {.`static`.}
  SESSION_EVENT_CAMERA_FAILURE*: jint {.`static`.}
  SESSION_EVENT_CAMERA_READY*: jint {.`static`.}
  SESSION_EVENT_CAMERA_PERMISSION_ERROR*: jint {.`static`.}
  SESSION_MODIFY_REQUEST_SUCCESS*: jint {.`static`.}
  SESSION_MODIFY_REQUEST_FAIL*: jint {.`static`.}
  SESSION_MODIFY_REQUEST_INVALID*: jint {.`static`.}
  SESSION_MODIFY_REQUEST_TIMED_OUT*: jint {.`static`.}
  SESSION_MODIFY_REQUEST_REJECTED_BY_REMOTE*: jint {.`static`.}

jclass android.telecom.CallFilteringCompletionInfo* of JVMObject:
  proc isBlocked*(): jboolean
  proc isInContacts*(): jboolean
  proc getCallResponse*(): CallScreeningService.CallResponse
  proc getCallScreeningComponent*(): ComponentName
  proc describeContents*(): jint
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[CallFilteringCompletionInfo] {.`static`.}

