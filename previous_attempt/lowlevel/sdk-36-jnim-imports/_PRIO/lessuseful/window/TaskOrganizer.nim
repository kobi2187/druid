import jnim

jclass android.window.TaskOrganizer* of WindowOrganizer:
  proc registerOrganizer*(): List[TaskAppearedInfo]
  proc unregisterOrganizer*()
  proc addStartingWindow*(info: StartingWindowInfo)
  proc removeStartingWindow*(removalInfo: StartingWindowRemovalInfo)
  proc copySplashScreenView*(taskId: jint)
  proc onAppSplashScreenViewRemoved*(taskId: jint)
  proc onTaskAppeared*(taskInfo: ActivityManager.RunningTaskInfo, leash: SurfaceControl)
  proc onTaskVanished*(taskInfo: ActivityManager.RunningTaskInfo)
  proc onTaskInfoChanged*(taskInfo: ActivityManager.RunningTaskInfo)
  proc onBackPressedOnTaskRoot*(taskInfo: ActivityManager.RunningTaskInfo)
  proc onImeDrawnOnTask*(taskId: jint)
  proc createRootTask*(displayId: jint, windowingMode: jint, launchCookie: IBinder, removeWithTaskOrganizer: jboolean)
  proc createRootTask*(displayId: jint, windowingMode: jint, launchCookie: IBinder)
  proc deleteRootTask*(task: WindowContainerToken): jboolean
  proc getChildTasks*(parent: WindowContainerToken, activityTypes: seq[jint]): List[ActivityManager.RunningTaskInfo]
  proc getRootTasks*(displayId: jint, activityTypes: seq[jint]): List[ActivityManager.RunningTaskInfo]
  proc getImeTarget*(display: jint): WindowContainerToken
  proc setInterceptBackPressedOnTaskRoot*(task: WindowContainerToken, interceptBackPressed: jboolean)
  proc restartTaskTopActivityProcessIfVisible*(task: WindowContainerToken)
  proc getExecutor*(): Executor

