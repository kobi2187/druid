import jnim

jclass android.widget.ScrollView* of FrameLayout:
  proc shouldDelayChildPressedState*(): jboolean
  proc setEdgeEffectColor*(color: jint)
  proc setBottomEdgeEffectColor*(color: jint)
  proc setTopEdgeEffectColor*(color: jint)
  proc getTopEdgeEffectColor*(): jint
  proc getBottomEdgeEffectColor*(): jint
  proc getMaxScrollAmount*(): jint
  proc addView*(child: View)
  proc addView*(child: View, index: jint)
  proc addView*(child: View, params: ViewGroup.LayoutParams)
  proc addView*(child: View, index: jint, params: ViewGroup.LayoutParams)
  proc isFillViewport*(): jboolean
  proc setFillViewport*(fillViewport: jboolean)
  proc isSmoothScrollingEnabled*(): jboolean
  proc setSmoothScrollingEnabled*(smoothScrollingEnabled: jboolean)
  proc dispatchKeyEvent*(event: KeyEvent): jboolean
  proc executeKeyEvent*(event: KeyEvent): jboolean
  proc requestDisallowInterceptTouchEvent*(disallowIntercept: jboolean)
  proc onInterceptTouchEvent*(ev: MotionEvent): jboolean
  proc onTouchEvent*(ev: MotionEvent): jboolean
  proc onGenericMotionEvent*(event: MotionEvent): jboolean
  proc performAccessibilityActionInternal*(action: jint, arguments: Bundle): jboolean
  proc getAccessibilityClassName*(): CharSequence
  proc onInitializeAccessibilityNodeInfoInternal*(info: AccessibilityNodeInfo)
  proc onInitializeAccessibilityEventInternal*(event: AccessibilityEvent)
  proc pageScroll*(direction: jint): jboolean
  proc fullScroll*(direction: jint): jboolean
  proc arrowScroll*(direction: jint): jboolean
  proc smoothScrollBy*(dx: jint, dy: jint)
  proc smoothScrollTo*(x: jint, y: jint)
  proc computeScroll*()
  proc scrollToDescendant*(child: View)
  proc requestChildFocus*(child: View, focused: View)
  proc requestChildRectangleOnScreen*(child: View, rectangle: Rect, immediate: jboolean): jboolean
  proc requestLayout*()
  proc fling*(velocityY: jint)
  proc scrollTo*(x: jint, y: jint)
  proc onStartNestedScroll*(child: View, target: View, nestedScrollAxes: jint): jboolean
  proc onNestedScrollAccepted*(child: View, target: View, axes: jint)
  proc onStopNestedScroll*(target: View)
  proc onNestedScroll*(target: View, dxConsumed: jint, dyConsumed: jint, dxUnconsumed: jint, dyUnconsumed: jint)
  proc onNestedFling*(target: View, velocityX: jfloat, velocityY: jfloat, consumed: jboolean): jboolean
  proc draw*(canvas: Canvas)
  mEdgeGlowTop*: EdgeEffect
  mEdgeGlowBottom*: EdgeEffect

