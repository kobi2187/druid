import jnim

jclass android.view.WindowManagerImpl* of JVMObject:
  proc createLocalWindowManager*(parentWindow: Window): WindowManagerImpl
  proc createPresentationWindowManager*(displayContext: Context): WindowManagerImpl
  proc createWindowContextWindowManager*(context: Context): WindowManager {.`static`.}
  proc setDefaultToken*(token: IBinder)
  proc addView*(view: View, params: ViewGroup.LayoutParams)
  proc updateViewLayout*(view: View, params: ViewGroup.LayoutParams)
  proc removeView*(view: View)
  proc removeViewImmediate*(view: View)
  proc requestAppKeyboardShortcuts*(receiver: KeyboardShortcutsReceiver, deviceId: jint)
  proc getApplicationLaunchKeyboardShortcuts*(deviceId: jint): KeyboardShortcutGroup
  proc requestImeKeyboardShortcuts*(receiver: KeyboardShortcutsReceiver, deviceId: jint)
  proc getDefaultDisplay*(): Display
  proc getCurrentImeTouchRegion*(): Region
  proc setShouldShowWithInsecureKeyguard*(displayId: jint, shouldShow: jboolean)
  proc setShouldShowSystemDecors*(displayId: jint, shouldShow: jboolean)
  proc shouldShowSystemDecors*(displayId: jint): jboolean
  proc setDisplayImePolicy*(displayId: jint, imePolicy: jint)
  proc getDisplayImePolicy*(displayId: jint): jint
  proc isGlobalKey*(keyCode: jint): jboolean
  proc getCurrentWindowMetrics*(): WindowMetrics
  proc getMaximumWindowMetrics*(): WindowMetrics
  proc getPossibleMaximumWindowMetrics*(displayId: jint): Set[WindowMetrics]
  proc holdLock*(token: IBinder, durationMs: jint)
  proc isCrossWindowBlurEnabled*(): jboolean
  proc addCrossWindowBlurEnabledListener*(listener: Consumer[Boolean])
  proc addCrossWindowBlurEnabledListener*(executor: Executor, listener: Consumer[Boolean])
  proc removeCrossWindowBlurEnabledListener*(listener: Consumer[Boolean])
  proc addProposedRotationListener*(executor: Executor, listener: IntConsumer)
  proc removeProposedRotationListener*(listener: IntConsumer)
  proc isTaskSnapshotSupported*(): jboolean
  proc registerTaskFpsCallback*(taskId: jint, executor: Executor, callback: TaskFpsCallback)
  proc unregisterTaskFpsCallback*(callback: TaskFpsCallback)
  proc snapshotTaskForRecents*(taskId: jint): Bitmap
  proc getDefaultToken*(): IBinder
  proc notifyScreenshotListeners*(displayId: jint): List[ComponentName]
  proc replaceContentOnDisplayWithMirror*(displayId: jint, window: Window): jboolean
  proc replaceContentOnDisplayWithSc*(displayId: jint, sc: SurfaceControl): jboolean
  proc registerTrustedPresentationListener*(window: IBinder, thresholds: TrustedPresentationThresholds, executor: Executor, listener: Consumer[Boolean])
  proc unregisterTrustedPresentationListener*(listener: Consumer[Boolean])
  proc registerBatchedSurfaceControlInputReceiver*(hostInputTransferToken: InputTransferToken, surfaceControl: SurfaceControl, choreographer: Choreographer, receiver: SurfaceControlInputReceiver): InputTransferToken
  proc registerUnbatchedSurfaceControlInputReceiver*(hostInputTransferToken: InputTransferToken, surfaceControl: SurfaceControl, looper: Looper, receiver: SurfaceControlInputReceiver): InputTransferToken
  proc unregisterSurfaceControlInputReceiver*(surfaceControl: SurfaceControl)
  proc getSurfaceControlInputClientToken*(surfaceControl: SurfaceControl): IBinder
  proc transferTouchGesture*(transferFromToken: InputTransferToken, transferToToken: InputTransferToken): jboolean
  proc addScreenRecordingCallback*(executor: Executor, callback: Consumer[Integer]): jint
  proc removeScreenRecordingCallback*(callback: Consumer[Integer])
  mContext*: Context

