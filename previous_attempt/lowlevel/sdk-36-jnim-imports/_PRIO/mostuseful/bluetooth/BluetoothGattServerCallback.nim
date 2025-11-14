import jnim

jclass android.bluetooth.BluetoothGattServerCallback* of JVMObject:
  proc onConnectionStateChange*(device: BluetoothDevice, status: jint, newState: jint)
  proc onServiceAdded*(status: jint, service: BluetoothGattService)
  proc onCharacteristicReadRequest*(device: BluetoothDevice, requestId: jint, offset: jint, characteristic: BluetoothGattCharacteristic)
  proc onCharacteristicWriteRequest*(device: BluetoothDevice, requestId: jint, characteristic: BluetoothGattCharacteristic, preparedWrite: jboolean, responseNeeded: jboolean, offset: jint, value: seq[jbyte])
  proc onDescriptorReadRequest*(device: BluetoothDevice, requestId: jint, offset: jint, descriptor: BluetoothGattDescriptor)
  proc onDescriptorWriteRequest*(device: BluetoothDevice, requestId: jint, descriptor: BluetoothGattDescriptor, preparedWrite: jboolean, responseNeeded: jboolean, offset: jint, value: seq[jbyte])
  proc onExecuteWrite*(device: BluetoothDevice, requestId: jint, execute: jboolean)
  proc onNotificationSent*(device: BluetoothDevice, status: jint)
  proc onMtuChanged*(device: BluetoothDevice, mtu: jint)
  proc onPhyUpdate*(device: BluetoothDevice, txPhy: jint, rxPhy: jint, status: jint)
  proc onPhyRead*(device: BluetoothDevice, txPhy: jint, rxPhy: jint, status: jint)
  proc onConnectionUpdated*(device: BluetoothDevice, interval: jint, latency: jint, timeout: jint, status: jint)
  proc onSubrateChange*(device: BluetoothDevice, subrateFactor: jint, latency: jint, contNum: jint, timeout: jint, status: jint)

