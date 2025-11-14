import jnim

jclass android.net.LinkQualityInfo* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc writeToParcel*(dest: Parcel, flags: jint, objectType: jint)
  proc getNetworkType*(): jint
  proc setNetworkType*(networkType: jint)
  proc getNormalizedSignalStrength*(): jint
  proc setNormalizedSignalStrength*(normalizedSignalStrength: jint)
  proc getPacketCount*(): jlong
  proc setPacketCount*(packetCount: jlong)
  proc getPacketErrorCount*(): jlong
  proc setPacketErrorCount*(packetErrorCount: jlong)
  proc getTheoreticalTxBandwidth*(): jint
  proc setTheoreticalTxBandwidth*(theoreticalTxBandwidth: jint)
  proc getTheoreticalRxBandwidth*(): jint
  proc setTheoreticalRxBandwidth*(theoreticalRxBandwidth: jint)
  proc getTheoreticalLatency*(): jint
  proc setTheoreticalLatency*(theoreticalLatency: jint)
  proc getLastDataSampleTime*(): jlong
  proc setLastDataSampleTime*(lastDataSampleTime: jlong)
  proc getDataSampleDuration*(): jint
  proc setDataSampleDuration*(dataSampleDuration: jint)
  UNKNOWN_INT*: jint {.`static`.}
  UNKNOWN_LONG*: jlong {.`static`.}
  NORMALIZED_MIN_SIGNAL_STRENGTH*: jint {.`static`.}
  NORMALIZED_MAX_SIGNAL_STRENGTH*: jint {.`static`.}
  NORMALIZED_SIGNAL_STRENGTH_RANGE*: jint {.`static`.}
  CREATOR*: Creator[LinkQualityInfo] {.`static`.}

