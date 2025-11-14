import jnim

jclass android.app.ActivityManagerInternal* of JVMObject:
  proc getAppProfileStatsForDebugging*(time: jlong, lines: jint): Pair[string, string]
  proc checkContentProviderAccess*(authority: string, userId: jint): string
  proc checkContentProviderUriPermission*(uri: Uri, userId: jint, callingUid: jint, modeFlags: jint): jint
  proc onWakefulnessChanged*(wakefulness: jint)
  proc startIsolatedProcess*(entryPoint: string, mainArgs: seq[string], processName: string, abiOverride: string, uid: jint, crashHandler: Runnable): jboolean
  proc onUserRemoving*(userId: jint)
  proc onUserRemoved*(userId: jint)
  proc startUserInBackground*(userId: jint): jboolean
  proc killForegroundAppsForUser*(userId: jint)
  proc setPendingIntentAllowlistDuration*(target: IIntentSender, allowlistToken: IBinder, duration: jlong, type: jint, reasonCode: jint, reason: string)
  proc getPendingIntentFlags*(target: IIntentSender): jint
  proc setPendingIntentAllowBgActivityStarts*(target: IIntentSender, allowlistToken: IBinder, flags: jint)
  proc clearPendingIntentAllowBgActivityStarts*(target: IIntentSender, allowlistToken: IBinder)
  proc setDeviceIdleAllowlist*(allAppids: seq[jint], exceptIdleAppids: seq[jint])
  proc updateDeviceIdleTempAllowlist*(appids: seq[jint], changingUid: jint, adding: jboolean, durationMs: jlong, type: jint, reasonCode: jint, reason: string, callingUid: jint)
  proc getUidProcessState*(uid: jint): jint
  proc getProcessesWithPendingBindMounts*(userId: jint): Map[Integer, string]
  proc isSystemReady*(): jboolean
  proc enforceBroadcastOptionsPermissions*(options: Bundle, callingUid: jint)
  proc getPackageNameByPid*(pid: jint): string
  proc setHasOverlayUi*(pid: jint, hasOverlayUi: jboolean)
  proc notifyNetworkPolicyRulesUpdated*(uid: jint, procStateSeq: jlong)
  proc onUidBlockedReasonsChanged*(uid: jint, blockedReasons: jint)
  proc isRuntimeRestarted*(): jboolean
  proc canStartMoreUsers*(): jboolean
  proc setSwitchingFromUserMessage*(user: jint, message: string)
  proc setSwitchingToUserMessage*(user: jint, message: string)
  proc getMaxRunningUsers*(): jint
  proc isUidActive*(uid: jint): jboolean
  proc getMemoryStateForProcesses*(): List[ProcessMemoryState]
  proc handleIncomingUser*(callingPid: jint, callingUid: jint, userId: jint, allowAll: jboolean, allowMode: jint, name: string, callerPackage: string): jint
  proc enforceCallingPermission*(permission: string, func: string)
  proc getCurrentAndTargetUserIds*(): Pair[Integer, Integer]
  proc getCurrentUserId*(): jint
  proc getStartedUserIds*(): seq[jint]
  proc isUserRunning*(userId: jint, flags: jint): jboolean
  proc trimApplications*()
  proc killProcessesForRemovedTask*(procsToKill: ArrayList[JObject])
  proc killProcess*(processName: string, uid: jint, reason: string)
  proc hasRunningActivity*(uid: jint, packageName: string): jboolean
  proc updateOomAdj*(oomAdjReason: jint)
  proc updateCpuStats*()
  proc updateBatteryStats*(activity: ComponentName, uid: jint, userId: jint, resumed: jboolean)
  proc updateActivityUsageStats*(activity: ComponentName, userId: jint, event: jint, appToken: IBinder, taskRoot: ComponentName, activityId: ActivityId)
  proc updateForegroundTimeIfOnBattery*(packageName: string, uid: jint, cpuTimeDiff: jlong)
  proc sendForegroundProfileChanged*(userId: jint)
  proc shouldConfirmCredentials*(userId: jint): jboolean
  proc noteAlarmFinish*(ps: PendingIntent, workSource: WorkSource, sourceUid: jint, tag: string)
  proc noteAlarmStart*(ps: PendingIntent, workSource: WorkSource, sourceUid: jint, tag: string)
  proc noteWakeupAlarm*(ps: PendingIntent, workSource: WorkSource, sourceUid: jint, sourcePkg: string, tag: string)
  proc isAppStartModeDisabled*(uid: jint, packageName: string): jboolean
  proc getCurrentProfileIds*(): seq[jint]
  proc getCurrentUser*(): UserInfo
  proc ensureNotSpecialUser*(userId: jint)
  proc isCurrentProfile*(userId: jint): jboolean
  proc hasStartedUserState*(userId: jint): jboolean
  proc finishUserSwitch*(uss: JObject)
  proc scheduleAppGcs*()
  proc getTaskIdForActivity*(token: IBinder, onlyRoot: jboolean): jint
  proc getActivityPresentationInfo*(token: IBinder): ActivityPresentationInfo
  proc setBooting*(booting: jboolean)
  proc isBooting*(): jboolean
  proc setBooted*(booted: jboolean)
  proc isBooted*(): jboolean
  proc finishBooting*()
  proc tempAllowlistForPendingIntent*(callerPid: jint, callerUid: jint, targetUid: jint, duration: jlong, type: jint, reasonCode: jint, reason: string)
  proc broadcastIntentInPackage*(packageName: string, featureId: string, uid: jint, realCallingUid: jint, realCallingPid: jint, intent: Intent, resolvedType: string, resultToThread: IApplicationThread, resultTo: IIntentReceiver, resultCode: jint, resultData: string, resultExtras: Bundle, requiredPermission: string, bOptions: Bundle, serialized: jboolean, sticky: jboolean, userId: jint, backgroundStartPrivileges: BackgroundStartPrivileges, broadcastAllowList: seq[jint]): jint
  proc startServiceInPackage*(uid: jint, service: Intent, resolvedType: string, fgRequired: jboolean, callingPackage: string, callingFeatureId: string, userId: jint, backgroundStartPrivileges: BackgroundStartPrivileges): ComponentName
  proc disconnectActivityFromServices*(connectionHolder: JObject)
  proc cleanUpServices*(userId: jint, component: ComponentName, baseIntent: Intent)
  proc getActivityInfoForUser*(aInfo: ActivityInfo, userId: jint): ActivityInfo
  proc ensureBootCompleted*()
  proc updateOomLevelsForDisplay*(displayId: jint)
  proc isActivityStartsLoggingEnabled*(): jboolean
  proc isBackgroundActivityStartsEnabled*(): jboolean
  proc getBackgroundStartPrivileges*(uid: jint): BackgroundStartPrivileges
  proc reportCurKeyguardUsageEvent*(keyguardShowing: jboolean)
  proc canScheduleUserInitiatedJobs*(uid: jint, pid: jint, pkgName: string): jboolean
  proc monitor*()
  proc inputDispatchingTimedOut*(pid: jint, aboveSystem: jboolean, timeoutRecord: TimeoutRecord): jlong
  proc inputDispatchingTimedOut*(proc: JObject, activityShortComponentName: string, aInfo: ApplicationInfo, parentShortComponentName: string, parentProc: JObject, aboveSystem: jboolean, timeoutRecord: TimeoutRecord): jboolean
  proc inputDispatchingResumed*(pid: jint)
  proc rescheduleAnrDialog*(data: JObject)
  proc broadcastGlobalConfigurationChanged*(changes: jint, initLocale: jboolean)
  proc broadcastCloseSystemDialogs*(reason: string)
  proc appNotResponding*(processName: string, uid: jint, timeoutRecord: TimeoutRecord)
  proc killAllBackgroundProcessesExcept*(minTargetSdk: jint, maxProcState: jint)
  proc startProcess*(processName: string, info: ApplicationInfo, knownToBeDead: jboolean, isTop: jboolean, hostingType: string, hostingName: ComponentName)
  proc setDebugFlagsForStartingActivity*(aInfo: ActivityInfo, startFlags: jint, profilerInfo: ProfilerInfo, wmLock: JObject)
  proc getStorageMountMode*(pid: jint, uid: jint): jint
  proc isAppForeground*(uid: jint): jboolean
  proc isAppBad*(processName: string, uid: jint): jboolean
  proc clearPendingBackup*(userId: jint)
  proc prepareForPossibleShutdown*()
  proc hasRunningForegroundService*(uid: jint, foregroundServiceType: jint): jboolean
  proc hasForegroundServiceNotification*(pkg: string, userId: jint, channelId: string): jboolean
  proc applyForegroundServiceNotification*(notification: Notification, tag: string, id: jint, pkg: string, userId: jint): ServiceNotificationPolicy
  proc onForegroundServiceNotificationUpdate*(shown: jboolean, notification: Notification, id: jint, pkg: string, userId: jint)
  proc stopAppForUser*(pkg: string, userId: jint)
  proc registerProcessObserver*(processObserver: IProcessObserver)
  proc unregisterProcessObserver*(processObserver: IProcessObserver)
  proc getInstrumentationSourceUid*(uid: jint): jint
  proc isDeviceOwner*(uid: jint): jboolean
  proc setDeviceOwnerUid*(uid: jint)
  proc isProfileOwner*(uid: jint): jboolean
  proc setProfileOwnerUid*(profileOwnerUids: ArraySet[Integer])
  proc setCompanionAppUids*(userId: jint, companionAppUids: Set[Integer])
  proc isAssociatedCompanionApp*(userId: jint, uid: jint): jboolean
  proc broadcastIntent*(intent: Intent, resultTo: IIntentReceiver, requiredPermissions: seq[string], serialized: jboolean, userId: jint, appIdAllowList: seq[jint], filterExtrasForReceiver: BiFunction[Integer, Bundle, Bundle], bOptions: Bundle): jint
  proc broadcastIntentWithCallback*(intent: Intent, resultTo: IIntentReceiver, requiredPermissions: seq[string], userId: jint, appIdAllowList: seq[jint], filterExtrasForReceiver: BiFunction[Integer, Bundle, Bundle], bOptions: Bundle): jint
  proc addPendingTopUid*(uid: jint, pid: jint, thread: IApplicationThread)
  proc deletePendingTopUid*(uid: jint, nowElapsed: jlong)
  proc isPendingTopUid*(uid: jint): jboolean
  proc getIntentForIntentSender*(sender: IIntentSender): Intent
  proc getPendingIntentActivityAsApp*(requestCode: jint, intent: Intent, flags: jint, options: Bundle, ownerPkgName: string, ownerUid: jint): PendingIntent
  proc getPendingIntentActivityAsApp*(requestCode: jint, intents: seq[Intent], flags: jint, options: Bundle, ownerPkgName: string, ownerUid: jint): PendingIntent
  proc getBootTimeTempAllowListDuration*(): jlong
  proc registerAnrController*(controller: AnrController)
  proc unregisterAnrController*(controller: AnrController)
  proc isTempAllowlistedForFgsWhileInUse*(uid: jint): jboolean
  proc getPushMessagingOverQuotaBehavior*(): jint
  proc getServiceStartForegroundTimeout*(): jint
  proc getUidCapability*(uid: jint): jint
  proc getIsolatedProcesses*(uid: jint): List[Integer]
  proc sendIntentSender*(target: IIntentSender, allowlistToken: IBinder, code: jint, intent: Intent, resolvedType: string, finishedReceiver: IIntentReceiver, requiredPermission: string, options: Bundle): jint
  proc setVoiceInteractionManagerProvider*(provider: VoiceInteractionManagerProvider)
  proc isEarlyPackageKillEnabledForUserSwitch*(fromUserId: jint, toUserId: jint): jboolean
  proc setStopUserOnSwitch*(value: jint)
  proc getRestrictionLevel*(uid: jint): jint
  proc getRestrictionLevel*(pkg: string, userId: jint): jint
  proc isBgAutoRestrictedBucketFeatureFlagEnabled*(): jboolean
  proc addAppBackgroundRestrictionListener*(listener: AppBackgroundRestrictionListener)
  proc addForegroundServiceStateListener*(listener: ForegroundServiceStateListener)
  proc addBroadcastEventListener*(listener: BroadcastEventListener)
  proc addBindServiceEventListener*(listener: BindServiceEventListener)
  proc restart*()
  proc getPendingIntentStats*(): List[PendingIntentStats]
  proc registerNetworkPolicyUidObserver*(observer: IUidObserver, which: jint, cutpoint: jint, callingPackage: string)
  proc getClientPackages*(servicePackageName: string): ArraySet[string]
  proc triggerUnsafeIntentStrictMode*(callingPid: jint, type: jint, intent: Intent)
  proc startForegroundServiceDelegate*(options: ForegroundServiceDelegationOptions, connection: ServiceConnection): jboolean
  proc stopForegroundServiceDelegate*(options: ForegroundServiceDelegationOptions)
  proc stopForegroundServiceDelegate*(connection: ServiceConnection)
  proc notifyInactiveMediaForegroundService*(packageName: string, userId: jint, notificationId: jint)
  proc notifyActiveMediaForegroundService*(packageName: string, userId: jint, notificationId: jint)
  proc startProfileEvenWhenDisabled*(userId: jint): jboolean
  proc logFgsApiBegin*(apiType: jint, uid: jint, pid: jint)
  proc logFgsApiEnd*(apiType: jint, uid: jint, pid: jint)
  proc canStartForegroundService*(pid: jint, uid: jint, packageName: string): jboolean
  proc canAllowWhileInUsePermissionInFgs*(pid: jint, uid: jint, packageName: string): jboolean
  proc tempAllowWhileInUsePermissionInFgs*(uid: jint, durationMs: jlong)
  proc notifyMediaProjectionEvent*(uid: jint, projectionToken: IBinder, event: jint)
  proc getCachedAppsHighWatermarkStats*(atomTag: jint, resetAfterPull: jboolean): JObject
  proc clearApplicationUserData*(packageName: string, keepState: jboolean, isRestore: jboolean, observer: IPackageDataObserver, userId: jint): jboolean
  proc shouldDelayHomeLaunch*(userId: jint): jboolean
  proc addFrozenProcessListener*(pid: jint, executor: Executor, listener: FrozenProcessListener)
  proc addStartInfoTimestamp*(key: jint, timestampNs: jlong, uid: jint, pid: jint, userId: jint)
  proc killApplicationSync*(pkgName: string, appId: jint, userId: jint, reason: string, exitInfoReason: jint)
  proc getExecutableMethodFileOffsets*(processName: string, pid: jint, uid: jint, methodDescriptor: MethodDescriptor, callback: IOffsetCallback)
  proc addCreatorToken*(intent: Intent, creatorPackage: string)
  ALLOW_NON_FULL*: jint {.`static`.}
  ALLOW_NON_FULL_IN_PROFILE*: jint {.`static`.}
  ALLOW_FULL_ONLY*: jint {.`static`.}
  ALLOW_PROFILES_OR_NON_FULL*: jint {.`static`.}
  OOM_ADJ_REASON_NONE*: jint {.`static`.}
  OOM_ADJ_REASON_ACTIVITY*: jint {.`static`.}
  OOM_ADJ_REASON_FINISH_RECEIVER*: jint {.`static`.}
  OOM_ADJ_REASON_START_RECEIVER*: jint {.`static`.}
  OOM_ADJ_REASON_BIND_SERVICE*: jint {.`static`.}
  OOM_ADJ_REASON_UNBIND_SERVICE*: jint {.`static`.}
  OOM_ADJ_REASON_START_SERVICE*: jint {.`static`.}
  OOM_ADJ_REASON_GET_PROVIDER*: jint {.`static`.}
  OOM_ADJ_REASON_REMOVE_PROVIDER*: jint {.`static`.}
  OOM_ADJ_REASON_UI_VISIBILITY*: jint {.`static`.}
  OOM_ADJ_REASON_ALLOWLIST*: jint {.`static`.}
  OOM_ADJ_REASON_PROCESS_BEGIN*: jint {.`static`.}
  OOM_ADJ_REASON_PROCESS_END*: jint {.`static`.}
  OOM_ADJ_REASON_SHORT_FGS_TIMEOUT*: jint {.`static`.}
  OOM_ADJ_REASON_SYSTEM_INIT*: jint {.`static`.}
  OOM_ADJ_REASON_BACKUP*: jint {.`static`.}
  OOM_ADJ_REASON_SHELL*: jint {.`static`.}
  OOM_ADJ_REASON_REMOVE_TASK*: jint {.`static`.}
  OOM_ADJ_REASON_UID_IDLE*: jint {.`static`.}
  OOM_ADJ_REASON_STOP_SERVICE*: jint {.`static`.}
  OOM_ADJ_REASON_EXECUTING_SERVICE*: jint {.`static`.}
  OOM_ADJ_REASON_RESTRICTION_CHANGE*: jint {.`static`.}
  OOM_ADJ_REASON_COMPONENT_DISABLED*: jint {.`static`.}
  OOM_ADJ_REASON_FOLLOW_UP*: jint {.`static`.}
  OOM_ADJ_REASON_RECONFIGURATION*: jint {.`static`.}
  MEDIA_PROJECTION_TOKEN_EVENT_CREATED*: jint {.`static`.}
  MEDIA_PROJECTION_TOKEN_EVENT_DESTROYED*: jint {.`static`.}





