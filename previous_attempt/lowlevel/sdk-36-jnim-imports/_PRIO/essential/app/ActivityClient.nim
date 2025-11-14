import jnim

jclass android.app.ActivityClient* of JVMObject:
  proc activityIdle*(token: IBinder, config: Configuration, stopProfiling: jboolean)
  proc activityResumed*(token: IBinder, handleSplashScreenExit: jboolean)
  proc activityRefreshed*(token: IBinder)
  proc activityTopResumedStateLost*()
  proc activityPaused*(token: IBinder)
  proc activityStopped*(token: IBinder, state: Bundle, persistentState: PersistableBundle, description: CharSequence)
  proc activityDestroyed*(token: IBinder)
  proc activityLocalRelaunch*(token: IBinder)
  proc activityRelaunched*(token: IBinder)
  proc moveActivityTaskToBack*(token: IBinder, nonRoot: jboolean): jboolean
  proc finishActivity*(token: IBinder, resultCode: jint, resultData: Intent, finishTask: jint): jboolean
  proc isTopOfTask*(token: IBinder): jboolean
  proc getDisplayId*(token: IBinder): jint
  proc getTaskForActivity*(token: IBinder, onlyRoot: jboolean): jint
  proc getTaskConfiguration*(activityToken: IBinder): Configuration
  proc getActivityTokenBelow*(activityToken: IBinder): IBinder
  proc getLaunchedFromUid*(token: IBinder): jint
  proc getLaunchedFromPackage*(token: IBinder): string
  proc getActivityCallerUid*(activityToken: IBinder, callerToken: IBinder): jint
  proc getActivityCallerPackage*(activityToken: IBinder, callerToken: IBinder): string
  proc checkActivityCallerContentUriPermission*(activityToken: IBinder, callerToken: IBinder, uri: Uri, modeFlags: jint): jint
  proc setRequestedOrientation*(token: IBinder, requestedOrientation: jint)
  proc invalidateHomeTaskSnapshot*(homeToken: IBinder)
  proc isRequestedToLaunchInTaskFragment*(activityToken: IBinder, taskFragmentToken: IBinder): jboolean
  proc getInstance*(): ActivityClient {.`static`.}
  proc setActivityClientController*(activityClientController: IActivityClientController): IActivityClientController {.`static`.}

