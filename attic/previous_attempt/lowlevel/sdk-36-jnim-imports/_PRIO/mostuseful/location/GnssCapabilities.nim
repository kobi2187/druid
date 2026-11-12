import jnim

jclass android.location.GnssCapabilities* of JVMObject:
  proc empty*(): GnssCapabilities {.`static`.}
  proc withTopHalFlags*(flags: jint, isAdrCapabilityKnown: jboolean): GnssCapabilities
  proc withSubHalMeasurementCorrectionsFlags*(flags: jint): GnssCapabilities
  proc withSubHalPowerFlags*(flags: jint): GnssCapabilities
  proc withSignalTypes*(gnssSignalTypes: List[GnssSignalType]): GnssCapabilities
  proc hasScheduling*(): jboolean
  proc hasMsb*(): jboolean
  proc hasMsa*(): jboolean
  proc hasSingleShotFix*(): jboolean
  proc hasOnDemandTime*(): jboolean
  proc hasGeofencing*(): jboolean
  proc hasMeasurements*(): jboolean
  proc hasNavMessages*(): jboolean
  proc hasNavigationMessages*(): jboolean
  proc hasLowPowerMode*(): jboolean
  proc hasSatelliteBlacklist*(): jboolean
  proc hasSatelliteBlocklist*(): jboolean
  proc hasSatellitePvt*(): jboolean
  proc hasMeasurementCorrections*(): jboolean
  proc hasGnssAntennaInfo*(): jboolean
  proc hasAntennaInfo*(): jboolean
  proc hasMeasurementCorrelationVectors*(): jboolean
  proc hasMeasurementCorrectionsForDriving*(): jboolean
  proc hasAccumulatedDeltaRange*(): jint
  proc hasMeasurementCorrectionsLosSats*(): jboolean
  proc hasMeasurementCorrectionsExcessPathLength*(): jboolean
  proc hasMeasurementCorrectionsReflectingPane*(): jboolean
  proc hasMeasurementCorrectionsReflectingPlane*(): jboolean
  proc hasPowerTotal*(): jboolean
  proc hasPowerSinglebandTracking*(): jboolean
  proc hasPowerMultibandTracking*(): jboolean
  proc hasPowerSinglebandAcquisition*(): jboolean
  proc hasPowerMultibandAcquisition*(): jboolean
  proc hasPowerOtherModes*(): jboolean
  proc getGnssSignalTypes*(): List[GnssSignalType]
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  TOP_HAL_CAPABILITY_SCHEDULING*: jint {.`static`.}
  TOP_HAL_CAPABILITY_MSB*: jint {.`static`.}
  TOP_HAL_CAPABILITY_MSA*: jint {.`static`.}
  TOP_HAL_CAPABILITY_SINGLE_SHOT*: jint {.`static`.}
  TOP_HAL_CAPABILITY_ON_DEMAND_TIME*: jint {.`static`.}
  TOP_HAL_CAPABILITY_GEOFENCING*: jint {.`static`.}
  TOP_HAL_CAPABILITY_MEASUREMENTS*: jint {.`static`.}
  TOP_HAL_CAPABILITY_NAV_MESSAGES*: jint {.`static`.}
  TOP_HAL_CAPABILITY_LOW_POWER_MODE*: jint {.`static`.}
  TOP_HAL_CAPABILITY_SATELLITE_BLOCKLIST*: jint {.`static`.}
  TOP_HAL_CAPABILITY_MEASUREMENT_CORRECTIONS*: jint {.`static`.}
  TOP_HAL_CAPABILITY_ANTENNA_INFO*: jint {.`static`.}
  TOP_HAL_CAPABILITY_CORRELATION_VECTOR*: jint {.`static`.}
  TOP_HAL_CAPABILITY_SATELLITE_PVT*: jint {.`static`.}
  TOP_HAL_CAPABILITY_MEASUREMENT_CORRECTIONS_FOR_DRIVING*: jint {.`static`.}
  TOP_HAL_CAPABILITY_ACCUMULATED_DELTA_RANGE*: jint {.`static`.}
  SUB_HAL_MEASUREMENT_CORRECTIONS_CAPABILITY_LOS_SATS*: jint {.`static`.}
  SUB_HAL_MEASUREMENT_CORRECTIONS_CAPABILITY_EXCESS_PATH_LENGTH*: jint {.`static`.}
  SUB_HAL_MEASUREMENT_CORRECTIONS_CAPABILITY_REFLECTING_PLANE*: jint {.`static`.}
  SUB_HAL_POWER_CAPABILITY_TOTAL*: jint {.`static`.}
  SUB_HAL_POWER_CAPABILITY_SINGLEBAND_TRACKING*: jint {.`static`.}
  SUB_HAL_POWER_CAPABILITY_MULTIBAND_TRACKING*: jint {.`static`.}
  SUB_HAL_POWER_CAPABILITY_SINGLEBAND_ACQUISITION*: jint {.`static`.}
  SUB_HAL_POWER_CAPABILITY_MULTIBAND_ACQUISITION*: jint {.`static`.}
  SUB_HAL_POWER_CAPABILITY_OTHER_MODES*: jint {.`static`.}
  CAPABILITY_UNKNOWN*: jint {.`static`.}
  CAPABILITY_SUPPORTED*: jint {.`static`.}
  CAPABILITY_UNSUPPORTED*: jint {.`static`.}
  CREATOR*: Creator[GnssCapabilities] {.`static`.}

jclass android.location.GnssCapabilities.Builder* of JVMObject:
  proc setHasScheduling*(capable: jboolean): Builder
  proc setHasMsb*(capable: jboolean): Builder
  proc setHasMsa*(capable: jboolean): Builder
  proc setHasSingleShotFix*(capable: jboolean): Builder
  proc setHasOnDemandTime*(capable: jboolean): Builder
  proc setHasGeofencing*(capable: jboolean): Builder
  proc setHasMeasurements*(capable: jboolean): Builder
  proc setHasNavigationMessages*(capable: jboolean): Builder
  proc setHasLowPowerMode*(capable: jboolean): Builder
  proc setHasSatelliteBlocklist*(capable: jboolean): Builder
  proc setHasSatellitePvt*(capable: jboolean): Builder
  proc setHasMeasurementCorrections*(capable: jboolean): Builder
  proc setHasAntennaInfo*(capable: jboolean): Builder
  proc setHasMeasurementCorrelationVectors*(capable: jboolean): Builder
  proc setHasMeasurementCorrectionsForDriving*(capable: jboolean): Builder
  proc setHasAccumulatedDeltaRange*(capable: jint): Builder
  proc setHasMeasurementCorrectionsLosSats*(capable: jboolean): Builder
  proc setHasMeasurementCorrectionsExcessPathLength*(capable: jboolean): Builder
  proc setHasMeasurementCorrectionsReflectingPlane*(capable: jboolean): Builder
  proc setHasPowerTotal*(capable: jboolean): Builder
  proc setHasPowerSinglebandTracking*(capable: jboolean): Builder
  proc setHasPowerMultibandTracking*(capable: jboolean): Builder
  proc setHasPowerSinglebandAcquisition*(capable: jboolean): Builder
  proc setHasPowerMultibandAcquisition*(capable: jboolean): Builder
  proc setHasPowerOtherModes*(capable: jboolean): Builder
  proc setGnssSignalTypes*(gnssSignalTypes: List[GnssSignalType]): Builder
  proc build*(): GnssCapabilities

jclass android.location.Builder* of JVMObject:
  proc setHasScheduling*(capable: jboolean): Builder
  proc setHasMsb*(capable: jboolean): Builder
  proc setHasMsa*(capable: jboolean): Builder
  proc setHasSingleShotFix*(capable: jboolean): Builder
  proc setHasOnDemandTime*(capable: jboolean): Builder
  proc setHasGeofencing*(capable: jboolean): Builder
  proc setHasMeasurements*(capable: jboolean): Builder
  proc setHasNavigationMessages*(capable: jboolean): Builder
  proc setHasLowPowerMode*(capable: jboolean): Builder
  proc setHasSatelliteBlocklist*(capable: jboolean): Builder
  proc setHasSatellitePvt*(capable: jboolean): Builder
  proc setHasMeasurementCorrections*(capable: jboolean): Builder
  proc setHasAntennaInfo*(capable: jboolean): Builder
  proc setHasMeasurementCorrelationVectors*(capable: jboolean): Builder
  proc setHasMeasurementCorrectionsForDriving*(capable: jboolean): Builder
  proc setHasAccumulatedDeltaRange*(capable: jint): Builder
  proc setHasMeasurementCorrectionsLosSats*(capable: jboolean): Builder
  proc setHasMeasurementCorrectionsExcessPathLength*(capable: jboolean): Builder
  proc setHasMeasurementCorrectionsReflectingPlane*(capable: jboolean): Builder
  proc setHasPowerTotal*(capable: jboolean): Builder
  proc setHasPowerSinglebandTracking*(capable: jboolean): Builder
  proc setHasPowerMultibandTracking*(capable: jboolean): Builder
  proc setHasPowerSinglebandAcquisition*(capable: jboolean): Builder
  proc setHasPowerMultibandAcquisition*(capable: jboolean): Builder
  proc setHasPowerOtherModes*(capable: jboolean): Builder
  proc setGnssSignalTypes*(gnssSignalTypes: List[GnssSignalType]): Builder
  proc build*(): GnssCapabilities

