import jnim

jclass android.bluetooth.BluetoothGattCallback* of JVMObject:
  proc onPhyUpdate*(gatt: BluetoothGatt, txPhy: jint, rxPhy: jint, status: jint)
  proc onPhyRead*(gatt: BluetoothGatt, txPhy: jint, rxPhy: jint, status: jint)
  proc onConnectionStateChange*(gatt: BluetoothGatt, status: jint, newState: jint)
  proc onServicesDiscovered*(gatt: BluetoothGatt, status: jint)
  proc onCharacteristicRead*(gatt: BluetoothGatt, characteristic: BluetoothGattCharacteristic, status: jint)
  proc onCharacteristicRead*(gatt: BluetoothGatt, characteristic: BluetoothGattCharacteristic, value: seq[jbyte], status: jint)
  proc onCharacteristicWrite*(gatt: BluetoothGatt, characteristic: BluetoothGattCharacteristic, status: jint)
  proc onCharacteristicChanged*(gatt: BluetoothGatt, characteristic: BluetoothGattCharacteristic)
  proc onCharacteristicChanged*(gatt: BluetoothGatt, characteristic: BluetoothGattCharacteristic, value: seq[jbyte])
  proc onDescriptorRead*(gatt: BluetoothGatt, descriptor: BluetoothGattDescriptor, status: jint)
  proc onDescriptorRead*(gatt: BluetoothGatt, descriptor: BluetoothGattDescriptor, status: jint, value: seq[jbyte])
  proc onDescriptorWrite*(gatt: BluetoothGatt, descriptor: BluetoothGattDescriptor, status: jint)
  proc onReliableWriteCompleted*(gatt: BluetoothGatt, status: jint)
  proc onReadRemoteRssi*(gatt: BluetoothGatt, rssi: jint, status: jint)
  proc onMtuChanged*(gatt: BluetoothGatt, mtu: jint, status: jint)
  proc onConnectionUpdated*(gatt: BluetoothGatt, interval: jint, latency: jint, timeout: jint, status: jint)
  proc onServiceChanged*(gatt: BluetoothGatt)
  proc onSubrateChange*(gatt: BluetoothGatt, subrateFactor: jint, latency: jint, contNum: jint, timeout: jint, status: jint)

