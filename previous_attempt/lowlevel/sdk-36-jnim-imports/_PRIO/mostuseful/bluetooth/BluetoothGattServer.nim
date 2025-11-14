import jnim

jclass android.bluetooth.BluetoothGattServer* of JVMObject:
  proc getServerIf*(): jint
  proc onServiceConnected*(service: IBinder)
  proc onServiceDisconnected*()
  proc getAdapter*(): BluetoothAdapter
  proc close*()
  proc connect*(device: BluetoothDevice, autoConnect: jboolean): jboolean
  proc cancelConnection*(device: BluetoothDevice)
  proc setPreferredPhy*(device: BluetoothDevice, txPhy: jint, rxPhy: jint, phyOptions: jint)
  proc readPhy*(device: BluetoothDevice)
  proc sendResponse*(device: BluetoothDevice, requestId: jint, status: jint, offset: jint, value: seq[jbyte]): jboolean
  proc notifyCharacteristicChanged*(device: BluetoothDevice, characteristic: BluetoothGattCharacteristic, confirm: jboolean): jboolean
  proc notifyCharacteristicChanged*(device: BluetoothDevice, characteristic: BluetoothGattCharacteristic, confirm: jboolean, value: seq[jbyte]): jint
  proc addService*(service: BluetoothGattService): jboolean
  proc removeService*(service: BluetoothGattService): jboolean
  proc clearServices*()
  proc getServices*(): List[BluetoothGattService]
  proc getService*(uuid: UUID): BluetoothGattService
  proc getConnectionState*(device: BluetoothDevice): jint
  proc getConnectedDevices*(): List[BluetoothDevice]
  proc getDevicesMatchingConnectionStates*(states: seq[jint]): List[BluetoothDevice]

