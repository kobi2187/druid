import jnim

jclass android.location.GnssAssistance* of JVMObject:
  proc getGpsAssistance*(): GpsAssistance
  proc getGlonassAssistance*(): GlonassAssistance
  proc getGalileoAssistance*(): GalileoAssistance
  proc getBeidouAssistance*(): BeidouAssistance
  proc getQzssAssistance*(): QzssAssistance
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[GnssAssistance] {.`static`.}

jclass android.location.GnssAssistance.Builder* of JVMObject:
  proc setGpsAssistance*(gpsAssistance: GpsAssistance): Builder
  proc setGlonassAssistance*(glonassAssistance: GlonassAssistance): Builder
  proc setGalileoAssistance*(galileoAssistance: GalileoAssistance): Builder
  proc setBeidouAssistance*(beidouAssistance: BeidouAssistance): Builder
  proc setQzssAssistance*(qzssAssistance: QzssAssistance): Builder
  proc build*(): GnssAssistance

jclass android.location.GnssAssistance.GnssSatelliteCorrections* of JVMObject:
  proc getSvid*(): jint
  proc getIonosphericCorrections*(): List[IonosphericCorrection]
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string

jclass android.location.Builder* of JVMObject:
  proc setGpsAssistance*(gpsAssistance: GpsAssistance): Builder
  proc setGlonassAssistance*(glonassAssistance: GlonassAssistance): Builder
  proc setGalileoAssistance*(galileoAssistance: GalileoAssistance): Builder
  proc setBeidouAssistance*(beidouAssistance: BeidouAssistance): Builder
  proc setQzssAssistance*(qzssAssistance: QzssAssistance): Builder
  proc build*(): GnssAssistance

jclass android.location.GnssSatelliteCorrections* of JVMObject:
  proc getSvid*(): jint
  proc getIonosphericCorrections*(): List[IonosphericCorrection]
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[GnssSatelliteCorrections] {.`static`.}

