import jnim

jclass android.window.WindowContext* of ContextWrapper:
  proc attachToDisplayArea*()
  proc reparentToDisplay*(displayId: jint)
  proc getSystemService*(name: string): JObject
  proc release*()
  proc destroy*()
  proc registerComponentCallbacks*(callback: ComponentCallbacks)
  proc unregisterComponentCallbacks*(callback: ComponentCallbacks)
  proc dispatchConfigurationChanged*(newConfig: Configuration)
  proc getWindowType*(): jint
  proc getWindowContextOptions*(): Bundle
  proc shouldReportPrivateChanges*(): jboolean

