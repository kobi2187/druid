import jnim

jclass android.location.BeidouAssistance* of JVMObject:
  proc getAlmanac*(): GnssAlmanac
  proc getIonosphericModel*(): KlobucharIonosphericModel
  proc getUtcModel*(): UtcModel
  proc getLeapSecondsModel*(): LeapSecondsModel
  proc getAuxiliaryInformation*(): List[AuxiliaryInformation]
  proc getTimeModels*(): List[TimeModel]
  proc getSatelliteEphemeris*(): List[BeidouSatelliteEphemeris]
  proc getRealTimeIntegrityModels*(): List[RealTimeIntegrityModel]
  proc getSatelliteCorrections*(): List[GnssSatelliteCorrections]
  proc describeContents*(): jint
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[BeidouAssistance] {.`static`.}

jclass android.location.BeidouAssistance.Builder* of JVMObject:
  proc setAlmanac*(almanac: GnssAlmanac): Builder
  proc setIonosphericModel*(ionosphericModel: KlobucharIonosphericModel): Builder
  proc setUtcModel*(utcModel: UtcModel): Builder
  proc setLeapSecondsModel*(leapSecondsModel: LeapSecondsModel): Builder
  proc setAuxiliaryInformation*(auxiliaryInformation: List[AuxiliaryInformation]): Builder
  proc setTimeModels*(timeModels: List[TimeModel]): Builder
  proc setSatelliteEphemeris*(satelliteEphemeris: List[BeidouSatelliteEphemeris]): Builder
  proc setRealTimeIntegrityModels*(realTimeIntegrityModels: List[RealTimeIntegrityModel]): Builder
  proc setSatelliteCorrections*(satelliteCorrections: List[GnssSatelliteCorrections]): Builder
  proc build*(): BeidouAssistance

jclass android.location.Builder* of JVMObject:
  proc setAlmanac*(almanac: GnssAlmanac): Builder
  proc setIonosphericModel*(ionosphericModel: KlobucharIonosphericModel): Builder
  proc setUtcModel*(utcModel: UtcModel): Builder
  proc setLeapSecondsModel*(leapSecondsModel: LeapSecondsModel): Builder
  proc setAuxiliaryInformation*(auxiliaryInformation: List[AuxiliaryInformation]): Builder
  proc setTimeModels*(timeModels: List[TimeModel]): Builder
  proc setSatelliteEphemeris*(satelliteEphemeris: List[BeidouSatelliteEphemeris]): Builder
  proc setRealTimeIntegrityModels*(realTimeIntegrityModels: List[RealTimeIntegrityModel]): Builder
  proc setSatelliteCorrections*(satelliteCorrections: List[GnssSatelliteCorrections]): Builder
  proc build*(): BeidouAssistance

