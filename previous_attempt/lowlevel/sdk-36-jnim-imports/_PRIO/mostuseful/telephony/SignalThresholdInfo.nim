import jnim

jclass android.telephony.SignalThresholdInfo* of JVMObject:
  proc getRadioAccessNetworkType*(): jint
  proc getSignalMeasurementType*(): jint
  proc getHysteresisMs*(): jint
  proc getHysteresisDb*(): jint
  proc isEnabled*(): jboolean
  proc getThresholds*(): seq[jint]
  proc getMinimumNumberOfThresholdsAllowed*(): jint {.`static`.}
  proc getMaximumNumberOfThresholdsAllowed*(): jint {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  SIGNAL_MEASUREMENT_TYPE_UNKNOWN*: jint {.`static`.}
  SIGNAL_MEASUREMENT_TYPE_RSSI*: jint {.`static`.}
  SIGNAL_MEASUREMENT_TYPE_RSCP*: jint {.`static`.}
  SIGNAL_MEASUREMENT_TYPE_RSRP*: jint {.`static`.}
  SIGNAL_MEASUREMENT_TYPE_RSRQ*: jint {.`static`.}
  SIGNAL_MEASUREMENT_TYPE_RSSNR*: jint {.`static`.}
  SIGNAL_MEASUREMENT_TYPE_SSRSRP*: jint {.`static`.}
  SIGNAL_MEASUREMENT_TYPE_SSRSRQ*: jint {.`static`.}
  SIGNAL_MEASUREMENT_TYPE_SSSINR*: jint {.`static`.}
  SIGNAL_MEASUREMENT_TYPE_ECNO*: jint {.`static`.}
  HYSTERESIS_MS_DISABLED*: jint {.`static`.}
  HYSTERESIS_DB_MINIMUM*: jint {.`static`.}
  SIGNAL_RSSI_MIN_VALUE*: jint {.`static`.}
  SIGNAL_RSSI_MAX_VALUE*: jint {.`static`.}
  SIGNAL_RSCP_MIN_VALUE*: jint {.`static`.}
  SIGNAL_RSCP_MAX_VALUE*: jint {.`static`.}
  SIGNAL_RSRP_MIN_VALUE*: jint {.`static`.}
  SIGNAL_RSRP_MAX_VALUE*: jint {.`static`.}
  SIGNAL_RSRQ_MIN_VALUE*: jint {.`static`.}
  SIGNAL_RSRQ_MAX_VALUE*: jint {.`static`.}
  SIGNAL_RSSNR_MIN_VALUE*: jint {.`static`.}
  SIGNAL_RSSNR_MAX_VALUE*: jint {.`static`.}
  SIGNAL_SSRSRP_MIN_VALUE*: jint {.`static`.}
  SIGNAL_SSRSRP_MAX_VALUE*: jint {.`static`.}
  SIGNAL_SSRSRQ_MIN_VALUE*: jint {.`static`.}
  SIGNAL_SSRSRQ_MAX_VALUE*: jint {.`static`.}
  SIGNAL_SSSINR_MIN_VALUE*: jint {.`static`.}
  SIGNAL_SSSINR_MAX_VALUE*: jint {.`static`.}
  SIGNAL_ECNO_MIN_VALUE*: jint {.`static`.}
  SIGNAL_ECNO_MAX_VALUE*: jint {.`static`.}
  MINIMUM_NUMBER_OF_THRESHOLDS_ALLOWED*: jint {.`static`.}
  MAXIMUM_NUMBER_OF_THRESHOLDS_ALLOWED*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[SignalThresholdInfo] {.`static`.}

jclass android.telephony.SignalThresholdInfo.Builder* of JVMObject:
  proc setRadioAccessNetworkType*(ran: jint): Builder
  proc setSignalMeasurementType*(signalMeasurementType: jint): Builder
  proc setHysteresisMs*(hysteresisMs: jint): Builder
  proc setHysteresisDb*(hysteresisDb: jint): Builder
  proc setThresholds*(thresholds: seq[jint]): Builder
  proc setThresholds*(thresholds: seq[jint], isSystem: jboolean): Builder
  proc setIsEnabled*(isEnabled: jboolean): Builder
  proc build*(): SignalThresholdInfo

jclass android.telephony.Builder* of JVMObject:
  proc setRadioAccessNetworkType*(ran: jint): Builder
  proc setSignalMeasurementType*(signalMeasurementType: jint): Builder
  proc setHysteresisMs*(hysteresisMs: jint): Builder
  proc setHysteresisDb*(hysteresisDb: jint): Builder
  proc setThresholds*(thresholds: seq[jint]): Builder
  proc setThresholds*(thresholds: seq[jint], isSystem: jboolean): Builder
  proc setIsEnabled*(isEnabled: jboolean): Builder
  proc build*(): SignalThresholdInfo

