import jnim

jclass android.bluetooth.BluetoothLeBroadcastAssistant* of JVMObject:
  proc close*()
  proc onServiceConnected*(service: IBinder)
  proc onServiceDisconnected*()
  proc getAdapter*(): BluetoothAdapter
  proc getConnectionState*(sink: BluetoothDevice): jint
  proc getDevicesMatchingConnectionStates*(states: seq[jint]): List[BluetoothDevice]
  proc getConnectedDevices*(): List[BluetoothDevice]
  proc setConnectionPolicy*(device: BluetoothDevice, connectionPolicy: jint): jboolean
  proc getConnectionPolicy*(device: BluetoothDevice): jint
  proc registerCallback*(executor: Executor, callback: Callback)
  proc unregisterCallback*(callback: Callback)
  proc startSearchingForSources*(filters: List[ScanFilter])
  proc stopSearchingForSources*()
  proc isSearchInProgress*(): jboolean
  proc addSource*(sink: BluetoothDevice, sourceMetadata: BluetoothLeBroadcastMetadata, isGroupOp: jboolean)
  proc modifySource*(sink: BluetoothDevice, sourceId: jint, updatedMetadata: BluetoothLeBroadcastMetadata)
  proc removeSource*(sink: BluetoothDevice, sourceId: jint)
  proc getAllSources*(sink: BluetoothDevice): List[BluetoothLeBroadcastReceiveState]
  proc getMaximumSourceCapacity*(sink: BluetoothDevice): jint
  proc getSourceMetadata*(sink: BluetoothDevice, sourceId: jint): BluetoothLeBroadcastMetadata
  ACTION_CONNECTION_STATE_CHANGED*: string {.`static`.}

