import jnim

jclass android.location.GnssCorrectionComponent* of JVMObject:
  proc getSourceKey*(): string
  proc getValidityInterval*(): GnssInterval
  proc getPseudorangeCorrection*(): PseudorangeCorrection
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[GnssCorrectionComponent] {.`static`.}

jclass android.location.GnssCorrectionComponent.GnssInterval* of JVMObject:
  proc getStartMillisSinceGpsEpoch*(): jlong
  proc getEndMillisSinceGpsEpoch*(): jlong
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string

jclass android.location.GnssCorrectionComponent.PseudorangeCorrection* of JVMObject:
  proc getCorrectionMeters*(): jdouble
  proc getCorrectionUncertaintyMeters*(): jdouble
  proc getCorrectionRateMetersPerSecond*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string

jclass android.location.GnssInterval* of JVMObject:
  proc getStartMillisSinceGpsEpoch*(): jlong
  proc getEndMillisSinceGpsEpoch*(): jlong
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[GnssInterval] {.`static`.}

jclass android.location.PseudorangeCorrection* of JVMObject:
  proc getCorrectionMeters*(): jdouble
  proc getCorrectionUncertaintyMeters*(): jdouble
  proc getCorrectionRateMetersPerSecond*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[PseudorangeCorrection] {.`static`.}

