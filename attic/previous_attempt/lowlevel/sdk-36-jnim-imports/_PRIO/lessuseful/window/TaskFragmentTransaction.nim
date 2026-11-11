import jnim

jclass android.window.TaskFragmentTransaction* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getTransactionToken*(): IBinder
  proc addChange*(change: Change)
  proc isEmpty*(): jboolean
  proc getChanges*(): List[Change]
  proc toString*(): string
  proc describeContents*(): jint
  CREATOR*: Creator[TaskFragmentTransaction] {.`static`.}
  TYPE_TASK_FRAGMENT_APPEARED*: jint {.`static`.}
  TYPE_TASK_FRAGMENT_INFO_CHANGED*: jint {.`static`.}
  TYPE_TASK_FRAGMENT_VANISHED*: jint {.`static`.}
  TYPE_TASK_FRAGMENT_PARENT_INFO_CHANGED*: jint {.`static`.}
  TYPE_TASK_FRAGMENT_ERROR*: jint {.`static`.}
  TYPE_ACTIVITY_REPARENTED_TO_TASK*: jint {.`static`.}

jclass android.window.TaskFragmentTransaction.Change* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc setTaskFragmentToken*(taskFragmentToken: IBinder): Change
  proc setTaskFragmentInfo*(info: TaskFragmentInfo): Change
  proc setTaskId*(taskId: jint): Change
  proc setErrorCallbackToken*(errorCallbackToken: IBinder): Change
  proc setErrorBundle*(errorBundle: Bundle): Change
  proc setActivityIntent*(intent: Intent): Change
  proc setActivityToken*(activityToken: IBinder): Change
  proc setOtherActivityToken*(activityToken: IBinder): Change
  proc setTaskFragmentParentInfo*(info: TaskFragmentParentInfo): Change
  proc setTaskFragmentSurfaceControl*(sc: SurfaceControl): Change
  proc getType*(): jint
  proc getTaskFragmentToken*(): IBinder
  proc getTaskFragmentInfo*(): TaskFragmentInfo
  proc getTaskId*(): jint
  proc getErrorCallbackToken*(): IBinder
  proc getErrorBundle*(): Bundle
  proc getActivityIntent*(): Intent
  proc getActivityToken*(): IBinder
  proc getOtherActivityToken*(): IBinder
  proc getTaskFragmentParentInfo*(): TaskFragmentParentInfo
  proc getTaskFragmentSurfaceControl*(): SurfaceControl
  proc toString*(): string
  proc describeContents*(): jint

jclass android.window.Change* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc setTaskFragmentToken*(taskFragmentToken: IBinder): Change
  proc setTaskFragmentInfo*(info: TaskFragmentInfo): Change
  proc setTaskId*(taskId: jint): Change
  proc setErrorCallbackToken*(errorCallbackToken: IBinder): Change
  proc setErrorBundle*(errorBundle: Bundle): Change
  proc setActivityIntent*(intent: Intent): Change
  proc setActivityToken*(activityToken: IBinder): Change
  proc setOtherActivityToken*(activityToken: IBinder): Change
  proc setTaskFragmentParentInfo*(info: TaskFragmentParentInfo): Change
  proc setTaskFragmentSurfaceControl*(sc: SurfaceControl): Change
  proc getType*(): jint
  proc getTaskFragmentToken*(): IBinder
  proc getTaskFragmentInfo*(): TaskFragmentInfo
  proc getTaskId*(): jint
  proc getErrorCallbackToken*(): IBinder
  proc getErrorBundle*(): Bundle
  proc getActivityIntent*(): Intent
  proc getActivityToken*(): IBinder
  proc getOtherActivityToken*(): IBinder
  proc getTaskFragmentParentInfo*(): TaskFragmentParentInfo
  proc getTaskFragmentSurfaceControl*(): SurfaceControl
  proc toString*(): string
  proc describeContents*(): jint
  CREATOR*: Creator[Change] {.`static`.}

