import jnim

jclass android.bluetooth.BluetoothManager* of JVMObject:
  proc getAdapter*(): BluetoothAdapter
  proc getConnectionState*(device: BluetoothDevice, profile: jint): jint
  proc getConnectedDevices*(profile: jint): List[BluetoothDevice]
  proc getDevicesMatchingConnectionStates*(profile: jint, states: seq[jint]): List[BluetoothDevice]
  proc openGattServer*(context: Context, callback: BluetoothGattServerCallback): BluetoothGattServer
  proc openGattServer*(context: Context, callback: BluetoothGattServerCallback, eattSupport: jboolean): BluetoothGattServer
  proc openGattServer*(context: Context, callback: BluetoothGattServerCallback, transport: jint): BluetoothGattServer
  proc openGattServer*(context: Context, callback: BluetoothGattServerCallback, transport: jint, eattSupport: jboolean): BluetoothGattServer

