import jnim

jclass android.location.GnssAntennaInfo* of JVMObject:
  proc getCarrierFrequencyMHz*(): jdouble
  proc getPhaseCenterOffset*(): PhaseCenterOffset
  proc getPhaseCenterVariationCorrections*(): SphericalCorrections
  proc getSignalGainCorrections*(): SphericalCorrections
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  CREATOR*: Creator[GnssAntennaInfo] {.`static`.}

jclass android.location.GnssAntennaInfo.PhaseCenterOffset* of JVMObject:
  proc getXOffsetMm*(): jdouble
  proc getXOffsetUncertaintyMm*(): jdouble
  proc getYOffsetMm*(): jdouble
  proc getYOffsetUncertaintyMm*(): jdouble
  proc getZOffsetMm*(): jdouble
  proc getZOffsetUncertaintyMm*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.location.GnssAntennaInfo.SphericalCorrections* of JVMObject:
  proc getCorrectionsArray*(): seq[seq[jdouble]]
  proc getCorrectionUncertaintiesArray*(): seq[seq[jdouble]]
  proc getDeltaTheta*(): jdouble
  proc getDeltaPhi*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.location.GnssAntennaInfo.Builder* of JVMObject:
  proc setCarrierFrequencyMHz*(carrierFrequencyMHz: jdouble): Builder
  proc setPhaseCenterOffset*(phaseCenterOffset: PhaseCenterOffset): Builder
  proc setPhaseCenterVariationCorrections*(phaseCenterVariationCorrections: SphericalCorrections): Builder
  proc setSignalGainCorrections*(signalGainCorrections: SphericalCorrections): Builder
  proc build*(): GnssAntennaInfo


jclass android.location.PhaseCenterOffset* of JVMObject:
  proc getXOffsetMm*(): jdouble
  proc getXOffsetUncertaintyMm*(): jdouble
  proc getYOffsetMm*(): jdouble
  proc getYOffsetUncertaintyMm*(): jdouble
  proc getZOffsetMm*(): jdouble
  proc getZOffsetUncertaintyMm*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  CREATOR*: Creator[PhaseCenterOffset] {.`static`.}

jclass android.location.SphericalCorrections* of JVMObject:
  proc getCorrectionsArray*(): seq[seq[jdouble]]
  proc getCorrectionUncertaintiesArray*(): seq[seq[jdouble]]
  proc getDeltaTheta*(): jdouble
  proc getDeltaPhi*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  CREATOR*: Creator[SphericalCorrections] {.`static`.}

jclass android.location.Builder* of JVMObject:
  proc setCarrierFrequencyMHz*(carrierFrequencyMHz: jdouble): Builder
  proc setPhaseCenterOffset*(phaseCenterOffset: PhaseCenterOffset): Builder
  proc setPhaseCenterVariationCorrections*(phaseCenterVariationCorrections: SphericalCorrections): Builder
  proc setSignalGainCorrections*(signalGainCorrections: SphericalCorrections): Builder
  proc build*(): GnssAntennaInfo

