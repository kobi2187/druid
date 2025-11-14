import jnim

jclass android.view.InputFilter* of Stub:
  proc install*(host: IInputFilterHost)
  proc uninstall*()
  proc filterInputEvent*(event: InputEvent, policyFlags: jint)
  proc sendInputEvent*(event: InputEvent, policyFlags: jint)
  proc onInputEvent*(event: InputEvent, policyFlags: jint)
  proc onInstalled*()
  proc onUninstalled*()

