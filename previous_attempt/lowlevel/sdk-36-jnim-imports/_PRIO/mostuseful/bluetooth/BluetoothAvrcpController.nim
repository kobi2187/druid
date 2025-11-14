import jnim

jclass android.bluetooth.BluetoothAvrcpController* of JVMObject:
  proc onServiceConnected*(service: IBinder)
  proc onServiceDisconnected*()
  proc getAdapter*(): BluetoothAdapter
  proc finalize*()
  proc getConnectedDevices*(): List[BluetoothDevice]
  proc getDevicesMatchingConnectionStates*(states: seq[jint]): List[BluetoothDevice]
  proc getConnectionState*(device: BluetoothDevice): jint
  proc getPlayerSettings*(device: BluetoothDevice): BluetoothAvrcpPlayerSettings
  proc setPlayerApplicationSetting*(plAppSetting: BluetoothAvrcpPlayerSettings): jboolean
  proc sendGroupNavigationCmd*(device: BluetoothDevice, keyCode: jint, keyState: jint)
  ACTION_CONNECTION_STATE_CHANGED*: string {.`static`.}
  ACTION_PLAYER_SETTING*: string {.`static`.}
  EXTRA_PLAYER_SETTING*: string {.`static`.}

