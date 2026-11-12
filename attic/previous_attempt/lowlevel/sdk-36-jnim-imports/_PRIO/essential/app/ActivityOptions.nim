import jnim

jclass android.app.ActivityOptions* of ComponentOptions:
  proc makeCustomAnimation*(context: Context, enterResId: jint, exitResId: jint): ActivityOptions {.`static`.}
  proc makeCustomAnimation*(context: Context, enterResId: jint, exitResId: jint, backgroundColor: jint): ActivityOptions {.`static`.}
  proc makeCustomAnimation*(context: Context, enterResId: jint, exitResId: jint, backgroundColor: jint, handler: Handler, listener: OnAnimationStartedListener): ActivityOptions {.`static`.}
  proc makeCustomAnimation*(context: Context, enterResId: jint, exitResId: jint, backgroundColor: jint, handler: Handler, startedListener: OnAnimationStartedListener, finishedListener: OnAnimationFinishedListener): ActivityOptions {.`static`.}
  proc makeCustomTaskAnimation*(context: Context, enterResId: jint, exitResId: jint, handler: Handler, startedListener: OnAnimationStartedListener, finishedListener: OnAnimationFinishedListener): ActivityOptions {.`static`.}
  proc makeCustomInPlaceAnimation*(context: Context, animId: jint): ActivityOptions {.`static`.}
  proc setOnAnimationFinishedListener*(listener: IRemoteCallback)
  proc setOnAnimationAbortListener*(listener: IRemoteCallback)
  proc makeScaleUpAnimation*(source: View, startX: jint, startY: jint, width: jint, height: jint): ActivityOptions {.`static`.}
  proc makeClipRevealAnimation*(source: View, startX: jint, startY: jint, width: jint, height: jint): ActivityOptions {.`static`.}
  proc makeOpenCrossProfileAppsAnimation*(): ActivityOptions {.`static`.}
  proc makeThumbnailScaleUpAnimation*(source: View, thumbnail: Bitmap, startX: jint, startY: jint): ActivityOptions {.`static`.}
  proc makeMultiThumbFutureAspectScaleAnimation*(context: Context, handler: Handler, specsFuture: IAppTransitionAnimationSpecsFuture, listener: OnAnimationStartedListener, scaleUp: jboolean): ActivityOptions {.`static`.}
  proc makeThumbnailAspectScaleDownAnimation*(source: View, thumbnail: Bitmap, startX: jint, startY: jint, targetWidth: jint, targetHeight: jint, handler: Handler, listener: OnAnimationStartedListener): ActivityOptions {.`static`.}
  proc makeThumbnailAspectScaleDownAnimation*(source: View, specs: seq[AppTransitionAnimationSpec], handler: Handler, onAnimationStartedListener: OnAnimationStartedListener, onAnimationFinishedListener: OnAnimationFinishedListener): ActivityOptions {.`static`.}
  proc makeSceneTransitionAnimation*(activity: Activity, sharedElement: View, sharedElementName: string): ActivityOptions {.`static`.}
  proc makeSceneTransitionAnimation*(activity: Activity, sharedElements: Pair[View, string]): ActivityOptions {.`static`.}
  proc startSharedElementAnimation*(window: Window, exitCallbacks: ExitTransitionCallbacks, callback: SharedElementCallback, sharedElements: Pair[View, string]): Pair[ActivityOptions, ExitTransitionCoordinator] {.`static`.}
  proc stopSharedElementAnimation*(window: Window) {.`static`.}
  proc setExitTransitionTimeout*(timeoutMillis: jlong) {.`static`.}
  proc makeTaskLaunchBehind*(): ActivityOptions {.`static`.}
  proc makeBasic*(): ActivityOptions {.`static`.}
  proc makeRemoteAnimation*(remoteAnimationAdapter: RemoteAnimationAdapter): ActivityOptions {.`static`.}
  proc makeRemoteAnimation*(remoteAnimationAdapter: RemoteAnimationAdapter, remoteTransition: RemoteTransition): ActivityOptions {.`static`.}
  proc makeRemoteTransition*(remoteTransition: RemoteTransition): ActivityOptions {.`static`.}
  proc makeLaunchIntoPip*(pictureInPictureParams: PictureInPictureParams): ActivityOptions {.`static`.}
  proc getLaunchTaskBehind*(): jboolean
  proc setLaunchBounds*(screenSpacePixelRect: Rect): ActivityOptions
  proc getPackageName*(): string
  proc getLaunchBounds*(): Rect
  proc getAnimationType*(): jint
  proc getCustomEnterResId*(): jint
  proc getCustomExitResId*(): jint
  proc getCustomInPlaceResId*(): jint
  proc getCustomBackgroundColor*(): jint
  proc getThumbnail*(): HardwareBuffer
  proc getStartX*(): jint
  proc getStartY*(): jint
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc getAnimationStartedListener*(): IRemoteCallback
  proc getAnimationFinishedListener*(): IRemoteCallback
  proc abort*()
  proc setSceneTransitionInfo*(info: SceneTransitionInfo): ActivityOptions
  proc getSceneTransitionInfo*(): SceneTransitionInfo
  proc getUsageTimeReport*(): PendingIntent
  proc getAnimSpecs*(): seq[AppTransitionAnimationSpec]
  proc getSpecsFuture*(): IAppTransitionAnimationSpecsFuture
  proc getRemoteAnimationAdapter*(): RemoteAnimationAdapter
  proc setRemoteAnimationAdapter*(remoteAnimationAdapter: RemoteAnimationAdapter)
  proc getRemoteTransition*(): RemoteTransition
  proc setRemoteTransition*(remoteTransition: RemoteTransition): ActivityOptions
  proc fromBundle*(bOptions: Bundle): ActivityOptions {.`static`.}
  proc abort*(options: ActivityOptions) {.`static`.}
  proc hasLaunchTargetContainer*(options: ActivityOptions): jboolean {.`static`.}
  proc getLockTaskMode*(): jboolean
  proc isShareIdentityEnabled*(): jboolean
  proc getSplashScreenThemeResName*(): string
  proc getSplashScreenStyle*(): jint
  proc setSplashScreenStyle*(style: jint): ActivityOptions
  proc isEligibleForLegacyPermissionPrompt*(): jboolean
  proc setEligibleForLegacyPermissionPrompt*(eligible: jboolean)
  proc setLockTaskEnabled*(lockTaskMode: jboolean): ActivityOptions
  proc setShareIdentityEnabled*(shareIdentity: jboolean): ActivityOptions
  proc getLaunchDisplayId*(): jint
  proc setLaunchDisplayId*(launchDisplayId: jint): ActivityOptions
  proc getCallerDisplayId*(): jint
  proc setCallerDisplayId*(callerDisplayId: jint): ActivityOptions
  proc getLaunchTaskDisplayArea*(): WindowContainerToken
  proc setLaunchTaskDisplayArea*(windowContainerToken: WindowContainerToken): ActivityOptions
  proc getLaunchTaskDisplayAreaFeatureId*(): jint
  proc setLaunchTaskDisplayAreaFeatureId*(launchTaskDisplayAreaFeatureId: jint)
  proc getLaunchRootTask*(): WindowContainerToken
  proc setLaunchRootTask*(windowContainerToken: WindowContainerToken): ActivityOptions
  proc getLaunchTaskFragmentToken*(): IBinder
  proc setLaunchTaskFragmentToken*(taskFragmentToken: IBinder): ActivityOptions
  proc getLaunchWindowingMode*(): jint
  proc setLaunchWindowingMode*(windowingMode: jint)
  proc getLaunchIntoPipParams*(): PictureInPictureParams
  proc isLaunchIntoPip*(): jboolean
  proc isAllowPassThroughOnTouchOutside*(): jboolean
  proc setAllowPassThroughOnTouchOutside*(allowed: jboolean)
  proc getLaunchActivityType*(): jint
  proc setLaunchActivityType*(activityType: jint)
  proc setLaunchTaskId*(taskId: jint)
  proc getLaunchTaskId*(): jint
  proc setDisableStartingWindow*(disable: jboolean)
  proc getDisableStartingWindow*(): jboolean
  proc setPendingIntentLaunchFlags*(flags: jint)
  proc getPendingIntentLaunchFlags*(): jint
  proc setTaskAlwaysOnTop*(alwaysOnTop: jboolean)
  proc getTaskAlwaysOnTop*(): jboolean
  proc setTaskOverlay*(taskOverlay: jboolean, canResume: jboolean)
  proc getTaskOverlay*(): jboolean
  proc canTaskOverlayResume*(): jboolean
  proc setAvoidMoveToFront*()
  proc getAvoidMoveToFront*(): jboolean
  proc setFreezeRecentTasksReordering*()
  proc freezeRecentTasksReordering*(): jboolean
  proc setSplitScreenCreateMode*(splitScreenCreateMode: jint)
  proc setDisallowEnterPictureInPictureWhileLaunching*(disallow: jboolean)
  proc disallowEnterPictureInPictureWhileLaunching*(): jboolean
  proc setApplyActivityFlagsForBubbles*(apply: jboolean)
  proc isApplyActivityFlagsForBubbles*(): jboolean
  proc setApplyMultipleTaskFlagForShortcut*(apply: jboolean)
  proc isApplyMultipleTaskFlagForShortcut*(): jboolean
  proc setApplyNoUserActionFlagForShortcut*(apply: jboolean)
  proc isApplyNoUserActionFlagForShortcut*(): jboolean
  proc setLaunchCookie*(launchCookie: LaunchCookie)
  proc setLaunchCookie*(launchCookie: IBinder)
  proc getLaunchCookie*(): IBinder
  proc setOverrideTaskTransition*(allowTaskOverride: jboolean): ActivityOptions
  proc getOverrideTaskTransition*(): jboolean
  proc setRemoveWithTaskOrganizer*(remove: jboolean)
  proc getRemoveWithTaskOranizer*(): jboolean
  proc setLaunchedFromBubble*(fromBubble: jboolean)
  proc getLaunchedFromBubble*(): jboolean
  proc setTransientLaunch*(): ActivityOptions
  proc getTransientLaunch*(): jboolean
  proc setDismissKeyguardIfInsecure*()
  proc getDismissKeyguardIfInsecure*(): jboolean
  proc setPendingIntentCreatorBackgroundActivityStartMode*(mode: jint): ActivityOptions
  proc getPendingIntentCreatorBackgroundActivityStartMode*(): jint
  proc setFlexibleLaunchSize*(isFlexible: jboolean): ActivityOptions
  proc getFlexibleLaunchSize*(): jboolean
  proc update*(otherOptions: ActivityOptions)
  proc toBundle*(): Bundle
  proc requestUsageTimeReport*(receiver: PendingIntent)
  proc getSourceInfo*(): SourceInfo
  proc setSourceInfo*(type: jint, uptimeMillis: jlong)
  proc forTargetActivity*(): ActivityOptions
  proc getRotationAnimationHint*(): jint
  proc setRotationAnimationHint*(hint: jint)
  proc popAppVerificationBundle*(): Bundle
  proc setAppVerificationBundle*(bundle: Bundle): ActivityOptions
  proc setPendingIntentBackgroundActivityStartMode*(state: jint): ActivityOptions
  proc getPendingIntentBackgroundActivityStartMode*(): jint
  proc setPendingIntentBackgroundActivityLaunchAllowed*(allowed: jboolean)
  proc isPendingIntentBackgroundActivityLaunchAllowed*(): jboolean
  proc toString*(): string
  EXTRA_USAGE_TIME_REPORT*: string {.`static`.}
  EXTRA_USAGE_TIME_REPORT_PACKAGES*: string {.`static`.}
  MODE_BACKGROUND_ACTIVITY_START_SYSTEM_DEFINED*: jint {.`static`.}
  MODE_BACKGROUND_ACTIVITY_START_ALLOWED*: jint {.`static`.}
  MODE_BACKGROUND_ACTIVITY_START_DENIED*: jint {.`static`.}
  MODE_BACKGROUND_ACTIVITY_START_ALLOW_ALWAYS*: jint {.`static`.}
  MODE_BACKGROUND_ACTIVITY_START_ALLOW_IF_VISIBLE*: jint {.`static`.}
  MODE_BACKGROUND_ACTIVITY_START_COMPAT*: jint {.`static`.}
  KEY_PACKAGE_NAME*: string {.`static`.}
  KEY_LAUNCH_BOUNDS*: string {.`static`.}
  KEY_ANIM_TYPE*: string {.`static`.}
  KEY_ANIM_ENTER_RES_ID*: string {.`static`.}
  KEY_ANIM_EXIT_RES_ID*: string {.`static`.}
  KEY_ANIM_IN_PLACE_RES_ID*: string {.`static`.}
  KEY_ANIM_BACKGROUND_COLOR*: string {.`static`.}
  KEY_ANIM_THUMBNAIL*: string {.`static`.}
  KEY_ANIM_START_X*: string {.`static`.}
  KEY_ANIM_START_Y*: string {.`static`.}
  KEY_ANIM_WIDTH*: string {.`static`.}
  KEY_ANIM_HEIGHT*: string {.`static`.}
  KEY_ANIM_START_LISTENER*: string {.`static`.}
  KEY_SPLASH_SCREEN_THEME*: string {.`static`.}
  KEY_LEGACY_PERMISSION_PROMPT_ELIGIBLE*: string {.`static`.}
  KEY_LAUNCH_ROOT_TASK_TOKEN*: string {.`static`.}
  KEY_LAUNCH_TASK_FRAGMENT_TOKEN*: string {.`static`.}
  KEY_TRANSIENT_LAUNCH*: string {.`static`.}
  KEY_LAUNCH_COOKIE*: string {.`static`.}
  ANIM_UNDEFINED*: jint {.`static`.}
  ANIM_NONE*: jint {.`static`.}
  ANIM_CUSTOM*: jint {.`static`.}
  ANIM_SCALE_UP*: jint {.`static`.}
  ANIM_THUMBNAIL_SCALE_UP*: jint {.`static`.}
  ANIM_THUMBNAIL_SCALE_DOWN*: jint {.`static`.}
  ANIM_SCENE_TRANSITION*: jint {.`static`.}
  ANIM_DEFAULT*: jint {.`static`.}
  ANIM_LAUNCH_TASK_BEHIND*: jint {.`static`.}
  ANIM_THUMBNAIL_ASPECT_SCALE_UP*: jint {.`static`.}
  ANIM_THUMBNAIL_ASPECT_SCALE_DOWN*: jint {.`static`.}
  ANIM_CUSTOM_IN_PLACE*: jint {.`static`.}
  ANIM_CLIP_REVEAL*: jint {.`static`.}
  ANIM_OPEN_CROSS_PROFILE_APPS*: jint {.`static`.}
  ANIM_REMOTE_ANIMATION*: jint {.`static`.}
  ANIM_FROM_STYLE*: jint {.`static`.}

jclass android.app.ActivityOptions.LaunchCookie* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(in: Parcel): LaunchCookie {.`static`.}
  proc writeToParcel*(launchCookie: LaunchCookie, output:Parcel) {.`static`.}
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint

jclass android.app.ActivityOptions.SourceInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint

jclass android.app.ActivityOptions.SceneTransitionInfo* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc setReturning*(isReturning: jboolean)
  proc isReturning*(): jboolean
  proc setResultCode*(resultCode: jint)
  proc getResultCode*(): jint
  proc setResultData*(resultData: Intent)
  proc getResultData*(): Intent
  proc setSharedElementNames*(sharedElementNames: ArrayList[string])
  proc getSharedElementNames*(): ArrayList[string]
  proc setResultReceiver*(resultReceiver: ResultReceiver)
  proc getResultReceiver*(): ResultReceiver
  proc setExitCoordinatorKey*(exitCoordinatorKey: jint)
  proc getExitCoordinatorKey*(): jint
  proc toString*(): string



jclass android.app.LaunchCookie* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(in: Parcel): LaunchCookie {.`static`.}
  proc writeToParcel*(launchCookie: LaunchCookie, output:Parcel) {.`static`.}
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  binder*: IBinder
  CREATOR*: Parcelable.Creator[LaunchCookie] {.`static`.}

jclass android.app.SourceInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  TYPE_LAUNCHER*: jint {.`static`.}
  TYPE_NOTIFICATION*: jint {.`static`.}
  TYPE_LOCKSCREEN*: jint {.`static`.}
  TYPE_RECENTS_ANIMATION*: jint {.`static`.}
  TYPE_DESKTOP_ANIMATION*: jint {.`static`.}
  typ*: jint
  eventTimeMs*: jlong
  CREATOR*: Creator[SourceInfo] {.`static`.}

jclass android.app.SceneTransitionInfo* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc setReturning*(isReturning: jboolean)
  proc isReturning*(): jboolean
  proc setResultCode*(resultCode: jint)
  proc getResultCode*(): jint
  proc setResultData*(resultData: Intent)
  proc getResultData*(): Intent
  proc setSharedElementNames*(sharedElementNames: ArrayList[string])
  proc getSharedElementNames*(): ArrayList[string]
  proc setResultReceiver*(resultReceiver: ResultReceiver)
  proc getResultReceiver*(): ResultReceiver
  proc setExitCoordinatorKey*(exitCoordinatorKey: jint)
  proc getExitCoordinatorKey*(): jint
  proc toString*(): string
  CREATOR*: Creator[SceneTransitionInfo] {.`static`.}

