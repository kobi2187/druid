import jnim

jclass android.bluetooth.BluetoothLeCallControl* of JVMObject:
  proc close*()
  proc onServiceConnected*(service: IBinder)
  proc onServiceDisconnected*()
  proc getAdapter*(): BluetoothAdapter
  proc getConnectionState*(device: BluetoothDevice): jint
  proc getConnectedDevices*(): List[BluetoothDevice]
  proc getDevicesMatchingConnectionStates*(states: seq[jint]): List[BluetoothDevice]
  proc registerBearer*(uci: string, uriSchemes: List[string], capabilities: jint, provider: string, technology: jint, executor: Executor, callback: Callback): jboolean
  proc unregisterBearer*()
  proc onCallAdded*(call: BluetoothLeCall)
  proc onCallRemoved*(callId: UUID, reason: jint)
  proc onCallStateChanged*(callId: UUID, state: jint)
  proc currentCallsList*(calls: List[BluetoothLeCall])
  proc requestResult*(requestId: jint, result: jint)

jclass android.bluetooth.BluetoothLeCallControl.Callback* of JVMObject:
  proc onAcceptCall*(requestId: jint, callId: UUID)
  proc onTerminateCall*(requestId: jint, callId: UUID)
  proc onHoldCall*(requestId: jint, callId: UUID)
  proc onUnholdCall*(requestId: jint, callId: UUID)
  proc onPlaceCall*(requestId: jint, callId: UUID, uri: string)
  proc onJoinCalls*(requestId: jint, callIds: List[UUID])

jclass android.bluetooth.Callback* of JVMObject:
  proc onAcceptCall*(requestId: jint, callId: UUID)
  proc onTerminateCall*(requestId: jint, callId: UUID)
  proc onHoldCall*(requestId: jint, callId: UUID)
  proc onUnholdCall*(requestId: jint, callId: UUID)
  proc onPlaceCall*(requestId: jint, callId: UUID, uri: string)
  proc onJoinCalls*(requestId: jint, callIds: List[UUID])

