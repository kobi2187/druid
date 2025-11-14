import jnim

jclass android.app.DreamManager* of JVMObject:
  proc isScreensaverEnabled*(): jboolean
  proc setScreensaverEnabled*(enabled: jboolean)
  proc areDreamsSupported*(): jboolean
  proc startDream*()
  proc stopDream*()
  proc setActiveDream*(dreamComponent: ComponentName)
  proc setSystemDreamComponent*(dreamComponent: ComponentName)
  proc setDreamOverlay*(dreamOverlayComponent: ComponentName)
  proc canStartDreaming*(isScreenOn: jboolean): jboolean
  proc isDreaming*(): jboolean
  proc setDreamIsObscured*(isObscured: jboolean)
  proc setDevicePostured*(isPostured: jboolean)

