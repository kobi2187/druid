import jnim

jclass android.location.GpsClock* of JVMObject:
  proc set*(clock: GpsClock)
  proc reset*()
  proc getType*(): jbyte
  proc setType*(value: jbyte)
  proc hasLeapSecond*(): jboolean
  proc getLeapSecond*(): jshort
  proc setLeapSecond*(leapSecond: jshort)
  proc resetLeapSecond*()
  proc getTimeInNs*(): jlong
  proc setTimeInNs*(timeInNs: jlong)
  proc hasTimeUncertaintyInNs*(): jboolean
  proc getTimeUncertaintyInNs*(): jdouble
  proc setTimeUncertaintyInNs*(timeUncertaintyInNs: jdouble)
  proc resetTimeUncertaintyInNs*()
  proc hasFullBiasInNs*(): jboolean
  proc getFullBiasInNs*(): jlong
  proc setFullBiasInNs*(value: jlong)
  proc resetFullBiasInNs*()
  proc hasBiasInNs*(): jboolean
  proc getBiasInNs*(): jdouble
  proc setBiasInNs*(biasInNs: jdouble)
  proc resetBiasInNs*()
  proc hasBiasUncertaintyInNs*(): jboolean
  proc getBiasUncertaintyInNs*(): jdouble
  proc setBiasUncertaintyInNs*(biasUncertaintyInNs: jdouble)
  proc resetBiasUncertaintyInNs*()
  proc hasDriftInNsPerSec*(): jboolean
  proc getDriftInNsPerSec*(): jdouble
  proc setDriftInNsPerSec*(driftInNsPerSec: jdouble)
  proc resetDriftInNsPerSec*()
  proc hasDriftUncertaintyInNsPerSec*(): jboolean
  proc getDriftUncertaintyInNsPerSec*(): jdouble
  proc setDriftUncertaintyInNsPerSec*(driftUncertaintyInNsPerSec: jdouble)
  proc resetDriftUncertaintyInNsPerSec*()
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  TYPE_UNKNOWN*: jbyte {.`static`.}
  TYPE_LOCAL_HW_TIME*: jbyte {.`static`.}
  TYPE_GPS_TIME*: jbyte {.`static`.}
  CREATOR*: Creator[GpsClock] {.`static`.}

