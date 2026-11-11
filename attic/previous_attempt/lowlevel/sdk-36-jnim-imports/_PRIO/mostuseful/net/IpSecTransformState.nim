import jnim

jclass android.net.IpSecTransformState* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc getTimestampMillis*(): jlong
  proc getTxHighestSequenceNumber*(): jlong
  proc getRxHighestSequenceNumber*(): jlong
  proc getPacketCount*(): jlong
  proc getByteCount*(): jlong
  proc getReplayBitmap*(): seq[jbyte]
  CREATOR*: Parcelable.Creator[IpSecTransformState] {.`static`.}

jclass android.net.IpSecTransformState.Builder* of JVMObject:
  proc setTimestampMillis*(timestamp: jlong): Builder
  proc setTxHighestSequenceNumber*(seqNum: jlong): Builder
  proc setRxHighestSequenceNumber*(seqNum: jlong): Builder
  proc setPacketCount*(packetCount: jlong): Builder
  proc setByteCount*(byteCount: jlong): Builder
  proc setReplayBitmap*(bitMap: seq[jbyte]): Builder
  proc build*(): IpSecTransformState

jclass android.net.Builder* of JVMObject:
  proc setTimestampMillis*(timestamp: jlong): Builder
  proc setTxHighestSequenceNumber*(seqNum: jlong): Builder
  proc setRxHighestSequenceNumber*(seqNum: jlong): Builder
  proc setPacketCount*(packetCount: jlong): Builder
  proc setByteCount*(byteCount: jlong): Builder
  proc setReplayBitmap*(bitMap: seq[jbyte]): Builder
  proc build*(): IpSecTransformState

