import jnim

jclass android.location.BeidouSatelliteEphemeris* of JVMObject:
  proc getSvid*(): jint
  proc getSatelliteClockModel*(): BeidouSatelliteClockModel
  proc getSatelliteOrbitModel*(): KeplerianOrbitModel
  proc getSatelliteHealth*(): BeidouSatelliteHealth
  proc getSatelliteEphemerisTime*(): BeidouSatelliteEphemerisTime
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[BeidouSatelliteEphemeris] {.`static`.}

jclass android.location.BeidouSatelliteEphemeris.Builder* of JVMObject:
  proc setSvid*(svid: jint): Builder
  proc setSatelliteClockModel*(satelliteClockModel: BeidouSatelliteClockModel): Builder
  proc setSatelliteOrbitModel*(satelliteOrbitModel: KeplerianOrbitModel): Builder
  proc setSatelliteHealth*(satelliteHealth: BeidouSatelliteHealth): Builder
  proc setSatelliteEphemerisTime*(satelliteEphemerisTime: BeidouSatelliteEphemerisTime): Builder
  proc build*(): BeidouSatelliteEphemeris

jclass android.location.BeidouSatelliteEphemeris.BeidouSatelliteClockModel* of JVMObject:
  proc getTimeOfClockSeconds*(): jlong
  proc getAf0*(): jdouble
  proc getAf1*(): jdouble
  proc getAf2*(): jdouble
  proc getTgd1*(): jdouble
  proc getTgd2*(): jdouble
  proc getAodc*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string

jclass android.location.BeidouSatelliteEphemeris.BeidouSatelliteHealth* of JVMObject:
  proc getSatH1*(): jint
  proc getSvAccur*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string

jclass android.location.BeidouSatelliteEphemeris.BeidouSatelliteEphemerisTime* of JVMObject:
  proc getAode*(): jint
  proc getBeidouWeekNumber*(): jint
  proc getToeSeconds*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string

jclass android.location.Builder* of JVMObject:
  proc setSvid*(svid: jint): Builder
  proc setSatelliteClockModel*(satelliteClockModel: BeidouSatelliteClockModel): Builder
  proc setSatelliteOrbitModel*(satelliteOrbitModel: KeplerianOrbitModel): Builder
  proc setSatelliteHealth*(satelliteHealth: BeidouSatelliteHealth): Builder
  proc setSatelliteEphemerisTime*(satelliteEphemerisTime: BeidouSatelliteEphemerisTime): Builder
  proc build*(): BeidouSatelliteEphemeris

jclass android.location.BeidouSatelliteClockModel* of JVMObject:
  proc getTimeOfClockSeconds*(): jlong
  proc getAf0*(): jdouble
  proc getAf1*(): jdouble
  proc getAf2*(): jdouble
  proc getTgd1*(): jdouble
  proc getTgd2*(): jdouble
  proc getAodc*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[BeidouSatelliteClockModel] {.`static`.}

jclass android.location.BeidouSatelliteClockModel.Builder* of JVMObject:
  proc setTimeOfClockSeconds*(timeOfClockSeconds: jlong): Builder
  proc setAf0*(af0: jdouble): Builder
  proc setAf1*(af1: jdouble): Builder
  proc setAf2*(af2: jdouble): Builder
  proc setTgd1*(tgd1: jdouble): Builder
  proc setTgd2*(tgd2: jdouble): Builder
  proc setAodc*(aodc: jint): Builder
  proc build*(): BeidouSatelliteClockModel

jclass android.location.Builder* of JVMObject:
  proc setTimeOfClockSeconds*(timeOfClockSeconds: jlong): Builder
  proc setAf0*(af0: jdouble): Builder
  proc setAf1*(af1: jdouble): Builder
  proc setAf2*(af2: jdouble): Builder
  proc setTgd1*(tgd1: jdouble): Builder
  proc setTgd2*(tgd2: jdouble): Builder
  proc setAodc*(aodc: jint): Builder
  proc build*(): BeidouSatelliteClockModel

jclass android.location.BeidouSatelliteHealth* of JVMObject:
  proc getSatH1*(): jint
  proc getSvAccur*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[BeidouSatelliteHealth] {.`static`.}

jclass android.location.BeidouSatelliteHealth.Builder* of JVMObject:
  proc setSatH1*(satH1: jint): Builder
  proc setSvAccur*(svAccur: jdouble): Builder
  proc build*(): BeidouSatelliteHealth

jclass android.location.Builder* of JVMObject:
  proc setSatH1*(satH1: jint): Builder
  proc setSvAccur*(svAccur: jdouble): Builder
  proc build*(): BeidouSatelliteHealth

jclass android.location.BeidouSatelliteEphemerisTime* of JVMObject:
  proc getAode*(): jint
  proc getBeidouWeekNumber*(): jint
  proc getToeSeconds*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[BeidouSatelliteEphemerisTime] {.`static`.}

jclass android.location.BeidouSatelliteEphemerisTime.Builder* of JVMObject:
  proc setAode*(iode: jint): Builder
  proc setBeidouWeekNumber*(beidouWeekNumber: jint): Builder
  proc setToeSeconds*(toeSeconds: jint): Builder
  proc build*(): BeidouSatelliteEphemerisTime

jclass android.location.Builder* of JVMObject:
  proc setAode*(iode: jint): Builder
  proc setBeidouWeekNumber*(beidouWeekNumber: jint): Builder
  proc setToeSeconds*(toeSeconds: jint): Builder
  proc build*(): BeidouSatelliteEphemerisTime

