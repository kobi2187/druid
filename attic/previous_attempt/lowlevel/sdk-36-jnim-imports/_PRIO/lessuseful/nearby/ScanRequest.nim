import jnim

jclass android.nearby.ScanRequest* of JVMObject:
  proc scanModeToString*(scanMode: jint): string {.`static`.}
  proc isValidScanType*(scanType: jint): jboolean {.`static`.}
  proc isValidScanMode*(scanMode: jint): jboolean {.`static`.}
  proc getScanType*(): jint
  proc getScanMode*(): jint
  proc isBleEnabled*(): jboolean
  proc isOffloadOnly*(): jboolean
  proc getScanFilters*(): List[ScanFilter]
  proc getWorkSource*(): WorkSource
  proc describeContents*(): jint
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  SCAN_TYPE_FAST_PAIR*: jint {.`static`.}
  SCAN_TYPE_NEARBY_PRESENCE*: jint {.`static`.}
  SCAN_MODE_LOW_LATENCY*: jint {.`static`.}
  SCAN_MODE_BALANCED*: jint {.`static`.}
  SCAN_MODE_LOW_POWER*: jint {.`static`.}
  SCAN_MODE_NO_POWER*: jint {.`static`.}
  SCAN_MODE_CHRE_ONLY*: jint {.`static`.}
  CREATOR*: Creator[ScanRequest] {.`static`.}

jclass android.nearby.ScanRequest.Builder* of JVMObject:
  proc setScanType*(scanType: jint): Builder
  proc setScanMode*(scanMode: jint): Builder
  proc setBleEnabled*(bleEnabled: jboolean): Builder
  proc setOffloadOnly*(offloadOnly: jboolean): Builder
  proc setWorkSource*(workSource: WorkSource): Builder
  proc addScanFilter*(scanFilter: ScanFilter): Builder
  proc build*(): ScanRequest

jclass android.nearby.Builder* of JVMObject:
  proc setScanType*(scanType: jint): Builder
  proc setScanMode*(scanMode: jint): Builder
  proc setBleEnabled*(bleEnabled: jboolean): Builder
  proc setOffloadOnly*(offloadOnly: jboolean): Builder
  proc setWorkSource*(workSource: WorkSource): Builder
  proc addScanFilter*(scanFilter: ScanFilter): Builder
  proc build*(): ScanRequest

