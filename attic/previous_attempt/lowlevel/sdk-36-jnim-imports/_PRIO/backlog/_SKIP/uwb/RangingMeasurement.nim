import jnim

jclass android.uwb.RangingMeasurement* of JVMObject:
  proc getRemoteDeviceAddress*(): UwbAddress
  proc getStatus*(): jint
  proc getElapsedRealtimeNanos*(): jlong
  proc getDistanceMeasurement*(): DistanceMeasurement
  proc getAngleOfArrivalMeasurement*(): AngleOfArrivalMeasurement
  proc getDestinationAngleOfArrivalMeasurement*(): AngleOfArrivalMeasurement
  proc getLineOfSight*(): jint
  proc getRssiDbm*(): jint
  proc getHusPrimarySessionId*(): jlong
  proc getMeasurementFocus*(): jint
  proc getRangingMeasurementMetadata*(): PersistableBundle
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  RSSI_UNKNOWN*: jint {.`static`.}
  RSSI_MIN*: jint {.`static`.}
  RSSI_MAX*: jint {.`static`.}
  NON_HYBRID_UWB_SESSION_ID*: jint {.`static`.}
  RANGING_STATUS_SUCCESS*: jint {.`static`.}
  RANGING_STATUS_FAILURE_OUT_OF_RANGE*: jint {.`static`.}
  RANGING_STATUS_FAILURE_UNKNOWN_ERROR*: jint {.`static`.}
  LOS*: jint {.`static`.}
  NLOS*: jint {.`static`.}
  LOS_UNDETERMINED*: jint {.`static`.}
  MEASUREMENT_FOCUS_NONE*: jint {.`static`.}
  MEASUREMENT_FOCUS_RANGE*: jint {.`static`.}
  MEASUREMENT_FOCUS_ANGLE_OF_ARRIVAL_AZIMUTH*: jint {.`static`.}
  MEASUREMENT_FOCUS_ANGLE_OF_ARRIVAL_ELEVATION*: jint {.`static`.}
  CREATOR*: Creator[RangingMeasurement] {.`static`.}

jclass android.uwb.RangingMeasurement.Builder* of JVMObject:
  proc setRemoteDeviceAddress*(remoteDeviceAddress: UwbAddress): Builder
  proc setStatus*(status: jint): Builder
  proc setElapsedRealtimeNanos*(elapsedRealtimeNanos: jlong): Builder
  proc setDistanceMeasurement*(distanceMeasurement: DistanceMeasurement): Builder
  proc setAngleOfArrivalMeasurement*(angleOfArrivalMeasurement: AngleOfArrivalMeasurement): Builder
  proc setDestinationAngleOfArrivalMeasurement*(angleOfArrivalMeasurement: AngleOfArrivalMeasurement): Builder
  proc setLineOfSight*(lineOfSight: jint): Builder
  proc setMeasurementFocus*(measurementFocus: jint): Builder
  proc setRssiDbm*(rssiDbm: jint): Builder
  proc setHusPrimarySessionId*(husPrimarySessionId: jlong): Builder
  proc setRangingMeasurementMetadata*(rangingMeasurementMetadata: PersistableBundle): Builder
  proc build*(): RangingMeasurement

jclass android.uwb.Builder* of JVMObject:
  proc setRemoteDeviceAddress*(remoteDeviceAddress: UwbAddress): Builder
  proc setStatus*(status: jint): Builder
  proc setElapsedRealtimeNanos*(elapsedRealtimeNanos: jlong): Builder
  proc setDistanceMeasurement*(distanceMeasurement: DistanceMeasurement): Builder
  proc setAngleOfArrivalMeasurement*(angleOfArrivalMeasurement: AngleOfArrivalMeasurement): Builder
  proc setDestinationAngleOfArrivalMeasurement*(angleOfArrivalMeasurement: AngleOfArrivalMeasurement): Builder
  proc setLineOfSight*(lineOfSight: jint): Builder
  proc setMeasurementFocus*(measurementFocus: jint): Builder
  proc setRssiDbm*(rssiDbm: jint): Builder
  proc setHusPrimarySessionId*(husPrimarySessionId: jlong): Builder
  proc setRangingMeasurementMetadata*(rangingMeasurementMetadata: PersistableBundle): Builder
  proc build*(): RangingMeasurement

