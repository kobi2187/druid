import jnim

jclass android.bluetooth.BluetoothMapClient* of JVMObject:
  proc close*()
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
  proc getPriority*(device: BluetoothDevice): jint
  proc getConnectionPolicy*(device: BluetoothDevice): jint
  proc sendMessage*(device: BluetoothDevice, contacts: Collection[Uri], message: string, sentIntent: PendingIntent, deliveredIntent: PendingIntent): jboolean
  proc sendMessage*(device: BluetoothDevice, contacts: seq[Uri], message: string, sentIntent: PendingIntent, deliveredIntent: PendingIntent): jboolean
  ACTION_CONNECTION_STATE_CHANGED*: string {.`static`.}
  ACTION_MESSAGE_RECEIVED*: string {.`static`.}
  ACTION_MESSAGE_SENT_SUCCESSFULLY*: string {.`static`.}
  ACTION_MESSAGE_DELIVERED_SUCCESSFULLY*: string {.`static`.}
  ACTION_MESSAGE_READ_STATUS_CHANGED*: string {.`static`.}
  ACTION_MESSAGE_DELETED_STATUS_CHANGED*: string {.`static`.}
  EXTRA_MESSAGE_HANDLE*: string {.`static`.}
  EXTRA_MESSAGE_TIMESTAMP*: string {.`static`.}
  EXTRA_MESSAGE_READ_STATUS*: string {.`static`.}
  EXTRA_SENDER_CONTACT_URI*: string {.`static`.}
  EXTRA_SENDER_CONTACT_NAME*: string {.`static`.}
  EXTRA_MESSAGE_DELETED_STATUS*: string {.`static`.}
  EXTRA_RESULT_CODE*: string {.`static`.}
  STATE_ERROR*: jint {.`static`.}
  RESULT_FAILURE*: jint {.`static`.}
  RESULT_SUCCESS*: jint {.`static`.}
  RESULT_CANCELED*: jint {.`static`.}
  UNREAD*: jint {.`static`.}
  READ*: jint {.`static`.}
  UNDELETED*: jint {.`static`.}
  DELETED*: jint {.`static`.}

