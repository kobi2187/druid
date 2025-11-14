import jnim

jclass android.content.ComponentCallbacksController* of JVMObject:
  proc registerCallbacks*(callbacks: ComponentCallbacks)
  proc unregisterCallbacks*(callbacks: ComponentCallbacks)
  proc clearCallbacks*()
  proc dispatchConfigurationChanged*(newConfig: Configuration)
  proc dispatchLowMemory*()
  proc dispatchTrimMemory*(level: jint)

