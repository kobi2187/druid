import jnim

jclass android.location.QzssSatelliteEphemeris* of JVMObject:
  proc getSvid*(): jint
  proc getGpsL2Params*(): GpsL2Params
  proc getSatelliteClockModel*(): GpsSatelliteClockModel
  proc getSatelliteOrbitModel*(): KeplerianOrbitModel
  proc getSatelliteHealth*(): GpsSatelliteHealth
  proc getSatelliteEphemerisTime*(): SatelliteEphemerisTime
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  CREATOR*: Creator[QzssSatelliteEphemeris] {.`static`.}

jclass android.location.QzssSatelliteEphemeris.Builder* of JVMObject:
  proc setSvid*(svid: jint): Builder
  proc setGpsL2Params*(gpsL2Params: GpsL2Params): Builder
  proc setSatelliteClockModel*(satelliteClockModel: GpsSatelliteClockModel): Builder
  proc setSatelliteOrbitModel*(satelliteOrbitModel: KeplerianOrbitModel): Builder
  proc setSatelliteHealth*(satelliteHealth: GpsSatelliteHealth): Builder
  proc setSatelliteEphemerisTime*(satelliteEphemerisTime: SatelliteEphemerisTime): Builder
  proc build*(): QzssSatelliteEphemeris

jclass android.location.Builder* of JVMObject:
  proc setSvid*(svid: jint): Builder
  proc setGpsL2Params*(gpsL2Params: GpsL2Params): Builder
  proc setSatelliteClockModel*(satelliteClockModel: GpsSatelliteClockModel): Builder
  proc setSatelliteOrbitModel*(satelliteOrbitModel: KeplerianOrbitModel): Builder
  proc setSatelliteHealth*(satelliteHealth: GpsSatelliteHealth): Builder
  proc setSatelliteEphemerisTime*(satelliteEphemerisTime: SatelliteEphemerisTime): Builder
  proc build*(): QzssSatelliteEphemeris

