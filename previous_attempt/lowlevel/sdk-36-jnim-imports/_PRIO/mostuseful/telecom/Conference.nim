import jnim

jclass android.telecom.Conference* of Conferenceable:
  proc getTelecomCallId*(): string
  proc setTelecomCallId*(telecomCallId: string)
  proc getPhoneAccountHandle*(): PhoneAccountHandle
  proc getConnections*(): List[Connection]
  proc getState*(): jint
  proc isRingbackRequested*(): jboolean
  proc getConnectionCapabilities*(): jint
  proc getConnectionProperties*(): jint
  proc getAudioState*(): AudioState
  proc getCallAudioState*(): CallAudioState
  proc getCurrentCallEndpoint*(): CallEndpoint
  proc getVideoProvider*(): VideoProvider
  proc getVideoState*(): jint
  proc onDisconnect*()
  proc onSeparate*(connection: Connection)
  proc onMerge*(connection: Connection)
  proc onHold*()
  proc onUnhold*()
  proc onMerge*()
  proc onSwap*()
  proc onPlayDtmfTone*(c: jchar)
  proc onStopDtmfTone*()
  proc onAudioStateChanged*(state: AudioState)
  proc onCallAudioStateChanged*(state: CallAudioState)
  proc onCallEndpointChanged*(callEndpoint: CallEndpoint)
  proc onAvailableCallEndpointsChanged*(availableEndpoints: List[CallEndpoint])
  proc onMuteStateChanged*(isMuted: jboolean)
  proc onConnectionAdded*(connection: Connection)
  proc onAddConferenceParticipants*(participants: List[Uri])
  proc onAnswer*(videoState: jint)
  proc onAnswer*()
  proc onReject*()
  proc setOnHold*()
  proc setDialing*()
  proc setRinging*()
  proc setActive*()
  proc setDisconnected*(disconnectCause: DisconnectCause)
  proc getDisconnectCause*(): DisconnectCause
  proc setConnectionCapabilities*(connectionCapabilities: jint)
  proc setConnectionProperties*(connectionProperties: jint)
  proc addConnection*(connection: Connection): jboolean
  proc removeConnection*(connection: Connection)
  proc setConferenceableConnections*(conferenceableConnections: List[Connection])
  proc setRingbackRequested*(ringback: jboolean)
  proc setVideoState*(c: Connection, videoState: jint)
  proc setVideoProvider*(c: Connection, videoProvider: Connection.VideoProvider)
  proc getConferenceableConnections*(): List[Connection]
  proc destroy*()
  proc getPrimaryConnection*(): Connection
  proc setConnectTimeMillis*(connectTimeMillis: jlong)
  proc setConnectionTime*(connectionTimeMillis: jlong)
  proc setConnectionStartElapsedRealTime*(connectionStartElapsedRealTime: jlong)
  proc setConnectionStartElapsedRealtimeMillis*(connectionStartElapsedRealTime: jlong)
  proc getConnectTimeMillis*(): jlong
  proc getConnectionTime*(): jlong
  proc getConnectionStartElapsedRealtimeMillis*(): jlong
  proc createFailedConference*(disconnectCause: DisconnectCause, phoneAccount: PhoneAccountHandle): Conference {.`static`.}
  proc toString*(): string
  proc setStatusHints*(statusHints: StatusHints)
  proc getStatusHints*(): StatusHints
  proc setExtras*(extras: Bundle)
  proc putExtras*(extras: Bundle)
  proc putExtra*(key: string, value: jboolean)
  proc putExtra*(key: string, value: jint)
  proc putExtra*(key: string, value: string)
  proc removeExtras*(keys: List[string])
  proc removeExtras*(keys: string)
  proc getExtras*(): Bundle
  proc onExtrasChanged*(extras: Bundle)
  proc setConferenceState*(isConference: jboolean)
  proc setCallDirection*(callDirection: jint)
  proc isMultiparty*(): jboolean
  proc setAddress*(address: Uri, presentation: jint)
  proc getAddress*(): Uri
  proc getAddressPresentation*(): jint
  proc getCallerDisplayName*(): string
  proc getCallerDisplayNamePresentation*(): jint
  proc getCallDirection*(): jint
  proc setCallerDisplayName*(callerDisplayName: string, presentation: jint)
  proc sendConferenceEvent*(event: string, extras: Bundle)
  CONNECT_TIME_NOT_SPECIFIED*: jlong {.`static`.}

