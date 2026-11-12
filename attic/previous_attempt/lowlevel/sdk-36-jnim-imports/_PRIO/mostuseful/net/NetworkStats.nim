import jnim

jclass android.net.NetworkStats* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc clone*(): NetworkStats
  proc clear*()
  proc insertEntry*(iface: string, rxBytes: jlong, rxPackets: jlong, txBytes: jlong, txPackets: jlong): NetworkStats
  proc insertEntry*(iface: string, uid: jint, set: jint, tag: jint, rxBytes: jlong, rxPackets: jlong, txBytes: jlong, txPackets: jlong, operations: jlong): NetworkStats
  proc insertEntry*(iface: string, uid: jint, set: jint, tag: jint, metered: jint, roaming: jint, defaultNetwork: jint, rxBytes: jlong, rxPackets: jlong, txBytes: jlong, txPackets: jlong, operations: jlong): NetworkStats
  proc insertEntry*(entry: Entry): NetworkStats
  proc iterator*(): Iterator[Entry]
  proc getValues*(i: jint, recycle: Entry): Entry
  proc getElapsedRealtime*(): jlong
  proc setElapsedRealtime*(time: jlong)
  proc getElapsedRealtimeAge*(): jlong
  proc size*(): jint
  proc internalSize*(): jint
  proc combineValues*(iface: string, uid: jint, tag: jint, rxBytes: jlong, rxPackets: jlong, txBytes: jlong, txPackets: jlong, operations: jlong): NetworkStats
  proc combineValues*(iface: string, uid: jint, set: jint, tag: jint, rxBytes: jlong, rxPackets: jlong, txBytes: jlong, txPackets: jlong, operations: jlong): NetworkStats
  proc combineValues*(entry: Entry): NetworkStats
  proc addEntries*(entries: List[Entry]): NetworkStats
  proc addEntry*(entry: Entry): NetworkStats
  proc add*(another: NetworkStats): NetworkStats
  proc combineAllValues*(another: NetworkStats)
  proc findIndex*(iface: string, uid: jint, set: jint, tag: jint, metered: jint, roaming: jint, defaultNetwork: jint): jint
  proc findIndexHinted*(iface: string, uid: jint, set: jint, tag: jint, metered: jint, roaming: jint, defaultNetwork: jint, hintIndex: jint): jint
  proc spliceOperationsFrom*(stats: NetworkStats)
  proc getUniqueIfaces*(): seq[string]
  proc getUniqueUids*(): seq[jint]
  proc getTotalBytes*(): jlong
  proc getTotal*(recycle: Entry): Entry
  proc getTotal*(recycle: Entry, limitUid: jint): Entry
  proc getTotal*(recycle: Entry, limitIface: HashSet[string]): Entry
  proc getTotalIncludingTags*(recycle: Entry): Entry
  proc getTotalPackets*(): jlong
  proc subtract*(right: NetworkStats): NetworkStats
  proc subtract*(left: NetworkStats, right: NetworkStats, observer: NonMonotonicObserver[C], cookie: C): NetworkStats {.`static`.}
  proc subtract*(left: NetworkStats, right: NetworkStats, observer: NonMonotonicObserver[C], cookie: C, recycle: NetworkStats): NetworkStats {.`static`.}
  proc apply464xlatAdjustments*(baseTraffic: NetworkStats, stackedTraffic: NetworkStats, stackedIfaces: Map[string, string]) {.`static`.}
  proc apply464xlatAdjustments*(stackedIfaces: Map[string, string])
  proc groupedByIface*(): NetworkStats
  proc groupedByUid*(): NetworkStats
  proc removeUids*(uids: seq[jint])
  proc removeEmptyEntries*(): NetworkStats
  proc withoutInterfaces*(): NetworkStats
  proc filter*(limitUid: jint, limitIfaces: seq[string], limitTag: jint)
  proc filterDebugEntries*()
  proc dump*(prefix: string, pw: PrintWriter)
  proc setToString*(set: jint): string {.`static`.}
  proc setToCheckinString*(set: jint): string {.`static`.}
  proc setMatches*(querySet: jint, dataSet: jint): jboolean {.`static`.}
  proc tagToString*(tag: jint): string {.`static`.}
  proc meteredToString*(metered: jint): string {.`static`.}
  proc roamingToString*(roaming: jint): string {.`static`.}
  proc defaultNetworkToString*(defaultNetwork: jint): string {.`static`.}
  proc toString*(): string
  proc describeContents*(): jint
  proc migrateTun*(tunUid: jint, tunIface: string, underlyingIfaces: List[string])
  IFACE_ALL*: string {.`static`.}
  IFACE_VT*: string {.`static`.}
  UID_ALL*: jint {.`static`.}
  UID_TETHERING*: jint {.`static`.}
  TAG_ALL*: jint {.`static`.}
  SET_ALL*: jint {.`static`.}
  SET_DEFAULT*: jint {.`static`.}
  SET_FOREGROUND*: jint {.`static`.}
  SET_DEBUG_START*: jint {.`static`.}
  SET_DBG_VPN_IN*: jint {.`static`.}
  SET_DBG_VPN_OUT*: jint {.`static`.}
  INTERFACES_ALL*: string {.`static`.}
  TAG_NONE*: jint {.`static`.}
  METERED_ALL*: jint {.`static`.}
  METERED_NO*: jint {.`static`.}
  METERED_YES*: jint {.`static`.}
  ROAMING_ALL*: jint {.`static`.}
  ROAMING_NO*: jint {.`static`.}
  ROAMING_YES*: jint {.`static`.}
  DEFAULT_NETWORK_ALL*: jint {.`static`.}
  DEFAULT_NETWORK_NO*: jint {.`static`.}
  DEFAULT_NETWORK_YES*: jint {.`static`.}
  STATS_PER_IFACE*: jint {.`static`.}
  STATS_PER_UID*: jint {.`static`.}
  CREATOR*: Creator[NetworkStats] {.`static`.}

jclass android.net.NetworkStats.Entry* of JVMObject:
  proc isNegative*(): jboolean
  proc isEmpty*(): jboolean
  proc add*(another: Entry)
  proc getIface*(): string
  proc getUid*(): jint
  proc getSet*(): jint
  proc getTag*(): jint
  proc getMetered*(): jint
  proc getRoaming*(): jint
  proc getDefaultNetwork*(): jint
  proc getRxBytes*(): jlong
  proc getRxPackets*(): jlong
  proc getTxBytes*(): jlong
  proc getTxPackets*(): jlong
  proc getOperations*(): jlong
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.net.NetworkStats.NonMonotonicObserver* of JVMObject:
  proc foundNonMonotonic*(left: NetworkStats, leftIndex: jint, right: NetworkStats, rightIndex: jint, cookie: C)
  proc foundNonMonotonic*(stats: NetworkStats, statsIndex: jint, cookie: C)

jclass android.net.Entry* of JVMObject:
  proc isNegative*(): jboolean
  proc isEmpty*(): jboolean
  proc add*(another: Entry)
  proc getIface*(): string
  proc getUid*(): jint
  proc getSet*(): jint
  proc getTag*(): jint
  proc getMetered*(): jint
  proc getRoaming*(): jint
  proc getDefaultNetwork*(): jint
  proc getRxBytes*(): jlong
  proc getRxPackets*(): jlong
  proc getTxBytes*(): jlong
  proc getTxPackets*(): jlong
  proc getOperations*(): jlong
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  iface*: string
  uid*: jint
  set*: jint
  tag*: jint
  metered*: jint
  roaming*: jint
  defaultNetwork*: jint
  rxBytes*: jlong
  rxPackets*: jlong
  txBytes*: jlong
  txPackets*: jlong
  operations*: jlong

jclass android.net.NonMonotonicObserver* of JVMObject:
  proc foundNonMonotonic*(left: NetworkStats, leftIndex: jint, right: NetworkStats, rightIndex: jint, cookie: C)
  proc foundNonMonotonic*(stats: NetworkStats, statsIndex: jint, cookie: C)

