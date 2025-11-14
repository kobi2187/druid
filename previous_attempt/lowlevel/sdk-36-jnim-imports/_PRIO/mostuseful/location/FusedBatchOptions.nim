import jnim

jclass android.location.FusedBatchOptions* of JVMObject:
  proc setMaxPowerAllocationInMW*(value: jdouble)
  proc getMaxPowerAllocationInMW*(): jdouble
  proc setPeriodInNS*(value: jlong)
  proc getPeriodInNS*(): jlong
  proc setSmallestDisplacementMeters*(value: jfloat)
  proc getSmallestDisplacementMeters*(): jfloat
  proc setSourceToUse*(source: jint)
  proc resetSourceToUse*(source: jint)
  proc isSourceToUseSet*(source: jint): jboolean
  proc getSourcesToUse*(): jint
  proc setFlag*(flag: jint)
  proc resetFlag*(flag: jint)
  proc isFlagSet*(flag: jint): jboolean
  proc getFlags*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[FusedBatchOptions] {.`static`.}

jclass android.location.SourceTechnologies* of JVMObject:
  GNSS*: jint {.`static`.}
  WIFI*: jint {.`static`.}
  SENSORS*: jint {.`static`.}
  CELL*: jint {.`static`.}
  BLUETOOTH*: jint {.`static`.}

jclass android.location.BatchFlags* of JVMObject:
  WAKEUP_ON_FIFO_FULL*: jint {.`static`.}
  CALLBACK_ON_LOCATION_FIX*: jint {.`static`.}

