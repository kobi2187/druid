import jnim

jclass android.view.ViewParent* of JVMObject:
  proc requestLayout*()
  proc isLayoutRequested*(): jboolean
  proc requestTransparentRegion*(child: View)
  proc invalidateChild*(child: View, r: Rect)
  proc invalidateChildInParent*(location: seq[jint], r: Rect): ViewParent
  proc getParent*(): ViewParent
  proc requestChildFocus*(child: View, focused: View)
  proc recomputeViewAttributes*(child: View)
  proc clearChildFocus*(child: View)
  proc getChildVisibleRect*(child: View, r: Rect, offset: android.graphics.Point): jboolean
  proc focusSearch*(v: View, direction: jint): View
  proc bringChildToFront*(child: View)
  proc focusableViewAvailable*(v: View)
  proc showContextMenuForChild*(originalView: View): jboolean
  proc createContextMenu*(menu: ContextMenu)
  proc startActionModeForChild*(originalView: View, callback: ActionMode.Callback): ActionMode
  proc startActionModeForChild*(originalView: View, callback: ActionMode.Callback, type: jint): ActionMode
  proc childDrawableStateChanged*(child: View)
  proc requestDisallowInterceptTouchEvent*(disallowIntercept: jboolean)
  proc requestChildRectangleOnScreen*(child: View, rectangle: Rect, immediate: jboolean): jboolean
  proc requestSendAccessibilityEvent*(child: View, event: AccessibilityEvent): jboolean
  proc childHasTransientStateChanged*(child: View, hasTransientState: jboolean)
  proc requestFitSystemWindows*()
  proc getParentForAccessibility*(): ViewParent
  proc notifySubtreeAccessibilityStateChanged*(child: View, source: View, changeType: jint)
  proc canResolveLayoutDirection*(): jboolean
  proc isLayoutDirectionResolved*(): jboolean
  proc getLayoutDirection*(): jint
  proc canResolveTextDirection*(): jboolean
  proc isTextDirectionResolved*(): jboolean
  proc getTextDirection*(): jint
  proc canResolveTextAlignment*(): jboolean
  proc isTextAlignmentResolved*(): jboolean
  proc getTextAlignment*(): jint
  proc onStartNestedScroll*(child: View, target: View, nestedScrollAxes: jint): jboolean
  proc onNestedScrollAccepted*(child: View, target: View, nestedScrollAxes: jint)
  proc onStopNestedScroll*(target: View)
  proc onNestedScroll*(target: View, dxConsumed: jint, dyConsumed: jint, dxUnconsumed: jint, dyUnconsumed: jint)
  proc onNestedPreScroll*(target: View, dx: jint, dy: jint, consumed: seq[jint])
  proc onNestedFling*(target: View, velocityX: jfloat, velocityY: jfloat, consumed: jboolean): jboolean
  proc onNestedPreFling*(target: View, velocityX: jfloat, velocityY: jfloat): jboolean
  proc onNestedPrePerformAccessibilityAction*(target: View, action: jint, arguments: Bundle): jboolean

