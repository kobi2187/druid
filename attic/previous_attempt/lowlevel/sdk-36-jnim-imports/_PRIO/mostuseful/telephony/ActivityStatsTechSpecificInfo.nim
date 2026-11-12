import jnim

jclass android.telephony.ActivityStatsTechSpecificInfo* of JVMObject:
  proc getRat*(): jint
  proc getFrequencyRange*(): jint
  proc getTransmitTimeMillis*(powerLevel: jint): jlong
  proc getTransmitTimeMillis*(): seq[jint]
  proc getReceiveTimeMillis*(): jlong
  proc setRat*(rat: jint)
  proc setFrequencyRange*(frequencyRange: jint)
  proc setReceiveTimeMillis*(receiveTimeMillis: jint)
  proc setReceiveTimeMillis*(receiveTimeMillis: jlong)
  proc setTransmitTimeMillis*(txTimeMs: seq[jint])
  proc isTxPowerValid*(): jboolean
  proc isRxPowerValid*(): jboolean
  proc isTxPowerEmpty*(): jboolean
  proc isRxPowerEmpty*(): jboolean
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[ActivityStatsTechSpecificInfo] {.`static`.}

