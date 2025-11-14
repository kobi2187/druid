import jnim

jclass android.widget.Gallery* of AbsSpinner:
  proc setCallbackDuringFling*(shouldCallback: jboolean)
  proc setCallbackOnUnselectedItemClick*(shouldCallback: jboolean)
  proc setAnimationDuration*(animationDurationMillis: jint)
  proc setSpacing*(spacing: jint)
  proc setUnselectedAlpha*(unselectedAlpha: jfloat)
  proc generateLayoutParams*(attrs: AttributeSet): ViewGroup.LayoutParams
  proc onTouchEvent*(event: MotionEvent): jboolean
  proc onSingleTapUp*(e: MotionEvent): jboolean
  proc onFling*(e1: MotionEvent, e2: MotionEvent, velocityX: jfloat, velocityY: jfloat): jboolean
  proc onScroll*(e1: MotionEvent, e2: MotionEvent, distanceX: jfloat, distanceY: jfloat): jboolean
  proc onDown*(e: MotionEvent): jboolean
  proc onLongPress*(e: MotionEvent)
  proc onShowPress*(e: MotionEvent)
  proc dispatchSetSelected*(selected: jboolean)
  proc showContextMenuForChild*(originalView: View): jboolean
  proc showContextMenuForChild*(originalView: View, x: jfloat, y: jfloat): jboolean
  proc showContextMenu*(): jboolean
  proc showContextMenu*(x: jfloat, y: jfloat): jboolean
  proc dispatchKeyEvent*(event: KeyEvent): jboolean
  proc onKeyDown*(keyCode: jint, event: KeyEvent): jboolean
  proc onKeyUp*(keyCode: jint, event: KeyEvent): jboolean
  proc setGravity*(gravity: jint)
  proc getAccessibilityClassName*(): CharSequence
  proc onInitializeAccessibilityNodeInfoInternal*(info: AccessibilityNodeInfo)
  proc performAccessibilityActionInternal*(action: jint, arguments: Bundle): jboolean

jclass android.widget.LayoutParams* of LayoutParams:

