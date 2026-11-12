import jnim

jclass android.widget.HorizontalScrollView* of FrameLayout:
  proc setEdgeEffectColor*(color: jint)
  proc setRightEdgeEffectColor*(color: jint)
  proc setLeftEdgeEffectColor*(color: jint)
  proc getLeftEdgeEffectColor*(): jint
  proc getRightEdgeEffectColor*(): jint
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
  proc shouldDelayChildPressedState*(): jboolean
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
  proc requestChildFocus*(child: View, focused: View)
  proc requestChildRectangleOnScreen*(child: View, rectangle: Rect, immediate: jboolean): jboolean
  proc requestLayout*()
  proc fling*(velocityX: jint)
  proc scrollTo*(x: jint, y: jint)
  proc draw*(canvas: Canvas)
  mEdgeGlowLeft*: EdgeEffect
  mEdgeGlowRight*: EdgeEffect

