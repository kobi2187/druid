import jnim

jclass android.location.GnssMeasurement* of JVMObject:
  proc set*(measurement: GnssMeasurement)
  proc reset*()
  proc getSvid*(): jint
  proc setSvid*(value: jint)
  proc getConstellationType*(): jint
  proc setConstellationType*(value: jint)
  proc getTimeOffsetNanos*(): jdouble
  proc setTimeOffsetNanos*(value: jdouble)
  proc getState*(): jint
  proc setState*(value: jint)
  proc getReceivedSvTimeNanos*(): jlong
  proc setReceivedSvTimeNanos*(value: jlong)
  proc getReceivedSvTimeUncertaintyNanos*(): jlong
  proc setReceivedSvTimeUncertaintyNanos*(value: jlong)
  proc getCn0DbHz*(): jdouble
  proc setCn0DbHz*(value: jdouble)
  proc hasBasebandCn0DbHz*(): jboolean
  proc getBasebandCn0DbHz*(): jdouble
  proc setBasebandCn0DbHz*(value: jdouble)
  proc resetBasebandCn0DbHz*()
  proc getPseudorangeRateMetersPerSecond*(): jdouble
  proc setPseudorangeRateMetersPerSecond*(value: jdouble)
  proc getPseudorangeRateUncertaintyMetersPerSecond*(): jdouble
  proc setPseudorangeRateUncertaintyMetersPerSecond*(value: jdouble)
  proc getAccumulatedDeltaRangeState*(): jint
  proc setAccumulatedDeltaRangeState*(value: jint)
  proc getAccumulatedDeltaRangeMeters*(): jdouble
  proc setAccumulatedDeltaRangeMeters*(value: jdouble)
  proc getAccumulatedDeltaRangeUncertaintyMeters*(): jdouble
  proc setAccumulatedDeltaRangeUncertaintyMeters*(value: jdouble)
  proc hasCarrierFrequencyHz*(): jboolean
  proc getCarrierFrequencyHz*(): jfloat
  proc setCarrierFrequencyHz*(carrierFrequencyHz: jfloat)
  proc resetCarrierFrequencyHz*()
  proc hasCarrierCycles*(): jboolean
  proc getCarrierCycles*(): jlong
  proc setCarrierCycles*(value: jlong)
  proc resetCarrierCycles*()
  proc hasCarrierPhase*(): jboolean
  proc getCarrierPhase*(): jdouble
  proc setCarrierPhase*(value: jdouble)
  proc resetCarrierPhase*()
  proc hasCarrierPhaseUncertainty*(): jboolean
  proc getCarrierPhaseUncertainty*(): jdouble
  proc setCarrierPhaseUncertainty*(value: jdouble)
  proc resetCarrierPhaseUncertainty*()
  proc getMultipathIndicator*(): jint
  proc setMultipathIndicator*(value: jint)
  proc hasSnrInDb*(): jboolean
  proc getSnrInDb*(): jdouble
  proc setSnrInDb*(snrInDb: jdouble)
  proc resetSnrInDb*()
  proc hasAutomaticGainControlLevelDb*(): jboolean
  proc getAutomaticGainControlLevelDb*(): jdouble
  proc setAutomaticGainControlLevelInDb*(agcLevelDb: jdouble)
  proc resetAutomaticGainControlLevel*()
  proc hasCodeType*(): jboolean
  proc getCodeType*(): string
  proc setCodeType*(codeType: string)
  proc resetCodeType*()
  proc hasFullInterSignalBiasNanos*(): jboolean
  proc getFullInterSignalBiasNanos*(): jdouble
  proc setFullInterSignalBiasNanos*(fullInterSignalBiasNanos: jdouble)
  proc resetFullInterSignalBiasNanos*()
  proc hasFullInterSignalBiasUncertaintyNanos*(): jboolean
  proc getFullInterSignalBiasUncertaintyNanos*(): jdouble
  proc setFullInterSignalBiasUncertaintyNanos*(fullInterSignalBiasUncertaintyNanos: jdouble)
  proc resetFullInterSignalBiasUncertaintyNanos*()
  proc hasSatelliteInterSignalBiasNanos*(): jboolean
  proc getSatelliteInterSignalBiasNanos*(): jdouble
  proc setSatelliteInterSignalBiasNanos*(satelliteInterSignalBiasNanos: jdouble)
  proc resetSatelliteInterSignalBiasNanos*()
  proc hasSatelliteInterSignalBiasUncertaintyNanos*(): jboolean
  proc getSatelliteInterSignalBiasUncertaintyNanos*(): jdouble
  proc setSatelliteInterSignalBiasUncertaintyNanos*(satelliteInterSignalBiasUncertaintyNanos: jdouble)
  proc resetSatelliteInterSignalBiasUncertaintyNanos*()
  proc hasSatellitePvt*(): jboolean
  proc getSatellitePvt*(): SatellitePvt
  proc setSatellitePvt*(satellitePvt: SatellitePvt)
  proc resetSatellitePvt*()
  proc hasCorrelationVectors*(): jboolean
  proc getCorrelationVectors*(): Collection[CorrelationVector]
  proc setCorrelationVectors*(correlationVectors: Collection[CorrelationVector])
  proc resetCorrelationVectors*()
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  MULTIPATH_INDICATOR_UNKNOWN*: jint {.`static`.}
  MULTIPATH_INDICATOR_DETECTED*: jint {.`static`.}
  MULTIPATH_INDICATOR_NOT_DETECTED*: jint {.`static`.}
  STATE_UNKNOWN*: jint {.`static`.}
  STATE_CODE_LOCK*: jint {.`static`.}
  STATE_BIT_SYNC*: jint {.`static`.}
  STATE_SUBFRAME_SYNC*: jint {.`static`.}
  STATE_TOW_DECODED*: jint {.`static`.}
  STATE_MSEC_AMBIGUOUS*: jint {.`static`.}
  STATE_SYMBOL_SYNC*: jint {.`static`.}
  STATE_GLO_STRING_SYNC*: jint {.`static`.}
  STATE_GLO_TOD_DECODED*: jint {.`static`.}
  STATE_BDS_D2_BIT_SYNC*: jint {.`static`.}
  STATE_BDS_D2_SUBFRAME_SYNC*: jint {.`static`.}
  STATE_GAL_E1BC_CODE_LOCK*: jint {.`static`.}
  STATE_GAL_E1C_2ND_CODE_LOCK*: jint {.`static`.}
  STATE_GAL_E1B_PAGE_SYNC*: jint {.`static`.}
  STATE_SBAS_SYNC*: jint {.`static`.}
  STATE_TOW_KNOWN*: jint {.`static`.}
  STATE_GLO_TOD_KNOWN*: jint {.`static`.}
  STATE_2ND_CODE_LOCK*: jint {.`static`.}
  ADR_STATE_UNKNOWN*: jint {.`static`.}
  ADR_STATE_VALID*: jint {.`static`.}
  ADR_STATE_RESET*: jint {.`static`.}
  ADR_STATE_CYCLE_SLIP*: jint {.`static`.}
  ADR_STATE_HALF_CYCLE_RESOLVED*: jint {.`static`.}
  ADR_STATE_HALF_CYCLE_REPORTED*: jint {.`static`.}
  ADR_STATE_ALL*: jint {.`static`.}
  CREATOR*: Creator[GnssMeasurement] {.`static`.}

