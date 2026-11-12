import jnim

jclass android.ranging.RangingSession* of JVMObject:
  proc start*(rangingPreference: RangingPreference): CancellationSignal
  proc addDeviceToRangingSession*(deviceRangingParams: RangingConfig)
  proc removeDeviceFromRangingSession*(rangingDevice: RangingDevice)
  proc reconfigureRangingInterval*(intervalSkipCount: jint)
  proc stop*()
  proc onOpened*()
  proc onOpenFailed*(reason: jint)
  proc onStarted*(peer: RangingDevice, technology: jint)
  proc onResults*(peer: RangingDevice, data: RangingData)
  proc onStopped*(peer: RangingDevice, technology: jint)
  proc onClosed*(reason: jint)
  proc close*()
  proc toString*(): string

