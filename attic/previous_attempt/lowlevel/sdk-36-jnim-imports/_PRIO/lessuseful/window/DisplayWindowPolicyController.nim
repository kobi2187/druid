import jnim

jclass android.window.DisplayWindowPolicyController* of JVMObject:
  proc isInterestedWindowFlags*(windowFlags: jint, systemWindowFlags: jint): jboolean
  proc setInterestedWindowFlags*(windowFlags: jint, systemWindowFlags: jint)
  proc isWindowingModeSupported*(windowingMode: jint): jboolean
  proc setSupportedWindowingModes*(supportedWindowingModes: Set[Integer])
  proc getCustomHomeComponent*(): ComponentName
  proc canContainActivities*(activities: List[ActivityInfo], windowingMode: jint): jboolean
  proc canActivityBeLaunched*(activityInfo: ActivityInfo, intent: Intent, windowingMode: jint, launchingFromDisplayId: jint, isNewTask: jboolean, isResultExpected: jboolean, intentSender: Supplier[IntentSender]): jboolean
  proc keepActivityOnWindowFlagsChanged*(activityInfo: ActivityInfo, windowFlags: jint, systemWindowFlags: jint): jboolean
  proc canShowTasksInHostDeviceRecents*(): jboolean
  proc onTopActivityChanged*(topActivity: ComponentName, uid: jint, userId: jint)
  proc onRunningAppsChanged*(runningUids: ArraySet[Integer])
  proc isEnteringPipAllowed*(uid: jint): jboolean
  proc dump*(prefix: string, pw: PrintWriter)

