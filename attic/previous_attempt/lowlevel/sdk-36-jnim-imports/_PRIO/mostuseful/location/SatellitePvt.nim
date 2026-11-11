import jnim

jclass android.location.SatellitePvt* of JVMObject:
  proc getPositionEcef*(): PositionEcef
  proc getVelocityEcef*(): VelocityEcef
  proc getClockInfo*(): ClockInfo
  proc getIonoDelayMeters*(): jdouble
  proc getTropoDelayMeters*(): jdouble
  proc getIssueOfDataClock*(): jint
  proc getIssueOfDataEphemeris*(): jint
  proc getTimeOfClockSeconds*(): jlong
  proc getTimeOfEphemerisSeconds*(): jlong
  proc getEphemerisSource*(): jint
  proc hasPositionVelocityClockInfo*(): jboolean
  proc hasIono*(): jboolean
  proc hasTropo*(): jboolean
  proc hasIssueOfDataClock*(): jboolean
  proc hasIssueOfDataEphemeris*(): jboolean
  proc hasTimeOfClockSeconds*(): jboolean
  proc hasTimeOfEphemerisSeconds*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  EPHEMERIS_SOURCE_DEMODULATED*: jint {.`static`.}
  EPHEMERIS_SOURCE_SERVER_NORMAL*: jint {.`static`.}
  EPHEMERIS_SOURCE_SERVER_LONG_TERM*: jint {.`static`.}
  EPHEMERIS_SOURCE_OTHER*: jint {.`static`.}
  CREATOR*: Creator[SatellitePvt] {.`static`.}

jclass android.location.SatellitePvt.PositionEcef* of JVMObject:
  proc getXMeters*(): jdouble
  proc getYMeters*(): jdouble
  proc getZMeters*(): jdouble
  proc getUreMeters*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string

jclass android.location.SatellitePvt.VelocityEcef* of JVMObject:
  proc getXMetersPerSecond*(): jdouble
  proc getYMetersPerSecond*(): jdouble
  proc getZMetersPerSecond*(): jdouble
  proc getUreRateMetersPerSecond*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string

jclass android.location.SatellitePvt.ClockInfo* of JVMObject:
  proc getHardwareCodeBiasMeters*(): jdouble
  proc getTimeCorrectionMeters*(): jdouble
  proc getClockDriftMetersPerSecond*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string

jclass android.location.SatellitePvt.Builder* of JVMObject:
  proc setPositionEcef*(positionEcef: PositionEcef): Builder
  proc setVelocityEcef*(velocityEcef: VelocityEcef): Builder
  proc setClockInfo*(clockInfo: ClockInfo): Builder
  proc setIonoDelayMeters*(ionoDelayMeters: jdouble): Builder
  proc setTropoDelayMeters*(tropoDelayMeters: jdouble): Builder
  proc setTimeOfClockSeconds*(timeOfClockSeconds: jlong): Builder
  proc setTimeOfEphemerisSeconds*(timeOfEphemerisSeconds: jlong): Builder
  proc setIssueOfDataClock*(issueOfDataClock: jint): Builder
  proc setIssueOfDataEphemeris*(issueOfDataEphemeris: jint): Builder
  proc setEphemerisSource*(ephemerisSource: jint): Builder
  proc build*(): SatellitePvt

jclass android.location.PositionEcef* of JVMObject:
  proc getXMeters*(): jdouble
  proc getYMeters*(): jdouble
  proc getZMeters*(): jdouble
  proc getUreMeters*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[PositionEcef] {.`static`.}

jclass android.location.VelocityEcef* of JVMObject:
  proc getXMetersPerSecond*(): jdouble
  proc getYMetersPerSecond*(): jdouble
  proc getZMetersPerSecond*(): jdouble
  proc getUreRateMetersPerSecond*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[VelocityEcef] {.`static`.}

jclass android.location.ClockInfo* of JVMObject:
  proc getHardwareCodeBiasMeters*(): jdouble
  proc getTimeCorrectionMeters*(): jdouble
  proc getClockDriftMetersPerSecond*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[ClockInfo] {.`static`.}

jclass android.location.Builder* of JVMObject:
  proc setPositionEcef*(positionEcef: PositionEcef): Builder
  proc setVelocityEcef*(velocityEcef: VelocityEcef): Builder
  proc setClockInfo*(clockInfo: ClockInfo): Builder
  proc setIonoDelayMeters*(ionoDelayMeters: jdouble): Builder
  proc setTropoDelayMeters*(tropoDelayMeters: jdouble): Builder
  proc setTimeOfClockSeconds*(timeOfClockSeconds: jlong): Builder
  proc setTimeOfEphemerisSeconds*(timeOfEphemerisSeconds: jlong): Builder
  proc setIssueOfDataClock*(issueOfDataClock: jint): Builder
  proc setIssueOfDataEphemeris*(issueOfDataEphemeris: jint): Builder
  proc setEphemerisSource*(ephemerisSource: jint): Builder
  proc build*(): SatellitePvt

