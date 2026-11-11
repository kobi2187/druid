import jnim

jclass android.bluetooth.BluetoothHidHost* of JVMObject:
  proc onServiceConnected*(service: IBinder)
  proc onServiceDisconnected*()
  proc getAdapter*(): BluetoothAdapter
  proc connect*(device: BluetoothDevice): jboolean
  proc disconnect*(device: BluetoothDevice): jboolean
  proc getConnectedDevices*(): List[BluetoothDevice]
  proc getDevicesMatchingConnectionStates*(states: seq[jint]): List[BluetoothDevice]
  proc getConnectionState*(device: BluetoothDevice): jint
  proc setPriority*(device: BluetoothDevice, priority: jint): jboolean
  proc setConnectionPolicy*(device: BluetoothDevice, connectionPolicy: jint): jboolean
  proc setPreferredTransport*(device: BluetoothDevice, transport: jint): jboolean
  proc getPriority*(device: BluetoothDevice): jint
  proc getConnectionPolicy*(device: BluetoothDevice): jint
  proc getPreferredTransport*(device: BluetoothDevice): jint
  proc virtualUnplug*(device: BluetoothDevice): jboolean
  proc getProtocolMode*(device: BluetoothDevice): jboolean
  proc setProtocolMode*(device: BluetoothDevice, protocolMode: jint): jboolean
  proc getReport*(device: BluetoothDevice, reportType: jbyte, reportId: jbyte, bufferSize: jint): jboolean
  proc setReport*(device: BluetoothDevice, reportType: jbyte, report: string): jboolean
  proc sendData*(device: BluetoothDevice, report: string): jboolean
  proc getIdleTime*(device: BluetoothDevice): jboolean
  proc setIdleTime*(device: BluetoothDevice, idleTime: jbyte): jboolean
  ACTION_CONNECTION_STATE_CHANGED*: string {.`static`.}
  ACTION_PROTOCOL_MODE_CHANGED*: string {.`static`.}
  ACTION_HANDSHAKE*: string {.`static`.}
  ACTION_REPORT*: string {.`static`.}
  ACTION_VIRTUAL_UNPLUG_STATUS*: string {.`static`.}
  ACTION_IDLE_TIME_CHANGED*: string {.`static`.}
  INPUT_DISCONNECT_FAILED_NOT_CONNECTED*: jint {.`static`.}
  INPUT_CONNECT_FAILED_ALREADY_CONNECTED*: jint {.`static`.}
  INPUT_CONNECT_FAILED_ATTEMPT_FAILED*: jint {.`static`.}
  INPUT_OPERATION_GENERIC_FAILURE*: jint {.`static`.}
  INPUT_OPERATION_SUCCESS*: jint {.`static`.}
  PROTOCOL_REPORT_MODE*: jint {.`static`.}
  PROTOCOL_BOOT_MODE*: jint {.`static`.}
  PROTOCOL_UNSUPPORTED_MODE*: jint {.`static`.}
  REPORT_TYPE_INPUT*: jbyte {.`static`.}
  REPORT_TYPE_OUTPUT*: jbyte {.`static`.}
  REPORT_TYPE_FEATURE*: jbyte {.`static`.}
  VIRTUAL_UNPLUG_STATUS_SUCCESS*: jint {.`static`.}
  VIRTUAL_UNPLUG_STATUS_FAIL*: jint {.`static`.}
  EXTRA_PROTOCOL_MODE*: string {.`static`.}
  EXTRA_REPORT_TYPE*: string {.`static`.}
  EXTRA_REPORT_ID*: string {.`static`.}
  EXTRA_REPORT_BUFFER_SIZE*: string {.`static`.}
  EXTRA_REPORT*: string {.`static`.}
  EXTRA_STATUS*: string {.`static`.}
  EXTRA_VIRTUAL_UNPLUG_STATUS*: string {.`static`.}
  EXTRA_IDLE_TIME*: string {.`static`.}

