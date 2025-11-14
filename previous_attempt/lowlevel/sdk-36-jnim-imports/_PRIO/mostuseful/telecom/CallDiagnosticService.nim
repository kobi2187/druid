import jnim

jclass android.telecom.CallDiagnosticService* of Service:
  proc onBind*(intent: Intent): IBinder
  proc getExecutor*(): Executor
  proc onInitializeCallDiagnostics*(call: android.telecom.Call.Details): CallDiagnostics
  proc onRemoveCallDiagnostics*(call: CallDiagnostics)
  proc onCallAudioStateChanged*(audioState: CallAudioState)
  proc onBluetoothCallQualityReportReceived*(qualityReport: BluetoothCallQualityReport)
  SERVICE_INTERFACE*: string {.`static`.}

