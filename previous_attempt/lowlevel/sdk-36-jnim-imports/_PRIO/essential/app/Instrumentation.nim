import jnim

jclass android.app.Instrumentation* of JVMObject:
  proc isInstrumenting*(): jboolean
  proc onCreate*(arguments: Bundle)
  proc start*()
  proc onStart*()
  proc onException*(obj: JObject, e: Throwable): jboolean
  proc sendStatus*(resultCode: jint, results: Bundle)
  proc addResults*(results: Bundle)
  proc finish*(resultCode: jint, results: Bundle)
  proc setAutomaticPerformanceSnapshots*()
  proc startPerformanceSnapshot*()
  proc endPerformanceSnapshot*()
  proc onDestroy*()
  proc getContext*(): Context
  proc getComponentName*(): ComponentName
  proc getTargetContext*(): Context
  proc getProcessName*(): string
  proc isProfiling*(): jboolean
  proc startProfiling*()
  proc stopProfiling*()
  proc setInTouchMode*(inTouch: jboolean)
  proc resetInTouchMode*()
  proc waitForIdle*(recipient: Runnable)
  proc waitForIdleSync*()
  proc runOnMainSync*(runner: Runnable)
  proc startActivitySync*(intent: Intent): Activity
  proc startActivitySync*(intent: Intent, options: Bundle): Activity
  proc addMonitor*(monitor: ActivityMonitor)
  proc addMonitor*(filter: IntentFilter, result: ActivityResult, block: jboolean): ActivityMonitor
  proc addMonitor*(cls: string, result: ActivityResult, block: jboolean): ActivityMonitor
  proc checkMonitorHit*(monitor: ActivityMonitor, minHits: jint): jboolean
  proc waitForMonitor*(monitor: ActivityMonitor): Activity
  proc waitForMonitorWithTimeout*(monitor: ActivityMonitor, timeOut: jlong): Activity
  proc removeMonitor*(monitor: ActivityMonitor)
  proc invokeMenuActionSync*(targetActivity: Activity, id: jint, flag: jint): jboolean
  proc invokeContextMenuAction*(targetActivity: Activity, id: jint, flag: jint): jboolean
  proc sendStringSync*(text: string)
  proc sendKeySync*(event: KeyEvent)
  proc sendKeyDownUpSync*(keyCode: jint)
  proc sendCharacterSync*(keyCode: jint)
  proc sendPointerSync*(event: MotionEvent)
  proc sendTrackballEventSync*(event: MotionEvent)
  proc newApplication*(cl: ClassLoader, className: string, context: Context): Application
  proc newApplication*(clazz: Class[?], context: Context): Application {.`static`.}
  proc callApplicationOnCreate*(app: Application)
  proc newActivity*(clazz: Class[?], context: Context, token: IBinder, application: Application, intent: Intent, info: ActivityInfo, title: CharSequence, parent: Activity, id: string, lastNonConfigurationInstance: JObject): Activity
  proc newActivity*(cl: ClassLoader, className: string, intent: Intent): Activity
  proc callActivityOnCreate*(activity: Activity, icicle: Bundle)
  proc callActivityOnCreate*(activity: Activity, icicle: Bundle, persistentState: PersistableBundle)
  proc callActivityOnDestroy*(activity: Activity)
  proc callActivityOnRestoreInstanceState*(activity: Activity, savedInstanceState: Bundle)
  proc callActivityOnRestoreInstanceState*(activity: Activity, savedInstanceState: Bundle, persistentState: PersistableBundle)
  proc callActivityOnPostCreate*(activity: Activity, savedInstanceState: Bundle)
  proc callActivityOnPostCreate*(activity: Activity, savedInstanceState: Bundle, persistentState: PersistableBundle)
  proc callActivityOnNewIntent*(activity: Activity, intent: Intent)
  proc callActivityOnNewIntent*(activity: Activity, intent: Intent, caller: ComponentCaller)
  proc callActivityOnNewIntent*(activity: Activity, intent: ReferrerIntent, caller: ComponentCaller)
  proc callActivityOnNewIntent*(activity: Activity, intent: ReferrerIntent)
  proc callActivityOnStart*(activity: Activity)
  proc callActivityOnRestart*(activity: Activity)
  proc callActivityOnResume*(activity: Activity)
  proc callActivityOnStop*(activity: Activity)
  proc callActivityOnSaveInstanceState*(activity: Activity, outState: Bundle)
  proc callActivityOnSaveInstanceState*(activity: Activity, outState: Bundle, outPersistentState: PersistableBundle)
  proc callActivityOnPause*(activity: Activity)
  proc callActivityOnUserLeaving*(activity: Activity)
  proc callActivityOnPictureInPictureRequested*(activity: Activity)
  proc startAllocCounting*()
  proc stopAllocCounting*()
  proc getAllocCounts*(): Bundle
  proc getBinderCounts*(): Bundle
  proc execStartActivity*(who: Context, contextThread: IBinder, token: IBinder, target: Activity, intent: Intent, requestCode: jint, options: Bundle): ActivityResult
  proc execStartActivities*(who: Context, contextThread: IBinder, token: IBinder, target: Activity, intents: seq[Intent], options: Bundle)
  proc execStartActivitiesAsUser*(who: Context, contextThread: IBinder, token: IBinder, target: Activity, intents: seq[Intent], options: Bundle, userId: jint): jint
  proc execStartActivity*(who: Context, contextThread: IBinder, token: IBinder, target: string, intent: Intent, requestCode: jint, options: Bundle): ActivityResult
  proc execStartActivity*(who: Context, contextThread: IBinder, token: IBinder, resultWho: string, intent: Intent, requestCode: jint, options: Bundle, user: UserHandle): ActivityResult
  proc execStartActivityAsCaller*(who: Context, contextThread: IBinder, token: IBinder, target: Activity, intent: Intent, requestCode: jint, options: Bundle, ignoreTargetSecurity: jboolean, userId: jint): ActivityResult
  proc execStartActivityFromAppTask*(who: Context, contextThread: IBinder, appTask: IAppTask, intent: Intent, options: Bundle)
  proc basicInit*(instrContext: Context, appContext: Context, ui: UiAutomation)
  proc checkStartActivityResult*(res: jint, intent: JObject) {.`static`.}
  proc getUiAutomation*(): UiAutomation
  proc getUiAutomation*(flags: jint): UiAutomation
  proc acquireLooperManager*(looper: Looper): TestLooperManager
  REPORT_KEY_IDENTIFIER*: string {.`static`.}
  REPORT_KEY_STREAMRESULT*: string {.`static`.}
  TAG*: string {.`static`.}
  DEBUG_START_ACTIVITY*: jboolean {.`static`.}

jclass android.app.Instrumentation.ActivityMonitor* of JVMObject:
  proc getFilter*(): IntentFilter
  proc getResult*(): ActivityResult
  proc isBlocking*(): jboolean
  proc getHits*(): jint
  proc getLastActivity*(): Activity
  proc waitForActivity*(): Activity
  proc waitForActivityWithTimeout*(timeOut: jlong): Activity
  proc onStartActivity*(who: Context, intent: Intent, options: Bundle): ActivityResult
  proc onStartActivity*(intent: Intent): ActivityResult
  proc onStartActivityResult*(result: jint, bOptions: Bundle)

jclass android.app.Instrumentation.ActivityResult* of JVMObject:
  proc getResultCode*(): jint
  proc getResultData*(): Intent

jclass android.app.ActivityMonitor* of JVMObject:
  proc getFilter*(): IntentFilter
  proc getResult*(): ActivityResult
  proc isBlocking*(): jboolean
  proc getHits*(): jint
  proc getLastActivity*(): Activity
  proc waitForActivity*(): Activity
  proc waitForActivityWithTimeout*(timeOut: jlong): Activity
  proc onStartActivity*(who: Context, intent: Intent, options: Bundle): ActivityResult
  proc onStartActivity*(intent: Intent): ActivityResult
  proc onStartActivityResult*(result: jint, bOptions: Bundle)

jclass android.app.ActivityResult* of JVMObject:
  proc getResultCode*(): jint
  proc getResultData*(): Intent

