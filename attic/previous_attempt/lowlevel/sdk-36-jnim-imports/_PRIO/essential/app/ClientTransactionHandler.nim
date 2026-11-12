import jnim

jclass android.app.ClientTransactionHandler* of JVMObject:
  proc executeTransaction*(transaction: ClientTransaction)
  proc isExecutingLocalTransaction*(): jboolean
  proc getActivity*(token: IBinder): Activity
  proc updatePendingConfiguration*(config: Configuration)
  proc updateProcessState*(processState: jint, fromIpc: jboolean)
  proc countLaunchingActivities*(num: jint)
  proc getActivitiesToBeDestroyed*(): Map[IBinder, DestroyActivityItem]
  proc handleDestroyActivity*(r: ActivityClientRecord, finishing: jboolean, getNonConfigInstance: jboolean, reason: string)
  proc handlePauseActivity*(r: ActivityClientRecord, finished: jboolean, userLeaving: jboolean, autoEnteringPip: jboolean, pendingActions: PendingTransactionActions, reason: string)
  proc handleResumeActivity*(r: ActivityClientRecord, finalStateRequest: jboolean, isForward: jboolean, shouldSendCompatFakeFocus: jboolean, reason: string)
  proc handleTopResumedActivityChanged*(r: ActivityClientRecord, isTopResumedActivity: jboolean, reason: string)
  proc handleStopActivity*(r: ActivityClientRecord, pendingActions: PendingTransactionActions, finalStateRequest: jboolean, reason: string)
  proc reportStop*(pendingActions: PendingTransactionActions)
  proc performRestartActivity*(r: ActivityClientRecord, start: jboolean)
  proc reportRefresh*(r: ActivityClientRecord)
  proc updatePendingActivityConfiguration*(token: IBinder, overrideConfig: Configuration)
  proc handleActivityConfigurationChanged*(r: ActivityClientRecord, overrideConfig: Configuration, displayId: jint, activityWindowInfo: ActivityWindowInfo)
  proc handleWindowContextInfoChanged*(clientToken: IBinder, info: WindowContextInfo)
  proc handleWindowContextWindowRemoval*(clientToken: IBinder)
  proc handleSendResult*(r: ActivityClientRecord, results: List[ResultInfo], reason: string)
  proc handleNewIntent*(r: ActivityClientRecord, intents: List[ReferrerIntent])
  proc handlePictureInPictureRequested*(r: ActivityClientRecord)
  proc handlePictureInPictureStateChanged*(r: ActivityClientRecord, pipState: PictureInPictureUiState)
  proc isHandleSplashScreenExit*(token: IBinder): jboolean
  proc handleAttachSplashScreenView*(r: ActivityClientRecord, parcelable: SplashScreenViewParcelable, startingWindowLeash: SurfaceControl)
  proc handleLaunchActivity*(r: ActivityClientRecord, pendingActions: PendingTransactionActions, deviceId: jint, customIntent: Intent): Activity
  proc handleStartActivity*(r: ActivityClientRecord, pendingActions: PendingTransactionActions, sceneTransitionInfo: SceneTransitionInfo)
  proc getPackageInfoNoCheck*(ai: ApplicationInfo): LoadedApk
  proc handleConfigurationChanged*(config: Configuration, deviceId: jint)
  proc getActivityClient*(token: IBinder): ActivityClientRecord
  proc prepareRelaunchActivity*(token: IBinder, pendingResults: List[ResultInfo], pendingNewIntents: List[ReferrerIntent], configChanges: jint, config: MergedConfiguration, preserveWindow: jboolean, activityWindowInfo: ActivityWindowInfo): ActivityClientRecord
  proc handleRelaunchActivity*(r: ActivityClientRecord, pendingActions: PendingTransactionActions)
  proc reportRelaunch*(r: ActivityClientRecord)

