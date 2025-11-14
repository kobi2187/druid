import jnim

jclass android.location.GnssMeasurementRequest* of JVMObject:
  proc isCorrelationVectorOutputsEnabled*(): jboolean
  proc isFullTracking*(): jboolean
  proc getIntervalMillis*(): jint
  proc getWorkSource*(): WorkSource
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc toString*(): string
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  PASSIVE_INTERVAL*: jint {.`static`.}
  CREATOR*: Creator[GnssMeasurementRequest] {.`static`.}

jclass android.location.GnssMeasurementRequest.Builder* of JVMObject:
  proc setCorrelationVectorOutputsEnabled*(value: jboolean): Builder
  proc setFullTracking*(value: jboolean): Builder
  proc setIntervalMillis*(value: jint): Builder
  proc setWorkSource*(workSource: WorkSource): Builder
  proc build*(): GnssMeasurementRequest

jclass android.location.Builder* of JVMObject:
  proc setCorrelationVectorOutputsEnabled*(value: jboolean): Builder
  proc setFullTracking*(value: jboolean): Builder
  proc setIntervalMillis*(value: jint): Builder
  proc setWorkSource*(workSource: WorkSource): Builder
  proc build*(): GnssMeasurementRequest

