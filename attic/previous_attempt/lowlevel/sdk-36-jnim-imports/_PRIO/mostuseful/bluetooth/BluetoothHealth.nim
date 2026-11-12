import jnim

jclass android.bluetooth.BluetoothHealth* of JVMObject:
  proc onServiceConnected*(service: IBinder)
  proc onServiceDisconnected*()
  proc getAdapter*(): BluetoothAdapter
  proc registerSinkAppConfiguration*(name: string, dataType: jint, callback: BluetoothHealthCallback): jboolean
  proc unregisterAppConfiguration*(config: BluetoothHealthAppConfiguration): jboolean
  proc connectChannelToSource*(device: BluetoothDevice, config: BluetoothHealthAppConfiguration): jboolean
  proc disconnectChannel*(device: BluetoothDevice, config: BluetoothHealthAppConfiguration, channelId: jint): jboolean
  proc getMainChannelFd*(device: BluetoothDevice, config: BluetoothHealthAppConfiguration): ParcelFileDescriptor
  proc getConnectionState*(device: BluetoothDevice): jint
  proc getConnectedDevices*(): List[BluetoothDevice]
  proc getDevicesMatchingConnectionStates*(states: seq[jint]): List[BluetoothDevice]
  SOURCE_ROLE*: jint {.`static`.}
  SINK_ROLE*: jint {.`static`.}
  CHANNEL_TYPE_RELIABLE*: jint {.`static`.}
  CHANNEL_TYPE_STREAMING*: jint {.`static`.}
  STATE_CHANNEL_DISCONNECTED*: jint {.`static`.}
  STATE_CHANNEL_CONNECTING*: jint {.`static`.}
  STATE_CHANNEL_CONNECTED*: jint {.`static`.}
  STATE_CHANNEL_DISCONNECTING*: jint {.`static`.}
  APP_CONFIG_REGISTRATION_SUCCESS*: jint {.`static`.}
  APP_CONFIG_REGISTRATION_FAILURE*: jint {.`static`.}
  APP_CONFIG_UNREGISTRATION_SUCCESS*: jint {.`static`.}
  APP_CONFIG_UNREGISTRATION_FAILURE*: jint {.`static`.}

