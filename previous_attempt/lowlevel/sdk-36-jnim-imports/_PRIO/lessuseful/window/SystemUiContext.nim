import jnim

jclass android.window.SystemUiContext* of ContextWrapper:
  proc registerComponentCallbacks*(callback: ComponentCallbacks)
  proc unregisterComponentCallbacks*(callback: ComponentCallbacks)
  proc dispatchConfigurationChanged*(newConfig: Configuration)
  proc shouldReportPrivateChanges*(): jboolean

