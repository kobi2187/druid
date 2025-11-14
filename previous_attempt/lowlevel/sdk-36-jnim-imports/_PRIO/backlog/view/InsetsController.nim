import jnim

jclass android.view.InsetsController* of JVMObject:
  proc onFrameChanged*(frame: Rect)
  proc getState*(): InsetsState
  proc getRequestedVisibleTypes*(): jint
  proc getLastDispatchedState*(): InsetsState
  proc onStateChanged*(state: InsetsState): jboolean
  proc calculateInsets*(isScreenRound: jboolean, windowType: jint, activityType: jint, legacySoftInputMode: jint, legacyWindowFlags: jint, legacySystemUiFlags: jint): WindowInsets
  proc calculateVisibleInsets*(windowType: jint, activityType: jint, softInputMode: jint, windowFlags: jint): Insets
  proc onControlsChanged*(activeControls: seq[InsetsSourceControl])
  proc setPredictiveBackImeHideAnimInProgress*(isInProgress: jboolean)
  proc isPredictiveBackImeHideAnimInProgress*(): jboolean
  proc show*(types: jint)
  proc show*(types: jint, fromIme: jboolean, statsToken: ImeTracker.Token)
  proc hide*(types: jint)
  proc hide*(types: jint, fromIme: jboolean, statsToken: ImeTracker.Token)
  proc controlWindowInsetsAnimation*(types: jint, durationMillis: jlong, interpolator: Interpolator, cancellationSignal: CancellationSignal, listener: WindowInsetsAnimationControlListener)
  proc controlWindowInsetsAnimation*(types: jint, cancellationSignal: CancellationSignal, listener: WindowInsetsAnimationControlListener, fromIme: jboolean, durationMs: jlong, interpolator: Interpolator, animationType: jint, fromPredictiveBack: jboolean)
  proc setSystemDrivenInsetsAnimationLoggingListener*(listener: WindowInsetsAnimationControlListener)
  proc notifyFinished*(runner: InsetsAnimationControlRunner, shown: jboolean)
  proc applySurfaceParams*(params: SyncRtSurfaceTransactionApplier.SurfaceParams)
  proc getSourceConsumer*(id: jint, type: jint): InsetsSourceConsumer
  proc getImeSourceConsumer*(): InsetsSourceConsumer
  proc updateCompatSysUiVisibility*()
  proc onWindowFocusGained*(hasViewFocused: jboolean)
  proc onWindowFocusLost*()
  proc getAnimationType*(type: jint): jint
  proc setRequestedVisibleTypes*(visibleTypes: jint, mask: jint)
  proc computeUserAnimatingTypes*(): jint
  proc applyAnimation*(types: jint, show: jboolean, fromIme: jboolean, skipsCallbacks: jboolean, statsToken: ImeTracker.Token)
  proc applyAnimation*(types: jint, show: jboolean, fromIme: jboolean, skipsAnim: jboolean, skipsCallbacks: jboolean, statsToken: ImeTracker.Token)
  proc cancelExistingAnimations*()
  proc startAnimation*(runner: T, listener: WindowInsetsAnimationControlListener, types: jint, animation: WindowInsetsAnimation, bounds: Bounds)
  proc dispatchAnimationEnd*(animation: WindowInsetsAnimation)
  proc scheduleApplyChangeInsets*(runner: InsetsAnimationControlRunner)
  proc setSystemBarsAppearance*(appearance: jint, mask: jint)
  proc setSystemBarsAppearanceFromResource*(appearance: jint, mask: jint)
  proc getSystemBarsAppearance*(): jint
  proc getAppearanceControlled*(): jint
  proc setImeCaptionBarInsetsHeight*(height: jint)
  proc setSystemBarsBehavior*(behavior: jint)
  proc getSystemBarsBehavior*(): jint
  proc isBehaviorControlled*(): jboolean
  proc setAnimationsDisabled*(disable: jboolean)
  proc addOnControllableInsetsChangedListener*(listener: OnControllableInsetsChangedListener)
  proc removeOnControllableInsetsChangedListener*(listener: OnControllableInsetsChangedListener)
  proc releaseSurfaceControlFromRt*(sc: SurfaceControl)
  proc reportPerceptible*(types: jint, perceptible: jboolean)
  proc getHost*(): Host
  ANIMATION_DURATION_RESIZE*: jint {.`static`.}
  RESIZE_INTERPOLATOR*: Interpolator {.`static`.}
  LAYOUT_INSETS_DURING_ANIMATION_SHOWN*: jint {.`static`.}
  LAYOUT_INSETS_DURING_ANIMATION_HIDDEN*: jint {.`static`.}
  ANIMATION_TYPE_NONE*: jint {.`static`.}
  ANIMATION_TYPE_SHOW*: jint {.`static`.}
  ANIMATION_TYPE_HIDE*: jint {.`static`.}
  ANIMATION_TYPE_USER*: jint {.`static`.}
  ANIMATION_TYPE_RESIZE*: jint {.`static`.}

jclass android.view.InsetsController.InternalAnimationControlListener* of JVMObject:
  proc onReady*(controller: WindowInsetsAnimationController, types: jint)
  proc onFinished*(controller: WindowInsetsAnimationController)
  proc onCancelled*(controller: WindowInsetsAnimationController)
  proc getInsetsInterpolator*(hasZeroInsetsIme: jboolean): Interpolator
  proc getDurationMs*(hasZeroInsetsIme: jboolean): jlong


jclass android.view.InternalAnimationControlListener* of JVMObject:
  proc onReady*(controller: WindowInsetsAnimationController, types: jint)
  proc onFinished*(controller: WindowInsetsAnimationController)
  proc onCancelled*(controller: WindowInsetsAnimationController)
  proc getInsetsInterpolator*(hasZeroInsetsIme: jboolean): Interpolator
  proc getDurationMs*(hasZeroInsetsIme: jboolean): jlong

