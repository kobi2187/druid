import jnim

jclass android.view.ViewTreeObserver* of JVMObject:
  proc addOnWindowAttachListener*(listener: OnWindowAttachListener)
  proc removeOnWindowAttachListener*(victim: OnWindowAttachListener)
  proc addOnWindowFocusChangeListener*(listener: OnWindowFocusChangeListener)
  proc removeOnWindowFocusChangeListener*(victim: OnWindowFocusChangeListener)
  proc addOnWindowVisibilityChangeListener*(listener: OnWindowVisibilityChangeListener)
  proc removeOnWindowVisibilityChangeListener*(victim: OnWindowVisibilityChangeListener)
  proc addOnGlobalFocusChangeListener*(listener: OnGlobalFocusChangeListener)
  proc removeOnGlobalFocusChangeListener*(victim: OnGlobalFocusChangeListener)
  proc addOnGlobalLayoutListener*(listener: OnGlobalLayoutListener)
  proc removeGlobalOnLayoutListener*(victim: OnGlobalLayoutListener)
  proc removeOnGlobalLayoutListener*(victim: OnGlobalLayoutListener)
  proc addOnPreDrawListener*(listener: OnPreDrawListener)
  proc removeOnPreDrawListener*(victim: OnPreDrawListener)
  proc addOnWindowShownListener*(listener: OnWindowShownListener)
  proc removeOnWindowShownListener*(victim: OnWindowShownListener)
  proc addOnDrawListener*(listener: OnDrawListener)
  proc removeOnDrawListener*(victim: OnDrawListener)
  proc registerFrameCommitCallback*(callback: Runnable)
  proc unregisterFrameCommitCallback*(callback: Runnable): jboolean
  proc addOnScrollChangedListener*(listener: OnScrollChangedListener)
  proc removeOnScrollChangedListener*(victim: OnScrollChangedListener)
  proc addOnTouchModeChangeListener*(listener: OnTouchModeChangeListener)
  proc removeOnTouchModeChangeListener*(victim: OnTouchModeChangeListener)
  proc addOnComputeInternalInsetsListener*(listener: OnComputeInternalInsetsListener)
  proc removeOnComputeInternalInsetsListener*(victim: OnComputeInternalInsetsListener)
  proc addOnEnterAnimationCompleteListener*(listener: OnEnterAnimationCompleteListener)
  proc removeOnEnterAnimationCompleteListener*(listener: OnEnterAnimationCompleteListener)
  proc addOnSystemGestureExclusionRectsChangedListener*(listener: Consumer[List[Rect]])
  proc removeOnSystemGestureExclusionRectsChangedListener*(listener: Consumer[List[Rect]])
  proc isAlive*(): jboolean
  proc dispatchOnGlobalLayout*()
  proc dispatchOnPreDraw*(): jboolean
  proc dispatchOnWindowShown*()
  proc dispatchOnDraw*()
  proc dispatchOnScrollChanged*()
  proc dispatchOnEnterAnimationComplete*()

jclass android.view.ViewTreeObserver.OnWindowAttachListener* of JVMObject:
  proc onWindowAttached*()
  proc onWindowDetached*()

jclass android.view.ViewTreeObserver.OnWindowFocusChangeListener* of JVMObject:
  proc onWindowFocusChanged*(hasFocus: jboolean)

jclass android.view.ViewTreeObserver.OnGlobalFocusChangeListener* of JVMObject:
  proc onGlobalFocusChanged*(oldFocus: View, newFocus: View)

jclass android.view.ViewTreeObserver.OnGlobalLayoutListener* of JVMObject:
  proc onGlobalLayout*()

jclass android.view.ViewTreeObserver.OnPreDrawListener* of JVMObject:
  proc onPreDraw*(): jboolean

jclass android.view.ViewTreeObserver.OnDrawListener* of JVMObject:
  proc onDraw*()

jclass android.view.ViewTreeObserver.OnTouchModeChangeListener* of JVMObject:
  proc onTouchModeChanged*(isInTouchMode: jboolean)

jclass android.view.ViewTreeObserver.OnScrollChangedListener* of JVMObject:
  proc onScrollChanged*()

jclass android.view.ViewTreeObserver.InternalInsetsInfo* of JVMObject:
  proc setTouchableInsets*(val: jint)
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean

jclass android.view.ViewTreeObserver.OnComputeInternalInsetsListener* of JVMObject:
  proc onComputeInternalInsets*(inoutInfo: InternalInsetsInfo)

jclass android.view.ViewTreeObserver.OnEnterAnimationCompleteListener* of JVMObject:
  proc onEnterAnimationComplete*()

jclass android.view.OnWindowAttachListener* of JVMObject:
  proc onWindowAttached*()
  proc onWindowDetached*()

jclass android.view.OnWindowFocusChangeListener* of JVMObject:
  proc onWindowFocusChanged*(hasFocus: jboolean)


jclass android.view.OnGlobalFocusChangeListener* of JVMObject:
  proc onGlobalFocusChanged*(oldFocus: View, newFocus: View)

jclass android.view.OnGlobalLayoutListener* of JVMObject:
  proc onGlobalLayout*()

jclass android.view.OnPreDrawListener* of JVMObject:
  proc onPreDraw*(): jboolean

jclass android.view.OnDrawListener* of JVMObject:
  proc onDraw*()

jclass android.view.OnTouchModeChangeListener* of JVMObject:
  proc onTouchModeChanged*(isInTouchMode: jboolean)

jclass android.view.OnScrollChangedListener* of JVMObject:
  proc onScrollChanged*()


jclass android.view.InternalInsetsInfo* of JVMObject:
  proc setTouchableInsets*(val: jint)
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  contentInsets*: Rect
  visibleInsets*: Rect
  touchableRegion*: Region
  TOUCHABLE_INSETS_FRAME*: jint {.`static`.}
  TOUCHABLE_INSETS_CONTENT*: jint {.`static`.}
  TOUCHABLE_INSETS_VISIBLE*: jint {.`static`.}
  TOUCHABLE_INSETS_REGION*: jint {.`static`.}

jclass android.view.OnComputeInternalInsetsListener* of JVMObject:
  proc onComputeInternalInsets*(inoutInfo: InternalInsetsInfo)

jclass android.view.OnEnterAnimationCompleteListener* of JVMObject:
  proc onEnterAnimationComplete*()

