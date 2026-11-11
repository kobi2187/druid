import jnim

jclass android.uwb.UwbOemExtensionCallbackListener* of Stub:
  proc register*(executor: Executor, callback: UwbManager.UwbOemExtensionCallback)
  proc unregister*(callback: UwbManager.UwbOemExtensionCallback)
  proc onSessionStatusNotificationReceived*(sessionStatusBundle: PersistableBundle)
  proc onDeviceStatusNotificationReceived*(deviceStateBundle: PersistableBundle)
  proc onSessionConfigurationReceived*(openSessionBundle: PersistableBundle): jint
  proc onRangingReportReceived*(rangingReport: RangingReport): RangingReport
  proc onCheckPointedTarget*(pointedTargetBundle: PersistableBundle): jboolean

