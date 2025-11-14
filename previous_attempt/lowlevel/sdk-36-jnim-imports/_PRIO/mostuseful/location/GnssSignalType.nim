import jnim

jclass android.location.GnssSignalType* of JVMObject:
  proc create*(constellationType: jint, carrierFrequencyHz: jdouble, codeType: string): GnssSignalType {.`static`.}
  proc getConstellationType*(): jint
  proc getCarrierFrequencyHz*(): jdouble
  proc getCodeType*(): string
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[GnssSignalType] {.`static`.}

