import jnim

jclass android.location.AuxiliaryInformation* of JVMObject:
  proc getSvid*(): jint
  proc getAvailableSignalTypes*(): List[GnssSignalType]
  proc getFrequencyChannelNumber*(): jint
  proc getSatType*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  BDS_B1C_ORBIT_TYPE_UNDEFINED*: jint {.`static`.}
  BDS_B1C_ORBIT_TYPE_GEO*: jint {.`static`.}
  BDS_B1C_ORBIT_TYPE_IGSO*: jint {.`static`.}
  BDS_B1C_ORBIT_TYPE_MEO*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[AuxiliaryInformation] {.`static`.}

jclass android.location.AuxiliaryInformation.Builder* of JVMObject:
  proc setSvid*(svid: jint): Builder
  proc setAvailableSignalTypes*(availableSignalTypes: List[GnssSignalType]): Builder
  proc setFrequencyChannelNumber*(frequencyChannelNumber: jint): Builder
  proc setSatType*(satType: jint): Builder
  proc build*(): AuxiliaryInformation

jclass android.location.Builder* of JVMObject:
  proc setSvid*(svid: jint): Builder
  proc setAvailableSignalTypes*(availableSignalTypes: List[GnssSignalType]): Builder
  proc setFrequencyChannelNumber*(frequencyChannelNumber: jint): Builder
  proc setSatType*(satType: jint): Builder
  proc build*(): AuxiliaryInformation

