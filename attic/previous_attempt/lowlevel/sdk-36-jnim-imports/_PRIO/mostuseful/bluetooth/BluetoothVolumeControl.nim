import jnim

jclass android.bluetooth.BluetoothVolumeControl* of JVMObject:
  proc close*()
  proc onServiceConnected*(service: IBinder)
  proc onServiceDisconnected*()
  proc getAdapter*(): BluetoothAdapter
  proc getConnectedDevices*(): List[BluetoothDevice]
  proc getDevicesMatchingConnectionStates*(states: seq[jint]): List[BluetoothDevice]
  proc getConnectionState*(device: BluetoothDevice): jint
  proc registerCallback*(executor: Executor, callback: Callback)
  proc unregisterCallback*(callback: Callback)
  proc setVolumeOffset*(device: BluetoothDevice, volumeOffset: jint)
  proc setVolumeOffset*(device: BluetoothDevice, instanceId: jint, volumeOffset: jint)
  proc isVolumeOffsetAvailable*(device: BluetoothDevice): jboolean
  proc getNumberOfVolumeOffsetInstances*(device: BluetoothDevice): jint
  proc setConnectionPolicy*(device: BluetoothDevice, connectionPolicy: jint): jboolean
  proc getConnectionPolicy*(device: BluetoothDevice): jint
  proc setDeviceVolume*(device: BluetoothDevice, volume: jint, isGroupOperation: jboolean)
  proc getAudioInputControlServices*(device: BluetoothDevice): List[AudioInputControl]
  ACTION_CONNECTION_STATE_CHANGED*: string {.`static`.}

