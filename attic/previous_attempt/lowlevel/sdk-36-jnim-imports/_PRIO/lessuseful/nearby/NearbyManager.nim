import jnim

jclass android.nearby.NearbyManager* of JVMObject:
  proc startScan*(scanRequest: ScanRequest, executor: Executor, scanCallback: ScanCallback): jint
  proc stopScan*(scanCallback: ScanCallback)
  proc startBroadcast*(broadcastRequest: BroadcastRequest, executor: Executor, callback: BroadcastCallback)
  proc stopBroadcast*(callback: BroadcastCallback)
  proc queryOffloadCapability*(executor: Executor, callback: Consumer[OffloadCapability])
  proc setPoweredOffFindingEphemeralIds*(eids: List[seq[jbyte]])
  proc setPoweredOffFindingMode*(poweredOffFindingMode: jint)
  proc getPoweredOffFindingMode*(): jint
  POWERED_OFF_FINDING_MODE_UNSUPPORTED*: jint {.`static`.}
  POWERED_OFF_FINDING_MODE_DISABLED*: jint {.`static`.}
  POWERED_OFF_FINDING_MODE_ENABLED*: jint {.`static`.}

