import jnim

jclass android.widget.ZoomButton* of ImageButton:
  proc onTouchEvent*(event: MotionEvent): jboolean
  proc setZoomSpeed*(speed: jlong)
  proc onLongClick*(v: View): jboolean
  proc onKeyUp*(keyCode: jint, event: KeyEvent): jboolean
  proc setEnabled*(enabled: jboolean)
  proc dispatchUnhandledMove*(focused: View, direction: jint): jboolean
  proc getAccessibilityClassName*(): CharSequence

