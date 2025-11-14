import jnim

jclass android.bluetooth.BluetoothPbap* of JVMObject:
  proc onServiceConnected*(service: IBinder)
  proc onServiceDisconnected*()
  proc getAdapter*(): BluetoothAdapter
  proc getConnectedDevices*(): List[BluetoothDevice]
  proc getConnectionState*(device: BluetoothDevice): jint
  proc getDevicesMatchingConnectionStates*(states: seq[jint]): List[BluetoothDevice]
  proc setConnectionPolicy*(device: BluetoothDevice, connectionPolicy: jint): jboolean
  proc disconnect*(device: BluetoothDevice): jboolean
  ACTION_CONNECTION_STATE_CHANGED*: string {.`static`.}
  RESULT_FAILURE*: jint {.`static`.}
  RESULT_SUCCESS*: jint {.`static`.}
  RESULT_CANCELED*: jint {.`static`.}

