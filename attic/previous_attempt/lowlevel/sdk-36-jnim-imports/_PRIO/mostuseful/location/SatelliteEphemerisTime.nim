import jnim

jclass android.location.SatelliteEphemerisTime* of JVMObject:
  proc getIode*(): jint
  proc getWeekNumber*(): jint
  proc getToeSeconds*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[SatelliteEphemerisTime] {.`static`.}

jclass android.location.SatelliteEphemerisTime.Builder* of JVMObject:
  proc setIode*(iode: jint): Builder
  proc setWeekNumber*(weekNumber: jint): Builder
  proc setToeSeconds*(toeSeconds: jint): Builder
  proc build*(): SatelliteEphemerisTime

jclass android.location.Builder* of JVMObject:
  proc setIode*(iode: jint): Builder
  proc setWeekNumber*(weekNumber: jint): Builder
  proc setToeSeconds*(toeSeconds: jint): Builder
  proc build*(): SatelliteEphemerisTime

