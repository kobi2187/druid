import jnim

jclass android.app.TaskInfo* of JVMObject:
  proc getTaskId*(): jint
  proc isVisible*(): jboolean
  proc getToken*(): WindowContainerToken
  proc getConfiguration*(): Configuration
  proc getPictureInPictureParams*(): PictureInPictureParams
  proc shouldDockBigOverlays*(): jboolean
  proc getWindowingMode*(): jint
  proc isFreeform*(): jboolean
  proc getActivityType*(): jint
  proc addLaunchCookie*(cookie: IBinder)
  proc containsLaunchCookie*(cookie: IBinder): jboolean
  proc getParentTaskId*(): jint
  proc hasParentTask*(): jboolean
  proc getDisplayId*(): jint
  proc equalsForTaskOrganizer*(that: TaskInfo): jboolean
  proc equalsForCompatUi*(that: TaskInfo): jboolean
  proc writeTaskToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  PROPERTY_VALUE_UNSET*: jint {.`static`.}
  userId*: jint
  taskId*: jint
  effectiveUid*: jint
  isRunning*: jboolean
  baseIntent*: Intent
  baseActivity*: ComponentName
  topActivity*: ComponentName
  origActivity*: ComponentName
  realActivity*: ComponentName
  numActivities*: jint
  lastActiveTime*: jlong
  displayId*: jint
  displayAreaFeatureId*: jint
  taskDescription*: ActivityManager.TaskDescription
  mTopActivityLocusId*: LocusId
  supportsMultiWindow*: jboolean
  resizeMode*: jint
  configuration*: Configuration
  token*: WindowContainerToken
  pictureInPictureParams*: PictureInPictureParams
  shouldDockBigOverlays*: jboolean
  launchIntoPipHostTaskId*: jint
  lastParentTaskIdBeforePip*: jint
  displayCutoutInsets*: Rect
  topActivityType*: jint
  topActivityInfo*: ActivityInfo
  isResizeable*: jboolean
  minWidth*: jint
  minHeight*: jint
  defaultMinSize*: jint
  positionInParent*: Point
  launchCookies*: ArrayList[IBinder]
  parentTaskId*: jint
  isFocused*: jboolean
  isVisible*: jboolean
  isVisibleRequested*: jboolean
  isTopActivityNoDisplay*: jboolean
  isSleeping*: jboolean
  isTopActivityTransparent*: jboolean
  isActivityStackTransparent*: jboolean
  lastNonFullscreenBounds*: Rect
  capturedLink*: Uri
  capturedLinkTimestamp*: jlong
  requestedVisibleTypes*: jint
  topActivityRequestOpenInBrowserEducationTimestamp*: jlong
  appCompatTaskInfo*: AppCompatTaskInfo
  topActivityMainWindowFrame*: Rect

