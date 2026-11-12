import jnim

jclass android.location.GnssAlmanac* of JVMObject:
  proc getIssueDateMillis*(): jlong
  proc getIoda*(): jint
  proc getWeekNumber*(): jint
  proc getToaSeconds*(): jint
  proc isCompleteAlmanacProvided*(): jboolean
  proc getGnssSatelliteAlmanacs*(): List[GnssSatelliteAlmanac]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[GnssAlmanac] {.`static`.}

jclass android.location.GnssAlmanac.Builder* of JVMObject:
  proc setIssueDateMillis*(issueDateMillis: jlong): Builder
  proc setIoda*(ioda: jint): Builder
  proc setWeekNumber*(weekNumber: jint): Builder
  proc setToaSeconds*(toaSeconds: jint): Builder
  proc setCompleteAlmanacProvided*(isCompleteAlmanacProvided: jboolean): Builder
  proc setGnssSatelliteAlmanacs*(gnssSatelliteAlmanacs: List[GnssSatelliteAlmanac]): Builder
  proc build*(): GnssAlmanac

jclass android.location.GnssAlmanac.GnssSatelliteAlmanac* of JVMObject:
  proc getSvid*(): jint
  proc getSvHealth*(): jint
  proc getEccentricity*(): jdouble
  proc getInclination*(): jdouble
  proc getOmega*(): jdouble
  proc getOmega0*(): jdouble
  proc getOmegaDot*(): jdouble
  proc getRootA*(): jdouble
  proc getM0*(): jdouble
  proc getAf0*(): jdouble
  proc getAf1*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string

jclass android.location.Builder* of JVMObject:
  proc setIssueDateMillis*(issueDateMillis: jlong): Builder
  proc setIoda*(ioda: jint): Builder
  proc setWeekNumber*(weekNumber: jint): Builder
  proc setToaSeconds*(toaSeconds: jint): Builder
  proc setCompleteAlmanacProvided*(isCompleteAlmanacProvided: jboolean): Builder
  proc setGnssSatelliteAlmanacs*(gnssSatelliteAlmanacs: List[GnssSatelliteAlmanac]): Builder
  proc build*(): GnssAlmanac

jclass android.location.GnssSatelliteAlmanac* of JVMObject:
  proc getSvid*(): jint
  proc getSvHealth*(): jint
  proc getEccentricity*(): jdouble
  proc getInclination*(): jdouble
  proc getOmega*(): jdouble
  proc getOmega0*(): jdouble
  proc getOmegaDot*(): jdouble
  proc getRootA*(): jdouble
  proc getM0*(): jdouble
  proc getAf0*(): jdouble
  proc getAf1*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[GnssSatelliteAlmanac] {.`static`.}

jclass android.location.GnssSatelliteAlmanac.Builder* of JVMObject:
  proc setSvid*(svid: jint): Builder
  proc setSvHealth*(svHealth: jint): Builder
  proc setEccentricity*(eccentricity: jdouble): Builder
  proc setInclination*(inclination: jdouble): Builder
  proc setOmega*(omega: jdouble): Builder
  proc setOmega0*(omega0: jdouble): Builder
  proc setOmegaDot*(omegaDot: jdouble): Builder
  proc setRootA*(rootA: jdouble): Builder
  proc setM0*(m0: jdouble): Builder
  proc setAf0*(af0: jdouble): Builder
  proc setAf1*(af1: jdouble): Builder
  proc build*(): GnssSatelliteAlmanac

jclass android.location.Builder* of JVMObject:
  proc setSvid*(svid: jint): Builder
  proc setSvHealth*(svHealth: jint): Builder
  proc setEccentricity*(eccentricity: jdouble): Builder
  proc setInclination*(inclination: jdouble): Builder
  proc setOmega*(omega: jdouble): Builder
  proc setOmega0*(omega0: jdouble): Builder
  proc setOmegaDot*(omegaDot: jdouble): Builder
  proc setRootA*(rootA: jdouble): Builder
  proc setM0*(m0: jdouble): Builder
  proc setAf0*(af0: jdouble): Builder
  proc setAf1*(af1: jdouble): Builder
  proc build*(): GnssSatelliteAlmanac

