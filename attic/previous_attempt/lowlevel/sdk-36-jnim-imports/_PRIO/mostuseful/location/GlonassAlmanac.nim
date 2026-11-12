import jnim

jclass android.location.GlonassAlmanac* of JVMObject:
  proc getIssueDateMillis*(): jlong
  proc getSatelliteAlmanacs*(): List[GlonassSatelliteAlmanac]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Parcelable.Creator[GlonassAlmanac] {.`static`.}

jclass android.location.GlonassAlmanac.GlonassSatelliteAlmanac* of JVMObject:
  proc getSlotNumber*(): jint
  proc getHealthState*(): jint
  proc getFrequencyChannelNumber*(): jint
  proc getCalendarDayNumber*(): jint
  proc isGlonassM*(): jboolean
  proc getTau*(): jdouble
  proc getTLambda*(): jdouble
  proc getLambda*(): jdouble
  proc getDeltaI*(): jdouble
  proc getDeltaT*(): jdouble
  proc getDeltaTDot*(): jdouble
  proc getEccentricity*(): jdouble
  proc getOmega*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string

jclass android.location.GlonassSatelliteAlmanac* of JVMObject:
  proc getSlotNumber*(): jint
  proc getHealthState*(): jint
  proc getFrequencyChannelNumber*(): jint
  proc getCalendarDayNumber*(): jint
  proc isGlonassM*(): jboolean
  proc getTau*(): jdouble
  proc getTLambda*(): jdouble
  proc getLambda*(): jdouble
  proc getDeltaI*(): jdouble
  proc getDeltaT*(): jdouble
  proc getDeltaTDot*(): jdouble
  proc getEccentricity*(): jdouble
  proc getOmega*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Parcelable.Creator[GlonassSatelliteAlmanac] {.`static`.}

jclass android.location.GlonassSatelliteAlmanac.Builder* of JVMObject:
  proc setSlotNumber*(slotNumber: jint): Builder
  proc setHealthState*(healthState: jint): Builder
  proc setFrequencyChannelNumber*(frequencyChannelNumber: jint): Builder
  proc setCalendarDayNumber*(calendarDayNumber: jint): Builder
  proc setGlonassM*(isGlonassM: jboolean): Builder
  proc setTau*(tau: jdouble): Builder
  proc setTLambda*(tLambda: jdouble): Builder
  proc setLambda*(lambda: jdouble): Builder
  proc setDeltaI*(deltaI: jdouble): Builder
  proc setDeltaT*(deltaT: jdouble): Builder
  proc setDeltaTDot*(deltaTDot: jdouble): Builder
  proc setEccentricity*(eccentricity: jdouble): Builder
  proc setOmega*(omega: jdouble): Builder
  proc build*(): GlonassSatelliteAlmanac

jclass android.location.Builder* of JVMObject:
  proc setSlotNumber*(slotNumber: jint): Builder
  proc setHealthState*(healthState: jint): Builder
  proc setFrequencyChannelNumber*(frequencyChannelNumber: jint): Builder
  proc setCalendarDayNumber*(calendarDayNumber: jint): Builder
  proc setGlonassM*(isGlonassM: jboolean): Builder
  proc setTau*(tau: jdouble): Builder
  proc setTLambda*(tLambda: jdouble): Builder
  proc setLambda*(lambda: jdouble): Builder
  proc setDeltaI*(deltaI: jdouble): Builder
  proc setDeltaT*(deltaT: jdouble): Builder
  proc setDeltaTDot*(deltaTDot: jdouble): Builder
  proc setEccentricity*(eccentricity: jdouble): Builder
  proc setOmega*(omega: jdouble): Builder
  proc build*(): GlonassSatelliteAlmanac

