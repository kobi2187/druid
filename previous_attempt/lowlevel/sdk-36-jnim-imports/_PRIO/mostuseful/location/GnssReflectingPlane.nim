import jnim

jclass android.location.GnssReflectingPlane* of JVMObject:
  proc getLatitudeDegrees*(): jdouble
  proc getLongitudeDegrees*(): jdouble
  proc getAltitudeMeters*(): jdouble
  proc getAzimuthDegrees*(): jdouble
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  CREATOR*: Creator[GnssReflectingPlane] {.`static`.}

jclass android.location.GnssReflectingPlane.Builder* of JVMObject:
  proc setLatitudeDegrees*(latitudeDegrees: jdouble): Builder
  proc setLongitudeDegrees*(longitudeDegrees: jdouble): Builder
  proc setAltitudeMeters*(altitudeMeters: jdouble): Builder
  proc setAzimuthDegrees*(azimuthDegrees: jdouble): Builder
  proc build*(): GnssReflectingPlane

jclass android.location.Builder* of JVMObject:
  proc setLatitudeDegrees*(latitudeDegrees: jdouble): Builder
  proc setLongitudeDegrees*(longitudeDegrees: jdouble): Builder
  proc setAltitudeMeters*(altitudeMeters: jdouble): Builder
  proc setAzimuthDegrees*(azimuthDegrees: jdouble): Builder
  proc build*(): GnssReflectingPlane

