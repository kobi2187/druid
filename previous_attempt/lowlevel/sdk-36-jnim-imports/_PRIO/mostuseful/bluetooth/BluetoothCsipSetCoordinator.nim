import jnim

jclass android.bluetooth.BluetoothCsipSetCoordinator* of JVMObject:
  proc close*()
  proc onServiceConnected*(service: IBinder)
  proc onServiceDisconnected*()
  proc getAdapter*(): BluetoothAdapter
  proc lockGroup*(groupId: jint, executor: Executor, callback: ClientLockCallback): UUID
  proc unlockGroup*(lockUuid: UUID): jboolean
  proc getGroupUuidMapByDevice*(device: BluetoothDevice): Map[Integer, ParcelUuid]
  proc getAllGroupIds*(uuid: ParcelUuid): List[Integer]
  proc getConnectedDevices*(): List[BluetoothDevice]
  proc getDevicesMatchingConnectionStates*(states: seq[jint]): List[BluetoothDevice]
  proc getConnectionState*(device: BluetoothDevice): jint
  proc setConnectionPolicy*(device: BluetoothDevice, connectionPolicy: jint): jboolean
  proc getConnectionPolicy*(device: BluetoothDevice): jint
  ACTION_CSIS_CONNECTION_STATE_CHANGED*: string {.`static`.}
  ACTION_CSIS_DEVICE_AVAILABLE*: string {.`static`.}
  EXTRA_CSIS_GROUP_ID*: string {.`static`.}
  EXTRA_CSIS_GROUP_SIZE*: string {.`static`.}
  EXTRA_CSIS_GROUP_TYPE_UUID*: string {.`static`.}
  ACTION_CSIS_SET_MEMBER_AVAILABLE*: string {.`static`.}
  GROUP_ID_INVALID*: jint {.`static`.}

