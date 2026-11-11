import jnim

jclass android.telecom.RemoteConference* of JVMObject:
  proc getConnections*(): List[RemoteConnection]
  proc getState*(): jint
  proc getConnectionCapabilities*(): jint
  proc getConnectionProperties*(): jint
  proc getExtras*(): Bundle
  proc disconnect*()
  proc separate*(connection: RemoteConnection)
  proc merge*()
  proc swap*()
  proc hold*()
  proc unhold*()
  proc getDisconnectCause*(): DisconnectCause
  proc playDtmfTone*(digit: jchar)
  proc stopDtmfTone*()
  proc setAudioState*(state: AudioState)
  proc setCallAudioState*(state: CallAudioState)
  proc getConferenceableConnections*(): List[RemoteConnection]
  proc registerCallback*(callback: Callback)
  proc registerCallback*(callback: Callback, handler: Handler)
  proc unregisterCallback*(callback: Callback)
  proc failure*(disconnectCause: DisconnectCause): RemoteConference {.`static`.}

jclass android.telecom.RemoteConference.Callback* of JVMObject:
  proc onStateChanged*(conference: RemoteConference, oldState: jint, newState: jint)
  proc onDisconnected*(conference: RemoteConference, disconnectCause: DisconnectCause)
  proc onConnectionAdded*(conference: RemoteConference, connection: RemoteConnection)
  proc onConnectionRemoved*(conference: RemoteConference, connection: RemoteConnection)
  proc onConnectionCapabilitiesChanged*(conference: RemoteConference, connectionCapabilities: jint)
  proc onConnectionPropertiesChanged*(conference: RemoteConference, connectionProperties: jint)
  proc onConferenceableConnectionsChanged*(conference: RemoteConference, conferenceableConnections: List[RemoteConnection])
  proc onDestroyed*(conference: RemoteConference)
  proc onExtrasChanged*(conference: RemoteConference, extras: Bundle)

jclass android.telecom.Callback* of JVMObject:
  proc onStateChanged*(conference: RemoteConference, oldState: jint, newState: jint)
  proc onDisconnected*(conference: RemoteConference, disconnectCause: DisconnectCause)
  proc onConnectionAdded*(conference: RemoteConference, connection: RemoteConnection)
  proc onConnectionRemoved*(conference: RemoteConference, connection: RemoteConnection)
  proc onConnectionCapabilitiesChanged*(conference: RemoteConference, connectionCapabilities: jint)
  proc onConnectionPropertiesChanged*(conference: RemoteConference, connectionProperties: jint)
  proc onConferenceableConnectionsChanged*(conference: RemoteConference, conferenceableConnections: List[RemoteConnection])
  proc onDestroyed*(conference: RemoteConference)
  proc onExtrasChanged*(conference: RemoteConference, extras: Bundle)

