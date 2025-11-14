import jnim

jclass android.view.ViewConfiguration* of JVMObject:
  proc get*(context: Context): ViewConfiguration {.`static`.}
  proc resetCacheForTesting*() {.`static`.}
  proc setInstanceForTesting*(context: Context, instance: ViewConfiguration) {.`static`.}
  proc getScrollBarSize*(): jint {.`static`.}
  proc getScaledScrollBarSize*(): jint
  proc getScaledMinScrollbarTouchTarget*(): jint
  proc getScrollBarFadeDuration*(): jint {.`static`.}
  proc getScrollDefaultDelay*(): jint {.`static`.}
  proc getFadingEdgeLength*(): jint {.`static`.}
  proc getScaledFadingEdgeLength*(): jint
  proc getPressedStateDuration*(): jint {.`static`.}
  proc getLongPressTimeout*(): jint {.`static`.}
  proc getMultiPressTimeout*(): jint {.`static`.}
  proc getKeyRepeatTimeout*(): jint {.`static`.}
  proc getKeyRepeatDelay*(): jint {.`static`.}
  proc getTapTimeout*(): jint {.`static`.}
  proc getJumpTapTimeout*(): jint {.`static`.}
  proc getDoubleTapTimeout*(): jint {.`static`.}
  proc getDoubleTapMinTime*(): jint {.`static`.}
  proc getHoverTapTimeout*(): jint {.`static`.}
  proc getHoverTapSlop*(): jint {.`static`.}
  proc getEdgeSlop*(): jint {.`static`.}
  proc getScaledEdgeSlop*(): jint
  proc getTouchSlop*(): jint {.`static`.}
  proc getScaledTouchSlop*(): jint
  proc getScaledHandwritingSlop*(): jint
  proc getScaledHoverSlop*(): jint
  proc getScaledDoubleTapTouchSlop*(): jint
  proc getScaledPagingTouchSlop*(): jint
  proc getDoubleTapSlop*(): jint {.`static`.}
  proc getScaledDoubleTapSlop*(): jint
  proc getScaledHandwritingGestureLineMargin*(): jint
  proc getSendRecurringAccessibilityEventsInterval*(): jlong {.`static`.}
  proc getWindowTouchSlop*(): jint {.`static`.}
  proc getScaledWindowTouchSlop*(): jint
  proc getMinimumFlingVelocity*(): jint {.`static`.}
  proc getScaledMinimumFlingVelocity*(): jint
  proc getMaximumFlingVelocity*(): jint {.`static`.}
  proc getScaledMaximumFlingVelocity*(): jint
  proc getScaledScrollFactor*(): jint
  proc getScaledHorizontalScrollFactor*(): jfloat
  proc getScaledVerticalScrollFactor*(): jfloat
  proc getMaximumDrawingCacheSize*(): jint {.`static`.}
  proc getScaledMaximumDrawingCacheSize*(): jint
  proc getScaledOverscrollDistance*(): jint
  proc getScaledOverflingDistance*(): jint
  proc getZoomControlsTimeout*(): jlong {.`static`.}
  proc getGlobalActionKeyTimeout*(): jlong {.`static`.}
  proc getDeviceGlobalActionKeyTimeout*(): jlong
  proc getScreenshotChordKeyTimeout*(): jlong
  proc getAccessibilityShortcutKeyTimeout*(): jlong
  proc getAccessibilityShortcutKeyTimeoutAfterConfirmation*(): jlong
  proc getScrollFriction*(): jfloat {.`static`.}
  proc getDefaultActionModeHideDuration*(): jlong {.`static`.}
  proc getAmbiguousGestureMultiplier*(): jfloat {.`static`.}
  proc getScaledAmbiguousGestureMultiplier*(): jfloat
  proc hasPermanentMenuKey*(): jboolean
  proc getScaledMinimumFlingVelocity*(inputDeviceId: jint, axis: jint, source: jint): jint
  proc getScaledMaximumFlingVelocity*(inputDeviceId: jint, axis: jint, source: jint): jint
  proc isHapticScrollFeedbackEnabled*(inputDeviceId: jint, axis: jint, source: jint): jboolean
  proc getHapticScrollFeedbackTickInterval*(inputDeviceId: jint, axis: jint, source: jint): jint
  proc isViewBasedRotaryEncoderHapticScrollFeedbackEnabled*(): jboolean
  proc shouldShowMenuShortcutsWhenKeyboardPresent*(): jboolean
  proc getScaledMinimumScalingSpan*(): jint
  proc isFadingMarqueeEnabled*(): jboolean
  proc getSmartSelectionInitializedTimeout*(): jint
  proc getSmartSelectionInitializingTimeout*(): jint
  proc isPreferKeepClearForFocusEnabled*(): jboolean
  proc getLongPressTooltipHideTimeout*(): jint {.`static`.}
  proc getHoverTooltipShowTimeout*(): jint {.`static`.}
  proc getHoverTooltipHideTimeout*(): jint {.`static`.}
  proc getHoverTooltipHideShortTimeout*(): jint {.`static`.}
  DEFAULT_LONG_PRESS_TIMEOUT*: jint {.`static`.}
  NO_HAPTIC_SCROLL_TICK_INTERVAL*: jint {.`static`.}

