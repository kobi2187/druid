import jnim

jclass android.uwb.AngleOfArrivalMeasurement* of JVMObject:
  proc getAzimuth*(): AngleMeasurement
  proc getAltitude*(): AngleMeasurement
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[AngleOfArrivalMeasurement] {.`static`.}

jclass android.uwb.AngleOfArrivalMeasurement.Builder* of JVMObject:
  proc setAltitude*(altitudeAngle: AngleMeasurement): Builder
  proc build*(): AngleOfArrivalMeasurement

jclass android.uwb.Builder* of JVMObject:
  proc setAltitude*(altitudeAngle: AngleMeasurement): Builder
  proc build*(): AngleOfArrivalMeasurement

