import jnim

jclass android.window.WindowContainerTransaction* of JVMObject:
  proc clear*()
  proc setBounds*(container: WindowContainerToken, bounds: Rect): WindowContainerTransaction
  proc setAppBounds*(container: WindowContainerToken, appBounds: Rect): WindowContainerTransaction
  proc setScreenSizeDp*(container: WindowContainerToken, w: jint, h: jint): WindowContainerTransaction
  proc setDensityDpi*(container: WindowContainerToken, densityDpi: jint): WindowContainerTransaction
  proc setBoundsChangeTransaction*(container: WindowContainerToken, t: SurfaceControl.Transaction): WindowContainerTransaction
  proc setActivityWindowingMode*(container: WindowContainerToken, windowingMode: jint): WindowContainerTransaction
  proc setWindowingMode*(container: WindowContainerToken, windowingMode: jint): WindowContainerTransaction
  proc setFocusable*(container: WindowContainerToken, focusable: jboolean): WindowContainerTransaction
  proc setExcludeImeInsets*(container: WindowContainerToken, exclude: jboolean): WindowContainerTransaction
  proc setHidden*(container: WindowContainerToken, hidden: jboolean): WindowContainerTransaction
  proc setSmallestScreenWidthDp*(container: WindowContainerToken, widthDp: jint): WindowContainerTransaction
  proc setIgnoreOrientationRequest*(container: WindowContainerToken, ignoreOrientationRequest: jboolean): WindowContainerTransaction
  proc setForceTranslucent*(container: WindowContainerToken, forceTranslucent: jboolean): WindowContainerTransaction
  proc setDoNotPip*(container: WindowContainerToken): WindowContainerTransaction
  proc setRelativeBounds*(container: WindowContainerToken, relBounds: Rect): WindowContainerTransaction
  proc setDragResizing*(container: WindowContainerToken, dragResizing: jboolean): WindowContainerTransaction
  proc setAlwaysOnTop*(windowContainer: WindowContainerToken, alwaysOnTop: jboolean): WindowContainerTransaction
  proc setReparentLeafTaskIfRelaunch*(windowContainer: WindowContainerToken, reparentLeafTaskIfRelaunch: jboolean): WindowContainerTransaction
  proc deferConfigToTransitionEnd*(container: WindowContainerToken): WindowContainerTransaction
  proc setTaskTrimmableFromRecents*(container: WindowContainerToken, isTrimmableFromRecents: jboolean): WindowContainerTransaction
  proc setSafeRegionBounds*(container: WindowContainerToken, safeRegionBounds: Rect): WindowContainerTransaction
  proc reorder*(child: WindowContainerToken, onTop: jboolean): WindowContainerTransaction
  proc reorder*(child: WindowContainerToken, onTop: jboolean, includingParents: jboolean): WindowContainerTransaction
  proc reparent*(child: WindowContainerToken, parent: WindowContainerToken, onTop: jboolean): WindowContainerTransaction
  proc reparentTasks*(currentParent: WindowContainerToken, newParent: WindowContainerToken, windowingModes: seq[jint], activityTypes: seq[jint], onTop: jboolean, reparentTopOnly: jboolean): WindowContainerTransaction
  proc reparentTasks*(currentParent: WindowContainerToken, newParent: WindowContainerToken, windowingModes: seq[jint], activityTypes: seq[jint], onTop: jboolean): WindowContainerTransaction
  proc removeTask*(containerToken: WindowContainerToken): WindowContainerTransaction
  proc removeRootTask*(containerToken: WindowContainerToken): WindowContainerTransaction
  proc restoreTransientOrder*(container: WindowContainerToken): WindowContainerTransaction
  proc restoreBackNavi*(): WindowContainerTransaction
  proc startTask*(taskId: jint, options: Bundle): WindowContainerTransaction
  proc sendPendingIntent*(sender: PendingIntent, fillInIntent: Intent, options: Bundle): WindowContainerTransaction
  proc startShortcut*(callingPackage: string, shortcutInfo: ShortcutInfo, options: Bundle): WindowContainerTransaction
  proc setLaunchRoot*(container: WindowContainerToken, windowingModes: seq[jint], activityTypes: seq[jint]): WindowContainerTransaction
  proc setAdjacentRoots*(root1: WindowContainerToken, root2: WindowContainerToken): WindowContainerTransaction
  proc setAdjacentRootSet*(roots: WindowContainerToken): WindowContainerTransaction
  proc clearAdjacentRoots*(root: WindowContainerToken): WindowContainerTransaction
  proc setLaunchAdjacentFlagRoot*(container: WindowContainerToken): WindowContainerTransaction
  proc clearLaunchAdjacentFlagRoot*(container: WindowContainerToken): WindowContainerTransaction
  proc setDisableLaunchAdjacent*(container: WindowContainerToken, disabled: jboolean): WindowContainerTransaction
  proc movePipActivityToPinnedRootTask*(parentToken: WindowContainerToken, bounds: Rect): WindowContainerTransaction
  proc scheduleFinishEnterPip*(container: WindowContainerToken, bounds: Rect): WindowContainerTransaction
  proc addInsetsSource*(receiver: WindowContainerToken, owner: IBinder, index: jint, type: jint, frame: Rect, boundingRects: seq[Rect], flags: jint): WindowContainerTransaction
  proc removeInsetsSource*(receiver: WindowContainerToken, owner: IBinder, index: jint, type: jint): WindowContainerTransaction
  proc addKeyguardState*(keyguardState: KeyguardState): WindowContainerTransaction
  proc setTaskFragmentOrganizer*(organizer: ITaskFragmentOrganizer): WindowContainerTransaction
  proc setErrorCallbackToken*(errorCallbackToken: IBinder): WindowContainerTransaction
  proc createTaskFragment*(taskFragmentCreationParams: TaskFragmentCreationParams): WindowContainerTransaction
  proc deleteTaskFragment*(fragmentToken: IBinder): WindowContainerTransaction
  proc startActivityInTaskFragment*(fragmentToken: IBinder, callerToken: IBinder, activityIntent: Intent, activityOptions: Bundle): WindowContainerTransaction
  proc reparentActivityToTaskFragment*(fragmentToken: IBinder, activityToken: IBinder): WindowContainerTransaction
  proc setAdjacentTaskFragments*(fragmentToken1: IBinder, fragmentToken2: IBinder, params: TaskFragmentAdjacentParams): WindowContainerTransaction
  proc clearAdjacentTaskFragments*(fragmentToken: IBinder): WindowContainerTransaction
  proc requestFocusOnTaskFragment*(fragmentToken: IBinder): WindowContainerTransaction
  proc finishActivity*(activityToken: IBinder): WindowContainerTransaction
  proc setCompanionTaskFragment*(fragmentToken: IBinder, companionFragmentToken: IBinder): WindowContainerTransaction
  proc addTaskFragmentOperation*(fragmentToken: IBinder, taskFragmentOperation: TaskFragmentOperation): WindowContainerTransaction
  proc setReachabilityOffset*(container: WindowContainerToken, taskId: jint, x: jint, y: jint): WindowContainerTransaction
  proc merge*(other: WindowContainerTransaction, transfer: jboolean)
  proc isEmpty*(): jboolean
  proc getChanges*(): Map[IBinder, Change]
  proc getHierarchyOps*(): List[HierarchyOp]
  proc getErrorCallbackToken*(): IBinder
  proc getTaskFragmentOrganizer*(): ITaskFragmentOrganizer
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Creator[WindowContainerTransaction] {.`static`.}

jclass android.window.WindowContainerTransaction.Change* of JVMObject:
  proc merge*(other: Change, transfer: jboolean)
  proc getWindowingMode*(): jint
  proc getActivityWindowingMode*(): jint
  proc getConfiguration*(): Configuration
  proc getFocusable*(): jboolean
  proc getHidden*(): jboolean
  proc getIgnoreOrientationRequest*(): jboolean
  proc getForceTranslucent*(): jboolean
  proc getDragResizing*(): jboolean
  proc getConfigAtTransitionEnd*(): jboolean
  proc getChangeMask*(): jint
  proc getConfigSetMask*(): jint
  proc getWindowSetMask*(): jint
  proc getEnterPipBounds*(): Rect
  proc getBoundsChangeTransaction*(): SurfaceControl.Transaction
  proc getRelativeBounds*(): Rect
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint

jclass android.window.WindowContainerTransaction.HierarchyOp* of JVMObject:
  proc createForReparent*(container: IBinder, reparent: IBinder, toTop: jboolean): HierarchyOp {.`static`.}
  proc createForReorder*(container: IBinder, toTop: jboolean, includingParents: jboolean): HierarchyOp {.`static`.}
  proc createForChildrenTasksReparent*(currentParent: IBinder, newParent: IBinder, windowingModes: seq[jint], activityTypes: seq[jint], onTop: jboolean, reparentTopOnly: jboolean): HierarchyOp {.`static`.}
  proc createForSetLaunchRoot*(container: IBinder, windowingModes: seq[jint], activityTypes: seq[jint]): HierarchyOp {.`static`.}
  proc createForAdjacentRoots*(root1: IBinder, root2: IBinder): HierarchyOp {.`static`.}
  proc createForTaskLaunch*(taskId: jint, options: Bundle): HierarchyOp {.`static`.}
  proc createForStartShortcut*(callingPackage: string, shortcutInfo: ShortcutInfo, options: Bundle): HierarchyOp {.`static`.}
  proc createForSetLaunchAdjacentFlagRoot*(container: IBinder, clearRoot: jboolean): HierarchyOp {.`static`.}
  proc createForSetDisableLaunchAdjacent*(container: IBinder, disabled: jboolean): HierarchyOp {.`static`.}
  proc createForRemoveTask*(container: IBinder): HierarchyOp {.`static`.}
  proc createForRemoveRootTask*(container: IBinder): HierarchyOp {.`static`.}
  proc createForClearAdjacentRoots*(root: IBinder): HierarchyOp {.`static`.}
  proc createForReachability*(container: IBinder, taskId: jint, x: jint, y: jint): HierarchyOp {.`static`.}
  proc createForSetTaskTrimmableFromRecents*(container: IBinder, isTrimmableFromRecents: jboolean): HierarchyOp {.`static`.}
  proc createForSetSafeRegionBounds*(container: IBinder, safeRegionBounds: Rect): HierarchyOp {.`static`.}
  proc getType*(): jint
  proc isReparent*(): jboolean
  proc getNewParent*(): IBinder
  proc getInsetsFrameProvider*(): InsetsFrameProvider
  proc getInsetsFrameOwner*(): IBinder
  proc getContainer*(): IBinder
  proc getContainers*(): seq[IBinder]
  proc getToTop*(): jboolean
  proc getReparentTopOnly*(): jboolean
  proc getWindowingModes*(): seq[jint]
  proc getActivityTypes*(): seq[jint]
  proc getLaunchOptions*(): Bundle
  proc getAppCompatOptions*(): Bundle
  proc getActivityIntent*(): Intent
  proc isAlwaysOnTop*(): jboolean
  proc isReparentLeafTaskIfRelaunch*(): jboolean
  proc getTaskFragmentOperation*(): TaskFragmentOperation
  proc getKeyguardState*(): KeyguardState
  proc getPendingIntent*(): PendingIntent
  proc getShortcutInfo*(): ShortcutInfo
  proc getBounds*(): Rect
  proc includingParents*(): jboolean
  proc isTrimmableFromRecents*(): jboolean
  proc getExcludeInsetsTypes*(): jint
  proc isLaunchAdjacentDisabled*(): jboolean
  proc getSafeRegionBounds*(): Rect
  proc hopToString*(type: jint): string {.`static`.}
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint

jclass android.window.WindowContainerTransaction.TaskFragmentAdjacentParams* of JVMObject:
  proc setShouldDelayPrimaryLastActivityRemoval*(delay: jboolean)
  proc setShouldDelaySecondaryLastActivityRemoval*(delay: jboolean)
  proc shouldDelayPrimaryLastActivityRemoval*(): jboolean
  proc shouldDelaySecondaryLastActivityRemoval*(): jboolean

jclass android.window.Change* of JVMObject:
  proc merge*(other: Change, transfer: jboolean)
  proc getWindowingMode*(): jint
  proc getActivityWindowingMode*(): jint
  proc getConfiguration*(): Configuration
  proc getFocusable*(): jboolean
  proc getHidden*(): jboolean
  proc getIgnoreOrientationRequest*(): jboolean
  proc getForceTranslucent*(): jboolean
  proc getDragResizing*(): jboolean
  proc getConfigAtTransitionEnd*(): jboolean
  proc getChangeMask*(): jint
  proc getConfigSetMask*(): jint
  proc getWindowSetMask*(): jint
  proc getEnterPipBounds*(): Rect
  proc getBoundsChangeTransaction*(): SurfaceControl.Transaction
  proc getRelativeBounds*(): Rect
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CHANGE_FOCUSABLE*: jint {.`static`.}
  CHANGE_BOUNDS_TRANSACTION*: jint {.`static`.}
  CHANGE_PIP_CALLBACK*: jint {.`static`.}
  CHANGE_HIDDEN*: jint {.`static`.}
  CHANGE_IGNORE_ORIENTATION_REQUEST*: jint {.`static`.}
  CHANGE_FORCE_NO_PIP*: jint {.`static`.}
  CHANGE_FORCE_TRANSLUCENT*: jint {.`static`.}
  CHANGE_DRAG_RESIZING*: jint {.`static`.}
  CHANGE_RELATIVE_BOUNDS*: jint {.`static`.}
  CREATOR*: Creator[Change] {.`static`.}

jclass android.window.HierarchyOp* of JVMObject:
  proc createForReparent*(container: IBinder, reparent: IBinder, toTop: jboolean): HierarchyOp {.`static`.}
  proc createForReorder*(container: IBinder, toTop: jboolean, includingParents: jboolean): HierarchyOp {.`static`.}
  proc createForChildrenTasksReparent*(currentParent: IBinder, newParent: IBinder, windowingModes: seq[jint], activityTypes: seq[jint], onTop: jboolean, reparentTopOnly: jboolean): HierarchyOp {.`static`.}
  proc createForSetLaunchRoot*(container: IBinder, windowingModes: seq[jint], activityTypes: seq[jint]): HierarchyOp {.`static`.}
  proc createForAdjacentRoots*(root1: IBinder, root2: IBinder): HierarchyOp {.`static`.}
  proc createForTaskLaunch*(taskId: jint, options: Bundle): HierarchyOp {.`static`.}
  proc createForStartShortcut*(callingPackage: string, shortcutInfo: ShortcutInfo, options: Bundle): HierarchyOp {.`static`.}
  proc createForSetLaunchAdjacentFlagRoot*(container: IBinder, clearRoot: jboolean): HierarchyOp {.`static`.}
  proc createForSetDisableLaunchAdjacent*(container: IBinder, disabled: jboolean): HierarchyOp {.`static`.}
  proc createForRemoveTask*(container: IBinder): HierarchyOp {.`static`.}
  proc createForRemoveRootTask*(container: IBinder): HierarchyOp {.`static`.}
  proc createForClearAdjacentRoots*(root: IBinder): HierarchyOp {.`static`.}
  proc createForReachability*(container: IBinder, taskId: jint, x: jint, y: jint): HierarchyOp {.`static`.}
  proc createForSetTaskTrimmableFromRecents*(container: IBinder, isTrimmableFromRecents: jboolean): HierarchyOp {.`static`.}
  proc createForSetSafeRegionBounds*(container: IBinder, safeRegionBounds: Rect): HierarchyOp {.`static`.}
  proc getType*(): jint
  proc isReparent*(): jboolean
  proc getNewParent*(): IBinder
  proc getInsetsFrameProvider*(): InsetsFrameProvider
  proc getInsetsFrameOwner*(): IBinder
  proc getContainer*(): IBinder
  proc getContainers*(): seq[IBinder]
  proc getToTop*(): jboolean
  proc getReparentTopOnly*(): jboolean
  proc getWindowingModes*(): seq[jint]
  proc getActivityTypes*(): seq[jint]
  proc getLaunchOptions*(): Bundle
  proc getAppCompatOptions*(): Bundle
  proc getActivityIntent*(): Intent
  proc isAlwaysOnTop*(): jboolean
  proc isReparentLeafTaskIfRelaunch*(): jboolean
  proc getTaskFragmentOperation*(): TaskFragmentOperation
  proc getKeyguardState*(): KeyguardState
  proc getPendingIntent*(): PendingIntent
  proc getShortcutInfo*(): ShortcutInfo
  proc getBounds*(): Rect
  proc includingParents*(): jboolean
  proc isTrimmableFromRecents*(): jboolean
  proc getExcludeInsetsTypes*(): jint
  proc isLaunchAdjacentDisabled*(): jboolean
  proc getSafeRegionBounds*(): Rect
  proc hopToString*(type: jint): string {.`static`.}
  proc toString*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  HIERARCHY_OP_TYPE_REPARENT*: jint {.`static`.}
  HIERARCHY_OP_TYPE_REORDER*: jint {.`static`.}
  HIERARCHY_OP_TYPE_CHILDREN_TASKS_REPARENT*: jint {.`static`.}
  HIERARCHY_OP_TYPE_SET_LAUNCH_ROOT*: jint {.`static`.}
  HIERARCHY_OP_TYPE_SET_ADJACENT_ROOTS*: jint {.`static`.}
  HIERARCHY_OP_TYPE_LAUNCH_TASK*: jint {.`static`.}
  HIERARCHY_OP_TYPE_SET_LAUNCH_ADJACENT_FLAG_ROOT*: jint {.`static`.}
  HIERARCHY_OP_TYPE_PENDING_INTENT*: jint {.`static`.}
  HIERARCHY_OP_TYPE_START_SHORTCUT*: jint {.`static`.}
  HIERARCHY_OP_TYPE_RESTORE_TRANSIENT_ORDER*: jint {.`static`.}
  HIERARCHY_OP_TYPE_ADD_INSETS_FRAME_PROVIDER*: jint {.`static`.}
  HIERARCHY_OP_TYPE_REMOVE_INSETS_FRAME_PROVIDER*: jint {.`static`.}
  HIERARCHY_OP_TYPE_SET_ALWAYS_ON_TOP*: jint {.`static`.}
  HIERARCHY_OP_TYPE_REMOVE_TASK*: jint {.`static`.}
  HIERARCHY_OP_TYPE_FINISH_ACTIVITY*: jint {.`static`.}
  HIERARCHY_OP_TYPE_CLEAR_ADJACENT_ROOTS*: jint {.`static`.}
  HIERARCHY_OP_TYPE_SET_REPARENT_LEAF_TASK_IF_RELAUNCH*: jint {.`static`.}
  HIERARCHY_OP_TYPE_ADD_TASK_FRAGMENT_OPERATION*: jint {.`static`.}
  HIERARCHY_OP_TYPE_MOVE_PIP_ACTIVITY_TO_PINNED_TASK*: jint {.`static`.}
  HIERARCHY_OP_TYPE_SET_IS_TRIMMABLE*: jint {.`static`.}
  HIERARCHY_OP_TYPE_RESTORE_BACK_NAVIGATION*: jint {.`static`.}
  HIERARCHY_OP_TYPE_SET_EXCLUDE_INSETS_TYPES*: jint {.`static`.}
  HIERARCHY_OP_TYPE_SET_KEYGUARD_STATE*: jint {.`static`.}
  HIERARCHY_OP_TYPE_SET_DISABLE_LAUNCH_ADJACENT*: jint {.`static`.}
  HIERARCHY_OP_TYPE_REMOVE_ROOT_TASK*: jint {.`static`.}
  HIERARCHY_OP_TYPE_APP_COMPAT_REACHABILITY*: jint {.`static`.}
  HIERARCHY_OP_TYPE_SET_SAFE_REGION_BOUNDS*: jint {.`static`.}
  LAUNCH_KEY_TASK_ID*: string {.`static`.}
  LAUNCH_KEY_SHORTCUT_CALLING_PACKAGE*: string {.`static`.}
  REACHABILITY_EVENT_X*: string {.`static`.}
  REACHABILITY_EVENT_Y*: string {.`static`.}
  CREATOR*: Creator[HierarchyOp] {.`static`.}

jclass android.window.TaskFragmentAdjacentParams* of JVMObject:
  proc setShouldDelayPrimaryLastActivityRemoval*(delay: jboolean)
  proc setShouldDelaySecondaryLastActivityRemoval*(delay: jboolean)
  proc shouldDelayPrimaryLastActivityRemoval*(): jboolean
  proc shouldDelaySecondaryLastActivityRemoval*(): jboolean

