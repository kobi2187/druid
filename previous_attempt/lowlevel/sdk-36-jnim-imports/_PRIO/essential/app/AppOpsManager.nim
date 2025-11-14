import jnim

jclass android.app.AppOpsManager* of JVMObject:
  proc resolveFirstUnrestrictedUidState*(op: jint): jint {.`static`.}
  proc resolveLastRestrictedUidState*(op: jint): jint {.`static`.}
  proc getUidStateName*(uidState: jint): string {.`static`.}
  proc getFlagName*(flag: jint): string {.`static`.}
  proc keyToString*(key: jlong): string {.`static`.}
  proc makeKey*(uidState: jint, flags: jint): jlong {.`static`.}
  proc extractUidStateFromKey*(key: jlong): jint {.`static`.}
  proc extractFlagsFromKey*(key: jlong): jint {.`static`.}
  proc flagsToString*(flags: jint): string {.`static`.}
  proc shouldForceCollectNoteForOp*(op: jint): jboolean {.`static`.}
  proc opToSwitch*(op: jint): jint {.`static`.}
  proc opToName*(op: jint): string {.`static`.}
  proc opToPublicName*(op: jint): string {.`static`.}
  proc isValidOp*(op: jint): jboolean {.`static`.}
  proc strDebugOpToOp*(op: string): jint {.`static`.}
  proc opToPermission*(op: jint): string {.`static`.}
  proc opToPermission*(op: string): string {.`static`.}
  proc opIsRuntimePermission*(op: jint): jboolean {.`static`.}
  proc opToRestriction*(op: jint): string {.`static`.}
  proc permissionToOpCode*(permission: string): jint {.`static`.}
  proc opAllowSystemBypassRestriction*(op: jint): RestrictionBypass {.`static`.}
  proc opToDefaultMode*(op: jint): jint {.`static`.}
  proc opToDefaultMode*(appOp: string): jint {.`static`.}
  proc modeToName*(mode: jint): string {.`static`.}
  proc opRestrictsRead*(op: jint): jboolean {.`static`.}
  proc opAllowsReset*(op: jint): jboolean {.`static`.}
  proc opIsPackageAppOpPermission*(op: jint): jboolean {.`static`.}
  proc opIsUidAppOpPermission*(op: jint): jboolean {.`static`.}
  proc toReceiverId*(obj: JObject): string {.`static`.}
  proc toReceiverId*(pendingIntent: PendingIntent): string {.`static`.}
  proc invalidateAppOpModeCache*() {.`static`.}
  proc disableAppOpModeCache*() {.`static`.}
  proc getPackagesForOps*(ops: seq[string]): List[AppOpsManager.PackageOps]
  proc getPackagesForOps*(ops: seq[string], persistentDeviceId: string): List[AppOpsManager.PackageOps]
  proc getPackagesForOps*(ops: seq[jint]): List[AppOpsManager.PackageOps]
  proc getOpsForPackage*(uid: jint, packageName: string, ops: seq[jint]): List[PackageOps]
  proc getOpsForPackage*(uid: jint, packageName: string, ops: string): List[AppOpsManager.PackageOps]
  proc getHistoricalOps*(request: HistoricalOpsRequest, executor: Executor, callback: Consumer[HistoricalOps])
  proc getHistoricalOpsFromDiskRaw*(request: HistoricalOpsRequest, executor: Executor, callback: Consumer[HistoricalOps])
  proc reloadNonHistoricalState*()
  proc setUidMode*(code: jint, uid: jint, mode: jint)
  proc setUidMode*(appOp: string, uid: jint, mode: jint)
  proc setUserRestriction*(code: jint, restricted: jboolean, token: IBinder)
  proc setUserRestriction*(code: jint, restricted: jboolean, token: IBinder, excludedPackageTags: PackageTagsList)
  proc setUserRestrictionForUser*(code: jint, restricted: jboolean, token: IBinder, excludedPackageTags: PackageTagsList, userId: jint)
  proc setMode*(code: jint, uid: jint, packageName: string, mode: jint)
  proc setMode*(op: string, uid: jint, packageName: string, mode: jint)
  proc setRestriction*(code: jint, usage: jint, mode: jint, exceptionPackages: seq[string])
  proc resetAllModes*()
  proc permissionToOp*(permission: string): string {.`static`.}
  proc resolvePackageName*(uid: jint, packageName: string): string {.`static`.}
  proc startWatchingMode*(op: string, packageName: string, callback: OnOpChangedListener)
  proc startWatchingMode*(op: string, packageName: string, flags: jint, callback: OnOpChangedListener)
  proc startWatchingMode*(op: jint, packageName: string, callback: OnOpChangedListener)
  proc startWatchingMode*(op: jint, packageName: string, flags: jint, callback: OnOpChangedListener)
  proc stopWatchingMode*(callback: OnOpChangedListener)
  proc startWatchingActive*(ops: seq[jint], callback: OnOpActiveChangedListener)
  proc startWatchingActive*(ops: seq[string], executor: Executor, callback: OnOpActiveChangedListener)
  proc stopWatchingActive*(callback: OnOpActiveChangedListener)
  proc startWatchingStarted*(ops: seq[jint], callback: OnOpStartedListener)
  proc stopWatchingStarted*(callback: OnOpStartedListener)
  proc startWatchingNoted*(ops: seq[string], listener: OnOpNotedListener)
  proc startWatchingNoted*(ops: seq[string], executor: Executor, listener: OnOpNotedListener)
  proc startWatchingNoted*(ops: seq[jint], listener: OnOpNotedListener)
  proc startWatchingNoted*(ops: seq[jint], executor: Executor, listener: OnOpNotedListener)
  proc stopWatchingNoted*(callback: OnOpNotedListener)
  proc strOpToOp*(op: string): jint {.`static`.}
  proc unsafeCheckOp*(op: string, uid: jint, packageName: string): jint
  proc checkOp*(op: string, uid: jint, packageName: string): jint
  proc unsafeCheckOpNoThrow*(op: string, uid: jint, packageName: string): jint
  proc checkOp*(op: string, uid: jint, packageName: string, attributionTag: string): jint
  proc checkOpNoThrow*(op: string, uid: jint, packageName: string, attributionTag: string): jint
  proc checkOpRawNoThrow*(op: string, uid: jint, packageName: string, attributionTag: string): jint
  proc checkOpNoThrow*(op: string, uid: jint, packageName: string): jint
  proc unsafeCheckOpRaw*(op: string, uid: jint, packageName: string): jint
  proc unsafeCheckOpRawNoThrow*(op: string, uid: jint, packageName: string): jint
  proc unsafeCheckOpRawNoThrow*(op: jint, attributionSource: AttributionSource): jint
  proc unsafeCheckOpRawNoThrow*(op: string, attributionSource: AttributionSource): jint
  proc unsafeCheckOpRawNoThrow*(op: jint, uid: jint, packageName: string): jint
  proc noteOp*(op: string, uid: jint, packageName: string): jint
  proc noteOp*(op: jint): jint
  proc noteOp*(op: jint, uid: jint, packageName: string): jint
  proc noteOp*(op: string, uid: jint, packageName: string, attributionTag: string, message: string): jint
  proc noteOp*(op: jint, uid: jint, packageName: string, attributionTag: string, message: string): jint
  proc noteOpNoThrow*(op: string, uid: jint, packageName: string): jint
  proc noteOpNoThrow*(op: jint, uid: jint, packageName: string): jint
  proc noteOpNoThrow*(op: string, uid: jint, packageName: string, attributionTag: string, message: string): jint
  proc noteOpNoThrow*(op: jint, attributionSource: AttributionSource, message: string): jint
  proc noteOpNoThrow*(op: jint, uid: jint, packageName: string, attributionTag: string, message: string): jint
  proc noteProxyOp*(op: string, proxiedPackageName: string): jint
  proc noteProxyOp*(op: jint, proxiedPackageName: string): jint
  proc noteProxyOp*(op: jint, proxiedPackageName: string, proxiedUid: jint, proxiedAttributionTag: string, message: string): jint
  proc noteProxyOp*(op: string, proxiedPackageName: string, proxiedUid: jint, proxiedAttributionTag: string, message: string): jint
  proc noteProxyOp*(op: jint, attributionSource: AttributionSource, message: string, skipProxyOperation: jboolean): jint
  proc noteProxyOpNoThrow*(op: string, proxiedPackageName: string): jint
  proc noteProxyOpNoThrow*(op: string, proxiedPackageName: string, proxiedUid: jint): jint
  proc noteProxyOpNoThrow*(op: string, proxiedPackageName: string, proxiedUid: jint, proxiedAttributionTag: string, message: string): jint
  proc noteProxyOpNoThrow*(op: jint, attributionSource: AttributionSource, message: string, skipProxyOperation: jboolean): jint
  proc checkOp*(op: jint, uid: jint, packageName: string): jint
  proc checkOpNoThrow*(op: jint, attributionSource: AttributionSource): jint
  proc checkOpNoThrow*(op: jint, uid: jint, packageName: string): jint
  proc checkPackage*(uid: jint, packageName: string)
  proc checkAudioOp*(op: jint, stream: jint, uid: jint, packageName: string): jint
  proc checkAudioOpNoThrow*(op: jint, stream: jint, uid: jint, packageName: string): jint
  proc getToken*(service: IAppOpsService): IBinder {.`static`.}
  proc getClientId*(): IBinder {.`static`.}
  proc startOp*(op: string, uid: jint, packageName: string): jint
  proc startOp*(op: jint): jint
  proc startOp*(op: jint, uid: jint, packageName: string): jint
  proc startOp*(op: jint, uid: jint, packageName: string, startIfModeDefault: jboolean): jint
  proc startOp*(op: string, uid: jint, packageName: string, attributionTag: string, message: string): jint
  proc startOp*(op: jint, uid: jint, packageName: string, startIfModeDefault: jboolean, attributionTag: string, message: string): jint
  proc startOpNoThrow*(op: string, uid: jint, packageName: string): jint
  proc startOpNoThrow*(op: jint, uid: jint, packageName: string): jint
  proc startOpNoThrow*(op: jint, uid: jint, packageName: string, startIfModeDefault: jboolean): jint
  proc startOpNoThrow*(op: string, uid: jint, packageName: string, attributionTag: string, message: string): jint
  proc startOpNoThrow*(op: jint, uid: jint, packageName: string, startIfModeDefault: jboolean, attributionTag: string, message: string): jint
  proc startOpNoThrow*(token: IBinder, op: jint, uid: jint, packageName: string, startIfModeDefault: jboolean, attributionTag: string, message: string): jint
  proc startOpNoThrow*(token: IBinder, op: jint, attributionSource: AttributionSource, startIfModeDefault: jboolean, message: string, attributionFlags: jint, attributionChainId: jint): jint
  proc startOpNoThrow*(token: IBinder, op: jint, uid: jint, packageName: string, startIfModeDefault: jboolean, attributionTag: string, message: string, attributionFlags: jint, attributionChainId: jint): jint
  proc startProxyOp*(op: string, proxiedUid: jint, proxiedPackageName: string, proxiedAttributionTag: string, message: string): jint
  proc startProxyOp*(op: string, attributionSource: AttributionSource, message: string, skipProxyOperation: jboolean): jint
  proc startProxyOpNoThrow*(op: string, proxiedUid: jint, proxiedPackageName: string, proxiedAttributionTag: string, message: string): jint
  proc startProxyOpNoThrow*(op: jint, attributionSource: AttributionSource, message: string, skipProxyOperation: jboolean): jint
  proc startProxyOpNoThrow*(clientId: IBinder, op: jint, attributionSource: AttributionSource, message: string, skipProxyOperation: jboolean, proxyAttributionFlags: jint, proxiedAttributionFlags: jint, attributionChainId: jint): jint
  proc finishOp*(op: jint)
  proc finishOp*(op: string, uid: jint, packageName: string)
  proc finishOp*(op: string, uid: jint, packageName: string, attributionTag: string)
  proc finishOp*(op: jint, uid: jint, packageName: string)
  proc finishOp*(op: jint, uid: jint, packageName: string, attributionTag: string)
  proc finishOp*(token: IBinder, op: jint, attributionSource: AttributionSource)
  proc finishOp*(token: IBinder, op: jint, uid: jint, packageName: string, attributionTag: string)
  proc finishProxyOp*(op: string, proxiedUid: jint, proxiedPackageName: string, proxiedAttributionTag: string)
  proc finishProxyOp*(clientId: IBinder, op: string, attributionSource: AttributionSource, skipProxyOperation: jboolean)
  proc isOpActive*(op: string, uid: jint, packageName: string): jboolean
  proc isProxying*(op: jint, proxyAttributionTag: string, proxiedUid: jint, proxiedPackageName: string): jboolean
  proc resetPackageOpsNoHistory*(packageName: string)
  proc startNotedAppOpsCollection*(callingUid: jint) {.`static`.}
  proc pauseNotedAppOpsCollection*(): PausedNotedAppOpsCollection {.`static`.}
  proc resumeNotedAppOpsCollection*(prevCollection: PausedNotedAppOpsCollection) {.`static`.}
  proc finishNotedAppOpsCollection*() {.`static`.}
  proc collectNotedOpSync*(syncOp: SyncNotedAppOp) {.`static`.}
  proc getPermissionGroupUsageForPrivacyIndicator*(includeMicrophoneUsage: jboolean): List[PermissionGroupUsage]
  proc prefixParcelWithAppOpsIfNeeded*(p: Parcel) {.`static`.}
  proc readAndLogNotedAppops*(p: Parcel) {.`static`.}
  proc setOnOpNotedCallback*(asyncExecutor: Executor, callback: OnOpNotedCallback)
  proc setOnOpNotedCallback*(asyncExecutor: Executor, callback: OnOpNotedCallback, flags: jint)
  proc setNotedAppOpsCollector*(collector: AppOpsCollector)
  proc isListeningForOpNoted*(): jboolean {.`static`.}
  proc isOperationActive*(code: jint, uid: jint, packageName: string): jboolean
  proc setHistoryParameters*(mode: jint, baseSnapshotInterval: jlong, compressionStep: jint)
  proc offsetHistory*(offsetMillis: jlong)
  proc addHistoricalOps*(ops: HistoricalOps)
  proc resetHistoryParameters*()
  proc clearHistory*()
  proc rebootHistory*(offlineDurationMillis: jlong)
  proc collectRuntimeAppOpAccessMessage*(): RuntimeAppOpAccessMessage
  proc getOpStrs*(): seq[string] {.`static`.}
  proc getNumOps*(): jint {.`static`.}
  proc uidStateToString*(uidState: jint): string {.`static`.}
  proc parseHistoricalMode*(mode: string): jint {.`static`.}
  proc historicalModeToString*(mode: jint): string {.`static`.}
  proc leftCircularDistance*(from: jint, to: jint, size: jint): jint {.`static`.}
  CALL_BACK_ON_CHANGED_LISTENER_WITH_SWITCHED_OP_CHANGE*: jlong {.`static`.}
  SECURITY_EXCEPTION_ON_INVALID_ATTRIBUTION_TAG_CHANGE*: jlong {.`static`.}
  KEY_TOP_STATE_SETTLE_TIME*: string {.`static`.}
  KEY_FG_SERVICE_STATE_SETTLE_TIME*: string {.`static`.}
  KEY_BG_STATE_SETTLE_TIME*: string {.`static`.}
  HISTORICAL_MODE_DISABLED*: jint {.`static`.}
  HISTORICAL_MODE_ENABLED_ACTIVE*: jint {.`static`.}
  HISTORICAL_MODE_ENABLED_PASSIVE*: jint {.`static`.}
  MODE_ALLOWED*: jint {.`static`.}
  MODE_IGNORED*: jint {.`static`.}
  MODE_ERRORED*: jint {.`static`.}
  MODE_DEFAULT*: jint {.`static`.}
  MODE_FOREGROUND*: jint {.`static`.}
  WATCH_FOREGROUND_CHANGES*: jint {.`static`.}
  CALL_BACK_ON_SWITCHED_OP*: jint {.`static`.}
  NOTE_OP_COLLECTION_ENABLED*: jboolean {.`static`.}
  MODE_NAMES*: string {.`static`.}
  UID_STATE_PERSISTENT*: jint {.`static`.}
  UID_STATE_TOP*: jint {.`static`.}
  UID_STATE_FOREGROUND_SERVICE_LOCATION*: jint {.`static`.}
  UID_STATE_FOREGROUND_SERVICE*: jint {.`static`.}
  UID_STATE_FOREGROUND*: jint {.`static`.}
  UID_STATE_MAX_LAST_NON_RESTRICTED*: jint {.`static`.}
  UID_STATE_BACKGROUND*: jint {.`static`.}
  UID_STATE_CACHED*: jint {.`static`.}
  MAX_PRIORITY_UID_STATE*: jint {.`static`.}
  MIN_PRIORITY_UID_STATE*: jint {.`static`.}
  UID_STATE_NONEXISTENT*: jint {.`static`.}
  UID_STATES*: jint {.`static`.}
  OP_FLAG_SELF*: jint {.`static`.}
  OP_FLAG_TRUSTED_PROXY*: jint {.`static`.}
  OP_FLAG_UNTRUSTED_PROXY*: jint {.`static`.}
  OP_FLAG_TRUSTED_PROXIED*: jint {.`static`.}
  OP_FLAG_UNTRUSTED_PROXIED*: jint {.`static`.}
  OP_FLAGS_ALL*: jint {.`static`.}
  OP_FLAGS_ALL_TRUSTED*: jint {.`static`.}
  ATTRIBUTION_FLAG_ACCESSOR*: jint {.`static`.}
  ATTRIBUTION_FLAG_INTERMEDIARY*: jint {.`static`.}
  ATTRIBUTION_FLAG_RECEIVER*: jint {.`static`.}
  ATTRIBUTION_FLAG_TRUSTED*: jint {.`static`.}
  ATTRIBUTION_FLAGS_NONE*: jint {.`static`.}
  ATTRIBUTION_CHAIN_ID_NONE*: jint {.`static`.}
  SAMPLING_STRATEGY_DEFAULT*: jint {.`static`.}
  SAMPLING_STRATEGY_UNIFORM*: jint {.`static`.}
  SAMPLING_STRATEGY_RARELY_USED*: jint {.`static`.}
  SAMPLING_STRATEGY_BOOT_TIME_SAMPLING*: jint {.`static`.}
  SAMPLING_STRATEGY_UNIFORM_OPS*: jint {.`static`.}
  OP_NONE*: jint {.`static`.}
  OP_COARSE_LOCATION*: jint {.`static`.}
  OP_FINE_LOCATION*: jint {.`static`.}
  OP_GPS*: jint {.`static`.}
  OP_VIBRATE*: jint {.`static`.}
  OP_READ_CONTACTS*: jint {.`static`.}
  OP_WRITE_CONTACTS*: jint {.`static`.}
  OP_READ_CALL_LOG*: jint {.`static`.}
  OP_WRITE_CALL_LOG*: jint {.`static`.}
  OP_READ_CALENDAR*: jint {.`static`.}
  OP_WRITE_CALENDAR*: jint {.`static`.}
  OP_WIFI_SCAN*: jint {.`static`.}
  OP_POST_NOTIFICATION*: jint {.`static`.}
  OP_NEIGHBORING_CELLS*: jint {.`static`.}
  OP_CALL_PHONE*: jint {.`static`.}
  OP_READ_SMS*: jint {.`static`.}
  OP_WRITE_SMS*: jint {.`static`.}
  OP_RECEIVE_SMS*: jint {.`static`.}
  OP_RECEIVE_EMERGECY_SMS*: jint {.`static`.}
  OP_RECEIVE_MMS*: jint {.`static`.}
  OP_RECEIVE_WAP_PUSH*: jint {.`static`.}
  OP_SEND_SMS*: jint {.`static`.}
  OP_MANAGE_ONGOING_CALLS*: jint {.`static`.}
  OP_READ_ICC_SMS*: jint {.`static`.}
  OP_WRITE_ICC_SMS*: jint {.`static`.}
  OP_WRITE_SETTINGS*: jint {.`static`.}
  OP_SYSTEM_ALERT_WINDOW*: jint {.`static`.}
  OP_ACCESS_NOTIFICATIONS*: jint {.`static`.}
  OP_CAMERA*: jint {.`static`.}
  OP_RECORD_AUDIO*: jint {.`static`.}
  OP_PLAY_AUDIO*: jint {.`static`.}
  OP_READ_CLIPBOARD*: jint {.`static`.}
  OP_WRITE_CLIPBOARD*: jint {.`static`.}
  OP_TAKE_MEDIA_BUTTONS*: jint {.`static`.}
  OP_TAKE_AUDIO_FOCUS*: jint {.`static`.}
  OP_AUDIO_MASTER_VOLUME*: jint {.`static`.}
  OP_AUDIO_VOICE_VOLUME*: jint {.`static`.}
  OP_AUDIO_RING_VOLUME*: jint {.`static`.}
  OP_AUDIO_MEDIA_VOLUME*: jint {.`static`.}
  OP_AUDIO_ALARM_VOLUME*: jint {.`static`.}
  OP_AUDIO_NOTIFICATION_VOLUME*: jint {.`static`.}
  OP_AUDIO_BLUETOOTH_VOLUME*: jint {.`static`.}
  OP_WAKE_LOCK*: jint {.`static`.}
  OP_MONITOR_LOCATION*: jint {.`static`.}
  OP_MONITOR_HIGH_POWER_LOCATION*: jint {.`static`.}
  OP_GET_USAGE_STATS*: jint {.`static`.}
  OP_MUTE_MICROPHONE*: jint {.`static`.}
  OP_TOAST_WINDOW*: jint {.`static`.}
  OP_PROJECT_MEDIA*: jint {.`static`.}
  OP_ACTIVATE_VPN*: jint {.`static`.}
  OP_WRITE_WALLPAPER*: jint {.`static`.}
  OP_ASSIST_STRUCTURE*: jint {.`static`.}
  OP_ASSIST_SCREENSHOT*: jint {.`static`.}
  OP_READ_PHONE_STATE*: jint {.`static`.}
  OP_ADD_VOICEMAIL*: jint {.`static`.}
  OP_USE_SIP*: jint {.`static`.}
  OP_PROCESS_OUTGOING_CALLS*: jint {.`static`.}
  OP_USE_FINGERPRINT*: jint {.`static`.}
  OP_BODY_SENSORS*: jint {.`static`.}
  OP_READ_CELL_BROADCASTS*: jint {.`static`.}
  OP_MOCK_LOCATION*: jint {.`static`.}
  OP_READ_EXTERNAL_STORAGE*: jint {.`static`.}
  OP_WRITE_EXTERNAL_STORAGE*: jint {.`static`.}
  OP_TURN_SCREEN_ON*: jint {.`static`.}
  OP_GET_ACCOUNTS*: jint {.`static`.}
  OP_RUN_IN_BACKGROUND*: jint {.`static`.}
  OP_AUDIO_ACCESSIBILITY_VOLUME*: jint {.`static`.}
  OP_READ_PHONE_NUMBERS*: jint {.`static`.}
  OP_REQUEST_INSTALL_PACKAGES*: jint {.`static`.}
  OP_PICTURE_IN_PICTURE*: jint {.`static`.}
  OP_INSTANT_APP_START_FOREGROUND*: jint {.`static`.}
  OP_ANSWER_PHONE_CALLS*: jint {.`static`.}
  OP_RUN_ANY_IN_BACKGROUND*: jint {.`static`.}
  OP_CHANGE_WIFI_STATE*: jint {.`static`.}
  OP_REQUEST_DELETE_PACKAGES*: jint {.`static`.}
  OP_BIND_ACCESSIBILITY_SERVICE*: jint {.`static`.}
  OP_ACCEPT_HANDOVER*: jint {.`static`.}
  OP_MANAGE_IPSEC_TUNNELS*: jint {.`static`.}
  OP_START_FOREGROUND*: jint {.`static`.}
  OP_BLUETOOTH_SCAN*: jint {.`static`.}
  OP_BLUETOOTH_CONNECT*: jint {.`static`.}
  OP_BLUETOOTH_ADVERTISE*: jint {.`static`.}
  OP_USE_BIOMETRIC*: jint {.`static`.}
  OP_ACTIVITY_RECOGNITION*: jint {.`static`.}
  OP_SMS_FINANCIAL_TRANSACTIONS*: jint {.`static`.}
  OP_READ_MEDIA_AUDIO*: jint {.`static`.}
  OP_WRITE_MEDIA_AUDIO*: jint {.`static`.}
  OP_READ_MEDIA_VIDEO*: jint {.`static`.}
  OP_WRITE_MEDIA_VIDEO*: jint {.`static`.}
  OP_READ_MEDIA_IMAGES*: jint {.`static`.}
  OP_WRITE_MEDIA_IMAGES*: jint {.`static`.}
  OP_LEGACY_STORAGE*: jint {.`static`.}
  OP_ACCESS_ACCESSIBILITY*: jint {.`static`.}
  OP_READ_DEVICE_IDENTIFIERS*: jint {.`static`.}
  OP_ACCESS_MEDIA_LOCATION*: jint {.`static`.}
  OP_QUERY_ALL_PACKAGES*: jint {.`static`.}
  OP_MANAGE_EXTERNAL_STORAGE*: jint {.`static`.}
  OP_INTERACT_ACROSS_PROFILES*: jint {.`static`.}
  OP_ACTIVATE_PLATFORM_VPN*: jint {.`static`.}
  OP_LOADER_USAGE_STATS*: jint {.`static`.}
  OP_AUTO_REVOKE_PERMISSIONS_IF_UNUSED*: jint {.`static`.}
  OP_AUTO_REVOKE_MANAGED_BY_INSTALLER*: jint {.`static`.}
  OP_NO_ISOLATED_STORAGE*: jint {.`static`.}
  OP_PHONE_CALL_MICROPHONE*: jint {.`static`.}
  OP_PHONE_CALL_CAMERA*: jint {.`static`.}
  OP_RECORD_AUDIO_HOTWORD*: jint {.`static`.}
  OP_MANAGE_CREDENTIALS*: jint {.`static`.}
  OP_USE_ICC_AUTH_WITH_DEVICE_IDENTIFIER*: jint {.`static`.}
  OP_RECORD_AUDIO_OUTPUT*: jint {.`static`.}
  OP_SCHEDULE_EXACT_ALARM*: jint {.`static`.}
  OP_FINE_LOCATION_SOURCE*: jint {.`static`.}
  OP_COARSE_LOCATION_SOURCE*: jint {.`static`.}
  OP_MANAGE_MEDIA*: jint {.`static`.}
  OP_UWB_RANGING*: jint {.`static`.}
  OP_NEARBY_WIFI_DEVICES*: jint {.`static`.}
  OP_ACTIVITY_RECOGNITION_SOURCE*: jint {.`static`.}
  OP_RECORD_INCOMING_PHONE_AUDIO*: jint {.`static`.}
  OP_ESTABLISH_VPN_SERVICE*: jint {.`static`.}
  OP_ESTABLISH_VPN_MANAGER*: jint {.`static`.}
  OP_ACCESS_RESTRICTED_SETTINGS*: jint {.`static`.}
  OP_RECEIVE_AMBIENT_TRIGGER_AUDIO*: jint {.`static`.}
  OP_RECEIVE_EXPLICIT_USER_INTERACTION_AUDIO*: jint {.`static`.}
  OP_RUN_USER_INITIATED_JOBS*: jint {.`static`.}
  OP_READ_MEDIA_VISUAL_USER_SELECTED*: jint {.`static`.}
  OP_SYSTEM_EXEMPT_FROM_SUSPENSION*: jint {.`static`.}
  OP_SYSTEM_EXEMPT_FROM_DISMISSIBLE_NOTIFICATIONS*: jint {.`static`.}
  OP_READ_WRITE_HEALTH_DATA*: jint {.`static`.}
  OP_FOREGROUND_SERVICE_SPECIAL_USE*: jint {.`static`.}
  OP_SYSTEM_EXEMPT_FROM_POWER_RESTRICTIONS*: jint {.`static`.}
  OP_SYSTEM_EXEMPT_FROM_HIBERNATION*: jint {.`static`.}
  OP_SYSTEM_EXEMPT_FROM_ACTIVITY_BG_START_RESTRICTION*: jint {.`static`.}
  OP_CAPTURE_CONSENTLESS_BUGREPORT_ON_USERDEBUG_BUILD*: jint {.`static`.}
  OP_USE_FULL_SCREEN_INTENT*: jint {.`static`.}
  OP_CAMERA_SANDBOXED*: jint {.`static`.}
  OP_RECORD_AUDIO_SANDBOXED*: jint {.`static`.}
  OP_RECEIVE_SANDBOX_TRIGGER_AUDIO*: jint {.`static`.}
  OP_CREATE_ACCESSIBILITY_OVERLAY*: jint {.`static`.}
  OP_ENABLE_MOBILE_DATA_BY_USER*: jint {.`static`.}
  OP_MEDIA_ROUTING_CONTROL*: jint {.`static`.}
  OP_RESERVED_FOR_TESTING*: jint {.`static`.}
  OP_RAPID_CLEAR_NOTIFICATIONS_BY_LISTENER*: jint {.`static`.}
  OP_READ_SYSTEM_GRAMMATICAL_GENDER*: jint {.`static`.}
  OP_ARCHIVE_ICON_OVERLAY*: jint {.`static`.}
  OP_UNARCHIVAL_CONFIRMATION*: jint {.`static`.}
  OP_EMERGENCY_LOCATION*: jint {.`static`.}
  OP_RECEIVE_SENSITIVE_NOTIFICATIONS*: jint {.`static`.}
  OP_READ_HEART_RATE*: jint {.`static`.}
  OP_READ_SKIN_TEMPERATURE*: jint {.`static`.}
  OP_RANGING*: jint {.`static`.}
  OP_READ_OXYGEN_SATURATION*: jint {.`static`.}
  OP_WRITE_SYSTEM_PREFERENCES*: jint {.`static`.}
  OP_CONTROL_AUDIO*: jint {.`static`.}
  OP_CONTROL_AUDIO_PARTIAL*: jint {.`static`.}
  OP_EYE_TRACKING_COARSE*: jint {.`static`.}
  OP_EYE_TRACKING_FINE*: jint {.`static`.}
  OP_FACE_TRACKING*: jint {.`static`.}
  OP_HAND_TRACKING*: jint {.`static`.}
  OP_HEAD_TRACKING*: jint {.`static`.}
  OP_SCENE_UNDERSTANDING_COARSE*: jint {.`static`.}
  OP_SCENE_UNDERSTANDING_FINE*: jint {.`static`.}
  _NUM_OP*: jint {.`static`.}
  OPSTR_COARSE_LOCATION*: string {.`static`.}
  OPSTR_FINE_LOCATION*: string {.`static`.}
  OPSTR_MONITOR_LOCATION*: string {.`static`.}
  OPSTR_MONITOR_HIGH_POWER_LOCATION*: string {.`static`.}
  OPSTR_GET_USAGE_STATS*: string {.`static`.}
  OPSTR_ACTIVATE_VPN*: string {.`static`.}
  OPSTR_READ_CONTACTS*: string {.`static`.}
  OPSTR_WRITE_CONTACTS*: string {.`static`.}
  OPSTR_READ_CALL_LOG*: string {.`static`.}
  OPSTR_WRITE_CALL_LOG*: string {.`static`.}
  OPSTR_READ_CALENDAR*: string {.`static`.}
  OPSTR_WRITE_CALENDAR*: string {.`static`.}
  OPSTR_CALL_PHONE*: string {.`static`.}
  OPSTR_READ_SMS*: string {.`static`.}
  OPSTR_RECEIVE_SMS*: string {.`static`.}
  OPSTR_RECEIVE_MMS*: string {.`static`.}
  OPSTR_RECEIVE_WAP_PUSH*: string {.`static`.}
  OPSTR_SEND_SMS*: string {.`static`.}
  OPSTR_CAMERA*: string {.`static`.}
  OPSTR_RECORD_AUDIO*: string {.`static`.}
  OPSTR_READ_PHONE_STATE*: string {.`static`.}
  OPSTR_ADD_VOICEMAIL*: string {.`static`.}
  OPSTR_USE_SIP*: string {.`static`.}
  OPSTR_PROCESS_OUTGOING_CALLS*: string {.`static`.}
  OPSTR_USE_FINGERPRINT*: string {.`static`.}
  OPSTR_BODY_SENSORS*: string {.`static`.}
  OPSTR_READ_CELL_BROADCASTS*: string {.`static`.}
  OPSTR_MOCK_LOCATION*: string {.`static`.}
  OPSTR_READ_EXTERNAL_STORAGE*: string {.`static`.}
  OPSTR_WRITE_EXTERNAL_STORAGE*: string {.`static`.}
  OPSTR_SYSTEM_ALERT_WINDOW*: string {.`static`.}
  OPSTR_WRITE_SETTINGS*: string {.`static`.}
  OPSTR_GET_ACCOUNTS*: string {.`static`.}
  OPSTR_READ_PHONE_NUMBERS*: string {.`static`.}
  OPSTR_PICTURE_IN_PICTURE*: string {.`static`.}
  OPSTR_INSTANT_APP_START_FOREGROUND*: string {.`static`.}
  OPSTR_ANSWER_PHONE_CALLS*: string {.`static`.}
  OPSTR_ACCEPT_HANDOVER*: string {.`static`.}
  OPSTR_GPS*: string {.`static`.}
  OPSTR_VIBRATE*: string {.`static`.}
  OPSTR_WIFI_SCAN*: string {.`static`.}
  OPSTR_POST_NOTIFICATION*: string {.`static`.}
  OPSTR_NEIGHBORING_CELLS*: string {.`static`.}
  OPSTR_WRITE_SMS*: string {.`static`.}
  OPSTR_RECEIVE_EMERGENCY_BROADCAST*: string {.`static`.}
  OPSTR_READ_ICC_SMS*: string {.`static`.}
  OPSTR_WRITE_ICC_SMS*: string {.`static`.}
  OPSTR_ACCESS_NOTIFICATIONS*: string {.`static`.}
  OPSTR_PLAY_AUDIO*: string {.`static`.}
  OPSTR_READ_CLIPBOARD*: string {.`static`.}
  OPSTR_WRITE_CLIPBOARD*: string {.`static`.}
  OPSTR_TAKE_MEDIA_BUTTONS*: string {.`static`.}
  OPSTR_TAKE_AUDIO_FOCUS*: string {.`static`.}
  OPSTR_AUDIO_MASTER_VOLUME*: string {.`static`.}
  OPSTR_AUDIO_VOICE_VOLUME*: string {.`static`.}
  OPSTR_AUDIO_RING_VOLUME*: string {.`static`.}
  OPSTR_AUDIO_MEDIA_VOLUME*: string {.`static`.}
  OPSTR_AUDIO_ALARM_VOLUME*: string {.`static`.}
  OPSTR_AUDIO_NOTIFICATION_VOLUME*: string {.`static`.}
  OPSTR_AUDIO_BLUETOOTH_VOLUME*: string {.`static`.}
  OPSTR_WAKE_LOCK*: string {.`static`.}
  OPSTR_MUTE_MICROPHONE*: string {.`static`.}
  OPSTR_TOAST_WINDOW*: string {.`static`.}
  OPSTR_PROJECT_MEDIA*: string {.`static`.}
  OPSTR_WRITE_WALLPAPER*: string {.`static`.}
  OPSTR_ASSIST_STRUCTURE*: string {.`static`.}
  OPSTR_ASSIST_SCREENSHOT*: string {.`static`.}
  OPSTR_TURN_SCREEN_ON*: string {.`static`.}
  OPSTR_RUN_IN_BACKGROUND*: string {.`static`.}
  OPSTR_AUDIO_ACCESSIBILITY_VOLUME*: string {.`static`.}
  OPSTR_REQUEST_INSTALL_PACKAGES*: string {.`static`.}
  OPSTR_RUN_ANY_IN_BACKGROUND*: string {.`static`.}
  OPSTR_CHANGE_WIFI_STATE*: string {.`static`.}
  OPSTR_REQUEST_DELETE_PACKAGES*: string {.`static`.}
  OPSTR_BIND_ACCESSIBILITY_SERVICE*: string {.`static`.}
  OPSTR_MANAGE_IPSEC_TUNNELS*: string {.`static`.}
  OPSTR_START_FOREGROUND*: string {.`static`.}
  OPSTR_BLUETOOTH_SCAN*: string {.`static`.}
  OPSTR_BLUETOOTH_CONNECT*: string {.`static`.}
  OPSTR_BLUETOOTH_ADVERTISE*: string {.`static`.}
  OPSTR_USE_BIOMETRIC*: string {.`static`.}
  OPSTR_ACTIVITY_RECOGNITION*: string {.`static`.}
  OPSTR_SMS_FINANCIAL_TRANSACTIONS*: string {.`static`.}
  OPSTR_READ_MEDIA_AUDIO*: string {.`static`.}
  OPSTR_WRITE_MEDIA_AUDIO*: string {.`static`.}
  OPSTR_READ_MEDIA_VIDEO*: string {.`static`.}
  OPSTR_WRITE_MEDIA_VIDEO*: string {.`static`.}
  OPSTR_READ_MEDIA_IMAGES*: string {.`static`.}
  OPSTR_WRITE_MEDIA_IMAGES*: string {.`static`.}
  OPSTR_LEGACY_STORAGE*: string {.`static`.}
  OPSTR_ACCESS_MEDIA_LOCATION*: string {.`static`.}
  OPSTR_ACCESS_ACCESSIBILITY*: string {.`static`.}
  OPSTR_READ_DEVICE_IDENTIFIERS*: string {.`static`.}
  OPSTR_QUERY_ALL_PACKAGES*: string {.`static`.}
  OPSTR_MANAGE_EXTERNAL_STORAGE*: string {.`static`.}
  OPSTR_AUTO_REVOKE_PERMISSIONS_IF_UNUSED*: string {.`static`.}
  OPSTR_AUTO_REVOKE_MANAGED_BY_INSTALLER*: string {.`static`.}
  OPSTR_INTERACT_ACROSS_PROFILES*: string {.`static`.}
  OPSTR_ACTIVATE_PLATFORM_VPN*: string {.`static`.}
  OPSTR_LOADER_USAGE_STATS*: string {.`static`.}
  OPSTR_MANAGE_ONGOING_CALLS*: string {.`static`.}
  OPSTR_MEDIA_ROUTING_CONTROL*: string {.`static`.}
  OPSTR_ARCHIVE_ICON_OVERLAY*: string {.`static`.}
  OPSTR_UNARCHIVAL_CONFIRMATION*: string {.`static`.}
  OPSTR_NO_ISOLATED_STORAGE*: string {.`static`.}
  OPSTR_PHONE_CALL_MICROPHONE*: string {.`static`.}
  OPSTR_PHONE_CALL_CAMERA*: string {.`static`.}
  OPSTR_RECORD_AUDIO_HOTWORD*: string {.`static`.}
  OPSTR_MANAGE_CREDENTIALS*: string {.`static`.}
  OPSTR_USE_ICC_AUTH_WITH_DEVICE_IDENTIFIER*: string {.`static`.}
  OPSTR_RECORD_AUDIO_OUTPUT*: string {.`static`.}
  OPSTR_SCHEDULE_EXACT_ALARM*: string {.`static`.}
  OPSTR_FINE_LOCATION_SOURCE*: string {.`static`.}
  OPSTR_COARSE_LOCATION_SOURCE*: string {.`static`.}
  OPSTR_CAMERA_SANDBOXED*: string {.`static`.}
  OPSTR_RECORD_AUDIO_SANDBOXED*: string {.`static`.}
  OPSTR_MANAGE_MEDIA*: string {.`static`.}
  OPSTR_UWB_RANGING*: string {.`static`.}
  OPSTR_NEARBY_WIFI_DEVICES*: string {.`static`.}
  OPSTR_ACTIVITY_RECOGNITION_SOURCE*: string {.`static`.}
  OPSTR_RECORD_INCOMING_PHONE_AUDIO*: string {.`static`.}
  OPSTR_ESTABLISH_VPN_SERVICE*: string {.`static`.}
  OPSTR_ESTABLISH_VPN_MANAGER*: string {.`static`.}
  OPSTR_ACCESS_RESTRICTED_SETTINGS*: string {.`static`.}
  OPSTR_RECEIVE_AMBIENT_TRIGGER_AUDIO*: string {.`static`.}
  OPSTR_READ_MEDIA_VISUAL_USER_SELECTED*: string {.`static`.}
  OPSTR_READ_WRITE_HEALTH_DATA*: string {.`static`.}
  OPSTR_RECEIVE_EXPLICIT_USER_INTERACTION_AUDIO*: string {.`static`.}
  OPSTR_RUN_USER_INITIATED_JOBS*: string {.`static`.}
  OPSTR_SYSTEM_EXEMPT_FROM_SUSPENSION*: string {.`static`.}
  OPSTR_SYSTEM_EXEMPT_FROM_DISMISSIBLE_NOTIFICATIONS*: string {.`static`.}
  OPSTR_FOREGROUND_SERVICE_SPECIAL_USE*: string {.`static`.}
  OPSTR_SYSTEM_EXEMPT_FROM_POWER_RESTRICTIONS*: string {.`static`.}
  OPSTR_SYSTEM_EXEMPT_FROM_HIBERNATION*: string {.`static`.}
  OPSTR_SYSTEM_EXEMPT_FROM_ACTIVITY_BG_START_RESTRICTION*: string {.`static`.}
  OPSTR_CAPTURE_CONSENTLESS_BUGREPORT_ON_USERDEBUG_BUILD*: string {.`static`.}
  OPSTR_DEPRECATED_2*: string {.`static`.}
  OPSTR_USE_FULL_SCREEN_INTENT*: string {.`static`.}
  OPSTR_RECEIVE_SANDBOX_TRIGGER_AUDIO*: string {.`static`.}
  OPSTR_DEPRECATED_3*: string {.`static`.}
  OPSTR_CREATE_ACCESSIBILITY_OVERLAY*: string {.`static`.}
  OPSTR_ENABLE_MOBILE_DATA_BY_USER*: string {.`static`.}
  OPSTR_RESERVED_FOR_TESTING*: string {.`static`.}
  OPSTR_RAPID_CLEAR_NOTIFICATIONS_BY_LISTENER*: string {.`static`.}
  OPSTR_READ_SYSTEM_GRAMMATICAL_GENDER*: string {.`static`.}
  OPSTR_DEPRECATED_4*: string {.`static`.}
  OPSTR_EMERGENCY_LOCATION*: string {.`static`.}
  OPSTR_RECEIVE_SENSITIVE_NOTIFICATIONS*: string {.`static`.}
  OPSTR_READ_HEART_RATE*: string {.`static`.}
  OPSTR_READ_OXYGEN_SATURATION*: string {.`static`.}
  OPSTR_READ_SKIN_TEMPERATURE*: string {.`static`.}
  OPSTR_RANGING*: string {.`static`.}
  OPSTR_WRITE_SYSTEM_PREFERENCES*: string {.`static`.}
  OPSTR_CONTROL_AUDIO*: string {.`static`.}
  OPSTR_CONTROL_AUDIO_PARTIAL*: string {.`static`.}
  OPSTR_EYE_TRACKING_COARSE*: string {.`static`.}
  OPSTR_EYE_TRACKING_FINE*: string {.`static`.}
  OPSTR_FACE_TRACKING*: string {.`static`.}
  OPSTR_HAND_TRACKING*: string {.`static`.}
  OPSTR_HEAD_TRACKING*: string {.`static`.}
  OPSTR_SCENE_UNDERSTANDING_COARSE*: string {.`static`.}
  OPSTR_SCENE_UNDERSTANDING_FINE*: string {.`static`.}
  KEY_HISTORICAL_OPS*: string {.`static`.}
  HISTORY_FLAG_AGGREGATE*: jint {.`static`.}
  HISTORY_FLAG_DISCRETE*: jint {.`static`.}
  HISTORY_FLAG_GET_ATTRIBUTION_CHAINS*: jint {.`static`.}
  HISTORY_FLAGS_ALL*: jint {.`static`.}
  FILTER_BY_UID*: jint {.`static`.}
  FILTER_BY_PACKAGE_NAME*: jint {.`static`.}
  FILTER_BY_ATTRIBUTION_TAG*: jint {.`static`.}
  FILTER_BY_OP_NAMES*: jint {.`static`.}
  OP_NOTED_CALLBACK_FLAG_IGNORE_ASYNC*: jint {.`static`.}

jclass android.app.AppOpsManager.PackageOps* of JVMObject:
  proc getPackageName*(): string
  proc getUid*(): jint
  proc getOps*(): List[OpEntry]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)

jclass android.app.AppOpsManager.OpEventProxyInfo* of JVMObject:
  proc reinit*(uid: jint, packageName: string, attributionTag: string, deviceId: string)
  proc getUid*(): jint
  proc getPackageName*(): string
  proc getAttributionTag*(): string
  proc getDeviceId*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint

jclass android.app.AppOpsManager.NoteOpEvent* of JVMObject:
  proc reinit*(noteTime: jlong, duration: jlong, proxy: OpEventProxyInfo, proxyPool: Pools.Pool[OpEventProxyInfo])
  proc getNoteTime*(): jlong
  proc getDuration*(): jlong
  proc getProxy*(): OpEventProxyInfo
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint

jclass android.app.AppOpsManager.AttributedOpEntry* of JVMObject:
  proc collectKeys*(): ArraySet[Long]
  proc getLastAccessTime*(flags: jint): jlong
  proc getLastAccessForegroundTime*(flags: jint): jlong
  proc getLastAccessBackgroundTime*(flags: jint): jlong
  proc getLastAccessTime*(fromUidState: jint, toUidState: jint, flags: jint): jlong
  proc getLastRejectTime*(flags: jint): jlong
  proc getLastRejectForegroundTime*(flags: jint): jlong
  proc getLastRejectBackgroundTime*(flags: jint): jlong
  proc getLastRejectTime*(fromUidState: jint, toUidState: jint, flags: jint): jlong
  proc getLastDuration*(flags: jint): jlong
  proc getLastForegroundDuration*(flags: jint): jlong
  proc getLastBackgroundDuration*(flags: jint): jlong
  proc getLastDuration*(fromUidState: jint, toUidState: jint, flags: jint): jlong
  proc getLastProxyInfo*(flags: jint): OpEventProxyInfo
  proc getLastForegroundProxyInfo*(flags: jint): OpEventProxyInfo
  proc getLastBackgroundProxyInfo*(flags: jint): OpEventProxyInfo
  proc getLastProxyInfo*(fromUidState: jint, toUidState: jint, flags: jint): OpEventProxyInfo
  proc isRunning*(): jboolean
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint

jclass android.app.AppOpsManager.OpEntry* of JVMObject:
  proc getOp*(): jint
  proc getOpStr*(): string
  proc getTime*(): jlong
  proc getLastAccessTime*(flags: jint): jlong
  proc getLastAccessForegroundTime*(flags: jint): jlong
  proc getLastAccessBackgroundTime*(flags: jint): jlong
  proc getLastAccessTime*(fromUidState: jint, toUidState: jint, flags: jint): jlong
  proc getRejectTime*(): jlong
  proc getLastRejectTime*(flags: jint): jlong
  proc getLastRejectForegroundTime*(flags: jint): jlong
  proc getLastRejectBackgroundTime*(flags: jint): jlong
  proc getLastRejectTime*(fromUidState: jint, toUidState: jint, flags: jint): jlong
  proc isRunning*(): jboolean
  proc getDuration*(): jlong
  proc getLastDuration*(flags: jint): jlong
  proc getLastForegroundDuration*(flags: jint): jlong
  proc getLastBackgroundDuration*(flags: jint): jlong
  proc getLastDuration*(fromUidState: jint, toUidState: jint, flags: jint): jlong
  proc getProxyUid*(): jint
  proc getProxyUid*(uidState: jint, flags: jint): jint
  proc getProxyPackageName*(): string
  proc getProxyPackageName*(uidState: jint, flags: jint): string
  proc getLastProxyInfo*(flags: jint): OpEventProxyInfo
  proc getLastForegroundProxyInfo*(flags: jint): OpEventProxyInfo
  proc getLastBackgroundProxyInfo*(flags: jint): OpEventProxyInfo
  proc getLastProxyInfo*(fromUidState: jint, toUidState: jint, flags: jint): OpEventProxyInfo
  proc getMode*(): jint
  proc getAttributedOpEntries*(): Map[string, AttributedOpEntry]
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint

jclass android.app.AppOpsManager.HistoricalOps* of JVMObject:
  proc spliceFromBeginning*(splicePoint: jdouble): HistoricalOps
  proc spliceFromEnd*(fractionToRemove: jdouble): HistoricalOps
  proc merge*(other: HistoricalOps)
  proc filter*(uid: jint, packageName: string, attributionTag: string, opNames: seq[string], historyFilter: jint, filter: jint, beginTimeMillis: jlong, endTimeMillis: jlong)
  proc isEmpty*(): jboolean
  proc getDurationMillis*(): jlong
  proc increaseAccessCount*(opCode: jint, uid: jint, packageName: string, attributionTag: string, uidState: jint, flags: jint, increment: jlong)
  proc increaseRejectCount*(opCode: jint, uid: jint, packageName: string, attributionTag: string, uidState: jint, flags: jint, increment: jlong)
  proc increaseAccessDuration*(opCode: jint, uid: jint, packageName: string, attributionTag: string, uidState: jint, flags: jint, increment: jlong)
  proc addDiscreteAccess*(opCode: jint, uid: jint, packageName: string, attributionTag: string, uidState: jint, opFlag: jint, discreteAccessTime: jlong, discreteAccessDuration: jlong)
  proc addDiscreteAccess*(opCode: jint, uid: jint, packageName: string, attributionTag: string, uidState: jint, opFlag: jint, discreteAccessTime: jlong, discreteAccessDuration: jlong, proxy: OpEventProxyInfo)
  proc offsetBeginAndEndTime*(offsetMillis: jlong)
  proc setBeginAndEndTime*(beginTimeMillis: jlong, endTimeMillis: jlong)
  proc setBeginTime*(beginTimeMillis: jlong)
  proc setEndTime*(endTimeMillis: jlong)
  proc getBeginTimeMillis*(): jlong
  proc getEndTimeMillis*(): jlong
  proc getUidCount*(): jint
  proc getUidOpsAt*(index: jint): HistoricalUidOps
  proc getUidOps*(uid: jint): HistoricalUidOps
  proc clearHistory*(uid: jint, packageName: string)
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc accept*(visitor: HistoricalOpsVisitor)
  proc round*(value: jdouble): jdouble {.`static`.}
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

jclass android.app.AppOpsManager.HistoricalUidOps* of JVMObject:
  proc getUid*(): jint
  proc getPackageCount*(): jint
  proc getPackageOpsAt*(index: jint): HistoricalPackageOps
  proc getPackageOps*(packageName: string): HistoricalPackageOps
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint

jclass android.app.AppOpsManager.HistoricalPackageOps* of JVMObject:
  proc getPackageName*(): string
  proc getOpCount*(): jint
  proc getOpAt*(index: jint): HistoricalOp
  proc getOp*(opName: string): HistoricalOp
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc getAttributedOpsCount*(): jint
  proc getAttributedOpsAt*(index: jint): AttributedHistoricalOps
  proc getAttributedOps*(attributionTag: string): AttributedHistoricalOps

jclass android.app.AppOpsManager.AttributedHistoricalOps* of JVMObject:
  proc getOpCount*(): jint
  proc getOpAt*(index: jint): HistoricalOp
  proc getOp*(opName: string): HistoricalOp
  proc getTag*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint

jclass android.app.AppOpsManager.HistoricalOp* of JVMObject:
  proc getOpName*(): string
  proc getOpCode*(): jint
  proc getDiscreteAccessCount*(): jint
  proc getDiscreteAccessAt*(index: jint): AttributedOpEntry
  proc getForegroundAccessCount*(flags: jint): jlong
  proc getForegroundDiscreteAccesses*(flags: jint): List[AttributedOpEntry]
  proc getBackgroundAccessCount*(flags: jint): jlong
  proc getBackgroundDiscreteAccesses*(flags: jint): List[AttributedOpEntry]
  proc getAccessCount*(fromUidState: jint, toUidState: jint, flags: jint): jlong
  proc getDiscreteAccesses*(fromUidState: jint, toUidState: jint, flags: jint): List[AttributedOpEntry]
  proc getForegroundRejectCount*(flags: jint): jlong
  proc getBackgroundRejectCount*(flags: jint): jlong
  proc getRejectCount*(fromUidState: jint, toUidState: jint, flags: jint): jlong
  proc getForegroundAccessDuration*(flags: jint): jlong
  proc getBackgroundAccessDuration*(flags: jint): jlong
  proc getAccessDuration*(fromUidState: jint, toUidState: jint, flags: jint): jlong
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc collectKeys*(): LongSparseArray[JObject]

jclass android.app.AppOpsManager.NotedOp* of JVMObject:
  proc getOp*(): jint
  proc getUid*(): jint
  proc getPackageName*(): string
  proc getAttributionTag*(): string
  proc getVirtualDeviceId*(): jint
  proc getMessage*(): string
  proc getShouldCollectAsyncNotedOp*(): jboolean
  proc getShouldCollectMessage*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

jclass android.app.AppOpsManager.OnOpChangedListener* of JVMObject:
  proc onOpChanged*(op: string, packageName: string)

jclass android.app.AppOpsManager.OnOpChangedInternalListener* of JVMObject:
  proc onOpChanged*(op: string, packageName: string)
  proc onOpChanged*(op: jint, packageName: string)
  proc onOpChanged*(op: jint, packageName: string, persistentDeviceId: string)

jclass android.app.AppOpsManager.OnOpNotedCallback* of JVMObject:
  proc onNoted*(op: SyncNotedAppOp)
  proc onSelfNoted*(op: SyncNotedAppOp)
  proc onAsyncNoted*(asyncOp: AsyncNotedAppOp)

jclass android.app.AppOpsManager.AppOpsCollector* of JVMObject:
  proc getAsyncNotedExecutor*(): Executor

jclass android.app.RestrictionBypass* of JVMObject:
  isSystemUid*: jboolean
  isPrivileged*: jboolean
  isRecordAudioRestrictionExcept*: jboolean
  UNRESTRICTED*: RestrictionBypass {.`static`.}

jclass android.app.PackageOps* of JVMObject:
  proc getPackageName*(): string
  proc getUid*(): jint
  proc getOps*(): List[OpEntry]
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[PackageOps] {.`static`.}

jclass android.app.OpEventProxyInfo* of JVMObject:
  proc reinit*(uid: jint, packageName: string, attributionTag: string, deviceId: string)
  proc getUid*(): jint
  proc getPackageName*(): string
  proc getAttributionTag*(): string
  proc getDeviceId*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[OpEventProxyInfo] {.`static`.}

jclass android.app.NoteOpEvent* of JVMObject:
  proc reinit*(noteTime: jlong, duration: jlong, proxy: OpEventProxyInfo, proxyPool: Pools.Pool[OpEventProxyInfo])
  proc getNoteTime*(): jlong
  proc getDuration*(): jlong
  proc getProxy*(): OpEventProxyInfo
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[NoteOpEvent] {.`static`.}

jclass android.app.AttributedOpEntry* of JVMObject:
  proc collectKeys*(): ArraySet[Long]
  proc getLastAccessTime*(flags: jint): jlong
  proc getLastAccessForegroundTime*(flags: jint): jlong
  proc getLastAccessBackgroundTime*(flags: jint): jlong
  proc getLastAccessTime*(fromUidState: jint, toUidState: jint, flags: jint): jlong
  proc getLastRejectTime*(flags: jint): jlong
  proc getLastRejectForegroundTime*(flags: jint): jlong
  proc getLastRejectBackgroundTime*(flags: jint): jlong
  proc getLastRejectTime*(fromUidState: jint, toUidState: jint, flags: jint): jlong
  proc getLastDuration*(flags: jint): jlong
  proc getLastForegroundDuration*(flags: jint): jlong
  proc getLastBackgroundDuration*(flags: jint): jlong
  proc getLastDuration*(fromUidState: jint, toUidState: jint, flags: jint): jlong
  proc getLastProxyInfo*(flags: jint): OpEventProxyInfo
  proc getLastForegroundProxyInfo*(flags: jint): OpEventProxyInfo
  proc getLastBackgroundProxyInfo*(flags: jint): OpEventProxyInfo
  proc getLastProxyInfo*(fromUidState: jint, toUidState: jint, flags: jint): OpEventProxyInfo
  proc isRunning*(): jboolean
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[AttributedOpEntry] {.`static`.}

jclass android.app.OpEntry* of JVMObject:
  proc getOp*(): jint
  proc getOpStr*(): string
  proc getTime*(): jlong
  proc getLastAccessTime*(flags: jint): jlong
  proc getLastAccessForegroundTime*(flags: jint): jlong
  proc getLastAccessBackgroundTime*(flags: jint): jlong
  proc getLastAccessTime*(fromUidState: jint, toUidState: jint, flags: jint): jlong
  proc getRejectTime*(): jlong
  proc getLastRejectTime*(flags: jint): jlong
  proc getLastRejectForegroundTime*(flags: jint): jlong
  proc getLastRejectBackgroundTime*(flags: jint): jlong
  proc getLastRejectTime*(fromUidState: jint, toUidState: jint, flags: jint): jlong
  proc isRunning*(): jboolean
  proc getDuration*(): jlong
  proc getLastDuration*(flags: jint): jlong
  proc getLastForegroundDuration*(flags: jint): jlong
  proc getLastBackgroundDuration*(flags: jint): jlong
  proc getLastDuration*(fromUidState: jint, toUidState: jint, flags: jint): jlong
  proc getProxyUid*(): jint
  proc getProxyUid*(uidState: jint, flags: jint): jint
  proc getProxyPackageName*(): string
  proc getProxyPackageName*(uidState: jint, flags: jint): string
  proc getLastProxyInfo*(flags: jint): OpEventProxyInfo
  proc getLastForegroundProxyInfo*(flags: jint): OpEventProxyInfo
  proc getLastBackgroundProxyInfo*(flags: jint): OpEventProxyInfo
  proc getLastProxyInfo*(fromUidState: jint, toUidState: jint, flags: jint): OpEventProxyInfo
  proc getMode*(): jint
  proc getAttributedOpEntries*(): Map[string, AttributedOpEntry]
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[OpEntry] {.`static`.}


jclass android.app.HistoricalOpsRequest.Builder* of JVMObject:
  proc setUid*(uid: jint): Builder
  proc setPackageName*(packageName: string): Builder
  proc setAttributionTag*(attributionTag: string): Builder
  proc setOpNames*(opNames: List[string]): Builder
  proc setFlags*(flags: jint): Builder
  proc setHistoryFlags*(flags: jint): Builder
  proc build*(): HistoricalOpsRequest

jclass android.app.Builder* of JVMObject:
  proc setUid*(uid: jint): Builder
  proc setPackageName*(packageName: string): Builder
  proc setAttributionTag*(attributionTag: string): Builder
  proc setOpNames*(opNames: List[string]): Builder
  proc setFlags*(flags: jint): Builder
  proc setHistoryFlags*(flags: jint): Builder
  proc build*(): HistoricalOpsRequest

jclass android.app.HistoricalOps* of JVMObject:
  proc spliceFromBeginning*(splicePoint: jdouble): HistoricalOps
  proc spliceFromEnd*(fractionToRemove: jdouble): HistoricalOps
  proc merge*(other: HistoricalOps)
  proc filter*(uid: jint, packageName: string, attributionTag: string, opNames: seq[string], historyFilter: jint, filter: jint, beginTimeMillis: jlong, endTimeMillis: jlong)
  proc isEmpty*(): jboolean
  proc getDurationMillis*(): jlong
  proc increaseAccessCount*(opCode: jint, uid: jint, packageName: string, attributionTag: string, uidState: jint, flags: jint, increment: jlong)
  proc increaseRejectCount*(opCode: jint, uid: jint, packageName: string, attributionTag: string, uidState: jint, flags: jint, increment: jlong)
  proc increaseAccessDuration*(opCode: jint, uid: jint, packageName: string, attributionTag: string, uidState: jint, flags: jint, increment: jlong)
  proc addDiscreteAccess*(opCode: jint, uid: jint, packageName: string, attributionTag: string, uidState: jint, opFlag: jint, discreteAccessTime: jlong, discreteAccessDuration: jlong)
  proc addDiscreteAccess*(opCode: jint, uid: jint, packageName: string, attributionTag: string, uidState: jint, opFlag: jint, discreteAccessTime: jlong, discreteAccessDuration: jlong, proxy: OpEventProxyInfo)
  proc offsetBeginAndEndTime*(offsetMillis: jlong)
  proc setBeginAndEndTime*(beginTimeMillis: jlong, endTimeMillis: jlong)
  proc setBeginTime*(beginTimeMillis: jlong)
  proc setEndTime*(endTimeMillis: jlong)
  proc getBeginTimeMillis*(): jlong
  proc getEndTimeMillis*(): jlong
  proc getUidCount*(): jint
  proc getUidOpsAt*(index: jint): HistoricalUidOps
  proc getUidOps*(uid: jint): HistoricalUidOps
  proc clearHistory*(uid: jint, packageName: string)
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc accept*(visitor: HistoricalOpsVisitor)
  proc round*(value: jdouble): jdouble {.`static`.}
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Creator[HistoricalOps] {.`static`.}

jclass android.app.HistoricalUidOps* of JVMObject:
  proc getUid*(): jint
  proc getPackageCount*(): jint
  proc getPackageOpsAt*(index: jint): HistoricalPackageOps
  proc getPackageOps*(packageName: string): HistoricalPackageOps
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  CREATOR*: Creator[HistoricalUidOps] {.`static`.}

jclass android.app.HistoricalPackageOps* of JVMObject:
  proc getPackageName*(): string
  proc getOpCount*(): jint
  proc getOpAt*(index: jint): HistoricalOp
  proc getOp*(opName: string): HistoricalOp
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc getAttributedOpsCount*(): jint
  proc getAttributedOpsAt*(index: jint): AttributedHistoricalOps
  proc getAttributedOps*(attributionTag: string): AttributedHistoricalOps
  CREATOR*: Creator[HistoricalPackageOps] {.`static`.}

jclass android.app.AttributedHistoricalOps* of JVMObject:
  proc getOpCount*(): jint
  proc getOpAt*(index: jint): HistoricalOp
  proc getOp*(opName: string): HistoricalOp
  proc getTag*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[AttributedHistoricalOps] {.`static`.}

jclass android.app.HistoricalOp* of JVMObject:
  proc getOpName*(): string
  proc getOpCode*(): jint
  proc getDiscreteAccessCount*(): jint
  proc getDiscreteAccessAt*(index: jint): AttributedOpEntry
  proc getForegroundAccessCount*(flags: jint): jlong
  proc getForegroundDiscreteAccesses*(flags: jint): List[AttributedOpEntry]
  proc getBackgroundAccessCount*(flags: jint): jlong
  proc getBackgroundDiscreteAccesses*(flags: jint): List[AttributedOpEntry]
  proc getAccessCount*(fromUidState: jint, toUidState: jint, flags: jint): jlong
  proc getDiscreteAccesses*(fromUidState: jint, toUidState: jint, flags: jint): List[AttributedOpEntry]
  proc getForegroundRejectCount*(flags: jint): jlong
  proc getBackgroundRejectCount*(flags: jint): jlong
  proc getRejectCount*(fromUidState: jint, toUidState: jint, flags: jint): jlong
  proc getForegroundAccessDuration*(flags: jint): jlong
  proc getBackgroundAccessDuration*(flags: jint): jlong
  proc getAccessDuration*(fromUidState: jint, toUidState: jint, flags: jint): jlong
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc collectKeys*(): LongSparseArray[JObject]
  CREATOR*: Creator[HistoricalOp] {.`static`.}

jclass android.app.NotedOp* of JVMObject:
  proc getOp*(): jint
  proc getUid*(): jint
  proc getPackageName*(): string
  proc getAttributionTag*(): string
  proc getVirtualDeviceId*(): jint
  proc getMessage*(): string
  proc getShouldCollectAsyncNotedOp*(): jboolean
  proc getShouldCollectMessage*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Creator[NotedOp] {.`static`.}

jclass android.app.OnOpChangedListener* of JVMObject:
  proc onOpChanged*(op: string, packageName: string)



jclass android.app.OnOpNotedInternalListener* of OnOpNotedListener:

jclass android.app.OnOpChangedInternalListener* of JVMObject:
  proc onOpChanged*(op: string, packageName: string)
  proc onOpChanged*(op: jint, packageName: string)
  proc onOpChanged*(op: jint, packageName: string, persistentDeviceId: string)

jclass android.app.OnOpActiveChangedInternalListener* of OnOpActiveChangedListener:

jclass android.app.OnOpStartedListener* of JVMObject:
  START_TYPE_FAILED*: jint
  START_TYPE_STARTED*: jint
  START_TYPE_RESUMED*: jint


jclass android.app.OnOpNotedCallback* of JVMObject:
  proc onNoted*(op: SyncNotedAppOp)
  proc onSelfNoted*(op: SyncNotedAppOp)
  proc onAsyncNoted*(asyncOp: AsyncNotedAppOp)

jclass android.app.AppOpsCollector* of OnOpNotedCallback:
  proc getAsyncNotedExecutor*(): Executor

