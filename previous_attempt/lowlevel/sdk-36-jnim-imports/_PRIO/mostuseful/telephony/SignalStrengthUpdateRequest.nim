import jnim

jclass android.telephony.SignalStrengthUpdateRequest* of JVMObject:
  proc getSignalThresholdInfos*(): Collection[SignalThresholdInfo]
  proc isReportingRequestedWhileIdle*(): jboolean
  proc isSystemThresholdReportingRequestedWhileIdle*(): jboolean
  proc getLiveToken*(): IBinder
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Parcelable.Creator[SignalStrengthUpdateRequest] {.`static`.}

jclass android.telephony.SignalStrengthUpdateRequest.Builder* of JVMObject:
  proc setSignalThresholdInfos*(signalThresholdInfos: Collection[SignalThresholdInfo]): Builder
  proc setReportingRequestedWhileIdle*(isReportingRequestedWhileIdle: jboolean): Builder
  proc setSystemThresholdReportingRequestedWhileIdle*(isSystemThresholdReportingRequestedWhileIdle: jboolean): Builder
  proc build*(): SignalStrengthUpdateRequest

jclass android.telephony.Builder* of JVMObject:
  proc setSignalThresholdInfos*(signalThresholdInfos: Collection[SignalThresholdInfo]): Builder
  proc setReportingRequestedWhileIdle*(isReportingRequestedWhileIdle: jboolean): Builder
  proc setSystemThresholdReportingRequestedWhileIdle*(isSystemThresholdReportingRequestedWhileIdle: jboolean): Builder
  proc build*(): SignalStrengthUpdateRequest

