import jnim

jclass android.bluetooth.BluetoothPan* of JVMObject:
  proc close*()
  proc onServiceConnected*(service: IBinder)
  proc onServiceDisconnected*()
  proc getAdapter*(): BluetoothAdapter
  proc connect*(device: BluetoothDevice): jboolean
  proc disconnect*(device: BluetoothDevice): jboolean
  proc setConnectionPolicy*(device: BluetoothDevice, connectionPolicy: jint): jboolean
  proc getConnectedDevices*(): List[BluetoothDevice]
  proc getDevicesMatchingConnectionStates*(states: seq[jint]): List[BluetoothDevice]
  proc getConnectionState*(device: BluetoothDevice): jint
  proc setBluetoothTethering*(value: jboolean)
  proc requestTetheredInterface*(executor: Executor, callback: TetheredInterfaceCallback): TetheredInterfaceRequest
  proc isTetheringOn*(): jboolean
  ACTION_CONNECTION_STATE_CHANGED*: string {.`static`.}
  EXTRA_LOCAL_ROLE*: string {.`static`.}
  ACTION_TETHERING_STATE_CHANGED*: string {.`static`.}
  EXTRA_TETHERING_STATE*: string {.`static`.}
  PAN_ROLE_NONE*: jint {.`static`.}
  LOCAL_NAP_ROLE*: jint {.`static`.}
  LOCAL_PANU_ROLE*: jint {.`static`.}
  REMOTE_NAP_ROLE*: jint {.`static`.}
  REMOTE_PANU_ROLE*: jint {.`static`.}
  TETHERING_STATE_OFF*: jint {.`static`.}
  TETHERING_STATE_ON*: jint {.`static`.}
  PAN_DISCONNECT_FAILED_NOT_CONNECTED*: jint {.`static`.}
  PAN_CONNECT_FAILED_ALREADY_CONNECTED*: jint {.`static`.}
  PAN_CONNECT_FAILED_ATTEMPT_FAILED*: jint {.`static`.}
  PAN_OPERATION_GENERIC_FAILURE*: jint {.`static`.}
  PAN_OPERATION_SUCCESS*: jint {.`static`.}

jclass android.bluetooth.BluetoothPan.BluetoothTetheredInterfaceRequest* of JVMObject:
  proc release*()

jclass android.bluetooth.BluetoothTetheredInterfaceRequest* of JVMObject:
  proc release*()

