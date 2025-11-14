import jnim

jclass android.app.ActivityTaskManager* of JVMObject:
  proc getInstance*(): ActivityTaskManager {.`static`.}
  proc getService*(): IActivityTaskManager {.`static`.}
  proc removeRootTasksInWindowingModes*(windowingModes: seq[jint])
  proc removeRootTasksWithActivityTypes*(activityTypes: seq[jint])
  proc removeAllVisibleRecentTasks*()
  proc getMaxRecentTasksStatic*(): jint {.`static`.}
  proc onSplashScreenViewCopyFinished*(taskId: jint, parcelable: SplashScreenViewParcelable)
  proc getDefaultAppRecentsLimitStatic*(): jint {.`static`.}
  proc getMaxAppRecentsLimitStatic*(): jint {.`static`.}
  proc supportsMultiWindow*(context: Context): jboolean {.`static`.}
  proc supportsSplitScreenMultiWindow*(context: Context): jboolean {.`static`.}
  proc startSystemLockTaskMode*(taskId: jint)
  proc stopSystemLockTaskMode*()
  proc moveTaskToRootTask*(taskId: jint, rootTaskId: jint, toTop: jboolean)
  proc resizeTask*(taskId: jint, bounds: Rect)
  proc clearLaunchParamsForPackages*(packageNames: List[string])
  proc currentUiModeSupportsErrorDialogs*(config: Configuration): jboolean {.`static`.}
  proc currentUiModeSupportsErrorDialogs*(context: Context): jboolean {.`static`.}
  proc getMaxNumPictureInPictureActions*(context: Context): jint {.`static`.}
  proc getTasks*(maxNum: jint): List[ActivityManager.RunningTaskInfo]
  proc getTasks*(maxNum: jint, filterOnlyVisibleRecents: jboolean): List[ActivityManager.RunningTaskInfo]
  proc getTasks*(maxNum: jint, filterOnlyVisibleRecents: jboolean, keepIntentExtra: jboolean): List[ActivityManager.RunningTaskInfo]
  proc getTasks*(maxNum: jint, filterOnlyVisibleRecents: jboolean, keepIntentExtra: jboolean, displayId: jint): List[ActivityManager.RunningTaskInfo]
  proc getRecentTasks*(maxNum: jint, flags: jint, userId: jint): List[ActivityManager.RecentTaskInfo]
  proc registerTaskStackListener*(listener: TaskStackListener)
  proc unregisterTaskStackListener*(listener: TaskStackListener)
  proc getTaskBounds*(taskId: jint): Rect
  proc registerRemoteAnimationsForDisplay*(displayId: jint, definition: RemoteAnimationDefinition)
  proc isInLockTaskMode*(): jboolean
  proc removeTask*(taskId: jint): jboolean
  proc canBeUniversalResizeable*(appInfo: ApplicationInfo): jboolean
  proc detachNavigationBarFromApp*(transition: IBinder)
  proc updateLockTaskPackages*(context: Context, packages: seq[string])
  INVALID_STACK_ID*: jint {.`static`.}
  INVALID_TASK_ID*: jint {.`static`.}
  INVALID_WINDOWING_MODE*: jint {.`static`.}
  RESIZE_MODE_SYSTEM*: jint {.`static`.}
  RESIZE_MODE_PRESERVE_WINDOW*: jint {.`static`.}
  RESIZE_MODE_USER*: jint {.`static`.}
  RESIZE_MODE_FORCED*: jint {.`static`.}
  RESIZE_MODE_USER_FORCED*: jint {.`static`.}
  EXTRA_OPTIONS*: string {.`static`.}
  EXTRA_IGNORE_TARGET_SECURITY*: string {.`static`.}
  DEFAULT_MINIMAL_SPLIT_SCREEN_DISPLAY_SIZE_DP*: jint {.`static`.}

jclass android.app.ActivityTaskManager.RootTaskInfo* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string

jclass android.app.RootTaskInfo* of TaskInfo:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  bounds*: Rect
  childTaskIds*: jint
  childTaskNames*: string
  childTaskBounds*: Rect
  childTaskUserIds*: jint
  visible*: jboolean
  position*: jint
  CREATOR*: Creator[RootTaskInfo] {.`static`.}

