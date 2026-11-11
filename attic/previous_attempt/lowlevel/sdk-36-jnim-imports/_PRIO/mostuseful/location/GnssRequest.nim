import jnim

jclass android.location.GnssRequest* of JVMObject:
  proc isFullTracking*(): jboolean
  proc toGnssMeasurementRequest*(): GnssMeasurementRequest
  proc toString*(): string
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  CREATOR*: Creator[GnssRequest] {.`static`.}

jclass android.location.GnssRequest.Builder* of JVMObject:
  proc setFullTracking*(value: jboolean): Builder
  proc build*(): GnssRequest

jclass android.location.Builder* of JVMObject:
  proc setFullTracking*(value: jboolean): Builder
  proc build*(): GnssRequest

