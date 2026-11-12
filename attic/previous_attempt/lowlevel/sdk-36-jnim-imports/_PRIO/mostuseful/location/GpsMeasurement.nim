import jnim

jclass android.location.GpsMeasurement* of JVMObject:
  proc set*(measurement: GpsMeasurement)
  proc reset*()
  proc getPrn*(): jbyte
  proc setPrn*(value: jbyte)
  proc getTimeOffsetInNs*(): jdouble
  proc setTimeOffsetInNs*(value: jdouble)
  proc getState*(): jshort
  proc setState*(value: jshort)
  proc getReceivedGpsTowInNs*(): jlong
  proc setReceivedGpsTowInNs*(value: jlong)
  proc getReceivedGpsTowUncertaintyInNs*(): jlong
  proc setReceivedGpsTowUncertaintyInNs*(value: jlong)
  proc getCn0InDbHz*(): jdouble
  proc setCn0InDbHz*(value: jdouble)
  proc getPseudorangeRateInMetersPerSec*(): jdouble
  proc setPseudorangeRateInMetersPerSec*(value: jdouble)
  proc isPseudorangeRateCorrected*(): jboolean
  proc getPseudorangeRateUncertaintyInMetersPerSec*(): jdouble
  proc setPseudorangeRateUncertaintyInMetersPerSec*(value: jdouble)
  proc getAccumulatedDeltaRangeState*(): jshort
  proc setAccumulatedDeltaRangeState*(value: jshort)
  proc getAccumulatedDeltaRangeInMeters*(): jdouble
  proc setAccumulatedDeltaRangeInMeters*(value: jdouble)
  proc getAccumulatedDeltaRangeUncertaintyInMeters*(): jdouble
  proc setAccumulatedDeltaRangeUncertaintyInMeters*(value: jdouble)
  proc hasPseudorangeInMeters*(): jboolean
  proc getPseudorangeInMeters*(): jdouble
  proc setPseudorangeInMeters*(value: jdouble)
  proc resetPseudorangeInMeters*()
  proc hasPseudorangeUncertaintyInMeters*(): jboolean
  proc getPseudorangeUncertaintyInMeters*(): jdouble
  proc setPseudorangeUncertaintyInMeters*(value: jdouble)
  proc resetPseudorangeUncertaintyInMeters*()
  proc hasCodePhaseInChips*(): jboolean
  proc getCodePhaseInChips*(): jdouble
  proc setCodePhaseInChips*(value: jdouble)
  proc resetCodePhaseInChips*()
  proc hasCodePhaseUncertaintyInChips*(): jboolean
  proc getCodePhaseUncertaintyInChips*(): jdouble
  proc setCodePhaseUncertaintyInChips*(value: jdouble)
  proc resetCodePhaseUncertaintyInChips*()
  proc hasCarrierFrequencyInHz*(): jboolean
  proc getCarrierFrequencyInHz*(): jfloat
  proc setCarrierFrequencyInHz*(carrierFrequencyInHz: jfloat)
  proc resetCarrierFrequencyInHz*()
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
  proc getLossOfLock*(): jbyte
  proc setLossOfLock*(value: jbyte)
  proc hasBitNumber*(): jboolean
  proc getBitNumber*(): jint
  proc setBitNumber*(bitNumber: jint)
  proc resetBitNumber*()
  proc hasTimeFromLastBitInMs*(): jboolean
  proc getTimeFromLastBitInMs*(): jshort
  proc setTimeFromLastBitInMs*(value: jshort)
  proc resetTimeFromLastBitInMs*()
  proc hasDopplerShiftInHz*(): jboolean
  proc getDopplerShiftInHz*(): jdouble
  proc setDopplerShiftInHz*(value: jdouble)
  proc resetDopplerShiftInHz*()
  proc hasDopplerShiftUncertaintyInHz*(): jboolean
  proc getDopplerShiftUncertaintyInHz*(): jdouble
  proc setDopplerShiftUncertaintyInHz*(value: jdouble)
  proc resetDopplerShiftUncertaintyInHz*()
  proc getMultipathIndicator*(): jbyte
  proc setMultipathIndicator*(value: jbyte)
  proc hasSnrInDb*(): jboolean
  proc getSnrInDb*(): jdouble
  proc setSnrInDb*(snrInDb: jdouble)
  proc resetSnrInDb*()
  proc hasElevationInDeg*(): jboolean
  proc getElevationInDeg*(): jdouble
  proc setElevationInDeg*(elevationInDeg: jdouble)
  proc resetElevationInDeg*()
  proc hasElevationUncertaintyInDeg*(): jboolean
  proc getElevationUncertaintyInDeg*(): jdouble
  proc setElevationUncertaintyInDeg*(value: jdouble)
  proc resetElevationUncertaintyInDeg*()
  proc hasAzimuthInDeg*(): jboolean
  proc getAzimuthInDeg*(): jdouble
  proc setAzimuthInDeg*(value: jdouble)
  proc resetAzimuthInDeg*()
  proc hasAzimuthUncertaintyInDeg*(): jboolean
  proc getAzimuthUncertaintyInDeg*(): jdouble
  proc setAzimuthUncertaintyInDeg*(value: jdouble)
  proc resetAzimuthUncertaintyInDeg*()
  proc isUsedInFix*(): jboolean
  proc setUsedInFix*(value: jboolean)
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  LOSS_OF_LOCK_UNKNOWN*: jbyte {.`static`.}
  LOSS_OF_LOCK_OK*: jbyte {.`static`.}
  LOSS_OF_LOCK_CYCLE_SLIP*: jbyte {.`static`.}
  MULTIPATH_INDICATOR_UNKNOWN*: jbyte {.`static`.}
  MULTIPATH_INDICATOR_DETECTED*: jbyte {.`static`.}
  MULTIPATH_INDICATOR_NOT_USED*: jbyte {.`static`.}
  STATE_UNKNOWN*: jshort {.`static`.}
  STATE_CODE_LOCK*: jshort {.`static`.}
  STATE_BIT_SYNC*: jshort {.`static`.}
  STATE_SUBFRAME_SYNC*: jshort {.`static`.}
  STATE_TOW_DECODED*: jshort {.`static`.}
  STATE_MSEC_AMBIGUOUS*: jshort {.`static`.}
  ADR_STATE_UNKNOWN*: jshort {.`static`.}
  ADR_STATE_VALID*: jshort {.`static`.}
  ADR_STATE_RESET*: jshort {.`static`.}
  ADR_STATE_CYCLE_SLIP*: jshort {.`static`.}
  CREATOR*: Creator[GpsMeasurement] {.`static`.}

