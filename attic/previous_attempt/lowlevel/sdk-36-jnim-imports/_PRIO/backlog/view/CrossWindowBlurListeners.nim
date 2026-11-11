import jnim

jclass android.view.CrossWindowBlurListeners* of JVMObject:
  proc getInstance*(): CrossWindowBlurListeners {.`static`.}
  proc isCrossWindowBlurEnabled*(): jboolean
  proc addListener*(executor: Executor, listener: Consumer[Boolean])
  proc removeListener*(listener: Consumer[Boolean])
  CROSS_WINDOW_BLUR_SUPPORTED*: jboolean {.`static`.}

