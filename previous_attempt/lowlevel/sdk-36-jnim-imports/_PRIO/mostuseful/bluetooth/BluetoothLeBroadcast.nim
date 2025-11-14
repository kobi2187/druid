import jnim

jclass android.bluetooth.BluetoothLeBroadcast* of JVMObject:
  proc getConnectionState*(device: BluetoothDevice): jint
  proc getDevicesMatchingConnectionStates*(states: seq[jint]): List[BluetoothDevice]
  proc getConnectedDevices*(): List[BluetoothDevice]
  proc registerCallback*(executor: Executor, callback: Callback)
  proc unregisterCallback*(callback: Callback)
  proc startBroadcast*(contentMetadata: BluetoothLeAudioContentMetadata, broadcastCode: seq[jbyte])
  proc startBroadcast*(broadcastSettings: BluetoothLeBroadcastSettings)
  proc updateBroadcast*(broadcastId: jint, contentMetadata: BluetoothLeAudioContentMetadata)
  proc updateBroadcast*(broadcastId: jint, broadcastSettings: BluetoothLeBroadcastSettings)
  proc stopBroadcast*(broadcastId: jint)
  proc isPlaying*(broadcastId: jint): jboolean
  proc getAllBroadcastMetadata*(): List[BluetoothLeBroadcastMetadata]
  proc getMaximumNumberOfBroadcasts*(): jint
  proc getMaximumStreamsPerBroadcast*(): jint
  proc getMaximumSubgroupsPerBroadcast*(): jint
  proc close*()
  proc onServiceConnected*(service: IBinder)
  proc onServiceDisconnected*()
  proc getAdapter*(): BluetoothAdapter

