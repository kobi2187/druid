import jnim

jclass android.bluetooth.BluetoothPbapClient* of JVMObject:
  proc close*()
  proc onServiceConnected*(service: IBinder)
  proc onServiceDisconnected*()
  proc getAdapter*(): BluetoothAdapter
  proc connect*(device: BluetoothDevice): jboolean
  proc disconnect*(device: BluetoothDevice): jboolean
  proc getConnectedDevices*(): List[BluetoothDevice]
  proc getDevicesMatchingConnectionStates*(states: seq[jint]): List[BluetoothDevice]
  proc getConnectionState*(device: BluetoothDevice): jint
  proc setPriority*(device: BluetoothDevice, priority: jint): jboolean
  proc setConnectionPolicy*(device: BluetoothDevice, connectionPolicy: jint): jboolean
  proc getPriority*(device: BluetoothDevice): jint
  proc getConnectionPolicy*(device: BluetoothDevice): jint
  ACTION_CONNECTION_STATE_CHANGED*: string {.`static`.}
  STATE_ERROR*: jint {.`static`.}
  RESULT_FAILURE*: jint {.`static`.}
  RESULT_SUCCESS*: jint {.`static`.}
  RESULT_CANCELED*: jint {.`static`.}

