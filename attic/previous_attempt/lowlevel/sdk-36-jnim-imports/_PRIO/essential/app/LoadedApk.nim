import jnim

jclass android.app.LoadedApk* of JVMObject:
  proc getAppFactory*(): AppComponentFactory
  proc getPackageName*(): string
  proc getApplicationInfo*(): ApplicationInfo
  proc getTargetSdkVersion*(): jint
  proc isSecurityViolation*(): jboolean
  proc getCompatibilityInfo*(): CompatibilityInfo
  proc setCompatibilityInfo*(compatInfo: CompatibilityInfo)
  proc updateApplicationInfo*(aInfo: ApplicationInfo, oldPaths: List[string])
  proc makePaths*(activityThread: ActivityThread, aInfo: ApplicationInfo, outZipPaths: List[string]) {.`static`.}
  proc makePaths*(activityThread: ActivityThread, isBundledApp: jboolean, aInfo: ApplicationInfo, outZipPaths: List[string], outLibPaths: List[string]) {.`static`.}
  proc getClassLoader*(): ClassLoader
  proc getAppDir*(): string
  proc getLibDir*(): string
  proc getResDir*(): string
  proc getSplitAppDirs*(): seq[string]
  proc getSplitResDirs*(): seq[string]
  proc getOverlayDirs*(): seq[string]
  proc getOverlayPaths*(): seq[string]
  proc getDataDir*(): string
  proc getDataDirFile*(): File
  proc getDeviceProtectedDataDirFile*(): File
  proc getCredentialProtectedDataDirFile*(): File
  proc getAssets*(): AssetManager
  proc getResources*(): Resources
  proc makeApplication*(forceDefaultAppClass: jboolean, instrumentation: Instrumentation): Application
  proc makeApplicationInner*(forceDefaultAppClass: jboolean, instrumentation: Instrumentation): Application
  proc removeContextRegistrations*(context: Context, who: string, what: string)
  proc getReceiverDispatcher*(r: BroadcastReceiver, context: Context, handler: Handler, instrumentation: Instrumentation, registered: jboolean): IIntentReceiver
  proc forgetReceiverDispatcher*(context: Context, r: BroadcastReceiver): IIntentReceiver
  proc getServiceDispatcher*(c: ServiceConnection, context: Context, handler: Handler, flags: jlong): IServiceConnection
  proc getServiceDispatcher*(c: ServiceConnection, context: Context, executor: Executor, flags: jlong): IServiceConnection
  proc lookupServiceDispatcher*(c: ServiceConnection, context: Context): IServiceConnection
  proc forgetServiceDispatcher*(context: Context, c: ServiceConnection): IServiceConnection
  proc checkAndUpdateApkPaths*(expectedAppInfo: ApplicationInfo) {.`static`.}

