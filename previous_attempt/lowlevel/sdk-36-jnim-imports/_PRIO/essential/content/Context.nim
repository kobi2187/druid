import jnim

jclass android.content.Context* of JVMObject:
  proc getAssets*(): AssetManager
  proc getResources*(): Resources
  proc getPackageManager*(): PackageManager
  proc getContentResolver*(): ContentResolver
  proc getMainLooper*(): Looper
  proc getMainExecutor*(): Executor
  proc getApplicationContext*(): Context
  proc getNextAutofillId*(): jint
  proc registerComponentCallbacks*(callback: ComponentCallbacks)
  proc unregisterComponentCallbacks*(callback: ComponentCallbacks)
  proc getText*(resId: jint): CharSequence
  proc getString*(resId: jint): string
  proc getString*(resId: jint, formatArgs: JObject): string
  proc getColor*(id: jint): jint
  proc getDrawable*(id: jint): Drawable
  proc getColorStateList*(id: jint): ColorStateList
  proc setTheme*(resid: jint)
  proc getThemeResId*(): jint
  proc getTheme*(): Resources.Theme
  proc obtainStyledAttributes*(attrs: seq[jint]): TypedArray
  proc obtainStyledAttributes*(resid: jint, attrs: seq[jint]): TypedArray
  proc obtainStyledAttributes*(set: AttributeSet, attrs: seq[jint]): TypedArray
  proc obtainStyledAttributes*(set: AttributeSet, attrs: seq[jint], defStyleAttr: jint, defStyleRes: jint): TypedArray
  proc getClassLoader*(): ClassLoader
  proc getPackageName*(): string
  proc getBasePackageName*(): string
  proc getOpPackageName*(): string
  proc getAttributionTag*(): string
  proc getAttributionSource*(): AttributionSource
  proc getFeatureId*(): string
  proc getParams*(): ContextParams
  proc getApplicationInfo*(): ApplicationInfo
  proc getPackageResourcePath*(): string
  proc getPackageCodePath*(): string
  proc getSharedPrefsFile*(name: string): File
  proc getSharedPreferences*(name: string, mode: jint): SharedPreferences
  proc getSharedPreferences*(file: File, mode: jint): SharedPreferences
  proc moveSharedPreferencesFrom*(sourceContext: Context, name: string): jboolean
  proc deleteSharedPreferences*(name: string): jboolean
  proc reloadSharedPreferences*()
  proc openFileInput*(name: string): FileInputStream
  proc openFileOutput*(name: string, mode: jint): FileOutputStream
  proc deleteFile*(name: string): jboolean
  proc getFileStreamPath*(name: string): File
  proc getSharedPreferencesPath*(name: string): File
  proc getDataDir*(): File
  proc getFilesDir*(): File
  proc getCrateDir*(crateId: string): File
  proc getNoBackupFilesDir*(): File
  proc getExternalFilesDir*(type: string): File
  proc getExternalFilesDirs*(type: string): seq[File]
  proc getObbDir*(): File
  proc getObbDirs*(): seq[File]
  proc getCacheDir*(): File
  proc getCodeCacheDir*(): File
  proc getExternalCacheDir*(): File
  proc getPreloadsFileCache*(): File
  proc getExternalCacheDirs*(): seq[File]
  proc getExternalMediaDirs*(): seq[File]
  proc fileList*(): seq[string]
  proc getDir*(name: string, mode: jint): File
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
  proc startActivity*(intent: Intent, options: Bundle)
  proc startActivityAsUser*(intent: Intent, options: Bundle, userId: UserHandle)
  proc startActivityForResult*(who: string, intent: Intent, requestCode: jint, options: Bundle)
  proc canStartActivityForResult*(): jboolean
  proc startActivities*(intents: seq[Intent])
  proc startActivities*(intents: seq[Intent], options: Bundle)
  proc startActivitiesAsUser*(intents: seq[Intent], options: Bundle, userHandle: UserHandle): jint
  proc startIntentSender*(intent: IntentSender, fillInIntent: Intent, flagsMask: jint, flagsValues: jint, extraFlags: jint)
  proc startIntentSender*(intent: IntentSender, fillInIntent: Intent, flagsMask: jint, flagsValues: jint, extraFlags: jint, options: Bundle)
  proc sendBroadcast*(intent: Intent)
  proc sendBroadcast*(intent: Intent, receiverPermission: string)
  proc sendBroadcastMultiplePermissions*(intent: Intent, receiverPermissions: seq[string])
  proc sendBroadcastMultiplePermissions*(intent: Intent, receiverPermissions: seq[string], excludedPermissions: seq[string])
  proc sendBroadcastMultiplePermissions*(intent: Intent, receiverPermissions: seq[string], excludedPermissions: seq[string], excludedPackages: seq[string])
  proc sendBroadcastMultiplePermissions*(intent: Intent, receiverPermissions: seq[string], excludedPermissions: seq[string], excludedPackages: seq[string], options: BroadcastOptions)
  proc sendBroadcastMultiplePermissions*(intent: Intent, receiverPermissions: seq[string], options: Bundle)
  proc sendBroadcastMultiplePermissions*(intent: Intent, receiverPermissions: seq[string], options: BroadcastOptions)
  proc sendBroadcastWithMultiplePermissions*(intent: Intent, receiverPermissions: seq[string])
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
  proc sendOrderedBroadcastAsUserMultiplePermissions*(intent: Intent, user: UserHandle, receiverPermissions: seq[string], appOp: jint, options: Bundle, resultReceiver: BroadcastReceiver, scheduler: Handler, initialCode: jint, initialData: string, initialExtras: Bundle)
  proc sendOrderedBroadcast*(intent: Intent, receiverPermission: string, receiverAppOp: string, resultReceiver: BroadcastReceiver, scheduler: Handler, initialCode: jint, initialData: string, initialExtras: Bundle)
  proc sendOrderedBroadcast*(intent: Intent, initialCode: jint, receiverPermission: string, receiverAppOp: string, resultReceiver: BroadcastReceiver, scheduler: Handler, initialData: string, initialExtras: Bundle, options: Bundle)
  proc sendOrderedBroadcastMultiplePermissions*(intent: Intent, receiverPermissions: seq[string], receiverAppOp: string, resultReceiver: BroadcastReceiver, scheduler: Handler, initialCode: jint, initialData: string, initialExtras: Bundle, options: Bundle)
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
  proc startForegroundServiceAsUser*(service: Intent, user: UserHandle): ComponentName
  proc stopService*(service: Intent): jboolean
  proc startServiceAsUser*(service: Intent, user: UserHandle): ComponentName
  proc stopServiceAsUser*(service: Intent, user: UserHandle): jboolean
  proc bindService*(service: Intent, conn: ServiceConnection, flags: jint): jboolean
  proc bindService*(service: Intent, conn: ServiceConnection, flags: BindServiceFlags): jboolean
  proc bindService*(service: Intent, flags: jint, executor: Executor, conn: ServiceConnection): jboolean
  proc bindService*(service: Intent, flags: BindServiceFlags, executor: Executor, conn: ServiceConnection): jboolean
  proc bindIsolatedService*(service: Intent, flags: jint, instanceName: string, executor: Executor, conn: ServiceConnection): jboolean
  proc bindIsolatedService*(service: Intent, flags: BindServiceFlags, instanceName: string, executor: Executor, conn: ServiceConnection): jboolean
  proc bindServiceAsUser*(service: Intent, conn: ServiceConnection, flags: jint, user: UserHandle): jboolean
  proc bindServiceAsUser*(service: Intent, conn: ServiceConnection, flags: BindServiceFlags, user: UserHandle): jboolean
  proc bindServiceAsUser*(service: Intent, conn: ServiceConnection, flags: jint, handler: Handler, user: UserHandle): jboolean
  proc bindServiceAsUser*(service: Intent, conn: ServiceConnection, flags: BindServiceFlags, handler: Handler, user: UserHandle): jboolean
  proc updateServiceGroup*(conn: ServiceConnection, group: jint, importance: jint)
  proc unbindService*(conn: ServiceConnection)
  proc startInstrumentation*(className: ComponentName, profileFile: string, arguments: Bundle): jboolean
  proc getSystemService*(name: string): JObject
  proc getSystemService*(serviceClass: Class[T]): T
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
  proc revokeUriPermission*(toPackage: string, uri: Uri, modeFlags: jint)
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
  proc revokeSelfPermissionOnKill*(permName: string)
  proc revokeSelfPermissionsOnKill*(permissions: Collection[string])
  proc createPackageContext*(packageName: string, flags: jint): Context
  proc createPackageContextAsUser*(packageName: string, flags: jint, user: UserHandle): Context
  proc createContextAsUser*(user: UserHandle, flags: jint): Context
  proc createApplicationContext*(application: ApplicationInfo, flags: jint): Context
  proc createContextForSdkInSandbox*(sdkInfo: ApplicationInfo, flags: jint): Context
  proc createContextForSplit*(splitName: string): Context
  proc getUser*(): UserHandle
  proc getUserId*(): jint
  proc createConfigurationContext*(overrideConfiguration: Configuration): Context
  proc createDisplayContext*(display: Display): Context
  proc createDeviceContext*(deviceId: jint): Context
  proc createWindowContext*(type: jint, options: Bundle): Context
  proc createWindowContext*(display: Display, type: jint, options: Bundle): Context
  proc createContext*(contextParams: ContextParams): Context
  proc createAttributionContext*(attributionTag: string): Context
  proc createFeatureContext*(attributionTag: string): Context
  proc createDeviceProtectedStorageContext*(): Context
  proc createCredentialProtectedStorageContext*(): Context
  proc createTokenContext*(token: IBinder, display: Display): Context
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
  proc isRestricted*(): jboolean
  proc isDeviceProtectedStorage*(): jboolean
  proc isCredentialProtectedStorage*(): jboolean
  proc canLoadUnsafeResources*(): jboolean
  proc getActivityToken*(): IBinder
  proc getWindowContextToken*(): IBinder
  proc getToken*(context: Context): IBinder {.`static`.}
  proc getServiceDispatcher*(conn: ServiceConnection, handler: Handler, flags: jlong): IServiceConnection
  proc getIApplicationThread*(): IApplicationThread
  proc getProcessToken*(): IBinder
  proc getMainThreadHandler*(): Handler
  proc getAutofillClient*(): AutofillClient
  proc setAutofillClient*(client: AutofillClient)
  proc getContentCaptureClient*(): ContentCaptureClient
  proc isAutofillCompatibilityEnabled*(): jboolean
  proc getAutofillOptions*(): AutofillOptions
  proc setAutofillOptions*(options: AutofillOptions)
  proc getContentCaptureOptions*(): ContentCaptureOptions
  proc setContentCaptureOptions*(options: ContentCaptureOptions)
  proc assertRuntimeOverlayThemable*()
  proc isUiContext*(): jboolean
  proc destroy*()
  proc isConfigurationContext*(): jboolean
  proc closeSystemDialogs*()
  OVERRIDABLE_COMPONENT_CALLBACKS*: jlong {.`static`.}
  DEVICE_ID_DEFAULT*: jint {.`static`.}
  DEVICE_ID_INVALID*: jint {.`static`.}
  MODE_PRIVATE*: jint {.`static`.}
  MODE_WORLD_READABLE*: jint {.`static`.}
  MODE_WORLD_WRITEABLE*: jint {.`static`.}
  MODE_APPEND*: jint {.`static`.}
  MODE_MULTI_PROCESS*: jint {.`static`.}
  MODE_ENABLE_WRITE_AHEAD_LOGGING*: jint {.`static`.}
  MODE_NO_LOCALIZED_COLLATORS*: jint {.`static`.}
  BIND_AUTO_CREATE*: jint {.`static`.}
  BIND_DEBUG_UNBIND*: jint {.`static`.}
  BIND_NOT_FOREGROUND*: jint {.`static`.}
  BIND_ABOVE_CLIENT*: jint {.`static`.}
  BIND_ALLOW_OOM_MANAGEMENT*: jint {.`static`.}
  BIND_WAIVE_PRIORITY*: jint {.`static`.}
  BIND_IMPORTANT*: jint {.`static`.}
  BIND_ADJUST_WITH_ACTIVITY*: jint {.`static`.}
  BIND_NOT_PERCEPTIBLE*: jint {.`static`.}
  BIND_ALLOW_ACTIVITY_STARTS*: jint {.`static`.}
  BIND_INCLUDE_CAPABILITIES*: jint {.`static`.}
  BIND_SHARED_ISOLATED_PROCESS*: jint {.`static`.}
  BIND_PACKAGE_ISOLATED_PROCESS*: jint {.`static`.}
  BIND_NOT_APP_COMPONENT_USAGE*: jint {.`static`.}
  BIND_ALMOST_PERCEPTIBLE*: jint {.`static`.}
  BIND_BYPASS_POWER_NETWORK_RESTRICTIONS*: jint {.`static`.}
  BIND_ALLOW_FOREGROUND_SERVICE_STARTS_FROM_BACKGROUND*: jint {.`static`.}
  BIND_SCHEDULE_LIKE_TOP_APP*: jint {.`static`.}
  BIND_ALLOW_BACKGROUND_ACTIVITY_STARTS*: jint {.`static`.}
  BIND_RESTRICT_ASSOCIATIONS*: jint {.`static`.}
  BIND_ALLOW_INSTANT*: jint {.`static`.}
  BIND_IMPORTANT_BACKGROUND*: jint {.`static`.}
  BIND_ALLOW_WHITELIST_MANAGEMENT*: jint {.`static`.}
  BIND_FOREGROUND_SERVICE_WHILE_AWAKE*: jint {.`static`.}
  BIND_FOREGROUND_SERVICE*: jint {.`static`.}
  BIND_TREAT_LIKE_ACTIVITY*: jint {.`static`.}
  BIND_VISIBLE*: jint {.`static`.}
  BIND_TREAT_LIKE_VISIBLE_FOREGROUND_SERVICE*: jint {.`static`.}
  BIND_SHOWING_UI*: jint {.`static`.}
  BIND_NOT_VISIBLE*: jint {.`static`.}
  BIND_EXTERNAL_SERVICE*: jint {.`static`.}
  BIND_EXTERNAL_SERVICE_LONG*: jlong {.`static`.}
  BIND_BYPASS_USER_NETWORK_RESTRICTIONS*: jlong {.`static`.}
  BIND_MATCH_QUARANTINED_COMPONENTS*: jlong {.`static`.}
  BIND_ALLOW_FREEZE*: jlong {.`static`.}
  BIND_REDUCTION_FLAGS*: jlong {.`static`.}
  RECEIVER_VISIBLE_TO_INSTANT_APPS*: jint {.`static`.}
  RECEIVER_EXPORTED*: jint {.`static`.}
  RECEIVER_EXPORTED_UNAUDITED*: jint {.`static`.}
  RECEIVER_NOT_EXPORTED*: jint {.`static`.}
  PERMISSION_REQUEST_STATE_GRANTED*: jint {.`static`.}
  PERMISSION_REQUEST_STATE_REQUESTABLE*: jint {.`static`.}
  PERMISSION_REQUEST_STATE_UNREQUESTABLE*: jint {.`static`.}
  POWER_SERVICE*: string {.`static`.}
  POWER_STATS_SERVICE*: string {.`static`.}
  RECOVERY_SERVICE*: string {.`static`.}
  SYSTEM_UPDATE_SERVICE*: string {.`static`.}
  WINDOW_SERVICE*: string {.`static`.}
  LAYOUT_INFLATER_SERVICE*: string {.`static`.}
  ACCOUNT_SERVICE*: string {.`static`.}
  ACTIVITY_SERVICE*: string {.`static`.}
  ACTIVITY_TASK_SERVICE*: string {.`static`.}
  URI_GRANTS_SERVICE*: string {.`static`.}
  ALARM_SERVICE*: string {.`static`.}
  NOTIFICATION_SERVICE*: string {.`static`.}
  ACCESSIBILITY_SERVICE*: string {.`static`.}
  CAPTIONING_SERVICE*: string {.`static`.}
  KEYGUARD_SERVICE*: string {.`static`.}
  LOCATION_SERVICE*: string {.`static`.}
  COUNTRY_DETECTOR*: string {.`static`.}
  SEARCH_SERVICE*: string {.`static`.}
  SENSOR_SERVICE*: string {.`static`.}
  SENSOR_PRIVACY_SERVICE*: string {.`static`.}
  KEYSTORE_SERVICE*: string {.`static`.}
  STORAGE_SERVICE*: string {.`static`.}
  STORAGE_STATS_SERVICE*: string {.`static`.}
  WALLPAPER_SERVICE*: string {.`static`.}
  VIBRATOR_MANAGER_SERVICE*: string {.`static`.}
  VIBRATOR_SERVICE*: string {.`static`.}
  STATUS_BAR_SERVICE*: string {.`static`.}
  CONNECTIVITY_SERVICE*: string {.`static`.}
  PAC_PROXY_SERVICE*: string {.`static`.}
  VCN_MANAGEMENT_SERVICE*: string {.`static`.}
  NETD_SERVICE*: string {.`static`.}
  NETWORK_STACK_SERVICE*: string {.`static`.}
  TETHERING_SERVICE*: string {.`static`.}
  THREAD_NETWORK_SERVICE*: string {.`static`.}
  IPSEC_SERVICE*: string {.`static`.}
  VPN_MANAGEMENT_SERVICE*: string {.`static`.}
  CONNECTIVITY_DIAGNOSTICS_SERVICE*: string {.`static`.}
  TEST_NETWORK_SERVICE*: string {.`static`.}
  UPDATE_LOCK_SERVICE*: string {.`static`.}
  NETWORKMANAGEMENT_SERVICE*: string {.`static`.}
  SLICE_SERVICE*: string {.`static`.}
  NETWORK_STATS_SERVICE*: string {.`static`.}
  NETWORK_POLICY_SERVICE*: string {.`static`.}
  NETWORK_WATCHLIST_SERVICE*: string {.`static`.}
  WIFI_SERVICE*: string {.`static`.}
  WIFI_NL80211_SERVICE*: string {.`static`.}
  WIFI_P2P_SERVICE*: string {.`static`.}
  WIFI_AWARE_SERVICE*: string {.`static`.}
  WIFI_SCANNING_SERVICE*: string {.`static`.}
  WIFI_RTT_SERVICE*: string {.`static`.}
  WIFI_RTT_RANGING_SERVICE*: string {.`static`.}
  WIFI_USD_SERVICE*: string {.`static`.}
  LOWPAN_SERVICE*: string {.`static`.}
  ETHERNET_SERVICE*: string {.`static`.}
  NSD_SERVICE*: string {.`static`.}
  AUDIO_SERVICE*: string {.`static`.}
  AUDIO_DEVICE_VOLUME_SERVICE*: string {.`static`.}
  MEDIA_TRANSCODING_SERVICE*: string {.`static`.}
  AUTH_SERVICE*: string {.`static`.}
  AUTHENTICATION_POLICY_SERVICE*: string {.`static`.}
  FINGERPRINT_SERVICE*: string {.`static`.}
  FACE_SERVICE*: string {.`static`.}
  IRIS_SERVICE*: string {.`static`.}
  BIOMETRIC_SERVICE*: string {.`static`.}
  MEDIA_COMMUNICATION_SERVICE*: string {.`static`.}
  MEDIA_ROUTER_SERVICE*: string {.`static`.}
  MEDIA_SESSION_SERVICE*: string {.`static`.}
  TELEPHONY_SERVICE*: string {.`static`.}
  TELEPHONY_SUBSCRIPTION_SERVICE*: string {.`static`.}
  TELECOM_SERVICE*: string {.`static`.}
  CARRIER_CONFIG_SERVICE*: string {.`static`.}
  EUICC_SERVICE*: string {.`static`.}
  EUICC_CARD_SERVICE*: string {.`static`.}
  MMS_SERVICE*: string {.`static`.}
  CLIPBOARD_SERVICE*: string {.`static`.}
  TEXT_CLASSIFICATION_SERVICE*: string {.`static`.}
  SELECTION_TOOLBAR_SERVICE*: string {.`static`.}
  FONT_SERVICE*: string {.`static`.}
  ATTENTION_SERVICE*: string {.`static`.}
  ROTATION_RESOLVER_SERVICE*: string {.`static`.}
  INPUT_METHOD_SERVICE*: string {.`static`.}
  TEXT_SERVICES_MANAGER_SERVICE*: string {.`static`.}
  APPWIDGET_SERVICE*: string {.`static`.}
  VOICE_INTERACTION_MANAGER_SERVICE*: string {.`static`.}
  AUTOFILL_MANAGER_SERVICE*: string {.`static`.}
  TEXT_TO_SPEECH_MANAGER_SERVICE*: string {.`static`.}
  CONTENT_CAPTURE_MANAGER_SERVICE*: string {.`static`.}
  TRANSLATION_MANAGER_SERVICE*: string {.`static`.}
  UI_TRANSLATION_SERVICE*: string {.`static`.}
  CONTENT_SUGGESTIONS_SERVICE*: string {.`static`.}
  APP_PREDICTION_SERVICE*: string {.`static`.}
  FEATURE_FLAGS_SERVICE*: string {.`static`.}
  SEARCH_UI_SERVICE*: string {.`static`.}
  SMARTSPACE_SERVICE*: string {.`static`.}
  CONTEXTUAL_SEARCH_SERVICE*: string {.`static`.}
  CLOUDSEARCH_SERVICE*: string {.`static`.}
  SOUND_TRIGGER_SERVICE*: string {.`static`.}
  SOUND_TRIGGER_MIDDLEWARE_SERVICE*: string {.`static`.}
  WALLPAPER_EFFECTS_GENERATION_SERVICE*: string {.`static`.}
  MUSIC_RECOGNITION_SERVICE*: string {.`static`.}
  PERMISSION_SERVICE*: string {.`static`.}
  LEGACY_PERMISSION_SERVICE*: string {.`static`.}
  PERMISSION_CONTROLLER_SERVICE*: string {.`static`.}
  PERMISSION_CHECKER_SERVICE*: string {.`static`.}
  PERMISSION_ENFORCER_SERVICE*: string {.`static`.}
  APP_HIBERNATION_SERVICE*: string {.`static`.}
  BACKUP_SERVICE*: string {.`static`.}
  ROLLBACK_SERVICE*: string {.`static`.}
  REBOOT_READINESS_SERVICE*: string {.`static`.}
  DROPBOX_SERVICE*: string {.`static`.}
  BACKGROUND_INSTALL_CONTROL_SERVICE*: string {.`static`.}
  BINARY_TRANSPARENCY_SERVICE*: string {.`static`.}
  INTRUSION_DETECTION_SERVICE*: string {.`static`.}
  DEVICE_IDLE_CONTROLLER*: string {.`static`.}
  POWER_WHITELIST_MANAGER*: string {.`static`.}
  POWER_EXEMPTION_SERVICE*: string {.`static`.}
  DEVICE_POLICY_SERVICE*: string {.`static`.}
  UI_MODE_SERVICE*: string {.`static`.}
  DOWNLOAD_SERVICE*: string {.`static`.}
  BATTERY_SERVICE*: string {.`static`.}
  NFC_SERVICE*: string {.`static`.}
  BLUETOOTH_SERVICE*: string {.`static`.}
  SIP_SERVICE*: string {.`static`.}
  USB_SERVICE*: string {.`static`.}
  ADB_SERVICE*: string {.`static`.}
  SERIAL_SERVICE*: string {.`static`.}
  HDMI_CONTROL_SERVICE*: string {.`static`.}
  INPUT_SERVICE*: string {.`static`.}
  DISPLAY_SERVICE*: string {.`static`.}
  COLOR_DISPLAY_SERVICE*: string {.`static`.}
  USER_SERVICE*: string {.`static`.}
  LAUNCHER_APPS_SERVICE*: string {.`static`.}
  RESTRICTIONS_SERVICE*: string {.`static`.}
  APP_OPS_SERVICE*: string {.`static`.}
  ROLE_SERVICE*: string {.`static`.}
  CAMERA_SERVICE*: string {.`static`.}
  PRINT_SERVICE*: string {.`static`.}
  COMPANION_DEVICE_SERVICE*: string {.`static`.}
  VIRTUAL_DEVICE_SERVICE*: string {.`static`.}
  CONSUMER_IR_SERVICE*: string {.`static`.}
  TRUST_SERVICE*: string {.`static`.}
  TV_INTERACTIVE_APP_SERVICE*: string {.`static`.}
  TV_INPUT_SERVICE*: string {.`static`.}
  TV_AD_SERVICE*: string {.`static`.}
  TV_TUNER_RESOURCE_MGR_SERVICE*: string {.`static`.}
  NETWORK_SCORE_SERVICE*: string {.`static`.}
  USAGE_STATS_SERVICE*: string {.`static`.}
  JOB_SCHEDULER_SERVICE*: string {.`static`.}
  PERSISTENT_DATA_BLOCK_SERVICE*: string {.`static`.}
  OEM_LOCK_SERVICE*: string {.`static`.}
  MEDIA_PROJECTION_SERVICE*: string {.`static`.}
  MIDI_SERVICE*: string {.`static`.}
  RADIO_SERVICE*: string {.`static`.}
  HARDWARE_PROPERTIES_SERVICE*: string {.`static`.}
  THERMAL_SERVICE*: string {.`static`.}
  PERFORMANCE_HINT_SERVICE*: string {.`static`.}
  SHORTCUT_SERVICE*: string {.`static`.}
  CONTEXTHUB_SERVICE*: string {.`static`.}
  SYSTEM_HEALTH_SERVICE*: string {.`static`.}
  GATEKEEPER_SERVICE*: string {.`static`.}
  DEVICE_IDENTIFIERS_SERVICE*: string {.`static`.}
  INCIDENT_SERVICE*: string {.`static`.}
  INCIDENT_COMPANION_SERVICE*: string {.`static`.}
  STATS_MANAGER_SERVICE*: string {.`static`.}
  STATS_COMPANION_SERVICE*: string {.`static`.}
  STATS_BOOTSTRAP_ATOM_SERVICE*: string {.`static`.}
  STATS_MANAGER*: string {.`static`.}
  PLATFORM_COMPAT_SERVICE*: string {.`static`.}
  PLATFORM_COMPAT_NATIVE_SERVICE*: string {.`static`.}
  BUGREPORT_SERVICE*: string {.`static`.}
  OVERLAY_SERVICE*: string {.`static`.}
  RESOURCES_SERVICE*: string {.`static`.}
  IDMAP_SERVICE*: string {.`static`.}
  VR_SERVICE*: string {.`static`.}
  CROSS_PROFILE_APPS_SERVICE*: string {.`static`.}
  SECURE_ELEMENT_SERVICE*: string {.`static`.}
  TIME_DETECTOR_SERVICE*: string {.`static`.}
  TIME_ZONE_DETECTOR_SERVICE*: string {.`static`.}
  TIME_MANAGER_SERVICE*: string {.`static`.}
  APP_BINDING_SERVICE*: string {.`static`.}
  TELEPHONY_IMS_SERVICE*: string {.`static`.}
  SYSTEM_CONFIG_SERVICE*: string {.`static`.}
  TELEPHONY_RCS_MESSAGE_SERVICE*: string {.`static`.}
  DYNAMIC_SYSTEM_SERVICE*: string {.`static`.}
  BLOB_STORE_SERVICE*: string {.`static`.}
  TELEPHONY_REGISTRY_SERVICE*: string {.`static`.}
  BATTERY_STATS_SERVICE*: string {.`static`.}
  APP_SEARCH_SERVICE*: string {.`static`.}
  APP_FUNCTION_SERVICE*: string {.`static`.}
  APP_INTEGRITY_SERVICE*: string {.`static`.}
  DATA_LOADER_MANAGER_SERVICE*: string {.`static`.}
  INCREMENTAL_SERVICE*: string {.`static`.}
  ATTESTATION_VERIFICATION_SERVICE*: string {.`static`.}
  ADVANCED_PROTECTION_SERVICE*: string {.`static`.}
  FILE_INTEGRITY_SERVICE*: string {.`static`.}
  REMOTE_PROVISIONING_SERVICE*: string {.`static`.}
  LIGHTS_SERVICE*: string {.`static`.}
  UWB_SERVICE*: string {.`static`.}
  RANGING_SERVICE*: string {.`static`.}
  DREAM_SERVICE*: string {.`static`.}
  SMS_SERVICE*: string {.`static`.}
  PEOPLE_SERVICE*: string {.`static`.}
  DEVICE_STATE_SERVICE*: string {.`static`.}
  MEDIA_METRICS_SERVICE*: string {.`static`.}
  SPEECH_RECOGNITION_SERVICE*: string {.`static`.}
  GAME_SERVICE*: string {.`static`.}
  DOMAIN_VERIFICATION_SERVICE*: string {.`static`.}
  DISPLAY_HASH_SERVICE*: string {.`static`.}
  LOCALE_SERVICE*: string {.`static`.}
  SAFETY_CENTER_SERVICE*: string {.`static`.}
  NEARBY_SERVICE*: string {.`static`.}
  REMOTE_AUTH_SERVICE*: string {.`static`.}
  AMBIENT_CONTEXT_SERVICE*: string {.`static`.}
  WEARABLE_SENSING_SERVICE*: string {.`static`.}
  ON_DEVICE_INTELLIGENCE_SERVICE*: string {.`static`.}
  HEALTHCONNECT_SERVICE*: string {.`static`.}
  CREDENTIAL_SERVICE*: string {.`static`.}
  DEVICE_LOCK_SERVICE*: string {.`static`.}
  VIRTUALIZATION_SERVICE*: string {.`static`.}
  GRAMMATICAL_INFLECTION_SERVICE*: string {.`static`.}
  SATELLITE_SERVICE*: string {.`static`.}
  SHARED_CONNECTIVITY_SERVICE*: string {.`static`.}
  SECURITY_STATE_SERVICE*: string {.`static`.}
  ECM_ENHANCED_CONFIRMATION_SERVICE*: string {.`static`.}
  SENSITIVE_CONTENT_PROTECTION_SERVICE*: string {.`static`.}
  CONTACT_KEYS_SERVICE*: string {.`static`.}
  PROFILING_SERVICE*: string {.`static`.}
  WEBVIEW_UPDATE_SERVICE*: string {.`static`.}
  BLOCKED_NUMBERS_SERVICE*: string {.`static`.}
  PROTOLOG_CONFIGURATION_SERVICE*: string {.`static`.}
  SUPERVISION_SERVICE*: string {.`static`.}
  MEDIA_QUALITY_SERVICE*: string {.`static`.}
  DYNAMIC_INSTRUMENTATION_SERVICE*: string {.`static`.}
  CONTEXT_INCLUDE_CODE*: jint {.`static`.}
  CONTEXT_IGNORE_SECURITY*: jint {.`static`.}
  CONTEXT_RESTRICTED*: jint {.`static`.}
  CONTEXT_DEVICE_PROTECTED_STORAGE*: jint {.`static`.}
  CONTEXT_CREDENTIAL_PROTECTED_STORAGE*: jint {.`static`.}
  CONTEXT_REGISTER_PACKAGE*: jint {.`static`.}

jclass android.content.Context.BindServiceFlags* of JVMObject:
  proc getValue*(): jlong
  proc of*(value: jlong): BindServiceFlags {.`static`.}

jclass android.content.BindServiceFlags* of JVMObject:
  proc getValue*(): jlong
  proc of*(value: jlong): BindServiceFlags {.`static`.}

