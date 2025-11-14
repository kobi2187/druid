import jnim

jclass android.location.GalileoSatelliteEphemeris* of JVMObject:
  proc getSvid*(): jint
  proc getSatelliteClockModels*(): List[GalileoSatelliteClockModel]
  proc getSatelliteOrbitModel*(): KeplerianOrbitModel
  proc getSatelliteHealth*(): GalileoSvHealth
  proc getSatelliteEphemerisTime*(): SatelliteEphemerisTime
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[GalileoSatelliteEphemeris] {.`static`.}

jclass android.location.GalileoSatelliteEphemeris.Builder* of JVMObject:
  proc setSvid*(svid: jint): Builder
  proc setSatelliteClockModels*(satelliteClockModels: List[GalileoSatelliteClockModel]): Builder
  proc setSatelliteOrbitModel*(satelliteOrbitModel: KeplerianOrbitModel): Builder
  proc setSatelliteHealth*(satelliteHealth: GalileoSvHealth): Builder
  proc setSatelliteEphemerisTime*(satelliteEphemerisTime: SatelliteEphemerisTime): Builder
  proc build*(): GalileoSatelliteEphemeris

jclass android.location.GalileoSatelliteEphemeris.GalileoSvHealth* of JVMObject:
  proc getDataValidityStatusE1b*(): jint
  proc getSignalHealthStatusE1b*(): jint
  proc getDataValidityStatusE5a*(): jint
  proc getSignalHealthStatusE5a*(): jint
  proc getDataValidityStatusE5b*(): jint
  proc getSignalHealthStatusE5b*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string

jclass android.location.GalileoSatelliteEphemeris.GalileoSatelliteClockModel* of JVMObject:
  proc getTimeOfClockSeconds*(): jlong
  proc getAf0*(): jdouble
  proc getAf1*(): jdouble
  proc getAf2*(): jdouble
  proc getBgdSeconds*(): jdouble
  proc getSisaMeters*(): jdouble
  proc getSatelliteClockType*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string

jclass android.location.Builder* of JVMObject:
  proc setSvid*(svid: jint): Builder
  proc setSatelliteClockModels*(satelliteClockModels: List[GalileoSatelliteClockModel]): Builder
  proc setSatelliteOrbitModel*(satelliteOrbitModel: KeplerianOrbitModel): Builder
  proc setSatelliteHealth*(satelliteHealth: GalileoSvHealth): Builder
  proc setSatelliteEphemerisTime*(satelliteEphemerisTime: SatelliteEphemerisTime): Builder
  proc build*(): GalileoSatelliteEphemeris

jclass android.location.GalileoSvHealth* of JVMObject:
  proc getDataValidityStatusE1b*(): jint
  proc getSignalHealthStatusE1b*(): jint
  proc getDataValidityStatusE5a*(): jint
  proc getSignalHealthStatusE5a*(): jint
  proc getDataValidityStatusE5b*(): jint
  proc getSignalHealthStatusE5b*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  DATA_STATUS_DATA_VALID*: jint {.`static`.}
  DATA_STATUS_WORKING_WITHOUT_GUARANTEE*: jint {.`static`.}
  HEALTH_STATUS_OK*: jint {.`static`.}
  HEALTH_STATUS_OUT_OF_SERVICE*: jint {.`static`.}
  HEALTH_STATUS_EXTENDED_OPERATION_MODE*: jint {.`static`.}
  HEALTH_STATUS_IN_TEST*: jint {.`static`.}
  CREATOR*: Creator[GalileoSvHealth] {.`static`.}

jclass android.location.GalileoSvHealth.Builder* of JVMObject:
  proc setDataValidityStatusE1b*(dataValidityStatusE1b: jint): Builder
  proc setSignalHealthStatusE1b*(signalHealthStatusE1b: jint): Builder
  proc setDataValidityStatusE5a*(dataValidityStatusE5a: jint): Builder
  proc setSignalHealthStatusE5a*(signalHealthStatusE5a: jint): Builder
  proc setDataValidityStatusE5b*(dataValidityStatusE5b: jint): Builder
  proc setSignalHealthStatusE5b*(signalHealthStatusE5b: jint): Builder
  proc build*(): GalileoSvHealth

jclass android.location.Builder* of JVMObject:
  proc setDataValidityStatusE1b*(dataValidityStatusE1b: jint): Builder
  proc setSignalHealthStatusE1b*(signalHealthStatusE1b: jint): Builder
  proc setDataValidityStatusE5a*(dataValidityStatusE5a: jint): Builder
  proc setSignalHealthStatusE5a*(signalHealthStatusE5a: jint): Builder
  proc setDataValidityStatusE5b*(dataValidityStatusE5b: jint): Builder
  proc setSignalHealthStatusE5b*(signalHealthStatusE5b: jint): Builder
  proc build*(): GalileoSvHealth

jclass android.location.GalileoSatelliteClockModel* of JVMObject:
  proc getTimeOfClockSeconds*(): jlong
  proc getAf0*(): jdouble
  proc getAf1*(): jdouble
  proc getAf2*(): jdouble
  proc getBgdSeconds*(): jdouble
  proc getSisaMeters*(): jdouble
  proc getSatelliteClockType*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  TYPE_UNDEFINED*: jint {.`static`.}
  TYPE_FNAV*: jint {.`static`.}
  TYPE_INAV*: jint {.`static`.}
  CREATOR*: Creator[GalileoSatelliteClockModel] {.`static`.}

jclass android.location.GalileoSatelliteClockModel.Builder* of JVMObject:
  proc setTimeOfClockSeconds*(timeOfClockSeconds: jlong): Builder
  proc setAf0*(af0: jdouble): Builder
  proc setAf1*(af1: jdouble): Builder
  proc setAf2*(af2: jdouble): Builder
  proc setBgdSeconds*(bgdSeconds: jdouble): Builder
  proc setSisaMeters*(sisaMeters: jdouble): Builder
  proc setSatelliteClockType*(satelliteClockType: jint): Builder
  proc build*(): GalileoSatelliteClockModel

jclass android.location.Builder* of JVMObject:
  proc setTimeOfClockSeconds*(timeOfClockSeconds: jlong): Builder
  proc setAf0*(af0: jdouble): Builder
  proc setAf1*(af1: jdouble): Builder
  proc setAf2*(af2: jdouble): Builder
  proc setBgdSeconds*(bgdSeconds: jdouble): Builder
  proc setSisaMeters*(sisaMeters: jdouble): Builder
  proc setSatelliteClockType*(satelliteClockType: jint): Builder
  proc build*(): GalileoSatelliteClockModel

