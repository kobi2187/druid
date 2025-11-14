import jnim

jclass android.telecom.Call* of JVMObject:
  proc getRemainingPostDialSequence*(): string
  proc answer*(videoState: jint)
  proc deflect*(address: Uri)
  proc reject*(rejectWithMessage: jboolean, textMessage: string)
  proc reject*(rejectReason: jint)
  proc transfer*(targetNumber: Uri, isConfirmationRequired: jboolean)
  proc transfer*(toCall: android.telecom.Call)
  proc disconnect*()
  proc hold*()
  proc unhold*()
  proc enterBackgroundAudioProcessing*()
  proc exitBackgroundAudioProcessing*(shouldRing: jboolean)
  proc playDtmfTone*(digit: jchar)
  proc stopDtmfTone*()
  proc postDialContinue*(proceed: jboolean)
  proc phoneAccountSelected*(accountHandle: PhoneAccountHandle, setDefault: jboolean)
  proc conference*(callToConferenceWith: Call)
  proc splitFromConference*()
  proc mergeConference*()
  proc swapConference*()
  proc addConferenceParticipants*(participants: List[Uri])
  proc pullExternalCall*()
  proc sendCallEvent*(event: string, extras: Bundle)
  proc sendRttRequest*()
  proc respondToRttRequest*(id: jint, accept: jboolean)
  proc handoverTo*(toHandle: PhoneAccountHandle, videoState: jint, extras: Bundle)
  proc stopRtt*()
  proc putExtras*(extras: Bundle)
  proc putExtra*(key: string, value: jboolean)
  proc putExtra*(key: string, value: jint)
  proc putExtra*(key: string, value: string)
  proc removeExtras*(keys: List[string])
  proc removeExtras*(keys: string)
  proc getParent*(): Call
  proc getChildren*(): List[Call]
  proc getConferenceableCalls*(): List[Call]
  proc getState*(): jint
  proc getGenericConferenceActiveChildCall*(): Call
  proc getCannedTextResponses*(): List[string]
  proc getVideoCall*(): InCallService.VideoCall
  proc getDetails*(): Details
  proc getRttCall*(): RttCall
  proc isRttActive*(): jboolean
  proc registerCallback*(callback: Callback)
  proc registerCallback*(callback: Callback, handler: Handler)
  proc unregisterCallback*(callback: Callback)
  proc toString*(): string
  proc addListener*(listener: Listener)
  proc removeListener*(listener: Listener)
  STATE_NEW*: jint {.`static`.}
  STATE_DIALING*: jint {.`static`.}
  STATE_RINGING*: jint {.`static`.}
  STATE_HOLDING*: jint {.`static`.}
  STATE_ACTIVE*: jint {.`static`.}
  STATE_DISCONNECTED*: jint {.`static`.}
  STATE_SELECT_PHONE_ACCOUNT*: jint {.`static`.}
  STATE_PRE_DIAL_WAIT*: jint {.`static`.}
  STATE_CONNECTING*: jint {.`static`.}
  STATE_DISCONNECTING*: jint {.`static`.}
  STATE_PULLING_CALL*: jint {.`static`.}
  STATE_AUDIO_PROCESSING*: jint {.`static`.}
  STATE_SIMULATED_RINGING*: jint {.`static`.}
  AVAILABLE_PHONE_ACCOUNTS*: string {.`static`.}
  EXTRA_IS_SUPPRESSED_BY_DO_NOT_DISTURB*: string {.`static`.}
  EXTRA_SUGGESTED_PHONE_ACCOUNTS*: string {.`static`.}
  EXTRA_LAST_EMERGENCY_CALLBACK_TIME_MILLIS*: string {.`static`.}
  EXTRA_SILENT_RINGING_REQUESTED*: string {.`static`.}
  EVENT_DISPLAY_DIAGNOSTIC_MESSAGE*: string {.`static`.}
  EVENT_CLEAR_DIAGNOSTIC_MESSAGE*: string {.`static`.}
  EXTRA_DIAGNOSTIC_MESSAGE_ID*: string {.`static`.}
  EXTRA_DIAGNOSTIC_MESSAGE*: string {.`static`.}
  EXTRA_IS_BUSINESS_CALL*: string {.`static`.}
  EXTRA_ASSERTED_DISPLAY_NAME*: string {.`static`.}
  REJECT_REASON_DECLINED*: jint {.`static`.}
  REJECT_REASON_UNWANTED*: jint {.`static`.}

jclass android.telecom.Call.Details* of JVMObject:
  proc can*(capabilities: jint, capability: jint): jboolean {.`static`.}
  proc can*(capability: jint): jboolean
  proc capabilitiesToString*(capabilities: jint): string {.`static`.}
  proc hasProperty*(properties: jint, property: jint): jboolean {.`static`.}
  proc hasProperty*(property: jint): jboolean
  proc propertiesToString*(properties: jint): string {.`static`.}
  proc getState*(): jint
  proc getId*(): string
  proc getTelecomCallId*(): string
  proc getHandle*(): Uri
  proc getHandlePresentation*(): jint
  proc getContactPhotoUri*(): Uri
  proc getCallerDisplayName*(): string
  proc getCallerDisplayNamePresentation*(): jint
  proc getAccountHandle*(): PhoneAccountHandle
  proc getCallCapabilities*(): jint
  proc getCallProperties*(): jint
  proc getSupportedAudioRoutes*(): jint
  proc getDisconnectCause*(): DisconnectCause
  proc getConnectTimeMillis*(): jlong
  proc getGatewayInfo*(): GatewayInfo
  proc getVideoState*(): jint
  proc getStatusHints*(): StatusHints
  proc getExtras*(): Bundle
  proc getIntentExtras*(): Bundle
  proc getCreationTimeMillis*(): jlong
  proc getContactDisplayName*(): string
  proc getCallDirection*(): jint
  proc getCallerNumberVerificationStatus*(): jint
  proc getAssociatedUser*(): UserHandle
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc createFromParcelableCall*(parcelableCall: ParcelableCall): Details {.`static`.}
  proc toString*(): string

jclass android.telecom.Call.Callback* of JVMObject:
  proc onStateChanged*(call: Call, state: jint)
  proc onParentChanged*(call: Call, parent: Call)
  proc onChildrenChanged*(call: Call, children: List[Call])
  proc onDetailsChanged*(call: Call, details: Details)
  proc onCannedTextResponsesLoaded*(call: Call, cannedTextResponses: List[string])
  proc onPostDialWait*(call: Call, remainingPostDialSequence: string)
  proc onVideoCallChanged*(call: Call, videoCall: InCallService.VideoCall)
  proc onCallDestroyed*(call: Call)
  proc onConferenceableCallsChanged*(call: Call, conferenceableCalls: List[Call])
  proc onConnectionEvent*(call: Call, event: string, extras: Bundle)
  proc onRttModeChanged*(call: Call, mode: jint)
  proc onRttStatusChanged*(call: Call, enabled: jboolean, rttCall: RttCall)
  proc onRttRequest*(call: Call, id: jint)
  proc onRttInitiationFailure*(call: Call, reason: jint)
  proc onHandoverComplete*(call: Call)
  proc onHandoverFailed*(call: Call, failureReason: jint)

jclass android.telecom.Call.RttCall* of JVMObject:
  proc getRttAudioMode*(): jint
  proc setRttMode*(mode: jint)
  proc write*(input: string)
  proc read*(): string
  proc readImmediately*(): string
  proc close*()

jclass android.telecom.Details* of JVMObject:
  proc can*(capabilities: jint, capability: jint): jboolean {.`static`.}
  proc can*(capability: jint): jboolean
  proc capabilitiesToString*(capabilities: jint): string {.`static`.}
  proc hasProperty*(properties: jint, property: jint): jboolean {.`static`.}
  proc hasProperty*(property: jint): jboolean
  proc propertiesToString*(properties: jint): string {.`static`.}
  proc getState*(): jint
  proc getId*(): string
  proc getTelecomCallId*(): string
  proc getHandle*(): Uri
  proc getHandlePresentation*(): jint
  proc getContactPhotoUri*(): Uri
  proc getCallerDisplayName*(): string
  proc getCallerDisplayNamePresentation*(): jint
  proc getAccountHandle*(): PhoneAccountHandle
  proc getCallCapabilities*(): jint
  proc getCallProperties*(): jint
  proc getSupportedAudioRoutes*(): jint
  proc getDisconnectCause*(): DisconnectCause
  proc getConnectTimeMillis*(): jlong
  proc getGatewayInfo*(): GatewayInfo
  proc getVideoState*(): jint
  proc getStatusHints*(): StatusHints
  proc getExtras*(): Bundle
  proc getIntentExtras*(): Bundle
  proc getCreationTimeMillis*(): jlong
  proc getContactDisplayName*(): string
  proc getCallDirection*(): jint
  proc getCallerNumberVerificationStatus*(): jint
  proc getAssociatedUser*(): UserHandle
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc createFromParcelableCall*(parcelableCall: ParcelableCall): Details {.`static`.}
  proc toString*(): string
  DIRECTION_UNKNOWN*: jint {.`static`.}
  DIRECTION_INCOMING*: jint {.`static`.}
  DIRECTION_OUTGOING*: jint {.`static`.}
  CAPABILITY_HOLD*: jint {.`static`.}
  CAPABILITY_SUPPORT_HOLD*: jint {.`static`.}
  CAPABILITY_MERGE_CONFERENCE*: jint {.`static`.}
  CAPABILITY_SWAP_CONFERENCE*: jint {.`static`.}
  CAPABILITY_UNUSED_1*: jint {.`static`.}
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
  CAPABILITY_SPEED_UP_MT_AUDIO*: jint {.`static`.}
  CAPABILITY_CAN_UPGRADE_TO_VIDEO*: jint {.`static`.}
  CAPABILITY_CAN_PAUSE_VIDEO*: jint {.`static`.}
  CAPABILITY_CAN_SEND_RESPONSE_VIA_CONNECTION*: jint {.`static`.}
  CAPABILITY_CANNOT_DOWNGRADE_VIDEO_TO_AUDIO*: jint {.`static`.}
  CAPABILITY_CAN_PULL_CALL*: jint {.`static`.}
  CAPABILITY_SUPPORT_DEFLECT*: jint {.`static`.}
  CAPABILITY_ADD_PARTICIPANT*: jint {.`static`.}
  CAPABILITY_TRANSFER*: jint {.`static`.}
  CAPABILITY_TRANSFER_CONSULTATIVE*: jint {.`static`.}
  CAPABILITY_REMOTE_PARTY_SUPPORTS_RTT*: jint {.`static`.}
  PROPERTY_CONFERENCE*: jint {.`static`.}
  PROPERTY_GENERIC_CONFERENCE*: jint {.`static`.}
  PROPERTY_EMERGENCY_CALLBACK_MODE*: jint {.`static`.}
  PROPERTY_WIFI*: jint {.`static`.}
  PROPERTY_HIGH_DEF_AUDIO*: jint {.`static`.}
  PROPERTY_ENTERPRISE_CALL*: jint {.`static`.}
  PROPERTY_IS_EXTERNAL_CALL*: jint {.`static`.}
  PROPERTY_HAS_CDMA_VOICE_PRIVACY*: jint {.`static`.}
  PROPERTY_SELF_MANAGED*: jint {.`static`.}
  PROPERTY_ASSISTED_DIALING*: jint {.`static`.}
  PROPERTY_RTT*: jint {.`static`.}
  PROPERTY_NETWORK_IDENTIFIED_EMERGENCY_CALL*: jint {.`static`.}
  PROPERTY_VOIP_AUDIO_MODE*: jint {.`static`.}
  PROPERTY_IS_ADHOC_CONFERENCE*: jint {.`static`.}
  PROPERTY_CROSS_SIM*: jint {.`static`.}
  PROPERTY_IS_TRANSACTIONAL*: jint {.`static`.}

jclass android.telecom.Callback* of JVMObject:
  proc onStateChanged*(call: Call, state: jint)
  proc onParentChanged*(call: Call, parent: Call)
  proc onChildrenChanged*(call: Call, children: List[Call])
  proc onDetailsChanged*(call: Call, details: Details)
  proc onCannedTextResponsesLoaded*(call: Call, cannedTextResponses: List[string])
  proc onPostDialWait*(call: Call, remainingPostDialSequence: string)
  proc onVideoCallChanged*(call: Call, videoCall: InCallService.VideoCall)
  proc onCallDestroyed*(call: Call)
  proc onConferenceableCallsChanged*(call: Call, conferenceableCalls: List[Call])
  proc onConnectionEvent*(call: Call, event: string, extras: Bundle)
  proc onRttModeChanged*(call: Call, mode: jint)
  proc onRttStatusChanged*(call: Call, enabled: jboolean, rttCall: RttCall)
  proc onRttRequest*(call: Call, id: jint)
  proc onRttInitiationFailure*(call: Call, reason: jint)
  proc onHandoverComplete*(call: Call)
  proc onHandoverFailed*(call: Call, failureReason: jint)
  HANDOVER_FAILURE_DEST_APP_REJECTED*: jint {.`static`.}
  HANDOVER_FAILURE_NOT_SUPPORTED*: jint {.`static`.}
  HANDOVER_FAILURE_USER_REJECTED*: jint {.`static`.}
  HANDOVER_FAILURE_ONGOING_EMERGENCY_CALL*: jint {.`static`.}
  HANDOVER_FAILURE_UNKNOWN*: jint {.`static`.}

jclass android.telecom.RttCall* of JVMObject:
  proc getRttAudioMode*(): jint
  proc setRttMode*(mode: jint)
  proc write*(input: string)
  proc read*(): string
  proc readImmediately*(): string
  proc close*()
  RTT_MODE_INVALID*: jint {.`static`.}
  RTT_MODE_FULL*: jint {.`static`.}
  RTT_MODE_HCO*: jint {.`static`.}
  RTT_MODE_VCO*: jint {.`static`.}

jclass android.telecom.Listener* of Callback:

