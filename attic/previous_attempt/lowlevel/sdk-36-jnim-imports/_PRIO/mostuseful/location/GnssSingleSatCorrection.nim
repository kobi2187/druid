import jnim

jclass android.location.GnssSingleSatCorrection* of JVMObject:
  proc getSingleSatelliteCorrectionFlags*(): jint
  proc getConstellationType*(): jint
  proc getSatelliteId*(): jint
  proc getCarrierFrequencyHz*(): jfloat
  proc getProbabilityLineOfSight*(): jfloat
  proc getExcessPathLengthMeters*(): jfloat
  proc getExcessPathLengthUncertaintyMeters*(): jfloat
  proc getCombinedAttenuationDb*(): jfloat
  proc getReflectingPlane*(): GnssReflectingPlane
  proc getGnssExcessPathInfoList*(): List[GnssExcessPathInfo]
  proc hasValidSatelliteLineOfSight*(): jboolean
  proc hasExcessPathLength*(): jboolean
  proc hasExcessPathLengthUncertainty*(): jboolean
  proc hasReflectingPlane*(): jboolean
  proc hasCombinedAttenuation*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Creator[GnssSingleSatCorrection] {.`static`.}

jclass android.location.GnssSingleSatCorrection.Builder* of JVMObject:
  proc setConstellationType*(constellationType: jint): Builder
  proc setSatelliteId*(satId: jint): Builder
  proc setCarrierFrequencyHz*(carrierFrequencyHz: jfloat): Builder
  proc setProbabilityLineOfSight*(probSatIsLos: jfloat): Builder
  proc clearProbabilityLineOfSight*(): Builder
  proc setExcessPathLengthMeters*(combinedExcessPathLengthMeters: jfloat): Builder
  proc clearExcessPathLengthMeters*(): Builder
  proc setExcessPathLengthUncertaintyMeters*(combinedExcessPathLengthUncertaintyMeters: jfloat): Builder
  proc clearExcessPathLengthUncertaintyMeters*(): Builder
  proc setCombinedAttenuationDb*(combinedAttenuationDb: jfloat): Builder
  proc clearCombinedAttenuationDb*(): Builder
  proc setReflectingPlane*(reflectingPlane: GnssReflectingPlane): Builder
  proc setGnssExcessPathInfoList*(infoList: List[GnssExcessPathInfo]): Builder
  proc build*(): GnssSingleSatCorrection

jclass android.location.Builder* of JVMObject:
  proc setConstellationType*(constellationType: jint): Builder
  proc setSatelliteId*(satId: jint): Builder
  proc setCarrierFrequencyHz*(carrierFrequencyHz: jfloat): Builder
  proc setProbabilityLineOfSight*(probSatIsLos: jfloat): Builder
  proc clearProbabilityLineOfSight*(): Builder
  proc setExcessPathLengthMeters*(combinedExcessPathLengthMeters: jfloat): Builder
  proc clearExcessPathLengthMeters*(): Builder
  proc setExcessPathLengthUncertaintyMeters*(combinedExcessPathLengthUncertaintyMeters: jfloat): Builder
  proc clearExcessPathLengthUncertaintyMeters*(): Builder
  proc setCombinedAttenuationDb*(combinedAttenuationDb: jfloat): Builder
  proc clearCombinedAttenuationDb*(): Builder
  proc setReflectingPlane*(reflectingPlane: GnssReflectingPlane): Builder
  proc setGnssExcessPathInfoList*(infoList: List[GnssExcessPathInfo]): Builder
  proc build*(): GnssSingleSatCorrection

