import jnim

jclass android.window.WindowProviderService* of Service:
  proc isWindowProviderService*(windowContextOptions: Bundle): jboolean {.`static`.}
  proc getWindowType*(): jint
  proc getWindowContextOptions*(): Bundle
  proc registerComponentCallbacks*(callback: ComponentCallbacks)
  proc unregisterComponentCallbacks*(callback: ComponentCallbacks)
  proc onConfigurationChanged*(configuration: Configuration)
  proc onLowMemory*()
  proc onTrimMemory*(level: jint)
  proc getInitialDisplayId*(): jint
  proc attachToWindowToken*(windowToken: IBinder)
  proc createServiceBaseContext*(mainThread: ActivityThread, packageInfo: LoadedApk): Context
  proc getSystemService*(name: string): JObject
  proc onDestroy*()
  proc dispatchConfigurationChanged*(configuration: Configuration)

