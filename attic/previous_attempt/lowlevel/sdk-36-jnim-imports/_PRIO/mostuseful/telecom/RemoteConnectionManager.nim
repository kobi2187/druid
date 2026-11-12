import jnim

jclass android.telecom.RemoteConnectionManager* of JVMObject:
  proc createRemoteConnection*(connectionManagerPhoneAccount: PhoneAccountHandle, request: ConnectionRequest, isIncoming: jboolean): RemoteConnection
  proc createRemoteConference*(connectionManagerPhoneAccount: PhoneAccountHandle, request: ConnectionRequest, isIncoming: jboolean): RemoteConference
  proc conferenceRemoteConnections*(a: RemoteConnection, b: RemoteConnection)

