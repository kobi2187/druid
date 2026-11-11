import jnim

jclass android.uwb.AngleMeasurement* of JVMObject:
  proc getRadians*(): jdouble
  proc getErrorRadians*(): jdouble
  proc getConfidenceLevel*(): jdouble
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[AngleMeasurement] {.`static`.}

