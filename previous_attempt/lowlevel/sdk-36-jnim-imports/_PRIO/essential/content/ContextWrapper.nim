import jnim

jclass android.content.ContextWrapper* of Context:
  proc getBaseContext*(): Context
  proc getAssets*(): AssetManager
  proc getResources*(): Resources
  proc getPackageManager*(): PackageManager
  proc getContentResolver*(): ContentResolver
  proc getMainLooper*(): Looper
  proc getMainExecutor*(): Executor
  proc getApplicationContext*(): Context
  proc setTheme*(resid: jint)
  proc getThemeResId*(): jint
  proc getTheme*(): Resources.Theme
  proc getClassLoader*(): ClassLoader
  proc getPackageName*(): string
  proc getBasePackageName*(): string
  proc getOpPackageName*(): string
  proc getAttributionTag*(): string
  proc getParams*(): ContextParams
  proc getApplicationInfo*(): ApplicationInfo
  proc getPackageResourcePath*(): string
  proc getPackageCodePath*(): string
  proc getSharedPreferences*(name: string, mode: jint): SharedPreferences
  proc getSharedPreferences*(file: File, mode: jint): SharedPreferences
  proc reloadSharedPreferences*()
  proc moveSharedPreferencesFrom*(sourceContext: Context, name: string): jboolean
  proc deleteSharedPreferences*(name: string): jboolean
  proc openFileInput*(name: string): FileInputStream
  proc openFileOutput*(name: string, mode: jint): FileOutputStream
  proc deleteFile*(name: string): jboolean
  proc getFileStreamPath*(name: string): File
  proc getSharedPreferencesPath*(name: string): File
  proc fileList*(): seq[string]
  proc getDataDir*(): File
  proc getFilesDir*(): File
  proc getCrateDir*(cratedId: string): File
  proc getNoBackupFilesDir*(): File
  proc getExternalFilesDir*(type: string): File
  proc getExternalFilesDirs*(type: string): seq[File]
  proc getObbDir*(): File
  proc getObbDirs*(): seq[File]
  proc getCacheDir*(): File
  proc getCodeCacheDir*(): File
  proc getExternalCacheDir*(): File
  proc getExternalCacheDirs*(): seq[File]
  proc getExternalMediaDirs*(): seq[File]
  proc getDir*(name: string, mode: jint): File
  proc getPreloadsFileCache*(): File
  proc openOrCreateDatabase*(name: string, mode: jint, factory: CursorFactory): SQLiteDatabase
  proc openOrCreateDatabase*(name: string, mode: jint, factory: CursorFactory, errorHandler: DatabaseErrorHandler): SQLiteDatabase
  proc moveDatabaseFrom*(sourceContext: Context, name: string): jboolean
  proc deleteDatabase*(name: string): jboolean
  proc getDatabasePath*(name: string): File
  proc databaseList*(): seq[string]
  proc getWallpaper*(): Drawable
  proc peekWallpaper*(): Drawable
  proc getWallpaperDesiredMinimumWidth*(): jint
  proc getWallpaperDesiredMinimumHeight*(): jint
  proc setWallpaper*(bitmap: Bitmap)
  proc setWallpaper*(data: InputStream)
  proc clearWallpaper*()
  proc startActivity*(intent: Intent)
  proc startActivityAsUser*(intent: Intent, user: UserHandle)
  proc startActivityForResult*(who: string, intent: Intent, requestCode: jint, options: Bundle)
  proc canStartActivityForResult*(): jboolean
  proc startActivity*(intent: Intent, options: Bundle)
  proc startActivityAsUser*(intent: Intent, options: Bundle, user: UserHandle)
  proc startActivities*(intents: seq[Intent])
  proc startActivities*(intents: seq[Intent], options: Bundle)
  proc startActivitiesAsUser*(intents: seq[Intent], options: Bundle, userHandle: UserHandle): jint
  proc startIntentSender*(intent: IntentSender, fillInIntent: Intent, flagsMask: jint, flagsValues: jint, extraFlags: jint)
  proc startIntentSender*(intent: IntentSender, fillInIntent: Intent, flagsMask: jint, flagsValues: jint, extraFlags: jint, options: Bundle)
  proc sendBroadcast*(intent: Intent)
  proc sendBroadcast*(intent: Intent, receiverPermission: string)
  proc sendBroadcastMultiplePermissions*(intent: Intent, receiverPermissions: seq[string])
  proc sendBroadcastMultiplePermissions*(intent: Intent, receiverPermissions: seq[string], excludedPermissions: seq[string], excludedPackages: seq[string], options: BroadcastOptions)
  proc sendBroadcastMultiplePermissions*(intent: Intent, receiverPermissions: seq[string], options: Bundle)
  proc sendBroadcastAsUserMultiplePermissions*(intent: Intent, user: UserHandle, receiverPermissions: seq[string])
  proc sendBroadcast*(intent: Intent, receiverPermission: string, options: Bundle)
  proc sendBroadcast*(intent: Intent, receiverPermission: string, appOp: jint)
  proc sendOrderedBroadcast*(intent: Intent, receiverPermission: string)
  proc sendOrderedBroadcast*(intent: Intent, receiverPermission: string, options: Bundle)
  proc sendOrderedBroadcast*(intent: Intent, receiverPermission: string, resultReceiver: BroadcastReceiver, scheduler: Handler, initialCode: jint, initialData: string, initialExtras: Bundle)
  proc sendOrderedBroadcast*(intent: Intent, receiverPermission: string, options: Bundle, resultReceiver: BroadcastReceiver, scheduler: Handler, initialCode: jint, initialData: string, initialExtras: Bundle)
  proc sendOrderedBroadcast*(intent: Intent, receiverPermission: string, appOp: jint, resultReceiver: BroadcastReceiver, scheduler: Handler, initialCode: jint, initialData: string, initialExtras: Bundle)
  proc sendBroadcastAsUser*(intent: Intent, user: UserHandle)
  proc sendBroadcastAsUser*(intent: Intent, user: UserHandle, receiverPermission: string)
  proc sendBroadcastAsUser*(intent: Intent, user: UserHandle, receiverPermission: string, options: Bundle)
  proc sendBroadcastAsUser*(intent: Intent, user: UserHandle, receiverPermission: string, appOp: jint)
  proc sendOrderedBroadcastAsUser*(intent: Intent, user: UserHandle, receiverPermission: string, resultReceiver: BroadcastReceiver, scheduler: Handler, initialCode: jint, initialData: string, initialExtras: Bundle)
  proc sendOrderedBroadcastAsUser*(intent: Intent, user: UserHandle, receiverPermission: string, appOp: jint, resultReceiver: BroadcastReceiver, scheduler: Handler, initialCode: jint, initialData: string, initialExtras: Bundle)
  proc sendOrderedBroadcastAsUser*(intent: Intent, user: UserHandle, receiverPermission: string, appOp: jint, options: Bundle, resultReceiver: BroadcastReceiver, scheduler: Handler, initialCode: jint, initialData: string, initialExtras: Bundle)
  proc sendOrderedBroadcastAsUserMultiplePermissions*(intent: Intent, user: UserHandle, receiverPermission: seq[string], appOp: jint, options: Bundle, resultReceiver: BroadcastReceiver, scheduler: Handler, initialCode: jint, initialData: string, initialExtras: Bundle)
  proc sendOrderedBroadcast*(intent: Intent, receiverPermission: string, receiverAppOp: string, resultReceiver: BroadcastReceiver, scheduler: Handler, initialCode: jint, initialData: string, initialExtras: Bundle)
  proc sendOrderedBroadcastMultiplePermissions*(intent: Intent, receiverPermissions: seq[string], receiverAppOp: string, resultReceiver: BroadcastReceiver, scheduler: Handler, initialCode: jint, initialData: string, initialExtras: Bundle, options: Bundle)
  proc sendOrderedBroadcast*(intent: Intent, initialCode: jint, receiverPermission: string, receiverAppOp: string, resultReceiver: BroadcastReceiver, scheduler: Handler, initialData: string, initialExtras: Bundle, options: Bundle)
  proc sendStickyBroadcast*(intent: Intent)
  proc sendStickyBroadcast*(intent: Intent, options: Bundle)
  proc sendStickyOrderedBroadcast*(intent: Intent, resultReceiver: BroadcastReceiver, scheduler: Handler, initialCode: jint, initialData: string, initialExtras: Bundle)
  proc removeStickyBroadcast*(intent: Intent)
  proc sendStickyBroadcastAsUser*(intent: Intent, user: UserHandle)
  proc sendStickyBroadcastAsUser*(intent: Intent, user: UserHandle, options: Bundle)
  proc sendStickyOrderedBroadcastAsUser*(intent: Intent, user: UserHandle, resultReceiver: BroadcastReceiver, scheduler: Handler, initialCode: jint, initialData: string, initialExtras: Bundle)
  proc removeStickyBroadcastAsUser*(intent: Intent, user: UserHandle)
  proc registerReceiver*(receiver: BroadcastReceiver, filter: IntentFilter): Intent
  proc registerReceiver*(receiver: BroadcastReceiver, filter: IntentFilter, flags: jint): Intent
  proc registerReceiver*(receiver: BroadcastReceiver, filter: IntentFilter, broadcastPermission: string, scheduler: Handler): Intent
  proc registerReceiver*(receiver: BroadcastReceiver, filter: IntentFilter, broadcastPermission: string, scheduler: Handler, flags: jint): Intent
  proc registerReceiverForAllUsers*(receiver: BroadcastReceiver, filter: IntentFilter, broadcastPermission: string, scheduler: Handler): Intent
  proc registerReceiverForAllUsers*(receiver: BroadcastReceiver, filter: IntentFilter, broadcastPermission: string, scheduler: Handler, flags: jint): Intent
  proc registerReceiverAsUser*(receiver: BroadcastReceiver, user: UserHandle, filter: IntentFilter, broadcastPermission: string, scheduler: Handler): Intent
  proc registerReceiverAsUser*(receiver: BroadcastReceiver, user: UserHandle, filter: IntentFilter, broadcastPermission: string, scheduler: Handler, flags: jint): Intent
  proc unregisterReceiver*(receiver: BroadcastReceiver)
  proc getRegisteredIntentFilters*(receiver: BroadcastReceiver): List[IntentFilter]
  proc startService*(service: Intent): ComponentName
  proc startForegroundService*(service: Intent): ComponentName
  proc stopService*(name: Intent): jboolean
  proc startServiceAsUser*(service: Intent, user: UserHandle): ComponentName
  proc startForegroundServiceAsUser*(service: Intent, user: UserHandle): ComponentName
  proc stopServiceAsUser*(name: Intent, user: UserHandle): jboolean
  proc bindService*(service: Intent, conn: ServiceConnection, flags: jint): jboolean
  proc bindService*(service: Intent, conn: ServiceConnection, flags: BindServiceFlags): jboolean
  proc bindService*(service: Intent, flags: jint, executor: Executor, conn: ServiceConnection): jboolean
  proc bindService*(service: Intent, flags: BindServiceFlags, executor: Executor, conn: ServiceConnection): jboolean
  proc bindIsolatedService*(service: Intent, flags: jint, instanceName: string, executor: Executor, conn: ServiceConnection): jboolean
  proc bindServiceAsUser*(service: Intent, conn: ServiceConnection, flags: jint, user: UserHandle): jboolean
  proc bindServiceAsUser*(service: Intent, conn: ServiceConnection, flags: BindServiceFlags, user: UserHandle): jboolean
  proc bindServiceAsUser*(service: Intent, conn: ServiceConnection, flags: jint, handler: Handler, user: UserHandle): jboolean
  proc bindServiceAsUser*(service: Intent, conn: ServiceConnection, flags: BindServiceFlags, handler: Handler, user: UserHandle): jboolean
  proc updateServiceGroup*(conn: ServiceConnection, group: jint, importance: jint)
  proc unbindService*(conn: ServiceConnection)
  proc startInstrumentation*(className: ComponentName, profileFile: string, arguments: Bundle): jboolean
  proc getSystemService*(name: string): JObject
  proc getSystemServiceName*(serviceClass: Class[?]): string
  proc checkPermission*(permission: string, pid: jint, uid: jint): jint
  proc checkPermission*(permission: string, pid: jint, uid: jint, callerToken: IBinder): jint
  proc checkCallingPermission*(permission: string): jint
  proc checkCallingOrSelfPermission*(permission: string): jint
  proc checkSelfPermission*(permission: string): jint
  proc enforcePermission*(permission: string, pid: jint, uid: jint, message: string)
  proc enforceCallingPermission*(permission: string, message: string)
  proc enforceCallingOrSelfPermission*(permission: string, message: string)
  proc getPermissionRequestState*(permission: string): jint
  proc grantUriPermission*(toPackage: string, uri: Uri, modeFlags: jint)
  proc revokeUriPermission*(uri: Uri, modeFlags: jint)
  proc revokeUriPermission*(targetPackage: string, uri: Uri, modeFlags: jint)
  proc checkUriPermission*(uri: Uri, pid: jint, uid: jint, modeFlags: jint): jint
  proc checkContentUriPermissionFull*(uri: Uri, pid: jint, uid: jint, modeFlags: jint): jint
  proc checkUriPermissions*(uris: List[Uri], pid: jint, uid: jint, modeFlags: jint): seq[jint]
  proc checkUriPermission*(uri: Uri, pid: jint, uid: jint, modeFlags: jint, callerToken: IBinder): jint
  proc checkCallingUriPermission*(uri: Uri, modeFlags: jint): jint
  proc checkCallingUriPermissions*(uris: List[Uri], modeFlags: jint): seq[jint]
  proc checkCallingOrSelfUriPermission*(uri: Uri, modeFlags: jint): jint
  proc checkCallingOrSelfUriPermissions*(uris: List[Uri], modeFlags: jint): seq[jint]
  proc checkUriPermission*(uri: Uri, readPermission: string, writePermission: string, pid: jint, uid: jint, modeFlags: jint): jint
  proc enforceUriPermission*(uri: Uri, pid: jint, uid: jint, modeFlags: jint, message: string)
  proc enforceCallingUriPermission*(uri: Uri, modeFlags: jint, message: string)
  proc enforceCallingOrSelfUriPermission*(uri: Uri, modeFlags: jint, message: string)
  proc enforceUriPermission*(uri: Uri, readPermission: string, writePermission: string, pid: jint, uid: jint, modeFlags: jint, message: string)
  proc revokeSelfPermissionsOnKill*(permissions: Collection[string])
  proc createPackageContext*(packageName: string, flags: jint): Context
  proc createPackageContextAsUser*(packageName: string, flags: jint, user: UserHandle): Context
  proc createContextAsUser*(user: UserHandle, flags: jint): Context
  proc createApplicationContext*(application: ApplicationInfo, flags: jint): Context
  proc createContextForSdkInSandbox*(sdkInfo: ApplicationInfo, flags: jint): Context
  proc createContextForSplit*(splitName: string): Context
  proc getUserId*(): jint
  proc getUser*(): UserHandle
  proc createConfigurationContext*(overrideConfiguration: Configuration): Context
  proc createDisplayContext*(display: Display): Context
  proc createDeviceContext*(deviceId: jint): Context
  proc createWindowContext*(type: jint, options: Bundle): Context
  proc createWindowContext*(display: Display, type: jint, options: Bundle): Context
  proc createContext*(contextParams: ContextParams): Context
  proc createAttributionContext*(attributionTag: string): Context
  proc getAttributionSource*(): AttributionSource
  proc isRestricted*(): jboolean
  proc getDisplayAdjustments*(displayId: jint): DisplayAdjustments
  proc getDisplay*(): Display
  proc getDisplayNoVerify*(): Display
  proc getDisplayId*(): jint
  proc getAssociatedDisplayId*(): jint
  proc updateDisplay*(displayId: jint)
  proc updateDeviceId*(deviceId: jint)
  proc getDeviceId*(): jint
  proc registerDeviceIdChangeListener*(executor: Executor, listener: IntConsumer)
  proc unregisterDeviceIdChangeListener*(listener: IntConsumer)
  proc createDeviceProtectedStorageContext*(): Context
  proc createCredentialProtectedStorageContext*(): Context
  proc createTokenContext*(token: IBinder, display: Display): Context
  proc isDeviceProtectedStorage*(): jboolean
  proc isCredentialProtectedStorage*(): jboolean
  proc canLoadUnsafeResources*(): jboolean
  proc getActivityToken*(): IBinder
  proc getWindowContextToken*(): IBinder
  proc getServiceDispatcher*(conn: ServiceConnection, handler: Handler, flags: jlong): IServiceConnection
  proc getIApplicationThread*(): IApplicationThread
  proc getProcessToken*(): IBinder
  proc getMainThreadHandler*(): Handler
  proc getNextAutofillId*(): jint
  proc getAutofillClient*(): AutofillClient
  proc setAutofillClient*(client: AutofillClient)
  proc getAutofillOptions*(): AutofillOptions
  proc setAutofillOptions*(options: AutofillOptions)
  proc getContentCaptureOptions*(): ContentCaptureOptions
  proc setContentCaptureOptions*(options: ContentCaptureOptions)
  proc isUiContext*(): jboolean
  proc isConfigurationContext*(): jboolean
  proc registerComponentCallbacks*(callback: ComponentCallbacks)
  proc unregisterComponentCallbacks*(callback: ComponentCallbacks)
  proc closeSystemDialogs*()
  mCallbacksRegisteredToSuper*: List[ComponentCallbacks]

