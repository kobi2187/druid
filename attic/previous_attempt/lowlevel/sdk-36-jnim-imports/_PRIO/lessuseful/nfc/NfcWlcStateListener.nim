import jnim

jclass android.nfc.NfcWlcStateListener* of Stub:
  proc register*(executor: Executor, listener: WlcStateListener)
  proc unregister*(listener: WlcStateListener)
  proc onWlcStateChanged*(wlcListenerDeviceInfo: WlcListenerDeviceInfo)

