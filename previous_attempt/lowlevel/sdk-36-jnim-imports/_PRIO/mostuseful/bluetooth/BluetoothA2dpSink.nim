import jnim

jclass android.bluetooth.BluetoothA2dpSink* of JVMObject:
  proc onServiceConnected*(service: IBinder)
  proc onServiceDisconnected*()
  proc getAdapter*(): BluetoothAdapter
  proc finalize*()
  proc connect*(device: BluetoothDevice): jboolean
  proc disconnect*(device: BluetoothDevice): jboolean
  proc getConnectedDevices*(): List[BluetoothDevice]
  proc getDevicesMatchingConnectionStates*(states: seq[jint]): List[BluetoothDevice]
  proc getConnectionState*(device: BluetoothDevice): jint
  proc getAudioConfig*(device: BluetoothDevice): BluetoothAudioConfig
  proc setPriority*(device: BluetoothDevice, priority: jint): jboolean
  proc setConnectionPolicy*(device: BluetoothDevice, connectionPolicy: jint): jboolean
  proc getPriority*(device: BluetoothDevice): jint
  proc getConnectionPolicy*(device: BluetoothDevice): jint
  proc isAudioPlaying*(device: BluetoothDevice): jboolean
  ACTION_CONNECTION_STATE_CHANGED*: string {.`static`.}

