import jnim

jclass android.window.TaskFragmentOperation* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getOpType*(): jint
  proc getTaskFragmentCreationParams*(): TaskFragmentCreationParams
  proc getActivityToken*(): IBinder
  proc getActivityIntent*(): Intent
  proc getBundle*(): Bundle
  proc getSecondaryFragmentToken*(): IBinder
  proc getAnimationParams*(): TaskFragmentAnimationParams
  proc getBooleanValue*(): jboolean
  proc getSurfaceTransaction*(): SurfaceControl.Transaction
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc describeContents*(): jint
  OP_TYPE_UNKNOWN*: jint {.`static`.}
  OP_TYPE_CREATE_TASK_FRAGMENT*: jint {.`static`.}
  OP_TYPE_DELETE_TASK_FRAGMENT*: jint {.`static`.}
  OP_TYPE_START_ACTIVITY_IN_TASK_FRAGMENT*: jint {.`static`.}
  OP_TYPE_REPARENT_ACTIVITY_TO_TASK_FRAGMENT*: jint {.`static`.}
  OP_TYPE_SET_ADJACENT_TASK_FRAGMENTS*: jint {.`static`.}
  OP_TYPE_CLEAR_ADJACENT_TASK_FRAGMENTS*: jint {.`static`.}
  OP_TYPE_REQUEST_FOCUS_ON_TASK_FRAGMENT*: jint {.`static`.}
  OP_TYPE_SET_COMPANION_TASK_FRAGMENT*: jint {.`static`.}
  OP_TYPE_SET_ANIMATION_PARAMS*: jint {.`static`.}
  OP_TYPE_SET_RELATIVE_BOUNDS*: jint {.`static`.}
  OP_TYPE_REORDER_TO_FRONT*: jint {.`static`.}
  OP_TYPE_SET_ISOLATED_NAVIGATION*: jint {.`static`.}
  OP_TYPE_CREATE_OR_MOVE_TASK_FRAGMENT_DECOR_SURFACE*: jint {.`static`.}
  OP_TYPE_REMOVE_TASK_FRAGMENT_DECOR_SURFACE*: jint {.`static`.}
  OP_TYPE_SET_DIM_ON_TASK*: jint {.`static`.}
  OP_TYPE_SET_DECOR_SURFACE_BOOSTED*: jint {.`static`.}
  OP_TYPE_SET_PINNED*: jint {.`static`.}
  PRIVILEGED_OP_START*: jint {.`static`.}
  OP_TYPE_PRIVILEGED_REORDER_TO_BOTTOM_OF_TASK*: jint {.`static`.}
  OP_TYPE_PRIVILEGED_REORDER_TO_TOP_OF_TASK*: jint {.`static`.}
  OP_TYPE_PRIVILEGED_SET_MOVE_TO_BOTTOM_IF_CLEAR_WHEN_LAUNCH*: jint {.`static`.}
  OP_TYPE_PRIVILEGED_SET_CAN_AFFECT_SYSTEM_UI_FLAGS*: jint {.`static`.}
  CREATOR*: Creator[TaskFragmentOperation] {.`static`.}

jclass android.window.TaskFragmentOperation.Builder* of JVMObject:
  proc setTaskFragmentCreationParams*(taskFragmentCreationParams: TaskFragmentCreationParams): Builder
  proc setActivityToken*(activityToken: IBinder): Builder
  proc setActivityIntent*(activityIntent: Intent): Builder
  proc setBundle*(bundle: Bundle): Builder
  proc setSecondaryFragmentToken*(secondaryFragmentToken: IBinder): Builder
  proc setAnimationParams*(animationParams: TaskFragmentAnimationParams): Builder
  proc setBooleanValue*(booleanValue: jboolean): Builder
  proc setSurfaceTransaction*(surfaceTransaction: SurfaceControl.Transaction): Builder
  proc build*(): TaskFragmentOperation

jclass android.window.Builder* of JVMObject:
  proc setTaskFragmentCreationParams*(taskFragmentCreationParams: TaskFragmentCreationParams): Builder
  proc setActivityToken*(activityToken: IBinder): Builder
  proc setActivityIntent*(activityIntent: Intent): Builder
  proc setBundle*(bundle: Bundle): Builder
  proc setSecondaryFragmentToken*(secondaryFragmentToken: IBinder): Builder
  proc setAnimationParams*(animationParams: TaskFragmentAnimationParams): Builder
  proc setBooleanValue*(booleanValue: jboolean): Builder
  proc setSurfaceTransaction*(surfaceTransaction: SurfaceControl.Transaction): Builder
  proc build*(): TaskFragmentOperation

