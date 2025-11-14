import jnim

jclass android.location.GnssExcessPathInfo* of JVMObject:
  proc getFlags*(): jint
  proc hasExcessPathLength*(): jboolean
  proc getExcessPathLengthMeters*(): jfloat
  proc hasExcessPathLengthUncertainty*(): jboolean
  proc getExcessPathLengthUncertaintyMeters*(): jfloat
  proc hasReflectingPlane*(): jboolean
  proc getReflectingPlane*(): GnssReflectingPlane
  proc hasAttenuation*(): jboolean
  proc getAttenuationDb*(): jfloat
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, parcelFlags: jint)
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Creator[GnssExcessPathInfo] {.`static`.}

jclass android.location.GnssExcessPathInfo.Builder* of JVMObject:
  proc setExcessPathLengthMeters*(excessPathLengthMeters: jfloat): Builder
  proc clearExcessPathLengthMeters*(): Builder
  proc setExcessPathLengthUncertaintyMeters*(excessPathLengthUncertaintyMeters: jfloat): Builder
  proc clearExcessPathLengthUncertaintyMeters*(): Builder
  proc setReflectingPlane*(reflectingPlane: GnssReflectingPlane): Builder
  proc setAttenuationDb*(attenuationDb: jfloat): Builder
  proc clearAttenuationDb*(): Builder
  proc build*(): GnssExcessPathInfo

jclass android.location.Builder* of JVMObject:
  proc setExcessPathLengthMeters*(excessPathLengthMeters: jfloat): Builder
  proc clearExcessPathLengthMeters*(): Builder
  proc setExcessPathLengthUncertaintyMeters*(excessPathLengthUncertaintyMeters: jfloat): Builder
  proc clearExcessPathLengthUncertaintyMeters*(): Builder
  proc setReflectingPlane*(reflectingPlane: GnssReflectingPlane): Builder
  proc setAttenuationDb*(attenuationDb: jfloat): Builder
  proc clearAttenuationDb*(): Builder
  proc build*(): GnssExcessPathInfo

