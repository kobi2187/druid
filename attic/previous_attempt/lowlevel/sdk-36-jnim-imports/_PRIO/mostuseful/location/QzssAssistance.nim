import jnim

jclass android.location.QzssAssistance* of JVMObject:
  proc getAlmanac*(): GnssAlmanac
  proc getIonosphericModel*(): KlobucharIonosphericModel
  proc getUtcModel*(): UtcModel
  proc getLeapSecondsModel*(): LeapSecondsModel
  proc getAuxiliaryInformation*(): List[AuxiliaryInformation]
  proc getTimeModels*(): List[TimeModel]
  proc getSatelliteEphemeris*(): List[QzssSatelliteEphemeris]
  proc getRealTimeIntegrityModels*(): List[RealTimeIntegrityModel]
  proc getSatelliteCorrections*(): List[GnssSatelliteCorrections]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[QzssAssistance] {.`static`.}

jclass android.location.QzssAssistance.Builder* of JVMObject:
  proc setAlmanac*(almanac: GnssAlmanac): Builder
  proc setIonosphericModel*(ionosphericModel: KlobucharIonosphericModel): Builder
  proc setUtcModel*(utcModel: UtcModel): Builder
  proc setLeapSecondsModel*(leapSecondsModel: LeapSecondsModel): Builder
  proc setAuxiliaryInformation*(auxiliaryInformation: List[AuxiliaryInformation]): Builder
  proc setTimeModels*(timeModels: List[TimeModel]): Builder
  proc setSatelliteEphemeris*(satelliteEphemeris: List[QzssSatelliteEphemeris]): Builder
  proc setRealTimeIntegrityModels*(realTimeIntegrityModels: List[RealTimeIntegrityModel]): Builder
  proc setSatelliteCorrections*(satelliteCorrections: List[GnssSatelliteCorrections]): Builder
  proc build*(): QzssAssistance

jclass android.location.Builder* of JVMObject:
  proc setAlmanac*(almanac: GnssAlmanac): Builder
  proc setIonosphericModel*(ionosphericModel: KlobucharIonosphericModel): Builder
  proc setUtcModel*(utcModel: UtcModel): Builder
  proc setLeapSecondsModel*(leapSecondsModel: LeapSecondsModel): Builder
  proc setAuxiliaryInformation*(auxiliaryInformation: List[AuxiliaryInformation]): Builder
  proc setTimeModels*(timeModels: List[TimeModel]): Builder
  proc setSatelliteEphemeris*(satelliteEphemeris: List[QzssSatelliteEphemeris]): Builder
  proc setRealTimeIntegrityModels*(realTimeIntegrityModels: List[RealTimeIntegrityModel]): Builder
  proc setSatelliteCorrections*(satelliteCorrections: List[GnssSatelliteCorrections]): Builder
  proc build*(): QzssAssistance

