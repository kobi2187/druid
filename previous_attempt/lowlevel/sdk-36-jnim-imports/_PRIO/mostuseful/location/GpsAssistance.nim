import jnim

jclass android.location.GpsAssistance* of JVMObject:
  proc getAlmanac*(): GnssAlmanac
  proc getIonosphericModel*(): KlobucharIonosphericModel
  proc getUtcModel*(): UtcModel
  proc getLeapSecondsModel*(): LeapSecondsModel
  proc getAuxiliaryInformation*(): List[AuxiliaryInformation]
  proc getTimeModels*(): List[TimeModel]
  proc getSatelliteEphemeris*(): List[GpsSatelliteEphemeris]
  proc getRealTimeIntegrityModels*(): List[RealTimeIntegrityModel]
  proc getSatelliteCorrections*(): List[GnssSatelliteCorrections]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[GpsAssistance] {.`static`.}

jclass android.location.GpsAssistance.Builder* of JVMObject:
  proc setAlmanac*(almanac: GnssAlmanac): Builder
  proc setIonosphericModel*(ionosphericModel: KlobucharIonosphericModel): Builder
  proc setUtcModel*(utcModel: UtcModel): Builder
  proc setLeapSecondsModel*(leapSecondsModel: LeapSecondsModel): Builder
  proc setAuxiliaryInformation*(auxiliaryInformation: List[AuxiliaryInformation]): Builder
  proc setTimeModels*(timeModels: List[TimeModel]): Builder
  proc setSatelliteEphemeris*(satelliteEphemeris: List[GpsSatelliteEphemeris]): Builder
  proc setRealTimeIntegrityModels*(realTimeIntegrityModels: List[RealTimeIntegrityModel]): Builder
  proc setSatelliteCorrections*(satelliteCorrections: List[GnssSatelliteCorrections]): Builder
  proc build*(): GpsAssistance

jclass android.location.Builder* of JVMObject:
  proc setAlmanac*(almanac: GnssAlmanac): Builder
  proc setIonosphericModel*(ionosphericModel: KlobucharIonosphericModel): Builder
  proc setUtcModel*(utcModel: UtcModel): Builder
  proc setLeapSecondsModel*(leapSecondsModel: LeapSecondsModel): Builder
  proc setAuxiliaryInformation*(auxiliaryInformation: List[AuxiliaryInformation]): Builder
  proc setTimeModels*(timeModels: List[TimeModel]): Builder
  proc setSatelliteEphemeris*(satelliteEphemeris: List[GpsSatelliteEphemeris]): Builder
  proc setRealTimeIntegrityModels*(realTimeIntegrityModels: List[RealTimeIntegrityModel]): Builder
  proc setSatelliteCorrections*(satelliteCorrections: List[GnssSatelliteCorrections]): Builder
  proc build*(): GpsAssistance

