import jnim

jclass android.net.TrafficStats* of JVMObject:
  proc setServiceForTest*(statsService: INetworkStatsService) {.`static`.}
  proc setTimeSupplierForTest*(timeSupplier: LongSupplier) {.`static`.}
  proc reinitRateLimitCacheForTest*() {.`static`.}
  proc init*(context: Context) {.`static`.}
  proc attachSocketTagger*() {.`static`.}
  proc setThreadStatsTag*(tag: jint) {.`static`.}
  proc getAndSetThreadStatsTag*(tag: jint): jint {.`static`.}
  proc setThreadStatsTagBackup*() {.`static`.}
  proc setThreadStatsTagRestore*() {.`static`.}
  proc setThreadStatsTagApp*() {.`static`.}
  proc setThreadStatsTagDownload*() {.`static`.}
  proc getThreadStatsTag*(): jint {.`static`.}
  proc clearThreadStatsTag*() {.`static`.}
  proc setThreadStatsUid*(uid: jint) {.`static`.}
  proc getThreadStatsUid*(): jint {.`static`.}
  proc setThreadStatsUidSelf*() {.`static`.}
  proc clearThreadStatsUid*() {.`static`.}
  proc tagSocket*(socket: Socket) {.`static`.}
  proc untagSocket*(socket: Socket) {.`static`.}
  proc tagDatagramSocket*(socket: DatagramSocket) {.`static`.}
  proc untagDatagramSocket*(socket: DatagramSocket) {.`static`.}
  proc tagFileDescriptor*(fd: FileDescriptor) {.`static`.}
  proc untagFileDescriptor*(fd: FileDescriptor) {.`static`.}
  proc startDataProfiling*(context: Context) {.`static`.}
  proc stopDataProfiling*(context: Context): NetworkStats {.`static`.}
  proc incrementOperationCount*(operationCount: jint) {.`static`.}
  proc incrementOperationCount*(tag: jint, operationCount: jint) {.`static`.}
  proc closeQuietly*(session: INetworkStatsSession) {.`static`.}
  proc getMobileTxPackets*(): jlong {.`static`.}
  proc getMobileRxPackets*(): jlong {.`static`.}
  proc getMobileTxBytes*(): jlong {.`static`.}
  proc getMobileRxBytes*(): jlong {.`static`.}
  proc getMobileTcpRxPackets*(): jlong {.`static`.}
  proc getMobileTcpTxPackets*(): jlong {.`static`.}
  proc clearRateLimitCaches*() {.`static`.}
  proc getTxPackets*(iface: string): jlong {.`static`.}
  proc getRxPackets*(iface: string): jlong {.`static`.}
  proc getTxBytes*(iface: string): jlong {.`static`.}
  proc getRxBytes*(iface: string): jlong {.`static`.}
  proc getLoopbackTxPackets*(): jlong {.`static`.}
  proc getLoopbackRxPackets*(): jlong {.`static`.}
  proc getLoopbackTxBytes*(): jlong {.`static`.}
  proc getLoopbackRxBytes*(): jlong {.`static`.}
  proc getTotalTxPackets*(): jlong {.`static`.}
  proc getTotalRxPackets*(): jlong {.`static`.}
  proc getTotalTxBytes*(): jlong {.`static`.}
  proc getTotalRxBytes*(): jlong {.`static`.}
  proc getUidTxBytes*(uid: jint): jlong {.`static`.}
  proc getUidRxBytes*(uid: jint): jlong {.`static`.}
  proc getUidTxPackets*(uid: jint): jlong {.`static`.}
  proc getUidRxPackets*(uid: jint): jlong {.`static`.}
  proc getUidStats*(uid: jint, type: jint): jlong {.`static`.}
  proc getTotalStats*(type: jint): jlong {.`static`.}
  proc getIfaceStats*(iface: string, type: jint): jlong {.`static`.}
  proc getUidTcpTxBytes*(uid: jint): jlong {.`static`.}
  proc getUidTcpRxBytes*(uid: jint): jlong {.`static`.}
  proc getUidUdpTxBytes*(uid: jint): jlong {.`static`.}
  proc getUidUdpRxBytes*(uid: jint): jlong {.`static`.}
  proc getUidTcpTxSegments*(uid: jint): jlong {.`static`.}
  proc getUidTcpRxSegments*(uid: jint): jlong {.`static`.}
  proc getUidUdpTxPackets*(uid: jint): jlong {.`static`.}
  proc getUidUdpRxPackets*(uid: jint): jlong {.`static`.}
  UNSUPPORTED*: jint {.`static`.}
  KB_IN_BYTES*: jlong {.`static`.}
  MB_IN_BYTES*: jlong {.`static`.}
  GB_IN_BYTES*: jlong {.`static`.}
  TB_IN_BYTES*: jlong {.`static`.}
  PB_IN_BYTES*: jlong {.`static`.}
  UID_REMOVED*: jint {.`static`.}
  UID_TETHERING*: jint {.`static`.}
  TAG_NETWORK_STACK_RANGE_START*: jint {.`static`.}
  TAG_NETWORK_STACK_RANGE_END*: jint {.`static`.}
  TAG_SYSTEM_IMPERSONATION_RANGE_START*: jint {.`static`.}
  TAG_SYSTEM_IMPERSONATION_RANGE_END*: jint {.`static`.}
  TAG_NETWORK_STACK_IMPERSONATION_RANGE_START*: jint {.`static`.}
  TAG_NETWORK_STACK_IMPERSONATION_RANGE_END*: jint {.`static`.}
  TAG_SYSTEM_DOWNLOAD*: jint {.`static`.}
  TAG_SYSTEM_MEDIA*: jint {.`static`.}
  TAG_SYSTEM_BACKUP*: jint {.`static`.}
  TAG_SYSTEM_RESTORE*: jint {.`static`.}
  TAG_SYSTEM_APP*: jint {.`static`.}
  TAG_SYSTEM_PROBE*: jint {.`static`.}
  TYPE_RX_BYTES*: jint {.`static`.}
  TYPE_RX_PACKETS*: jint {.`static`.}
  TYPE_TX_BYTES*: jint {.`static`.}
  TYPE_TX_PACKETS*: jint {.`static`.}

