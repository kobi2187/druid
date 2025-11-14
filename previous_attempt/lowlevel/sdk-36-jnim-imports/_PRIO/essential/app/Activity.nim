import jnim

jclass android.app.Activity* of ContextThemeWrapper:
  proc getIntent*(): Intent
  proc setIntent*(newIntent: Intent)
  proc getCaller*(): ComponentCaller
  proc setIntent*(newIntent: Intent, newCaller: ComponentCaller)
  proc setLocusContext*(locusId: LocusId, bundle: Bundle)
  proc requestOpenInBrowserEducation*()
  proc getApplication*(): Application
  proc isChild*(): jboolean
  proc getParent*(): Activity
  proc getWindowManager*(): WindowManager
  proc getWindow*(): Window
  proc getLoaderManager*(): LoaderManager
  proc getCurrentFocus*(): View
  proc getAutofillClient*(): AutofillClient
  proc getContentCaptureClient*(): ContentCaptureClient
  proc registerActivityLifecycleCallbacks*(callback: Application.ActivityLifecycleCallbacks)
  proc unregisterActivityLifecycleCallbacks*(callback: Application.ActivityLifecycleCallbacks)
  proc registerComponentCallbacks*(callback: ComponentCallbacks)
  proc unregisterComponentCallbacks*(callback: ComponentCallbacks)
  proc getSplashScreen*(): SplashScreen
  proc onCreate*(savedInstanceState: Bundle, persistentState: PersistableBundle)
  proc onRestoreInstanceState*(savedInstanceState: Bundle, persistentState: PersistableBundle)
  proc onPostCreate*(savedInstanceState: Bundle, persistentState: PersistableBundle)
  proc onStateNotSaved*()
  proc onTopResumedActivityChanged*(isTopResumedActivity: jboolean)
  proc getNextAutofillId*(): jint
  proc isVoiceInteraction*(): jboolean
  proc isVoiceInteractionRoot*(): jboolean
  proc getVoiceInteractor*(): VoiceInteractor
  proc isLocalVoiceInteractionSupported*(): jboolean
  proc startLocalVoiceInteraction*(privateOptions: Bundle)
  proc onLocalVoiceInteractionStarted*()
  proc onLocalVoiceInteractionStopped*()
  proc stopLocalVoiceInteraction*()
  proc onNewIntent*(intent: Intent, caller: ComponentCaller)
  proc onSaveInstanceState*(outState: Bundle, outPersistentState: PersistableBundle)
  proc onCreateThumbnail*(outBitmap: Bitmap, canvas: Canvas): jboolean
  proc onCreateDescription*(): CharSequence
  proc onProvideAssistData*(data: Bundle)
  proc onProvideAssistContent*(outContent: AssistContent)
  proc onGetDirectActions*(cancellationSignal: CancellationSignal, callback: Consumer[List[DirectAction]])
  proc onPerformDirectAction*(actionId: string, arguments: Bundle, cancellationSignal: CancellationSignal, resultListener: Consumer[Bundle])
  proc requestShowKeyboardShortcuts*()
  proc dismissKeyboardShortcutsHelper*()
  proc onProvideKeyboardShortcuts*(data: List[KeyboardShortcutGroup], menu: Menu, deviceId: jint)
  proc showAssist*(args: Bundle): jboolean
  proc reportFullyDrawn*()
  proc onMultiWindowModeChanged*(isInMultiWindowMode: jboolean, newConfig: Configuration)
  proc onMultiWindowModeChanged*(isInMultiWindowMode: jboolean)
  proc isInMultiWindowMode*(): jboolean
  proc onPictureInPictureModeChanged*(isInPictureInPictureMode: jboolean, newConfig: Configuration)
  proc onPictureInPictureUiStateChanged*(pipState: PictureInPictureUiState)
  proc onPictureInPictureModeChanged*(isInPictureInPictureMode: jboolean)
  proc isInPictureInPictureMode*(): jboolean
  proc enterPictureInPictureMode*()
  proc enterPictureInPictureMode*(params: PictureInPictureParams): jboolean
  proc setPictureInPictureParams*(params: PictureInPictureParams)
  proc getMaxNumPictureInPictureActions*(): jint
  proc onPictureInPictureRequested*(): jboolean
  proc requestFullscreenMode*(request: jint, approvalCallback: OutcomeReceiver[Void, Throwable])
  proc setShouldDockBigOverlays*(shouldDockBigOverlays: jboolean)
  proc shouldDockBigOverlays*(): jboolean
  proc onMovedToDisplay*(displayId: jint, config: Configuration)
  proc onConfigurationChanged*(newConfig: Configuration)
  proc getChangingConfigurations*(): jint
  proc getLastNonConfigurationInstance*(): JObject
  proc onRetainNonConfigurationInstance*(): JObject
  proc onLowMemory*()
  proc onTrimMemory*(level: jint)
  proc getFragmentManager*(): FragmentManager
  proc onAttachFragment*(fragment: Fragment)
  proc managedQuery*(uri: Uri, projection: seq[string], selection: string, sortOrder: string): Cursor
  proc managedQuery*(uri: Uri, projection: seq[string], selection: string, selectionArgs: seq[string], sortOrder: string): Cursor
  proc startManagingCursor*(c: Cursor)
  proc stopManagingCursor*(c: Cursor)
  proc setPersistent*(isPersistent: jboolean)
  proc findViewById*(id: jint): T
  proc requireViewById*(id: jint): T
  proc getActionBar*(): ActionBar
  proc setActionBar*(toolbar: Toolbar)
  proc setContentView*(layoutResID: jint)
  proc setContentView*(view: View)
  proc setContentView*(view: View, params: ViewGroup.LayoutParams)
  proc addContentView*(view: View, params: ViewGroup.LayoutParams)
  proc getContentTransitionManager*(): TransitionManager
  proc setContentTransitionManager*(tm: TransitionManager)
  proc getContentScene*(): Scene
  proc setFinishOnTouchOutside*(finish: jboolean)
  proc setDefaultKeyMode*(mode: jint)
  proc onKeyDown*(keyCode: jint, event: KeyEvent): jboolean
  proc onKeyLongPress*(keyCode: jint, event: KeyEvent): jboolean
  proc onKeyUp*(keyCode: jint, event: KeyEvent): jboolean
  proc onKeyMultiple*(keyCode: jint, repeatCount: jint, event: KeyEvent): jboolean
  proc onBackPressed*()
  proc onKeyShortcut*(keyCode: jint, event: KeyEvent): jboolean
  proc onTouchEvent*(event: MotionEvent): jboolean
  proc onTrackballEvent*(event: MotionEvent): jboolean
  proc onGenericMotionEvent*(event: MotionEvent): jboolean
  proc onUserInteraction*()
  proc onWindowAttributesChanged*(params: WindowManager.LayoutParams)
  proc onContentChanged*()
  proc onWindowFocusChanged*(hasFocus: jboolean)
  proc onAttachedToWindow*()
  proc onDetachedFromWindow*()
  proc hasWindowFocus*(): jboolean
  proc onWindowDismissed*(finishTask: jboolean, suppressWindowTransition: jboolean)
  proc dispatchKeyEvent*(event: KeyEvent): jboolean
  proc dispatchKeyShortcutEvent*(event: KeyEvent): jboolean
  proc dispatchTouchEvent*(ev: MotionEvent): jboolean
  proc dispatchTrackballEvent*(ev: MotionEvent): jboolean
  proc dispatchGenericMotionEvent*(ev: MotionEvent): jboolean
  proc dispatchPopulateAccessibilityEvent*(event: AccessibilityEvent): jboolean
  proc onCreatePanelView*(featureId: jint): View
  proc onCreatePanelMenu*(featureId: jint, menu: Menu): jboolean
  proc onPreparePanel*(featureId: jint, view: View, menu: Menu): jboolean
  proc onMenuOpened*(featureId: jint, menu: Menu): jboolean
  proc onMenuItemSelected*(featureId: jint, item: MenuItem): jboolean
  proc onPanelClosed*(featureId: jint, menu: Menu)
  proc invalidateOptionsMenu*()
  proc onCreateOptionsMenu*(menu: Menu): jboolean
  proc onPrepareOptionsMenu*(menu: Menu): jboolean
  proc onOptionsItemSelected*(item: MenuItem): jboolean
  proc onNavigateUp*(): jboolean
  proc onNavigateUpFromChild*(child: Activity): jboolean
  proc onCreateNavigateUpTaskStack*(builder: TaskStackBuilder)
  proc onPrepareNavigateUpTaskStack*(builder: TaskStackBuilder)
  proc onOptionsMenuClosed*(menu: Menu)
  proc openOptionsMenu*()
  proc closeOptionsMenu*()
  proc onCreateContextMenu*(menu: ContextMenu, v: View, menuInfo: ContextMenuInfo)
  proc registerForContextMenu*(view: View)
  proc unregisterForContextMenu*(view: View)
  proc openContextMenu*(view: View)
  proc closeContextMenu*()
  proc onContextItemSelected*(item: MenuItem): jboolean
  proc onContextMenuClosed*(menu: Menu)
  proc showDialog*(id: jint)
  proc showDialog*(id: jint, args: Bundle): jboolean
  proc dismissDialog*(id: jint)
  proc removeDialog*(id: jint)
  proc onSearchRequested*(searchEvent: SearchEvent): jboolean
  proc onSearchRequested*(): jboolean
  proc getSearchEvent*(): SearchEvent
  proc startSearch*(initialQuery: string, selectInitialQuery: jboolean, appSearchData: Bundle, globalSearch: jboolean)
  proc triggerSearch*(query: string, appSearchData: Bundle)
  proc takeKeyEvents*(get: jboolean)
  proc requestWindowFeature*(featureId: jint): jboolean
  proc setFeatureDrawableResource*(featureId: jint, resId: jint)
  proc setFeatureDrawableUri*(featureId: jint, uri: Uri)
  proc setFeatureDrawable*(featureId: jint, drawable: Drawable)
  proc setFeatureDrawableAlpha*(featureId: jint, alpha: jint)
  proc getLayoutInflater*(): LayoutInflater
  proc getMenuInflater*(): MenuInflater
  proc setTheme*(resid: jint)
  proc requestPermissions*(permissions: seq[string], requestCode: jint)
  proc requestPermissions*(permissions: seq[string], requestCode: jint, deviceId: jint)
  proc onRequestPermissionsResult*(requestCode: jint, permissions: seq[string], grantResults: seq[jint])
  proc onRequestPermissionsResult*(requestCode: jint, permissions: seq[string], grantResults: seq[jint], deviceId: jint)
  proc shouldShowRequestPermissionRationale*(permission: string): jboolean
  proc shouldShowRequestPermissionRationale*(permission: string, deviceId: jint): jboolean
  proc startActivityForResult*(intent: Intent, requestCode: jint)
  proc startActivityForResult*(intent: Intent, requestCode: jint, options: Bundle)
  proc isActivityTransitionRunning*(): jboolean
  proc startActivityForResultAsUser*(intent: Intent, requestCode: jint, user: UserHandle)
  proc startActivityForResultAsUser*(intent: Intent, requestCode: jint, options: Bundle, user: UserHandle)
  proc startActivityForResultAsUser*(intent: Intent, resultWho: string, requestCode: jint, options: Bundle, user: UserHandle)
  proc startActivityAsUser*(intent: Intent, user: UserHandle)
  proc startActivityAsUser*(intent: Intent, options: Bundle, user: UserHandle)
  proc startActivityAsCaller*(intent: Intent, options: Bundle, ignoreTargetSecurity: jboolean, userId: jint)
  proc startActivityAsCaller*(intent: Intent, options: Bundle, ignoreTargetSecurity: jboolean, userId: jint, requestCode: jint)
  proc startIntentSenderForResult*(intent: IntentSender, requestCode: jint, fillInIntent: Intent, flagsMask: jint, flagsValues: jint, extraFlags: jint)
  proc startIntentSenderForResult*(intent: IntentSender, who: string, requestCode: jint, fillInIntent: Intent, flagsMask: jint, flagsValues: jint, options: Bundle)
  proc startIntentSenderForResult*(intent: IntentSender, requestCode: jint, fillInIntent: Intent, flagsMask: jint, flagsValues: jint, extraFlags: jint, options: Bundle)
  proc startIntentSenderForResultInner*(intent: IntentSender, who: string, requestCode: jint, fillInIntent: Intent, flagsMask: jint, flagsValues: jint, options: Bundle)
  proc startActivity*(intent: Intent)
  proc startActivity*(intent: Intent, options: Bundle)
  proc startActivities*(intents: seq[Intent])
  proc startActivities*(intents: seq[Intent], options: Bundle)
  proc startIntentSender*(intent: IntentSender, fillInIntent: Intent, flagsMask: jint, flagsValues: jint, extraFlags: jint)
  proc startIntentSender*(intent: IntentSender, fillInIntent: Intent, flagsMask: jint, flagsValues: jint, extraFlags: jint, options: Bundle)
  proc startActivityIfNeeded*(intent: Intent, requestCode: jint): jboolean
  proc startActivityIfNeeded*(intent: Intent, requestCode: jint, options: Bundle): jboolean
  proc startNextMatchingActivity*(intent: Intent): jboolean
  proc startNextMatchingActivity*(intent: Intent, options: Bundle): jboolean
  proc startActivityFromChild*(child: Activity, intent: Intent, requestCode: jint)
  proc startActivityFromChild*(child: Activity, intent: Intent, requestCode: jint, options: Bundle)
  proc startActivityFromFragment*(fragment: Fragment, intent: Intent, requestCode: jint)
  proc startActivityFromFragment*(fragment: Fragment, intent: Intent, requestCode: jint, options: Bundle)
  proc startActivityForResult*(who: string, intent: Intent, requestCode: jint, options: Bundle)
  proc canStartActivityForResult*(): jboolean
  proc startIntentSenderFromChild*(child: Activity, intent: IntentSender, requestCode: jint, fillInIntent: Intent, flagsMask: jint, flagsValues: jint, extraFlags: jint)
  proc startIntentSenderFromChild*(child: Activity, intent: IntentSender, requestCode: jint, fillInIntent: Intent, flagsMask: jint, flagsValues: jint, extraFlags: jint, options: Bundle)
  proc overrideActivityTransition*(overrideType: jint, enterAnim: jint, exitAnim: jint)
  proc overrideActivityTransition*(overrideType: jint, enterAnim: jint, exitAnim: jint, backgroundColor: jint)
  proc clearOverrideActivityTransition*(overrideType: jint)
  proc overridePendingTransition*(enterAnim: jint, exitAnim: jint)
  proc overridePendingTransition*(enterAnim: jint, exitAnim: jint, backgroundColor: jint)
  proc setResult*(resultCode: jint)
  proc setForceSendResultForMediaProjection*()
  proc setResult*(resultCode: jint, data: Intent)
  proc getReferrer*(): Uri
  proc onProvideReferrer*(): Uri
  proc getCallingPackage*(): string
  proc getCallingActivity*(): ComponentName
  proc getLaunchedFromUid*(): jint
  proc getLaunchedFromPackage*(): string
  proc getInitialCaller*(): ComponentCaller
  proc getCurrentCaller*(): ComponentCaller
  proc setVisible*(visible: jboolean)
  proc isFinishing*(): jboolean
  proc isDestroyed*(): jboolean
  proc isChangingConfigurations*(): jboolean
  proc recreate*()
  proc finish*()
  proc finishAffinity*()
  proc finishFromChild*(child: Activity)
  proc finishAfterTransition*()
  proc finishActivity*(requestCode: jint)
  proc finishActivityFromChild*(child: Activity, requestCode: jint)
  proc finishAndRemoveTask*()
  proc releaseInstance*(): jboolean
  proc onActivityResult*(requestCode: jint, resultCode: jint, data: Intent, caller: ComponentCaller)
  proc onActivityReenter*(resultCode: jint, data: Intent)
  proc createPendingResult*(requestCode: jint, data: Intent, flags: jint): PendingIntent
  proc setRequestedOrientation*(requestedOrientation: jint)
  proc getRequestedOrientation*(): jint
  proc getTaskId*(): jint
  proc isTaskRoot*(): jboolean
  proc moveTaskToBack*(nonRoot: jboolean): jboolean
  proc getLocalClassName*(): string
  proc getComponentName*(): ComponentName
  proc contentCaptureClientGetComponentName*(): ComponentName
  proc getPreferences*(mode: jint): SharedPreferences
  proc isLaunchedFromBubble*(): jboolean
  proc getSystemService*(name: string): JObject
  proc setTitle*(title: CharSequence)
  proc setTitle*(titleId: jint)
  proc setTitleColor*(textColor: jint)
  proc getTitle*(): CharSequence
  proc getTitleColor*(): jint
  proc setTaskDescription*(taskDescription: ActivityManager.TaskDescription)
  proc setProgressBarVisibility*(visible: jboolean)
  proc setProgressBarIndeterminateVisibility*(visible: jboolean)
  proc setProgressBarIndeterminate*(indeterminate: jboolean)
  proc setProgress*(progress: jint)
  proc setSecondaryProgress*(secondaryProgress: jint)
  proc setVolumeControlStream*(streamType: jint)
  proc getVolumeControlStream*(): jint
  proc setMediaController*(controller: MediaController)
  proc getMediaController*(): MediaController
  proc runOnUiThread*(action: Runnable)
  proc onCreateView*(name: string, context: Context, attrs: AttributeSet): View
  proc onCreateView*(parent: View, name: string, context: Context, attrs: AttributeSet): View
  proc dump*(prefix: string, fd: FileDescriptor, writer: PrintWriter, args: seq[string])
  proc addDumpable*(dumpable: Dumpable): jboolean
  proc dumpInternal*(prefix: string, fd: FileDescriptor, writer: PrintWriter, args: seq[string])
  proc isImmersive*(): jboolean
  proc setTranslucent*(translucent: jboolean): jboolean
  proc convertFromTranslucent*()
  proc convertToTranslucent*(callback: TranslucentConversionListener, options: ActivityOptions): jboolean
  proc onNewSceneTransitionInfo*(info: ActivityOptions.SceneTransitionInfo)
  proc requestVisibleBehind*(visible: jboolean): jboolean
  proc onVisibleBehindCanceled*()
  proc isBackgroundVisibleBehind*(): jboolean
  proc onBackgroundVisibleBehindChanged*(visible: jboolean)
  proc onEnterAnimationComplete*()
  proc dispatchEnterAnimationComplete*()
  proc setImmersive*(i: jboolean)
  proc setVrModeEnabled*(enabled: jboolean, requestedComponent: ComponentName)
  proc startActionMode*(callback: ActionMode.Callback): ActionMode
  proc startActionMode*(callback: ActionMode.Callback, type: jint): ActionMode
  proc onWindowStartingActionMode*(callback: ActionMode.Callback): ActionMode
  proc onWindowStartingActionMode*(callback: ActionMode.Callback, type: jint): ActionMode
  proc onActionModeStarted*(mode: ActionMode)
  proc onActionModeFinished*(mode: ActionMode)
  proc shouldUpRecreateTask*(targetIntent: Intent): jboolean
  proc navigateUpTo*(upIntent: Intent): jboolean
  proc navigateUpToFromChild*(child: Activity, upIntent: Intent): jboolean
  proc getParentActivityIntent*(): Intent
  proc setEnterSharedElementCallback*(callback: SharedElementCallback)
  proc setExitSharedElementCallback*(callback: SharedElementCallback)
  proc postponeEnterTransition*()
  proc startPostponedEnterTransition*()
  proc requestDragAndDropPermissions*(event: DragEvent): DragAndDropPermissions
  proc getActivityToken*(): IBinder
  proc getAssistToken*(): IBinder
  proc getShareableActivityToken*(): IBinder
  proc getActivityThread*(): ActivityThread
  proc getActivityInfo*(): ActivityInfo
  proc isResumed*(): jboolean
  proc startLockTask*()
  proc stopLockTask*()
  proc showLockTaskEscapeMessage*()
  proc isOverlayWithDecorCaptionEnabled*(): jboolean
  proc setOverlayWithDecorCaptionEnabled*(enabled: jboolean)
  proc isVisibleForAutofill*(): jboolean
  proc setDisablePreviewScreenshots*(disable: jboolean)
  proc setRecentsScreenshotEnabled*(enabled: jboolean)
  proc setShowWhenLocked*(showWhenLocked: jboolean)
  proc setInheritShowWhenLocked*(inheritShowWhenLocked: jboolean)
  proc setTurnScreenOn*(turnScreenOn: jboolean)
  proc setAllowCrossUidActivitySwitchFromBelow*(allowed: jboolean)
  proc registerRemoteAnimations*(definition: RemoteAnimationDefinition)
  proc unregisterRemoteAnimations*()
  proc updateUiTranslationState*(state: jint, sourceSpec: TranslationSpec, targetSpec: TranslationSpec, viewIds: List[AutofillId], uiTranslationSpec: UiTranslationSpec)
  proc enableTaskLocaleOverride*()
  proc setActivityRecordInputSinkEnabled*(enabled: jboolean)
  proc getOnBackInvokedDispatcher*(): OnBackInvokedDispatcher
  proc registerScreenCaptureCallback*(executor: Executor, callback: ScreenCaptureCallback)
  proc unregisterScreenCaptureCallback*(callback: ScreenCaptureCallback)
  RESULT_CANCELED*: jint {.`static`.}
  RESULT_OK*: jint {.`static`.}
  RESULT_FIRST_USER*: jint {.`static`.}
  DONT_FINISH_TASK_WITH_ACTIVITY*: jint {.`static`.}
  FINISH_TASK_WITH_ROOT_ACTIVITY*: jint {.`static`.}
  FINISH_TASK_WITH_ACTIVITY*: jint {.`static`.}
  DUMP_ARG_AUTOFILL*: string {.`static`.}
  DUMP_ARG_CONTENT_CAPTURE*: string {.`static`.}
  DUMP_ARG_TRANSLATION*: string {.`static`.}
  DUMP_ARG_LIST_DUMPABLES*: string {.`static`.}
  DUMP_ARG_DUMP_DUMPABLE*: string {.`static`.}
  FULLSCREEN_MODE_REQUEST_EXIT*: jint {.`static`.}
  FULLSCREEN_MODE_REQUEST_ENTER*: jint {.`static`.}
  OVERRIDE_TRANSITION_OPEN*: jint {.`static`.}
  OVERRIDE_TRANSITION_CLOSE*: jint {.`static`.}
  DEFAULT_KEYS_DISABLE*: jint {.`static`.}
  DEFAULT_KEYS_DIALER*: jint {.`static`.}
  DEFAULT_KEYS_SHORTCUT*: jint {.`static`.}
  DEFAULT_KEYS_SEARCH_LOCAL*: jint {.`static`.}
  DEFAULT_KEYS_SEARCH_GLOBAL*: jint {.`static`.}


