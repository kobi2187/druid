import jnim

jclass android.telecom.CallDiagnostics* of JVMObject:
  proc setListener*(listener: Listener)
  proc setCallId*(callId: string)
  proc getCallId*(): string
  proc onCallDetailsChanged*(details: android.telecom.Call.Details)
  proc onReceiveDeviceToDeviceMessage*(message: jint, value: jint)
  proc sendDeviceToDeviceMessage*(message: jint, value: jint)
  proc onCallDisconnected*(disconnectCause: jint, preciseDisconnectCause: jint): CharSequence
  proc onCallDisconnected*(disconnectReason: ImsReasonInfo): CharSequence
  proc onCallQualityReceived*(callQuality: CallQuality)
  proc displayDiagnosticMessage*(messageId: jint, message: CharSequence)
  proc clearDiagnosticMessage*(messageId: jint)
  proc handleCallUpdated*(newDetails: Call.Details)
  MESSAGE_CALL_NETWORK_TYPE*: jint {.`static`.}
  MESSAGE_CALL_AUDIO_CODEC*: jint {.`static`.}
  MESSAGE_DEVICE_BATTERY_STATE*: jint {.`static`.}
  MESSAGE_DEVICE_NETWORK_COVERAGE*: jint {.`static`.}
  BATTERY_STATE_LOW*: jint {.`static`.}
  BATTERY_STATE_GOOD*: jint {.`static`.}
  BATTERY_STATE_CHARGING*: jint {.`static`.}
  COVERAGE_POOR*: jint {.`static`.}
  COVERAGE_GOOD*: jint {.`static`.}

