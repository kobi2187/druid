import jnim

jclass android.telephony.ThermalMitigationRequest* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  proc getThermalMitigationAction*(): jint
  proc getDataThrottlingRequest*(): DataThrottlingRequest
  THERMAL_MITIGATION_ACTION_DATA_THROTTLING*: jint {.`static`.}
  THERMAL_MITIGATION_ACTION_VOICE_ONLY*: jint {.`static`.}
  THERMAL_MITIGATION_ACTION_RADIO_OFF*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[ThermalMitigationRequest] {.`static`.}

jclass android.telephony.ThermalMitigationRequest.Builder* of JVMObject:
  proc setThermalMitigationAction*(thermalMitigationAction: jint): Builder
  proc setDataThrottlingRequest*(dataThrottlingRequest: DataThrottlingRequest): Builder
  proc build*(): ThermalMitigationRequest

jclass android.telephony.Builder* of JVMObject:
  proc setThermalMitigationAction*(thermalMitigationAction: jint): Builder
  proc setDataThrottlingRequest*(dataThrottlingRequest: DataThrottlingRequest): Builder
  proc build*(): ThermalMitigationRequest

