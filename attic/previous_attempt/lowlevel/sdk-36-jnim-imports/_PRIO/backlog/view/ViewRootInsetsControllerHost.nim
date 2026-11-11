import jnim

jclass android.view.ViewRootInsetsControllerHost* of JVMObject:
  proc getHandler*(): Handler
  proc notifyInsetsChanged*()
  proc addOnPreDrawRunnable*(r: Runnable)
  proc dispatchWindowInsetsAnimationPrepare*(animation: WindowInsetsAnimation)
  proc dispatchWindowInsetsAnimationStart*(animation: WindowInsetsAnimation, bounds: WindowInsetsAnimation.Bounds): WindowInsetsAnimation.Bounds
  proc dispatchWindowInsetsAnimationProgress*(insets: WindowInsets, runningAnimations: List[WindowInsetsAnimation]): WindowInsets
  proc dispatchWindowInsetsAnimationEnd*(animation: WindowInsetsAnimation)
  proc applySurfaceParams*(params: SyncRtSurfaceTransactionApplier.SurfaceParams)
  proc postInsetsAnimationCallback*(r: Runnable)
  proc updateCompatSysUiVisibility*(visibleTypes: jint, requestedVisibleTypes: jint, controllableTypes: jint)
  proc updateRequestedVisibleTypes*(types: jint, statsToken: ImeTracker.Token)
  proc updateAnimatingTypes*(animatingTypes: jint, statsToken: ImeTracker.Token)
  proc hasAnimationCallbacks*(): jboolean
  proc setSystemBarsAppearance*(appearance: jint, mask: jint)
  proc getSystemBarsAppearance*(): jint
  proc setSystemBarsBehavior*(behavior: jint)
  proc getSystemBarsBehavior*(): jint
  proc releaseSurfaceControlFromRt*(surfaceControl: SurfaceControl)
  proc getInputMethodManager*(): InputMethodManager
  proc getRootViewTitle*(): string
  proc getRootViewContext*(): Context
  proc dipToPx*(dips: jint): jint
  proc getWindowToken*(): IBinder
  proc getTranslator*(): CompatibilityInfo.Translator
  proc isHandlingPointerEvent*(): jboolean

