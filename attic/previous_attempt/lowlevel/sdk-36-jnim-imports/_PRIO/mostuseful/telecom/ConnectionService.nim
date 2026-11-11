import jnim

jclass android.telecom.ConnectionService* of Service:
  proc onBind*(intent: Intent): IBinder
  proc onUnbind*(intent: Intent): jboolean
  proc onBindClient*(intent: Intent)
  proc createRemoteIncomingConnection*(connectionManagerPhoneAccount: PhoneAccountHandle, request: ConnectionRequest): RemoteConnection
  proc createRemoteOutgoingConnection*(connectionManagerPhoneAccount: PhoneAccountHandle, request: ConnectionRequest): RemoteConnection
  proc createRemoteIncomingConference*(connectionManagerPhoneAccount: PhoneAccountHandle, request: ConnectionRequest): RemoteConference
  proc createRemoteOutgoingConference*(connectionManagerPhoneAccount: PhoneAccountHandle, request: ConnectionRequest): RemoteConference
  proc conferenceRemoteConnections*(remoteConnection1: RemoteConnection, remoteConnection2: RemoteConnection)
  proc addConference*(conference: Conference)
  proc addExistingConnection*(phoneAccountHandle: PhoneAccountHandle, connection: Connection)
  proc connectionServiceFocusReleased*()
  proc addExistingConnection*(phoneAccountHandle: PhoneAccountHandle, connection: Connection, conference: Conference)
  proc getAllConnections*(): Collection[Connection]
  proc getAllConferences*(): Collection[Conference]
  proc onCreateIncomingConnection*(connectionManagerPhoneAccount: PhoneAccountHandle, request: ConnectionRequest): Connection
  proc onCreateIncomingConference*(connectionManagerPhoneAccount: PhoneAccountHandle, request: ConnectionRequest): Conference
  proc onCreateConnectionComplete*(connection: Connection)
  proc onCreateConferenceComplete*(conference: Conference)
  proc onCreateIncomingConnectionFailed*(connectionManagerPhoneAccount: PhoneAccountHandle, request: ConnectionRequest)
  proc onCreateOutgoingConnectionFailed*(connectionManagerPhoneAccount: PhoneAccountHandle, request: ConnectionRequest)
  proc onCreateIncomingConferenceFailed*(connectionManagerPhoneAccount: PhoneAccountHandle, request: ConnectionRequest)
  proc onCreateOutgoingConferenceFailed*(connectionManagerPhoneAccount: PhoneAccountHandle, request: ConnectionRequest)
  proc triggerConferenceRecalculate*()
  proc onCreateOutgoingConnection*(connectionManagerPhoneAccount: PhoneAccountHandle, request: ConnectionRequest): Connection
  proc onCreateOutgoingConference*(connectionManagerPhoneAccount: PhoneAccountHandle, request: ConnectionRequest): Conference
  proc onCreateOutgoingHandoverConnection*(fromPhoneAccountHandle: PhoneAccountHandle, request: ConnectionRequest): Connection
  proc onCreateIncomingHandoverConnection*(fromPhoneAccountHandle: PhoneAccountHandle, request: ConnectionRequest): Connection
  proc onHandoverFailed*(request: ConnectionRequest, error: jint)
  proc onCreateUnknownConnection*(connectionManagerPhoneAccount: PhoneAccountHandle, request: ConnectionRequest): Connection
  proc onConference*(connection1: Connection, connection2: Connection)
  proc onConnectionAdded*(connection: Connection)
  proc onConnectionRemoved*(connection: Connection)
  proc onConferenceAdded*(conference: Conference)
  proc onConferenceRemoved*(conference: Conference)
  proc onRemoteConferenceAdded*(conference: RemoteConference)
  proc onRemoteExistingConnectionAdded*(connection: RemoteConnection)
  proc onConnectionServiceFocusLost*()
  proc onConnectionServiceFocusGained*()
  proc containsConference*(conference: Conference): jboolean
  proc getHandler*(): Handler
  proc setReadyForTest*()
  SERVICE_INTERFACE*: string {.`static`.}
  EXTRA_IS_HANDOVER*: string {.`static`.}

