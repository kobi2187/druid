import jnim

jclass android.location.GalileoAssistance* of JVMObject:
  proc getAlmanac*(): GnssAlmanac
  proc getIonosphericModel*(): GalileoIonosphericModel
  proc getUtcModel*(): UtcModel
  proc getLeapSecondsModel*(): LeapSecondsModel
  proc getAuxiliaryInformation*(): List[AuxiliaryInformation]
  proc getTimeModels*(): List[TimeModel]
  proc getSatelliteEphemeris*(): List[GalileoSatelliteEphemeris]
  proc getRealTimeIntegrityModels*(): List[RealTimeIntegrityModel]
  proc getSatelliteCorrections*(): List[GnssSatelliteCorrections]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[GalileoAssistance] {.`static`.}

jclass android.location.GalileoAssistance.Builder* of JVMObject:
  proc setAlmanac*(almanac: GnssAlmanac): Builder
  proc setIonosphericModel*(ionosphericModel: GalileoIonosphericModel): Builder
  proc setUtcModel*(utcModel: UtcModel): Builder
  proc setLeapSecondsModel*(leapSecondsModel: LeapSecondsModel): Builder
  proc setAuxiliaryInformation*(auxiliaryInformation: List[AuxiliaryInformation]): Builder
  proc setTimeModels*(timeModels: List[TimeModel]): Builder
  proc setSatelliteEphemeris*(satelliteEphemeris: List[GalileoSatelliteEphemeris]): Builder
  proc setRealTimeIntegrityModels*(realTimeIntegrityModels: List[RealTimeIntegrityModel]): Builder
  proc setSatelliteCorrections*(satelliteCorrections: List[GnssSatelliteCorrections]): Builder
  proc build*(): GalileoAssistance

jclass android.location.Builder* of JVMObject:
  proc setAlmanac*(almanac: GnssAlmanac): Builder
  proc setIonosphericModel*(ionosphericModel: GalileoIonosphericModel): Builder
  proc setUtcModel*(utcModel: UtcModel): Builder
  proc setLeapSecondsModel*(leapSecondsModel: LeapSecondsModel): Builder
  proc setAuxiliaryInformation*(auxiliaryInformation: List[AuxiliaryInformation]): Builder
  proc setTimeModels*(timeModels: List[TimeModel]): Builder
  proc setSatelliteEphemeris*(satelliteEphemeris: List[GalileoSatelliteEphemeris]): Builder
  proc setRealTimeIntegrityModels*(realTimeIntegrityModels: List[RealTimeIntegrityModel]): Builder
  proc setSatelliteCorrections*(satelliteCorrections: List[GnssSatelliteCorrections]): Builder
  proc build*(): GalileoAssistance

