import jnim

jclass android.app.Application* of ContextWrapper:
  proc onCreate*()
  proc onTerminate*()
  proc onConfigurationChanged*(newConfig: Configuration)
  proc onLowMemory*()
  proc onTrimMemory*(level: jint)
  proc registerComponentCallbacks*(callback: ComponentCallbacks)
  proc unregisterComponentCallbacks*(callback: ComponentCallbacks)
  proc registerActivityLifecycleCallbacks*(callback: ActivityLifecycleCallbacks)
  proc unregisterActivityLifecycleCallbacks*(callback: ActivityLifecycleCallbacks)
  proc registerOnProvideAssistDataListener*(callback: OnProvideAssistDataListener)
  proc unregisterOnProvideAssistDataListener*(callback: OnProvideAssistDataListener)
  proc getProcessName*(): string {.`static`.}
  proc getAutofillClient*(): AutofillManager.AutofillClient
  mLoadedApk*: LoadedApk

jclass android.app.Application.OnProvideAssistDataListener* of JVMObject:
  proc onProvideAssistData*(activity: Activity, data: Bundle)


jclass android.app.OnProvideAssistDataListener* of JVMObject:
  proc onProvideAssistData*(activity: Activity, data: Bundle)

