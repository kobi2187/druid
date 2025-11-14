import jnim

jclass android.net.NetworkStatsHistory* of JVMObject:
  proc writeToParcel*(output:Parcel, flags: jint)
  proc writeToStream*(output:DataOutput)
  proc describeContents*(): jint
  proc size*(): jint
  proc getBucketDuration*(): jlong
  proc getStart*(): jlong
  proc getEnd*(): jlong
  proc getTotalBytes*(): jlong
  proc getIndexBefore*(time: jlong): jint
  proc getIndexAfter*(time: jlong): jint
  proc getValues*(i: jint, recycle: Entry): Entry
  proc getEntries*(): List[Entry]
  proc setValues*(i: jint, entry: Entry)
  proc recordData*(start: jlong, end: jlong, rxBytes: jlong, txBytes: jlong)
  proc recordData*(start: jlong, end: jlong, entry: NetworkStats.Entry)
  proc recordEntireHistory*(input: NetworkStatsHistory)
  proc recordHistory*(input: NetworkStatsHistory, start: jlong, end: jlong)
  proc clear*()
  proc removeBucketsStartingBefore*(cutoff: jlong)
  proc getValues*(start: jlong, end: jlong, recycle: Entry): Entry
  proc getValues*(start: jlong, end: jlong, now: jlong, recycle: Entry): Entry
  proc generateRandom*(start: jlong, end: jlong, bytes: jlong)
  proc generateRandom*(start: jlong, end: jlong, rxBytes: jlong, rxPackets: jlong, txBytes: jlong, txPackets: jlong, operations: jlong, r: Random)
  proc randomLong*(r: Random, start: jlong, end: jlong): jlong {.`static`.}
  proc intersects*(start: jlong, end: jlong): jboolean
  proc dump*(pw: IndentingPrintWriter, fullHistory: jboolean)
  proc dumpCheckin*(pw: PrintWriter)
  proc dumpDebug*(proto: ProtoOutputStream, tag: jlong)
  proc toString*(): string
  proc isSameAs*(other: NetworkStatsHistory): jboolean
  proc estimateResizeBuckets*(newBucketDuration: jlong): jint
  FIELD_ACTIVE_TIME*: jint {.`static`.}
  FIELD_RX_BYTES*: jint {.`static`.}
  FIELD_RX_PACKETS*: jint {.`static`.}
  FIELD_TX_BYTES*: jint {.`static`.}
  FIELD_TX_PACKETS*: jint {.`static`.}
  FIELD_OPERATIONS*: jint {.`static`.}
  FIELD_ALL*: jint {.`static`.}
  CREATOR*: Creator[NetworkStatsHistory] {.`static`.}

jclass android.net.NetworkStatsHistory.Entry* of JVMObject:
  proc getBucketStart*(): jlong
  proc getActiveTime*(): jlong
  proc getRxBytes*(): jlong
  proc getRxPackets*(): jlong
  proc getTxBytes*(): jlong
  proc getTxPackets*(): jlong
  proc getOperations*(): jlong
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc plus*(another: Entry, bucketDuration: jlong): Entry

jclass android.net.NetworkStatsHistory.DataStreamUtils* of JVMObject:
  proc readFullLongArray*(in: DataInput): seq[jlong] {.`static`.}
  proc readVarLong*(in: DataInput): jlong {.`static`.}
  proc writeVarLong*(output:DataOutput, value: jlong) {.`static`.}
  proc readVarLongArray*(in: DataInput): seq[jlong] {.`static`.}
  proc writeVarLongArray*(output:DataOutput, values: seq[jlong], size: jint) {.`static`.}

jclass android.net.NetworkStatsHistory.ParcelUtils* of JVMObject:
  proc readLongArray*(in: Parcel): seq[jlong] {.`static`.}
  proc writeLongArray*(output:Parcel, values: seq[jlong], size: jint) {.`static`.}

jclass android.net.NetworkStatsHistory.Builder* of JVMObject:
  proc addEntry*(entry: Entry): Builder
  proc build*(): NetworkStatsHistory

jclass android.net.Entry* of JVMObject:
  proc getBucketStart*(): jlong
  proc getActiveTime*(): jlong
  proc getRxBytes*(): jlong
  proc getRxPackets*(): jlong
  proc getTxBytes*(): jlong
  proc getTxPackets*(): jlong
  proc getOperations*(): jlong
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc plus*(another: Entry, bucketDuration: jlong): Entry
  UNKNOWN*: jlong {.`static`.}
  bucketDuration*: jlong
  bucketStart*: jlong
  activeTime*: jlong
  rxBytes*: jlong
  rxPackets*: jlong
  txBytes*: jlong
  txPackets*: jlong
  operations*: jlong

jclass android.net.DataStreamUtils* of JVMObject:
  proc readFullLongArray*(in: DataInput): seq[jlong] {.`static`.}
  proc readVarLong*(in: DataInput): jlong {.`static`.}
  proc writeVarLong*(output:DataOutput, value: jlong) {.`static`.}
  proc readVarLongArray*(in: DataInput): seq[jlong] {.`static`.}
  proc writeVarLongArray*(output:DataOutput, values: seq[jlong], size: jint) {.`static`.}

jclass android.net.ParcelUtils* of JVMObject:
  proc readLongArray*(in: Parcel): seq[jlong] {.`static`.}
  proc writeLongArray*(output:Parcel, values: seq[jlong], size: jint) {.`static`.}

jclass android.net.Builder* of JVMObject:
  proc addEntry*(entry: Entry): Builder
  proc build*(): NetworkStatsHistory

