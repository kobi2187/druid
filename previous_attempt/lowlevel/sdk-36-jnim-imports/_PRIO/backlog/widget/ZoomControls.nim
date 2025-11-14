import jnim

jclass android.widget.ZoomControls* of LinearLayout:
  proc setOnZoomInClickListener*(listener: OnClickListener)
  proc setOnZoomOutClickListener*(listener: OnClickListener)
  proc setZoomSpeed*(speed: jlong)
  proc onTouchEvent*(event: MotionEvent): jboolean
  proc show*()
  proc hide*()
  proc setIsZoomInEnabled*(isEnabled: jboolean)
  proc setIsZoomOutEnabled*(isEnabled: jboolean)
  proc hasFocus*(): jboolean
  proc getAccessibilityClassName*(): CharSequence

