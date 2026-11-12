import jnim

jclass android.uwb.DistanceMeasurement* of JVMObject:
  proc getMeters*(): jdouble
  proc getErrorMeters*(): jdouble
  proc getConfidenceLevel*(): jdouble
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[DistanceMeasurement] {.`static`.}

jclass android.uwb.DistanceMeasurement.Builder* of JVMObject:
  proc setMeters*(meters: jdouble): Builder
  proc setErrorMeters*(errorMeters: jdouble): Builder
  proc setConfidenceLevel*(confidenceLevel: jdouble): Builder
  proc build*(): DistanceMeasurement

jclass android.uwb.Builder* of JVMObject:
  proc setMeters*(meters: jdouble): Builder
  proc setErrorMeters*(errorMeters: jdouble): Builder
  proc setConfidenceLevel*(confidenceLevel: jdouble): Builder
  proc build*(): DistanceMeasurement

