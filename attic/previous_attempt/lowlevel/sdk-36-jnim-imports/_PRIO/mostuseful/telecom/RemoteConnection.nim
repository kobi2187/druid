import jnim

jclass android.telecom.RemoteConnection* of JVMObject:
  proc registerCallback*(callback: Callback)
  proc registerCallback*(callback: Callback, handler: Handler)
  proc unregisterCallback*(callback: Callback)
  proc getState*(): jint
  proc getDisconnectCause*(): DisconnectCause
  proc getConnectionCapabilities*(): jint
  proc getConnectionProperties*(): jint
  proc isVoipAudioMode*(): jboolean
  proc getStatusHints*(): StatusHints
  proc getAddress*(): Uri
  proc getAddressPresentation*(): jint
  proc getCallerDisplayName*(): CharSequence
  proc getCallerDisplayNamePresentation*(): jint
  proc getVideoState*(): jint
  proc getVideoProvider*(): VideoProvider
  proc getExtras*(): Bundle
  proc isRingbackRequested*(): jboolean
  proc abort*()
  proc answer*()
  proc answer*(videoState: jint)
  proc reject*()
  proc hold*()
  proc unhold*()
  proc disconnect*()
  proc playDtmfTone*(digit: jchar)
  proc stopDtmfTone*()
  proc postDialContinue*(proceed: jboolean)
  proc pullExternalCall*()
  proc addConferenceParticipants*(participants: List[Uri])
  proc setAudioState*(state: AudioState)
  proc setCallAudioState*(state: CallAudioState)
  proc startRtt*(rttTextStream: Connection.RttTextStream)
  proc stopRtt*()
  proc onCallFilteringCompleted*(completionInfo: Connection.CallFilteringCompletionInfo)
  proc sendRttUpgradeResponse*(rttTextStream: Connection.RttTextStream)
  proc getConferenceableConnections*(): List[RemoteConnection]
  proc getConference*(): RemoteConference
  proc failure*(disconnectCause: DisconnectCause): RemoteConnection {.`static`.}

jclass android.telecom.RemoteConnection.Callback* of JVMObject:
  proc onStateChanged*(connection: RemoteConnection, state: jint)
  proc onDisconnected*(connection: RemoteConnection, disconnectCause: DisconnectCause)
  proc onRingbackRequested*(connection: RemoteConnection, ringback: jboolean)
  proc onConnectionCapabilitiesChanged*(connection: RemoteConnection, connectionCapabilities: jint)
  proc onConnectionPropertiesChanged*(connection: RemoteConnection, connectionProperties: jint)
  proc onPostDialWait*(connection: RemoteConnection, remainingPostDialSequence: string)
  proc onPostDialChar*(connection: RemoteConnection, nextChar: jchar)
  proc onVoipAudioChanged*(connection: RemoteConnection, isVoip: jboolean)
  proc onStatusHintsChanged*(connection: RemoteConnection, statusHints: StatusHints)
  proc onAddressChanged*(connection: RemoteConnection, address: Uri, presentation: jint)
  proc onCallerDisplayNameChanged*(connection: RemoteConnection, callerDisplayName: string, presentation: jint)
  proc onVideoStateChanged*(connection: RemoteConnection, videoState: jint)
  proc onDestroyed*(connection: RemoteConnection)
  proc onConferenceableConnectionsChanged*(connection: RemoteConnection, conferenceableConnections: List[RemoteConnection])
  proc onVideoProviderChanged*(connection: RemoteConnection, videoProvider: VideoProvider)
  proc onConferenceChanged*(connection: RemoteConnection, conference: RemoteConference)
  proc onExtrasChanged*(connection: RemoteConnection, extras: Bundle)
  proc onConnectionEvent*(connection: RemoteConnection, event: string, extras: Bundle)
  proc onRttInitiationSuccess*(connection: RemoteConnection)
  proc onRttInitiationFailure*(connection: RemoteConnection, reason: jint)
  proc onRttSessionRemotelyTerminated*(connection: RemoteConnection)
  proc onRemoteRttRequest*(connection: RemoteConnection)

jclass android.telecom.RemoteConnection.VideoProvider* of JVMObject:
  proc registerCallback*(l: Callback)
  proc unregisterCallback*(l: Callback)
  proc setCamera*(cameraId: string)
  proc setPreviewSurface*(surface: Surface)
  proc setDisplaySurface*(surface: Surface)
  proc setDeviceOrientation*(rotation: jint)
  proc setZoom*(value: jfloat)
  proc sendSessionModifyRequest*(fromProfile: VideoProfile, toProfile: VideoProfile)
  proc sendSessionModifyResponse*(responseProfile: VideoProfile)
  proc requestCameraCapabilities*()
  proc requestCallDataUsage*()
  proc setPauseImage*(uri: Uri)

jclass android.telecom.Callback* of JVMObject:
  proc onStateChanged*(connection: RemoteConnection, state: jint)
  proc onDisconnected*(connection: RemoteConnection, disconnectCause: DisconnectCause)
  proc onRingbackRequested*(connection: RemoteConnection, ringback: jboolean)
  proc onConnectionCapabilitiesChanged*(connection: RemoteConnection, connectionCapabilities: jint)
  proc onConnectionPropertiesChanged*(connection: RemoteConnection, connectionProperties: jint)
  proc onPostDialWait*(connection: RemoteConnection, remainingPostDialSequence: string)
  proc onPostDialChar*(connection: RemoteConnection, nextChar: jchar)
  proc onVoipAudioChanged*(connection: RemoteConnection, isVoip: jboolean)
  proc onStatusHintsChanged*(connection: RemoteConnection, statusHints: StatusHints)
  proc onAddressChanged*(connection: RemoteConnection, address: Uri, presentation: jint)
  proc onCallerDisplayNameChanged*(connection: RemoteConnection, callerDisplayName: string, presentation: jint)
  proc onVideoStateChanged*(connection: RemoteConnection, videoState: jint)
  proc onDestroyed*(connection: RemoteConnection)
  proc onConferenceableConnectionsChanged*(connection: RemoteConnection, conferenceableConnections: List[RemoteConnection])
  proc onVideoProviderChanged*(connection: RemoteConnection, videoProvider: VideoProvider)
  proc onConferenceChanged*(connection: RemoteConnection, conference: RemoteConference)
  proc onExtrasChanged*(connection: RemoteConnection, extras: Bundle)
  proc onConnectionEvent*(connection: RemoteConnection, event: string, extras: Bundle)
  proc onRttInitiationSuccess*(connection: RemoteConnection)
  proc onRttInitiationFailure*(connection: RemoteConnection, reason: jint)
  proc onRttSessionRemotelyTerminated*(connection: RemoteConnection)
  proc onRemoteRttRequest*(connection: RemoteConnection)

jclass android.telecom.VideoProvider* of JVMObject:
  proc registerCallback*(l: Callback)
  proc unregisterCallback*(l: Callback)
  proc setCamera*(cameraId: string)
  proc setPreviewSurface*(surface: Surface)
  proc setDisplaySurface*(surface: Surface)
  proc setDeviceOrientation*(rotation: jint)
  proc setZoom*(value: jfloat)
  proc sendSessionModifyRequest*(fromProfile: VideoProfile, toProfile: VideoProfile)
  proc sendSessionModifyResponse*(responseProfile: VideoProfile)
  proc requestCameraCapabilities*()
  proc requestCallDataUsage*()
  proc setPauseImage*(uri: Uri)

jclass android.telecom.VideoProvider.Callback* of JVMObject:
  proc onSessionModifyRequestReceived*(videoProvider: VideoProvider, videoProfile: VideoProfile)
  proc onSessionModifyResponseReceived*(videoProvider: VideoProvider, status: jint, requestedProfile: VideoProfile, responseProfile: VideoProfile)
  proc onCallSessionEvent*(videoProvider: VideoProvider, event: jint)
  proc onPeerDimensionsChanged*(videoProvider: VideoProvider, width: jint, height: jint)
  proc onCallDataUsageChanged*(videoProvider: VideoProvider, dataUsage: jlong)
  proc onCameraCapabilitiesChanged*(videoProvider: VideoProvider, cameraCapabilities: VideoProfile.CameraCapabilities)
  proc onVideoQualityChanged*(videoProvider: VideoProvider, videoQuality: jint)

jclass android.telecom.Callback* of JVMObject:
  proc onSessionModifyRequestReceived*(videoProvider: VideoProvider, videoProfile: VideoProfile)
  proc onSessionModifyResponseReceived*(videoProvider: VideoProvider, status: jint, requestedProfile: VideoProfile, responseProfile: VideoProfile)
  proc onCallSessionEvent*(videoProvider: VideoProvider, event: jint)
  proc onPeerDimensionsChanged*(videoProvider: VideoProvider, width: jint, height: jint)
  proc onCallDataUsageChanged*(videoProvider: VideoProvider, dataUsage: jlong)
  proc onCameraCapabilitiesChanged*(videoProvider: VideoProvider, cameraCapabilities: VideoProfile.CameraCapabilities)
  proc onVideoQualityChanged*(videoProvider: VideoProvider, videoQuality: jint)

