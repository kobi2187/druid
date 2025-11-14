import jnim

jclass android.location.GnssAutomaticGainControl* of JVMObject:
  proc getLevelDb*(): jdouble
  proc getConstellationType*(): jint
  proc getCarrierFrequencyHz*(): jlong
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flag: jint)
  proc toString*(): string
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  CREATOR*: Creator[GnssAutomaticGainControl] {.`static`.}

jclass android.location.GnssAutomaticGainControl.Builder* of JVMObject:
  proc setLevelDb*(levelDb: jdouble): Builder
  proc setConstellationType*(constellationType: jint): Builder
  proc setCarrierFrequencyHz*(carrierFrequencyHz: jlong): Builder
  proc build*(): GnssAutomaticGainControl

jclass android.location.Builder* of JVMObject:
  proc setLevelDb*(levelDb: jdouble): Builder
  proc setConstellationType*(constellationType: jint): Builder
  proc setCarrierFrequencyHz*(carrierFrequencyHz: jlong): Builder
  proc build*(): GnssAutomaticGainControl

