import jnim

jclass android.window.TaskFragmentOrganizer* of WindowOrganizer:
  proc putErrorInfoInBundle*(exception: Throwable, info: TaskFragmentInfo, opType: jint): Bundle {.`static`.}
  proc getExecutor*(): Executor
  proc registerOrganizer*()
  proc registerOrganizer*(isSystemOrganizer: jboolean)
  proc registerOrganizer*(isSystemOrganizer: jboolean, outSavedState: Bundle)
  proc unregisterOrganizer*()
  proc registerRemoteAnimations*(definition: RemoteAnimationDefinition)
  proc unregisterRemoteAnimations*()
  proc setSavedState*(state: Bundle)
  proc onTransactionHandled*(transactionToken: IBinder, wct: WindowContainerTransaction, transitionType: jint, shouldApplyIndependently: jboolean)
  proc applyTransaction*(wct: WindowContainerTransaction)
  proc applyTransaction*(wct: WindowContainerTransaction, transitionType: jint, shouldApplyIndependently: jboolean)
  proc applySystemTransaction*(wct: WindowContainerTransaction, transitionType: jint, remoteTransition: RemoteTransition)
  proc onTransactionReady*(transaction: TaskFragmentTransaction)
  proc getOrganizerToken*(): TaskFragmentOrganizerToken
  proc isActivityEmbedded*(activity: Activity): jboolean {.`static`.}
  KEY_ERROR_CALLBACK_THROWABLE*: string {.`static`.}
  KEY_ERROR_CALLBACK_TASK_FRAGMENT_INFO*: string {.`static`.}
  KEY_ERROR_CALLBACK_OP_TYPE*: string {.`static`.}
  KEY_RESTORE_TASK_FRAGMENTS_INFO*: string {.`static`.}
  KEY_RESTORE_TASK_FRAGMENT_PARENT_INFO*: string {.`static`.}
  TASK_FRAGMENT_TRANSIT_NONE*: jint {.`static`.}
  TASK_FRAGMENT_TRANSIT_OPEN*: jint {.`static`.}
  TASK_FRAGMENT_TRANSIT_CLOSE*: jint {.`static`.}
  TASK_FRAGMENT_TRANSIT_CHANGE*: jint {.`static`.}
  TASK_FRAGMENT_TRANSIT_DRAG_RESIZE*: jint {.`static`.}

