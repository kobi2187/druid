import jnim

jclass android.location.GnssStatus* of JVMObject:
  proc wrap*(svCount: jint, svidWithFlags: seq[jint], cn0DbHzs: seq[jfloat], elevations: seq[jfloat], azimuths: seq[jfloat], carrierFrequencies: seq[jfloat], basebandCn0DbHzs: seq[jfloat]): GnssStatus {.`static`.}
  proc getSatelliteCount*(): jint
  proc getConstellationType*(satelliteIndex: jint): jint
  proc getSvid*(satelliteIndex: jint): jint
  proc getCn0DbHz*(satelliteIndex: jint): jfloat
  proc getElevationDegrees*(satelliteIndex: jint): jfloat
  proc getAzimuthDegrees*(satelliteIndex: jint): jfloat
  proc hasEphemerisData*(satelliteIndex: jint): jboolean
  proc hasAlmanacData*(satelliteIndex: jint): jboolean
  proc usedInFix*(satelliteIndex: jint): jboolean
  proc hasCarrierFrequencyHz*(satelliteIndex: jint): jboolean
  proc getCarrierFrequencyHz*(satelliteIndex: jint): jfloat
  proc hasBasebandCn0DbHz*(satelliteIndex: jint): jboolean
  proc getBasebandCn0DbHz*(satelliteIndex: jint): jfloat
  proc constellationTypeToString*(constellationType: jint): string {.`static`.}
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  CONSTELLATION_UNKNOWN*: jint {.`static`.}
  CONSTELLATION_GPS*: jint {.`static`.}
  CONSTELLATION_SBAS*: jint {.`static`.}
  CONSTELLATION_GLONASS*: jint {.`static`.}
  CONSTELLATION_QZSS*: jint {.`static`.}
  CONSTELLATION_BEIDOU*: jint {.`static`.}
  CONSTELLATION_GALILEO*: jint {.`static`.}
  CONSTELLATION_IRNSS*: jint {.`static`.}
  CONSTELLATION_COUNT*: jint {.`static`.}
  CREATOR*: Creator[GnssStatus] {.`static`.}

jclass android.location.GnssStatus.Callback* of JVMObject:
  proc onStarted*()
  proc onStopped*()
  proc onFirstFix*(ttffMillis: jint)
  proc onSatelliteStatusChanged*(status: GnssStatus)

jclass android.location.GnssStatus.Builder* of JVMObject:
  proc addSatellite*(constellationType: jint, svid: jint, cn0DbHz: jfloat, elevation: jfloat, azimuth: jfloat, hasEphemeris: jboolean, hasAlmanac: jboolean, usedInFix: jboolean, hasCarrierFrequency: jboolean, carrierFrequency: jfloat, hasBasebandCn0DbHz: jboolean, basebandCn0DbHz: jfloat): Builder
  proc clearSatellites*(): Builder
  proc build*(): GnssStatus

jclass android.location.Callback* of JVMObject:
  proc onStarted*()
  proc onStopped*()
  proc onFirstFix*(ttffMillis: jint)
  proc onSatelliteStatusChanged*(status: GnssStatus)

jclass android.location.Builder* of JVMObject:
  proc addSatellite*(constellationType: jint, svid: jint, cn0DbHz: jfloat, elevation: jfloat, azimuth: jfloat, hasEphemeris: jboolean, hasAlmanac: jboolean, usedInFix: jboolean, hasCarrierFrequency: jboolean, carrierFrequency: jfloat, hasBasebandCn0DbHz: jboolean, basebandCn0DbHz: jfloat): Builder
  proc clearSatellites*(): Builder
  proc build*(): GnssStatus

