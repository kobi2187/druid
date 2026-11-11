import jnim

jclass android.location.GlonassAssistance* of JVMObject:
  proc getAlmanac*(): GlonassAlmanac
  proc getUtcModel*(): UtcModel
  proc getTimeModels*(): List[TimeModel]
  proc getSatelliteEphemeris*(): List[GlonassSatelliteEphemeris]
  proc getSatelliteCorrections*(): List[GnssSatelliteCorrections]
  proc getRealTimeIntegrityModels*(): List[RealTimeIntegrityModel]
  proc getAuxiliaryInformation*(): List[AuxiliaryInformation]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[GlonassAssistance] {.`static`.}

jclass android.location.GlonassAssistance.Builder* of JVMObject:
  proc setAlmanac*(almanac: GlonassAlmanac): Builder
  proc setUtcModel*(utcModel: UtcModel): Builder
  proc setAuxiliaryInformation*(auxiliaryInformation: List[AuxiliaryInformation]): Builder
  proc setTimeModels*(timeModels: List[TimeModel]): Builder
  proc setSatelliteEphemeris*(satelliteEphemeris: List[GlonassSatelliteEphemeris]): Builder
  proc setSatelliteCorrections*(satelliteCorrections: List[GnssSatelliteCorrections]): Builder
  proc setRealTimeIntegrityModels*(realTimeIntegrityModels: List[RealTimeIntegrityModel]): Builder
  proc build*(): GlonassAssistance

jclass android.location.Builder* of JVMObject:
  proc setAlmanac*(almanac: GlonassAlmanac): Builder
  proc setUtcModel*(utcModel: UtcModel): Builder
  proc setAuxiliaryInformation*(auxiliaryInformation: List[AuxiliaryInformation]): Builder
  proc setTimeModels*(timeModels: List[TimeModel]): Builder
  proc setSatelliteEphemeris*(satelliteEphemeris: List[GlonassSatelliteEphemeris]): Builder
  proc setSatelliteCorrections*(satelliteCorrections: List[GnssSatelliteCorrections]): Builder
  proc setRealTimeIntegrityModels*(realTimeIntegrityModels: List[RealTimeIntegrityModel]): Builder
  proc build*(): GlonassAssistance

