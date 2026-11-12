import jnim

jclass android.telecom.BluetoothCallQualityReport* of JVMObject:
  proc getSentTimestampMillis*(): jlong
  proc isChoppyVoice*(): jboolean
  proc getRssiDbm*(): jint
  proc getSnrDb*(): jint
  proc getRetransmittedPacketsCount*(): jint
  proc getPacketsNotReceivedCount*(): jint
  proc getNegativeAcknowledgementCount*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  EVENT_BLUETOOTH_CALL_QUALITY_REPORT*: string {.`static`.}
  EXTRA_BLUETOOTH_CALL_QUALITY_REPORT*: string {.`static`.}
  CREATOR*: Creator[BluetoothCallQualityReport] {.`static`.}

jclass android.telecom.BluetoothCallQualityReport.Builder* of JVMObject:
  proc setSentTimestampMillis*(sentTimestampMillis: jlong): Builder
  proc setChoppyVoice*(choppyVoice: jboolean): Builder
  proc setRssiDbm*(rssiDbm: jint): Builder
  proc setSnrDb*(snrDb: jint): Builder
  proc setRetransmittedPacketsCount*(retransmittedPacketsCount: jint): Builder
  proc setPacketsNotReceivedCount*(packetsNotReceivedCount: jint): Builder
  proc setNegativeAcknowledgementCount*(negativeAcknowledgementCount: jint): Builder
  proc build*(): BluetoothCallQualityReport

jclass android.telecom.Builder* of JVMObject:
  proc setSentTimestampMillis*(sentTimestampMillis: jlong): Builder
  proc setChoppyVoice*(choppyVoice: jboolean): Builder
  proc setRssiDbm*(rssiDbm: jint): Builder
  proc setSnrDb*(snrDb: jint): Builder
  proc setRetransmittedPacketsCount*(retransmittedPacketsCount: jint): Builder
  proc setPacketsNotReceivedCount*(packetsNotReceivedCount: jint): Builder
  proc setNegativeAcknowledgementCount*(negativeAcknowledgementCount: jint): Builder
  proc build*(): BluetoothCallQualityReport

