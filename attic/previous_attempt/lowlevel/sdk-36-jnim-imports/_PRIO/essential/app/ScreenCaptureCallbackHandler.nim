import jnim

jclass android.app.ScreenCaptureCallbackHandler* of JVMObject:
  proc registerScreenCaptureCallback*(executor: Executor, callback: Activity.ScreenCaptureCallback)
  proc unregisterScreenCaptureCallback*(callback: Activity.ScreenCaptureCallback)

