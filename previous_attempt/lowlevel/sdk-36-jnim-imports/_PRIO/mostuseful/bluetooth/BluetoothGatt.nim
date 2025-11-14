import jnim

jclass android.bluetooth.BluetoothGatt* of JVMObject:
  proc onServiceConnected*(service: IBinder)
  proc onServiceDisconnected*()
  proc getAdapter*(): BluetoothAdapter
  proc close*()
  proc disconnect*()
  proc connect*(): jboolean
  proc setPreferredPhy*(txPhy: jint, rxPhy: jint, phyOptions: jint)
  proc readPhy*()
  proc getDevice*(): BluetoothDevice
  proc discoverServices*(): jboolean
  proc discoverServiceByUuid*(uuid: UUID): jboolean
  proc getServices*(): List[BluetoothGattService]
  proc getService*(uuid: UUID): BluetoothGattService
  proc readCharacteristic*(characteristic: BluetoothGattCharacteristic): jboolean
  proc readUsingCharacteristicUuid*(uuid: UUID, startHandle: jint, endHandle: jint): jboolean
  proc writeCharacteristic*(characteristic: BluetoothGattCharacteristic): jboolean
  proc writeCharacteristic*(characteristic: BluetoothGattCharacteristic, value: seq[jbyte], writeType: jint): jint
  proc readDescriptor*(descriptor: BluetoothGattDescriptor): jboolean
  proc writeDescriptor*(descriptor: BluetoothGattDescriptor): jboolean
  proc writeDescriptor*(descriptor: BluetoothGattDescriptor, value: seq[jbyte]): jint
  proc beginReliableWrite*(): jboolean
  proc executeReliableWrite*(): jboolean
  proc abortReliableWrite*()
  proc abortReliableWrite*(mDevice: BluetoothDevice)
  proc setCharacteristicNotification*(characteristic: BluetoothGattCharacteristic, enable: jboolean): jboolean
  proc refresh*(): jboolean
  proc readRemoteRssi*(): jboolean
  proc requestMtu*(mtu: jint): jboolean
  proc requestConnectionPriority*(connectionPriority: jint): jboolean
  proc requestLeConnectionUpdate*(minConnectionInterval: jint, maxConnectionInterval: jint, slaveLatency: jint, supervisionTimeout: jint, minConnectionEventLen: jint, maxConnectionEventLen: jint): jboolean
  proc requestSubrateMode*(subrateMode: jint): jint
  proc getConnectionState*(device: BluetoothDevice): jint
  proc getConnectedDevices*(): List[BluetoothDevice]
  proc getDevicesMatchingConnectionStates*(states: seq[jint]): List[BluetoothDevice]
  GATT_SUCCESS*: jint {.`static`.}
  GATT_READ_NOT_PERMITTED*: jint {.`static`.}
  GATT_WRITE_NOT_PERMITTED*: jint {.`static`.}
  GATT_INSUFFICIENT_AUTHENTICATION*: jint {.`static`.}
  GATT_REQUEST_NOT_SUPPORTED*: jint {.`static`.}
  GATT_INSUFFICIENT_ENCRYPTION*: jint {.`static`.}
  GATT_INVALID_OFFSET*: jint {.`static`.}
  GATT_INSUFFICIENT_AUTHORIZATION*: jint {.`static`.}
  GATT_INVALID_ATTRIBUTE_LENGTH*: jint {.`static`.}
  GATT_CONNECTION_CONGESTED*: jint {.`static`.}
  GATT_CONNECTION_TIMEOUT*: jint {.`static`.}
  GATT_FAILURE*: jint {.`static`.}
  CONNECTION_PRIORITY_BALANCED*: jint {.`static`.}
  CONNECTION_PRIORITY_HIGH*: jint {.`static`.}
  CONNECTION_PRIORITY_LOW_POWER*: jint {.`static`.}
  CONNECTION_PRIORITY_DCK*: jint {.`static`.}
  SUBRATE_REQUEST_MODE_BALANCED*: jint {.`static`.}
  SUBRATE_REQUEST_MODE_HIGH*: jint {.`static`.}
  SUBRATE_REQUEST_MODE_LOW_POWER*: jint {.`static`.}

