import jnim

jclass android.app.ActivityManager* of JVMObject:
  proc invalidateGetCurrentUserIdCache*() {.`static`.}
  proc registerUidFrozenStateChangedCallback*(executor: Executor, callback: UidFrozenStateChangedCallback)
  proc unregisterUidFrozenStateChangedCallback*(callback: UidFrozenStateChangedCallback)
  proc getUidFrozenState*(uids: seq[jint]): seq[jint]
  proc printCapabilitiesSummary*(pw: PrintWriter, caps: jint) {.`static`.}
  proc printCapabilitiesSummary*(sb: StringBuilder, caps: jint) {.`static`.}
  proc printCapabilitiesFull*(pw: PrintWriter, caps: jint) {.`static`.}
  proc getCapabilitiesSummary*(caps: jint): string {.`static`.}
  proc processStateAmToProto*(amInt: jint): jint {.`static`.}
  proc isProcStateBackground*(procState: jint): jboolean {.`static`.}
  proc isProcStateCached*(procState: jint): jboolean {.`static`.}
  proc isForegroundService*(procState: jint): jboolean {.`static`.}
  proc isProcStateJankPerceptible*(procState: jint): jboolean {.`static`.}
  proc init$ravenwood*(currentUser: jint) {.`static`.}
  proc reset$ravenwood*() {.`static`.}
  proc isStartResultSuccessful*(result: jint): jboolean {.`static`.}
  proc isStartResultFatalError*(result: jint): jboolean {.`static`.}
  proc restrictionLevelToName*(level: jint): string {.`static`.}
  proc getFrontActivityScreenCompatMode*(): jint
  proc setFrontActivityScreenCompatMode*(mode: jint)
  proc getPackageScreenCompatMode*(packageName: string): jint
  proc setPackageScreenCompatMode*(packageName: string, mode: jint)
  proc getPackageAskScreenCompat*(packageName: string): jboolean
  proc setPackageAskScreenCompat*(packageName: string, ask: jboolean)
  proc getMemoryClass*(): jint
  proc staticGetMemoryClass*(): jint {.`static`.}
  proc getLargeMemoryClass*(): jint
  proc staticGetLargeMemoryClass*(): jint {.`static`.}
  proc isLowRamDevice*(): jboolean
  proc isLowRamDeviceStatic*(): jboolean {.`static`.}
  proc isSmallBatteryDevice*(): jboolean {.`static`.}
  proc isHighEndGfx*(): jboolean {.`static`.}
  proc getTotalRam*(): jlong
  proc getMaxRecentTasksStatic*(): jint {.`static`.}
  proc getRecentTasks*(maxNum: jint, flags: jint): List[RecentTaskInfo]
  proc getAppTasks*(): List[ActivityManager.AppTask]
  proc getAppTaskThumbnailSize*(): Size
  proc addAppTask*(activity: Activity, intent: Intent, description: TaskDescription, thumbnail: Bitmap): jint
  proc getRunningTasks*(maxNum: jint): List[RunningTaskInfo]
  proc moveTaskToFront*(taskId: jint, flags: jint)
  proc moveTaskToFront*(taskId: jint, flags: jint, options: Bundle)
  proc isActivityStartAllowedOnDisplay*(context: Context, displayId: jint, intent: Intent): jboolean
  proc getRunningServices*(maxNum: jint): List[RunningServiceInfo]
  proc getRunningServiceControlPanel*(service: ComponentName): PendingIntent
  proc getMemoryInfo*(outInfo: MemoryInfo)
  proc clearApplicationUserData*(packageName: string, observer: IPackageDataObserver): jboolean
  proc clearApplicationUserData*(): jboolean
  proc getGrantedUriPermissions*(packageName: string): ParceledListSlice[GrantedUriPermission]
  proc clearGrantedUriPermissions*(packageName: string)
  proc getProcessesInErrorState*(): List[ProcessErrorStateInfo]
  proc getRunningExternalApplications*(): List[ApplicationInfo]
  proc isBackgroundRestricted*(): jboolean
  proc setProcessMemoryTrimLevel*(process: string, userId: jint, level: jint): jboolean
  proc getRunningAppProcesses*(): List[RunningAppProcessInfo]
  proc getHistoricalProcessStartReasons*(maxNum: jint): List[ApplicationStartInfo]
  proc getExternalHistoricalProcessStartReasons*(packageName: string, maxNum: jint): List[ApplicationStartInfo]
  proc addApplicationStartInfoCompletionListener*(executor: Executor, listener: Consumer[ApplicationStartInfo])
  proc removeApplicationStartInfoCompletionListener*(listener: Consumer[ApplicationStartInfo])
  proc addStartInfoTimestamp*(key: jint, timestampNs: jlong)
  proc getHistoricalProcessExitReasons*(packageName: string, pid: jint, maxNum: jint): List[ApplicationExitInfo]
  proc setProcessStateSummary*(state: seq[jbyte])
  proc isLowMemoryKillReportSupported*(): jboolean {.`static`.}
  proc getUidProcessState*(uid: jint): jint
  proc getUidProcessCapabilities*(uid: jint): jint
  proc getPackageImportance*(packageName: string): jint
  proc getUidImportance*(uid: jint): jint
  proc getBindingUidImportance*(uid: jint): jint
  proc addOnUidImportanceListener*(listener: OnUidImportanceListener, importanceCutpoint: jint)
  proc addOnUidImportanceListener*(listener: OnUidImportanceListener, importanceCutpoint: jint, uids: seq[jint])
  proc removeOnUidImportanceListener*(listener: OnUidImportanceListener)
  proc getMyMemoryState*(outState: RunningAppProcessInfo) {.`static`.}
  proc getProcessMemoryInfo*(pids: seq[jint]): seq[Debug.MemoryInfo]
  proc restartPackage*(packageName: string)
  proc killBackgroundProcesses*(packageName: string)
  proc killUid*(uid: jint, reason: string)
  proc forceStopPackageAsUser*(packageName: string, userId: jint)
  proc forceStopPackage*(packageName: string)
  proc forceStopPackageAsUserEvenWhenStopping*(packageName: string, userId: jint)
  proc stopPackageForUser*(packageName: string)
  proc setDeviceLocales*(locales: LocaleList)
  proc getSupportedLocales*(): Collection[Locale]
  proc getDeviceConfigurationInfo*(): ConfigurationInfo
  proc getLauncherLargeIconDensity*(): jint
  proc getLauncherLargeIconSize*(): jint
  proc isUserAMonkey*(): jboolean {.`static`.}
  proc isUserAMonkey$ravenwood*(): jboolean {.`static`.}
  proc isRunningInTestHarness*(): jboolean {.`static`.}
  proc isRunningInUserTestHarness*(): jboolean {.`static`.}
  proc alwaysShowUnsupportedCompileSdkWarning*(activity: ComponentName)
  proc canAccessUnexportedComponents*(uid: jint): jboolean {.`static`.}
  proc checkComponentPermission*(permission: string, uid: jint, owningUid: jint, exported: jboolean): jint {.`static`.}
  proc checkComponentPermission*(permission: string, uid: jint, deviceId: jint, owningUid: jint, exported: jboolean): jint {.`static`.}
  proc checkUidPermission*(permission: string, uid: jint): jint {.`static`.}
  proc handleIncomingUser*(callingPid: jint, callingUid: jint, userId: jint, allowAll: jboolean, requireFull: jboolean, name: string, callerPackage: string): jint {.`static`.}
  proc getCurrentUser*(): jint {.`static`.}
  proc getCurrentUser$ravenwood*(): jint {.`static`.}
  proc switchUser*(userid: jint): jboolean
  proc switchUser*(user: UserHandle): jboolean
  proc startUserInBackgroundVisibleOnDisplay*(userId: jint, displayId: jint): jboolean
  proc getDisplayIdsForStartingVisibleBackgroundUsers*(): seq[jint]
  proc getSwitchingFromUserMessage*(userId: jint): string
  proc getSwitchingToUserMessage*(userId: jint): string
  proc setStopUserOnSwitch*(value: jint)
  proc startProfile*(userHandle: UserHandle): jboolean
  proc stopProfile*(userHandle: UserHandle): jboolean
  proc updateMccMncConfiguration*(mcc: string, mnc: string): jboolean
  proc stopUser*(userId: jint): jboolean
  proc isUserRunning*(userId: jint): jboolean
  proc isVrModePackageEnabled*(component: ComponentName): jboolean
  proc dumpPackageState*(fd: FileDescriptor, packageName: string)
  proc dumpPackageStateStatic*(fd: FileDescriptor, packageName: string) {.`static`.}
  proc isSystemReady*(): jboolean {.`static`.}
  proc isSystemReady$ravenwood*(): jboolean {.`static`.}
  proc broadcastStickyIntent*(intent: Intent, userId: jint) {.`static`.}
  proc broadcastStickyIntent*(intent: Intent, appOp: jint, userId: jint) {.`static`.}
  proc broadcastStickyIntent*(intent: Intent, appOp: jint, options: Bundle, userId: jint) {.`static`.}
  proc broadcastStickyIntent*(intent: Intent, excludedPackages: seq[string], appOp: jint, options: Bundle, userId: jint) {.`static`.}
  proc resumeAppSwitches*() {.`static`.}
  proc noteWakeupAlarm*(ps: PendingIntent, workSource: WorkSource, sourceUid: jint, sourcePkg: string, tag: string) {.`static`.}
  proc noteAlarmStart*(ps: PendingIntent, workSource: WorkSource, sourceUid: jint, tag: string) {.`static`.}
  proc noteAlarmFinish*(ps: PendingIntent, workSource: WorkSource, sourceUid: jint, tag: string) {.`static`.}
  proc getService*(): IActivityManager {.`static`.}
  proc setWatchHeapLimit*(pssSize: jlong)
  proc clearWatchHeapLimit*()
  proc isInLockTaskMode*(): jboolean
  proc getLockTaskModeState*(): jint
  proc setVrThread*(tid: jint) {.`static`.}
  proc setPersistentVrThread*(tid: jint) {.`static`.}
  proc scheduleApplicationInfoChanged*(packages: List[string], userId: jint)
  proc isProfileForeground*(userHandle: UserHandle): jboolean
  proc killProcessesWhenImperceptible*(pids: seq[jint], reason: string)
  proc isProcStateConsideredInteraction*(procState: jint): jboolean {.`static`.}
  proc procStateToString*(procState: jint): string {.`static`.}
  proc getBugreportWhitelistedPackages*(): List[string]
  proc appNotResponding*(reason: string)
  proc addHomeVisibilityListener*(executor: Executor, listener: HomeVisibilityListener)
  proc removeHomeVisibilityListener*(listener: HomeVisibilityListener)
  proc setThemeOverlayReady*(userId: jint)
  proc resetAppErrors*()
  proc holdLock*(token: IBinder, durationMs: jint)
  proc waitForBroadcastIdle*()
  proc forceDelayBroadcastDelivery*(targetPackage: string, delayedDurationMs: jlong)
  proc isProcessFrozen*(pid: jint): jboolean
  proc noteForegroundResourceUseBegin*(apiType: jint, uid: jint, pid: jint)
  proc noteForegroundResourceUseEnd*(apiType: jint, uid: jint, pid: jint)
  proc getBackgroundRestrictionExemptionReason*(uid: jint): jint
  proc noteAppRestrictionEnabled*(packageName: string, uid: jint, restrictionLevel: jint, enabled: jboolean, reason: jint, subReason: string, source: jint, threshold: jlong)
  proc notifySystemPropertiesChanged*()
  INSTR_FLAG_DISABLE_HIDDEN_API_CHECKS*: jint {.`static`.}
  INSTR_FLAG_DISABLE_ISOLATED_STORAGE*: jint {.`static`.}
  INSTR_FLAG_DISABLE_TEST_API_CHECKS*: jint {.`static`.}
  INSTR_FLAG_NO_RESTART*: jint {.`static`.}
  INSTR_FLAG_ALWAYS_CHECK_SIGNATURE*: jint {.`static`.}
  INSTR_FLAG_INSTRUMENT_SDK_SANDBOX*: jint {.`static`.}
  INSTR_FLAG_INSTRUMENT_SDK_IN_SANDBOX*: jint {.`static`.}
  META_HOME_ALTERNATE*: string {.`static`.}
  START_VOICE_HIDDEN_SESSION*: jint {.`static`.}
  START_VOICE_NOT_ACTIVE_SESSION*: jint {.`static`.}
  START_NOT_CURRENT_USER_ACTIVITY*: jint {.`static`.}
  START_NOT_VOICE_COMPATIBLE*: jint {.`static`.}
  START_CANCELED*: jint {.`static`.}
  START_NOT_ACTIVITY*: jint {.`static`.}
  START_PERMISSION_DENIED*: jint {.`static`.}
  START_FORWARD_AND_REQUEST_CONFLICT*: jint {.`static`.}
  START_CLASS_NOT_FOUND*: jint {.`static`.}
  START_INTENT_NOT_RESOLVED*: jint {.`static`.}
  START_ASSISTANT_HIDDEN_SESSION*: jint {.`static`.}
  START_ASSISTANT_NOT_ACTIVE_SESSION*: jint {.`static`.}
  START_SUCCESS*: jint {.`static`.}
  START_RETURN_INTENT_TO_CALLER*: jint {.`static`.}
  START_TASK_TO_FRONT*: jint {.`static`.}
  START_DELIVERED_TO_TOP*: jint {.`static`.}
  START_SWITCHES_CANCELED*: jint {.`static`.}
  START_RETURN_LOCK_TASK_MODE_VIOLATION*: jint {.`static`.}
  START_ABORTED*: jint {.`static`.}
  START_FLAG_ONLY_IF_NEEDED*: jint {.`static`.}
  START_FLAG_DEBUG*: jint {.`static`.}
  START_FLAG_TRACK_ALLOCATION*: jint {.`static`.}
  START_FLAG_NATIVE_DEBUGGING*: jint {.`static`.}
  START_FLAG_DEBUG_SUSPEND*: jint {.`static`.}
  BROADCAST_SUCCESS*: jint {.`static`.}
  BROADCAST_STICKY_CANT_HAVE_PERMISSION*: jint {.`static`.}
  BROADCAST_FAILED_USER_STOPPED*: jint {.`static`.}
  INTENT_SENDER_UNKNOWN*: jint {.`static`.}
  INTENT_SENDER_BROADCAST*: jint {.`static`.}
  INTENT_SENDER_ACTIVITY*: jint {.`static`.}
  INTENT_SENDER_ACTIVITY_RESULT*: jint {.`static`.}
  INTENT_SENDER_SERVICE*: jint {.`static`.}
  INTENT_SENDER_FOREGROUND_SERVICE*: jint {.`static`.}
  USER_OP_SUCCESS*: jint {.`static`.}
  USER_OP_UNKNOWN_USER*: jint {.`static`.}
  USER_OP_IS_CURRENT*: jint {.`static`.}
  USER_OP_ERROR_IS_SYSTEM*: jint {.`static`.}
  USER_OP_ERROR_RELATED_USERS_CANNOT_STOP*: jint {.`static`.}
  PROCESS_STATE_UNKNOWN*: jint {.`static`.}
  PROCESS_STATE_PERSISTENT*: jint {.`static`.}
  PROCESS_STATE_PERSISTENT_UI*: jint {.`static`.}
  PROCESS_STATE_TOP*: jint {.`static`.}
  PROCESS_STATE_BOUND_TOP*: jint {.`static`.}
  PROCESS_STATE_FOREGROUND_SERVICE*: jint {.`static`.}
  PROCESS_STATE_BOUND_FOREGROUND_SERVICE*: jint {.`static`.}
  PROCESS_STATE_IMPORTANT_FOREGROUND*: jint {.`static`.}
  PROCESS_STATE_IMPORTANT_BACKGROUND*: jint {.`static`.}
  PROCESS_STATE_TRANSIENT_BACKGROUND*: jint {.`static`.}
  PROCESS_STATE_BACKUP*: jint {.`static`.}
  PROCESS_STATE_SERVICE*: jint {.`static`.}
  PROCESS_STATE_RECEIVER*: jint {.`static`.}
  PROCESS_STATE_TOP_SLEEPING*: jint {.`static`.}
  PROCESS_STATE_HEAVY_WEIGHT*: jint {.`static`.}
  PROCESS_STATE_HOME*: jint {.`static`.}
  PROCESS_STATE_LAST_ACTIVITY*: jint {.`static`.}
  PROCESS_STATE_CACHED_ACTIVITY*: jint {.`static`.}
  PROCESS_STATE_CACHED_ACTIVITY_CLIENT*: jint {.`static`.}
  PROCESS_STATE_CACHED_RECENT*: jint {.`static`.}
  PROCESS_STATE_CACHED_EMPTY*: jint {.`static`.}
  PROCESS_STATE_NONEXISTENT*: jint {.`static`.}
  FOREGROUND_SERVICE_API_TYPE_CAMERA*: jint {.`static`.}
  FOREGROUND_SERVICE_API_TYPE_BLUETOOTH*: jint {.`static`.}
  FOREGROUND_SERVICE_API_TYPE_LOCATION*: jint {.`static`.}
  FOREGROUND_SERVICE_API_TYPE_MEDIA_PLAYBACK*: jint {.`static`.}
  FOREGROUND_SERVICE_API_TYPE_AUDIO*: jint {.`static`.}
  FOREGROUND_SERVICE_API_TYPE_MICROPHONE*: jint {.`static`.}
  FOREGROUND_SERVICE_API_TYPE_PHONE_CALL*: jint {.`static`.}
  FOREGROUND_SERVICE_API_TYPE_USB*: jint {.`static`.}
  FOREGROUND_SERVICE_API_TYPE_CDM*: jint {.`static`.}
  FOREGROUND_SERVICE_API_EVENT_BEGIN*: jint {.`static`.}
  FOREGROUND_SERVICE_API_EVENT_END*: jint {.`static`.}
  PROCESS_CAPABILITY_NONE*: jint {.`static`.}
  PROCESS_CAPABILITY_FOREGROUND_LOCATION*: jint {.`static`.}
  PROCESS_CAPABILITY_FOREGROUND_CAMERA*: jint {.`static`.}
  PROCESS_CAPABILITY_FOREGROUND_MICROPHONE*: jint {.`static`.}
  PROCESS_CAPABILITY_POWER_RESTRICTED_NETWORK*: jint {.`static`.}
  PROCESS_CAPABILITY_BFSL*: jint {.`static`.}
  PROCESS_CAPABILITY_USER_RESTRICTED_NETWORK*: jint {.`static`.}
  PROCESS_CAPABILITY_FOREGROUND_AUDIO_CONTROL*: jint {.`static`.}
  PROCESS_CAPABILITY_CPU_TIME*: jint {.`static`.}
  PROCESS_CAPABILITY_ALL*: jint {.`static`.}
  PROCESS_CAPABILITY_ALL_IMPLICIT*: jint {.`static`.}
  MIN_PROCESS_STATE*: jint {.`static`.}
  MAX_PROCESS_STATE*: jint {.`static`.}
  ASSIST_CONTEXT_BASIC*: jint {.`static`.}
  ASSIST_CONTEXT_FULL*: jint {.`static`.}
  ASSIST_CONTEXT_AUTOFILL*: jint {.`static`.}
  ASSIST_CONTEXT_CONTENT*: jint {.`static`.}
  UID_OBSERVER_PROCSTATE*: jint {.`static`.}
  UID_OBSERVER_GONE*: jint {.`static`.}
  UID_OBSERVER_IDLE*: jint {.`static`.}
  UID_OBSERVER_ACTIVE*: jint {.`static`.}
  UID_OBSERVER_CACHED*: jint {.`static`.}
  UID_OBSERVER_CAPABILITY*: jint {.`static`.}
  UID_OBSERVER_PROC_OOM_ADJ*: jint {.`static`.}
  APP_START_MODE_NORMAL*: jint {.`static`.}
  APP_START_MODE_DELAYED*: jint {.`static`.}
  APP_START_MODE_DELAYED_RIGID*: jint {.`static`.}
  APP_START_MODE_DISABLED*: jint {.`static`.}
  LOCK_TASK_MODE_NONE*: jint {.`static`.}
  LOCK_TASK_MODE_LOCKED*: jint {.`static`.}
  LOCK_TASK_MODE_PINNED*: jint {.`static`.}
  COMPAT_MODE_ALWAYS*: jint {.`static`.}
  COMPAT_MODE_NEVER*: jint {.`static`.}
  COMPAT_MODE_UNKNOWN*: jint {.`static`.}
  COMPAT_MODE_DISABLED*: jint {.`static`.}
  COMPAT_MODE_ENABLED*: jint {.`static`.}
  COMPAT_MODE_TOGGLE*: jint {.`static`.}
  DROP_CLOSE_SYSTEM_DIALOGS*: jlong {.`static`.}
  LOCK_DOWN_CLOSE_SYSTEM_DIALOGS*: jlong {.`static`.}
  RESTRICTION_LEVEL_UNKNOWN*: jint {.`static`.}
  RESTRICTION_LEVEL_UNRESTRICTED*: jint {.`static`.}
  RESTRICTION_LEVEL_EXEMPTED*: jint {.`static`.}
  RESTRICTION_LEVEL_ADAPTIVE_BUCKET*: jint {.`static`.}
  RESTRICTION_LEVEL_RESTRICTED_BUCKET*: jint {.`static`.}
  RESTRICTION_LEVEL_BACKGROUND_RESTRICTED*: jint {.`static`.}
  RESTRICTION_LEVEL_FORCE_STOPPED*: jint {.`static`.}
  RESTRICTION_LEVEL_USER_LAUNCH_ONLY*: jint {.`static`.}
  RESTRICTION_LEVEL_CUSTOM*: jint {.`static`.}
  RESTRICTION_LEVEL_MAX*: jint {.`static`.}
  RESTRICTION_SUBREASON_MAX_LENGTH*: jint {.`static`.}
  RESTRICTION_REASON_DEFAULT*: jint {.`static`.}
  RESTRICTION_REASON_DORMANT*: jint {.`static`.}
  RESTRICTION_REASON_USAGE*: jint {.`static`.}
  RESTRICTION_REASON_USER*: jint {.`static`.}
  RESTRICTION_REASON_SYSTEM_HEALTH*: jint {.`static`.}
  RESTRICTION_REASON_POLICY*: jint {.`static`.}
  RESTRICTION_REASON_OTHER*: jint {.`static`.}
  RESTRICTION_SOURCE_USER*: jint {.`static`.}
  RESTRICTION_SOURCE_USER_NUDGED*: jint {.`static`.}
  RESTRICTION_SOURCE_SYSTEM*: jint {.`static`.}
  RESTRICTION_SOURCE_COMMAND_LINE*: jint {.`static`.}
  RESTRICTION_SOURCE_REMOTE_TRIGGER*: jint {.`static`.}
  RECENT_WITH_EXCLUDED*: jint {.`static`.}
  RECENT_IGNORE_UNAVAILABLE*: jint {.`static`.}
  MOVE_TASK_WITH_HOME*: jint {.`static`.}
  MOVE_TASK_NO_USER_ACTION*: jint {.`static`.}
  STOP_USER_ON_SWITCH_DEFAULT*: jint {.`static`.}
  STOP_USER_ON_SWITCH_TRUE*: jint {.`static`.}
  STOP_USER_ON_SWITCH_FALSE*: jint {.`static`.}
  FLAG_OR_STOPPED*: jint {.`static`.}
  FLAG_AND_LOCKED*: jint {.`static`.}
  FLAG_AND_UNLOCKED*: jint {.`static`.}
  FLAG_AND_UNLOCKING_OR_UNLOCKED*: jint {.`static`.}
  ACTION_REPORT_HEAP_LIMIT*: string {.`static`.}

jclass android.app.ActivityManager.TaskDescription* of JVMObject:
  proc copyFrom*(other: TaskDescription)
  proc copyFromPreserveHiddenFields*(other: TaskDescription)
  proc setLabel*(label: string)
  proc setPrimaryColor*(primaryColor: jint)
  proc setBackgroundColor*(backgroundColor: jint)
  proc setBackgroundColorFloating*(backgroundColor: jint)
  proc setStatusBarColor*(statusBarColor: jint)
  proc setNavigationBarColor*(navigationBarColor: jint)
  proc setIcon*(icon: Icon)
  proc setIconFilename*(iconFilename: string)
  proc setResizeMode*(resizeMode: jint)
  proc setMinWidth*(minWidth: jint)
  proc setMinHeight*(minHeight: jint)
  proc getLabel*(): string
  proc loadIcon*(): Icon
  proc getIcon*(): Bitmap
  proc getRawIcon*(): Icon
  proc getIconResourcePackage*(): string
  proc getIconResource*(): jint
  proc getIconFilename*(): string
  proc getInMemoryIcon*(): Bitmap
  proc loadTaskDescriptionIcon*(iconFilename: string, userId: jint): Bitmap {.`static`.}
  proc getPrimaryColor*(): jint
  proc getBackgroundColor*(): jint
  proc getBackgroundColorFloating*(): jint
  proc getStatusBarColor*(): jint
  proc getNavigationBarColor*(): jint
  proc getEnsureStatusBarContrastWhenTransparent*(): jboolean
  proc getSystemBarsAppearance*(): jint
  proc getTopOpaqueSystemBarsAppearance*(): jint
  proc setEnsureStatusBarContrastWhenTransparent*(ensureStatusBarContrastWhenTransparent: jboolean)
  proc setSystemBarsAppearance*(systemBarsAppearance: jint)
  proc setTopOpaqueSystemBarsAppearance*(topOpaqueSystemBarsAppearance: jint)
  proc getEnsureNavigationBarContrastWhenTransparent*(): jboolean
  proc setEnsureNavigationBarContrastWhenTransparent*(ensureNavigationBarContrastWhenTransparent: jboolean)
  proc getResizeMode*(): jint
  proc getMinWidth*(): jint
  proc getMinHeight*(): jint
  proc saveToXml*(output:TypedXmlSerializer)
  proc restoreFromXml*(in: TypedXmlPullParser)
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(source: Parcel)
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc equals*(td1: TaskDescription, td2: TaskDescription): jboolean {.`static`.}

jclass android.app.ActivityManager.RecentTaskInfo* of JVMObject:
  proc describeContents*(): jint
  proc readFromParcel*(source: Parcel)
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc dump*(pw: PrintWriter, indent: string)

jclass android.app.ActivityManager.RunningTaskInfo* of JVMObject:
  proc describeContents*(): jint
  proc readFromParcel*(source: Parcel)
  proc writeToParcel*(dest: Parcel, flags: jint)

jclass android.app.ActivityManager.RunningServiceInfo* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(source: Parcel)

jclass android.app.ActivityManager.MemoryInfo* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(source: Parcel)
  proc copyTo*(other: MemoryInfo)

jclass android.app.ActivityManager.ProcessErrorStateInfo* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(source: Parcel)

jclass android.app.ActivityManager.RunningAppProcessInfo* of JVMObject:
  proc procStateToImportance*(procState: jint): jint {.`static`.}
  proc procStateToImportanceForClient*(procState: jint, clientContext: Context): jint {.`static`.}
  proc procStateToImportanceForTargetSdk*(procState: jint, targetSdkVersion: jint): jint {.`static`.}
  proc importanceToProcState*(importance: jint): jint {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(source: Parcel)
  proc copyTo*(other: RunningAppProcessInfo)

jclass android.app.ActivityManager.AppTask* of JVMObject:
  proc finishAndRemoveTask*()
  proc getTaskInfo*(): RecentTaskInfo
  proc moveToFront*()
  proc startActivity*(context: Context, intent: Intent, options: Bundle)
  proc setExcludeFromRecents*(exclude: jboolean)

jclass android.app.ActivityManager.PendingIntentInfo* of JVMObject:
  proc getCreatorPackage*(): string
  proc getCreatorUid*(): jint
  proc isImmutable*(): jboolean
  proc getIntentSenderType*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)


jclass android.app.TaskDescription* of JVMObject:
  proc copyFrom*(other: TaskDescription)
  proc copyFromPreserveHiddenFields*(other: TaskDescription)
  proc setLabel*(label: string)
  proc setPrimaryColor*(primaryColor: jint)
  proc setBackgroundColor*(backgroundColor: jint)
  proc setBackgroundColorFloating*(backgroundColor: jint)
  proc setStatusBarColor*(statusBarColor: jint)
  proc setNavigationBarColor*(navigationBarColor: jint)
  proc setIcon*(icon: Icon)
  proc setIconFilename*(iconFilename: string)
  proc setResizeMode*(resizeMode: jint)
  proc setMinWidth*(minWidth: jint)
  proc setMinHeight*(minHeight: jint)
  proc getLabel*(): string
  proc loadIcon*(): Icon
  proc getIcon*(): Bitmap
  proc getRawIcon*(): Icon
  proc getIconResourcePackage*(): string
  proc getIconResource*(): jint
  proc getIconFilename*(): string
  proc getInMemoryIcon*(): Bitmap
  proc loadTaskDescriptionIcon*(iconFilename: string, userId: jint): Bitmap {.`static`.}
  proc getPrimaryColor*(): jint
  proc getBackgroundColor*(): jint
  proc getBackgroundColorFloating*(): jint
  proc getStatusBarColor*(): jint
  proc getNavigationBarColor*(): jint
  proc getEnsureStatusBarContrastWhenTransparent*(): jboolean
  proc getSystemBarsAppearance*(): jint
  proc getTopOpaqueSystemBarsAppearance*(): jint
  proc setEnsureStatusBarContrastWhenTransparent*(ensureStatusBarContrastWhenTransparent: jboolean)
  proc setSystemBarsAppearance*(systemBarsAppearance: jint)
  proc setTopOpaqueSystemBarsAppearance*(topOpaqueSystemBarsAppearance: jint)
  proc getEnsureNavigationBarContrastWhenTransparent*(): jboolean
  proc setEnsureNavigationBarContrastWhenTransparent*(ensureNavigationBarContrastWhenTransparent: jboolean)
  proc getResizeMode*(): jint
  proc getMinWidth*(): jint
  proc getMinHeight*(): jint
  proc saveToXml*(output:TypedXmlSerializer)
  proc restoreFromXml*(in: TypedXmlPullParser)
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(source: Parcel)
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc equals*(td1: TaskDescription, td2: TaskDescription): jboolean {.`static`.}
  ATTR_TASKDESCRIPTION_PREFIX*: string {.`static`.}
  CREATOR*: Creator[TaskDescription] {.`static`.}

jclass android.app.TaskDescription.Builder* of JVMObject:
  proc setLabel*(label: string): Builder
  proc setIcon*(iconRes: jint): Builder
  proc setPrimaryColor*(color: jint): Builder
  proc setBackgroundColor*(color: jint): Builder
  proc setStatusBarColor*(color: jint): Builder
  proc setNavigationBarColor*(color: jint): Builder
  proc build*(): TaskDescription

jclass android.app.Builder* of JVMObject:
  proc setLabel*(label: string): Builder
  proc setIcon*(iconRes: jint): Builder
  proc setPrimaryColor*(color: jint): Builder
  proc setBackgroundColor*(color: jint): Builder
  proc setStatusBarColor*(color: jint): Builder
  proc setNavigationBarColor*(color: jint): Builder
  proc build*(): TaskDescription

jclass android.app.RecentTaskInfo* of TaskInfo:
  proc describeContents*(): jint
  proc readFromParcel*(source: Parcel)
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc dump*(pw: PrintWriter, indent: string)
  id*: jint
  persistentId*: jint
  description*: CharSequence
  affiliatedTaskId*: jint
  CREATOR*: Creator[RecentTaskInfo] {.`static`.}

jclass android.app.RunningTaskInfo* of TaskInfo:
  proc describeContents*(): jint
  proc readFromParcel*(source: Parcel)
  proc writeToParcel*(dest: Parcel, flags: jint)
  id*: jint
  thumbnail*: Bitmap
  description*: CharSequence
  numRunning*: jint
  CREATOR*: Creator[RunningTaskInfo] {.`static`.}

jclass android.app.RunningServiceInfo* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(source: Parcel)
  service*: ComponentName
  pid*: jint
  uid*: jint
  process*: string
  foreground*: jboolean
  activeSince*: jlong
  started*: jboolean
  clientCount*: jint
  crashCount*: jint
  lastActivityTime*: jlong
  restarting*: jlong
  FLAG_STARTED*: jint {.`static`.}
  FLAG_FOREGROUND*: jint {.`static`.}
  FLAG_SYSTEM_PROCESS*: jint {.`static`.}
  FLAG_PERSISTENT_PROCESS*: jint {.`static`.}
  flags*: jint
  clientPackage*: string
  clientLabel*: jint
  CREATOR*: Creator[RunningServiceInfo] {.`static`.}

jclass android.app.MemoryInfo* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(source: Parcel)
  proc copyTo*(other: MemoryInfo)
  advertisedMem*: jlong
  availMem*: jlong
  totalMem*: jlong
  threshold*: jlong
  lowMemory*: jboolean
  hiddenAppThreshold*: jlong
  secondaryServerThreshold*: jlong
  visibleAppThreshold*: jlong
  foregroundAppThreshold*: jlong
  CREATOR*: Creator[MemoryInfo] {.`static`.}

jclass android.app.ProcessErrorStateInfo* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(source: Parcel)
  NO_ERROR*: jint {.`static`.}
  CRASHED*: jint {.`static`.}
  NOT_RESPONDING*: jint {.`static`.}
  condition*: jint
  processName*: string
  pid*: jint
  uid*: jint
  tag*: string
  shortMsg*: string
  longMsg*: string
  stackTrace*: string
  crashData*: jbyte
  CREATOR*: Creator[ProcessErrorStateInfo] {.`static`.}

jclass android.app.RunningAppProcessInfo* of JVMObject:
  proc procStateToImportance*(procState: jint): jint {.`static`.}
  proc procStateToImportanceForClient*(procState: jint, clientContext: Context): jint {.`static`.}
  proc procStateToImportanceForTargetSdk*(procState: jint, targetSdkVersion: jint): jint {.`static`.}
  proc importanceToProcState*(importance: jint): jint {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(source: Parcel)
  proc copyTo*(other: RunningAppProcessInfo)
  processName*: string
  pid*: jint
  uid*: jint
  pkgList*: string
  pkgDeps*: string
  FLAG_CANT_SAVE_STATE*: jint {.`static`.}
  FLAG_PERSISTENT*: jint {.`static`.}
  FLAG_HAS_ACTIVITIES*: jint {.`static`.}
  flags*: jint
  lastTrimLevel*: jint
  IMPORTANCE_FOREGROUND*: jint {.`static`.}
  IMPORTANCE_FOREGROUND_SERVICE*: jint {.`static`.}
  IMPORTANCE_TOP_SLEEPING_PRE_28*: jint {.`static`.}
  IMPORTANCE_VISIBLE*: jint {.`static`.}
  IMPORTANCE_PERCEPTIBLE_PRE_26*: jint {.`static`.}
  IMPORTANCE_PERCEPTIBLE*: jint {.`static`.}
  IMPORTANCE_CANT_SAVE_STATE_PRE_26*: jint {.`static`.}
  IMPORTANCE_SERVICE*: jint {.`static`.}
  IMPORTANCE_TOP_SLEEPING*: jint {.`static`.}
  IMPORTANCE_CANT_SAVE_STATE*: jint {.`static`.}
  IMPORTANCE_CACHED*: jint {.`static`.}
  IMPORTANCE_BACKGROUND*: jint {.`static`.}
  IMPORTANCE_EMPTY*: jint {.`static`.}
  IMPORTANCE_GONE*: jint {.`static`.}
  importance*: jint
  lru*: jint
  REASON_UNKNOWN*: jint {.`static`.}
  REASON_PROVIDER_IN_USE*: jint {.`static`.}
  REASON_SERVICE_IN_USE*: jint {.`static`.}
  importanceReasonCode*: jint
  importanceReasonPid*: jint
  importanceReasonComponent*: ComponentName
  importanceReasonImportance*: jint
  processState*: jint
  isFocused*: jboolean
  lastActivityTime*: jlong
  CREATOR*: Creator[RunningAppProcessInfo] {.`static`.}


jclass android.app.AppTask* of JVMObject:
  proc finishAndRemoveTask*()
  proc getTaskInfo*(): RecentTaskInfo
  proc moveToFront*()
  proc startActivity*(context: Context, intent: Intent, options: Bundle)
  proc setExcludeFromRecents*(exclude: jboolean)

jclass android.app.PendingIntentInfo* of JVMObject:
  proc getCreatorPackage*(): string
  proc getCreatorUid*(): jint
  proc isImmutable*(): jboolean
  proc getIntentSenderType*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  CREATOR*: Creator[PendingIntentInfo] {.`static`.}

