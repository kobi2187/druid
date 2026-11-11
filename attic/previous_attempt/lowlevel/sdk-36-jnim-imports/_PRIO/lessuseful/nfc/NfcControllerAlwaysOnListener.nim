import jnim

jclass android.nfc.NfcControllerAlwaysOnListener* of Stub:
  proc register*(executor: Executor, listener: ControllerAlwaysOnListener)
  proc unregister*(listener: ControllerAlwaysOnListener)
  proc onControllerAlwaysOnChanged*(isEnabled: jboolean)

