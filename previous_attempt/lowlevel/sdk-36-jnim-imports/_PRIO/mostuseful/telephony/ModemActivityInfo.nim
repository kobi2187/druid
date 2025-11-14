import jnim

jclass android.telephony.ModemActivityInfo* of JVMObject:
  proc getNumTxPowerLevels*(): jint {.`static`.}
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getTimestampMillis*(): jlong
  proc setTimestamp*(timestamp: jlong)
  proc getTransmitDurationMillisAtPowerLevel*(powerLevel: jint): jlong
  proc getTransmitDurationMillisAtPowerLevel*(powerLevel: jint, rat: jint): jlong
  proc getTransmitDurationMillisAtPowerLevel*(powerLevel: jint, rat: jint, freq: jint): jlong
  proc getTransmitPowerRange*(powerLevel: jint): Range[Integer]
  proc getSpecificInfoRat*(index: jint): jint
  proc getSpecificInfoFrequencyRange*(index: jint): jint
  proc setTransmitTimeMillis*(txTimeMs: seq[jint])
  proc setTransmitTimeMillis*(rat: jint, txTimeMs: seq[jint])
  proc setTransmitTimeMillis*(rat: jint, freq: jint, txTimeMs: seq[jint])
  proc getTransmitTimeMillis*(): seq[jint]
  proc getTransmitTimeMillis*(rat: jint): seq[jint]
  proc getTransmitTimeMillis*(rat: jint, freq: jint): seq[jint]
  proc getSleepTimeMillis*(): jlong
  proc setSleepTimeMillis*(sleepTimeMillis: jint)
  proc setSleepTimeMillis*(sleepTimeMillis: jlong)
  proc getDelta*(other: ModemActivityInfo): ModemActivityInfo
  proc getIdleTimeMillis*(): jlong
  proc setIdleTimeMillis*(idleTimeMillis: jint)
  proc setIdleTimeMillis*(idleTimeMillis: jlong)
  proc getReceiveTimeMillis*(): jlong
  proc getReceiveTimeMillis*(rat: jint): jlong
  proc getReceiveTimeMillis*(rat: jint, freq: jint): jlong
  proc setReceiveTimeMillis*(rxTimeMillis: jint)
  proc setReceiveTimeMillis*(receiveTimeMillis: jlong)
  proc setReceiveTimeMillis*(rat: jint, receiveTimeMillis: jlong)
  proc setReceiveTimeMillis*(rat: jint, freq: jint, receiveTimeMillis: jlong)
  proc getSpecificInfoLength*(): jint
  proc isValid*(): jboolean
  proc isEmpty*(): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  TX_POWER_LEVEL_0*: jint {.`static`.}
  TX_POWER_LEVEL_1*: jint {.`static`.}
  TX_POWER_LEVEL_2*: jint {.`static`.}
  TX_POWER_LEVEL_3*: jint {.`static`.}
  TX_POWER_LEVEL_4*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[ModemActivityInfo] {.`static`.}

