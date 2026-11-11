import jnim

jclass android.location.GpsSatelliteEphemeris* of JVMObject:
  proc getSvid*(): jint
  proc getGpsL2Params*(): GpsL2Params
  proc getSatelliteClockModel*(): GpsSatelliteClockModel
  proc getSatelliteOrbitModel*(): KeplerianOrbitModel
  proc getSatelliteHealth*(): GpsSatelliteHealth
  proc getSatelliteEphemerisTime*(): SatelliteEphemerisTime
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[GpsSatelliteEphemeris] {.`static`.}

jclass android.location.GpsSatelliteEphemeris.Builder* of JVMObject:
  proc setSvid*(svid: jint): Builder
  proc setGpsL2Params*(gpsL2Params: GpsL2Params): Builder
  proc setSatelliteClockModel*(satelliteClockModel: GpsSatelliteClockModel): Builder
  proc setSatelliteOrbitModel*(satelliteOrbitModel: KeplerianOrbitModel): Builder
  proc setSatelliteHealth*(satelliteHealth: GpsSatelliteHealth): Builder
  proc setSatelliteEphemerisTime*(satelliteEphemerisTime: SatelliteEphemerisTime): Builder
  proc build*(): GpsSatelliteEphemeris

jclass android.location.GpsSatelliteEphemeris.GpsSatelliteHealth* of JVMObject:
  proc getSvHealth*(): jint
  proc getSvAccur*(): jdouble
  proc getFitInt*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string

jclass android.location.GpsSatelliteEphemeris.GpsL2Params* of JVMObject:
  proc getL2Code*(): jint
  proc getL2Flag*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string

jclass android.location.GpsSatelliteEphemeris.GpsSatelliteClockModel* of JVMObject:
  proc getTimeOfClockSeconds*(): jlong
  proc getAf0*(): jdouble
  proc getAf1*(): jdouble
  proc getAf2*(): jdouble
  proc getTgd*(): jdouble
  proc getIodc*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string

jclass android.location.Builder* of JVMObject:
  proc setSvid*(svid: jint): Builder
  proc setGpsL2Params*(gpsL2Params: GpsL2Params): Builder
  proc setSatelliteClockModel*(satelliteClockModel: GpsSatelliteClockModel): Builder
  proc setSatelliteOrbitModel*(satelliteOrbitModel: KeplerianOrbitModel): Builder
  proc setSatelliteHealth*(satelliteHealth: GpsSatelliteHealth): Builder
  proc setSatelliteEphemerisTime*(satelliteEphemerisTime: SatelliteEphemerisTime): Builder
  proc build*(): GpsSatelliteEphemeris

jclass android.location.GpsSatelliteHealth* of JVMObject:
  proc getSvHealth*(): jint
  proc getSvAccur*(): jdouble
  proc getFitInt*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[GpsSatelliteHealth] {.`static`.}

jclass android.location.GpsSatelliteHealth.Builder* of JVMObject:
  proc setSvHealth*(svHealth: jint): Builder
  proc setSvAccur*(svAccur: jdouble): Builder
  proc setFitInt*(fitInt: jdouble): Builder
  proc build*(): GpsSatelliteHealth

jclass android.location.Builder* of JVMObject:
  proc setSvHealth*(svHealth: jint): Builder
  proc setSvAccur*(svAccur: jdouble): Builder
  proc setFitInt*(fitInt: jdouble): Builder
  proc build*(): GpsSatelliteHealth

jclass android.location.GpsL2Params* of JVMObject:
  proc getL2Code*(): jint
  proc getL2Flag*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[GpsL2Params] {.`static`.}

jclass android.location.GpsL2Params.Builder* of JVMObject:
  proc setL2Code*(l2Code: jint): Builder
  proc setL2Flag*(l2Flag: jint): Builder
  proc build*(): GpsL2Params

jclass android.location.Builder* of JVMObject:
  proc setL2Code*(l2Code: jint): Builder
  proc setL2Flag*(l2Flag: jint): Builder
  proc build*(): GpsL2Params

jclass android.location.GpsSatelliteClockModel* of JVMObject:
  proc getTimeOfClockSeconds*(): jlong
  proc getAf0*(): jdouble
  proc getAf1*(): jdouble
  proc getAf2*(): jdouble
  proc getTgd*(): jdouble
  proc getIodc*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  CREATOR*: Creator[GpsSatelliteClockModel] {.`static`.}

jclass android.location.GpsSatelliteClockModel.Builder* of JVMObject:
  proc setTimeOfClockSeconds*(timeOfClockSeconds: jlong): Builder
  proc setAf0*(af0: jdouble): Builder
  proc setAf1*(af1: jdouble): Builder
  proc setAf2*(af2: jdouble): Builder
  proc setTgd*(tgd: jdouble): Builder
  proc setIodc*(iodc: jint): Builder
  proc build*(): GpsSatelliteClockModel

jclass android.location.Builder* of JVMObject:
  proc setTimeOfClockSeconds*(timeOfClockSeconds: jlong): Builder
  proc setAf0*(af0: jdouble): Builder
  proc setAf1*(af1: jdouble): Builder
  proc setAf2*(af2: jdouble): Builder
  proc setTgd*(tgd: jdouble): Builder
  proc setIodc*(iodc: jint): Builder
  proc build*(): GpsSatelliteClockModel

