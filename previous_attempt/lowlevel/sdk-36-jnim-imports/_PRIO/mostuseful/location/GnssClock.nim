import jnim

jclass android.location.GnssClock* of JVMObject:
  proc set*(clock: GnssClock)
  proc reset*()
  proc hasLeapSecond*(): jboolean
  proc getLeapSecond*(): jint
  proc setLeapSecond*(leapSecond: jint)
  proc resetLeapSecond*()
  proc getTimeNanos*(): jlong
  proc setTimeNanos*(timeNanos: jlong)
  proc hasTimeUncertaintyNanos*(): jboolean
  proc getTimeUncertaintyNanos*(): jdouble
  proc setTimeUncertaintyNanos*(timeUncertaintyNanos: jdouble)
  proc resetTimeUncertaintyNanos*()
  proc hasFullBiasNanos*(): jboolean
  proc getFullBiasNanos*(): jlong
  proc setFullBiasNanos*(value: jlong)
  proc resetFullBiasNanos*()
  proc hasBiasNanos*(): jboolean
  proc getBiasNanos*(): jdouble
  proc setBiasNanos*(biasNanos: jdouble)
  proc resetBiasNanos*()
  proc hasBiasUncertaintyNanos*(): jboolean
  proc getBiasUncertaintyNanos*(): jdouble
  proc setBiasUncertaintyNanos*(biasUncertaintyNanos: jdouble)
  proc resetBiasUncertaintyNanos*()
  proc hasDriftNanosPerSecond*(): jboolean
  proc getDriftNanosPerSecond*(): jdouble
  proc setDriftNanosPerSecond*(driftNanosPerSecond: jdouble)
  proc resetDriftNanosPerSecond*()
  proc hasDriftUncertaintyNanosPerSecond*(): jboolean
  proc getDriftUncertaintyNanosPerSecond*(): jdouble
  proc setDriftUncertaintyNanosPerSecond*(driftUncertaintyNanosPerSecond: jdouble)
  proc resetDriftUncertaintyNanosPerSecond*()
  proc hasElapsedRealtimeNanos*(): jboolean
  proc getElapsedRealtimeNanos*(): jlong
  proc setElapsedRealtimeNanos*(elapsedRealtimeNanos: jlong)
  proc resetElapsedRealtimeNanos*()
  proc hasElapsedRealtimeUncertaintyNanos*(): jboolean
  proc getElapsedRealtimeUncertaintyNanos*(): jdouble
  proc setElapsedRealtimeUncertaintyNanos*(elapsedRealtimeUncertaintyNanos: jdouble)
  proc resetElapsedRealtimeUncertaintyNanos*()
  proc hasReferenceConstellationTypeForIsb*(): jboolean
  proc getReferenceConstellationTypeForIsb*(): jint
  proc setReferenceConstellationTypeForIsb*(value: jint)
  proc resetReferenceConstellationTypeForIsb*()
  proc hasReferenceCarrierFrequencyHzForIsb*(): jboolean
  proc getReferenceCarrierFrequencyHzForIsb*(): jdouble
  proc setReferenceCarrierFrequencyHzForIsb*(value: jdouble)
  proc resetReferenceCarrierFrequencyHzForIsb*()
  proc hasReferenceCodeTypeForIsb*(): jboolean
  proc getReferenceCodeTypeForIsb*(): string
  proc setReferenceCodeTypeForIsb*(codeType: string)
  proc resetReferenceCodeTypeForIsb*()
  proc getHardwareClockDiscontinuityCount*(): jint
  proc setHardwareClockDiscontinuityCount*(value: jint)
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  CREATOR*: Creator[GnssClock] {.`static`.}

