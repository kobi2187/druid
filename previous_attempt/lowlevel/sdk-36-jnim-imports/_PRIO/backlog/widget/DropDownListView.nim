import jnim

jclass android.widget.DropDownListView* of ListView:
  proc onTouchEvent*(ev: MotionEvent): jboolean
  proc onHoverEvent*(ev: MotionEvent): jboolean
  proc onForwardedEvent*(event: MotionEvent, activePointerId: jint): jboolean
  proc setListSelectionHidden*(hideListSelection: jboolean)
  proc isInTouchMode*(): jboolean
  proc hasWindowFocus*(): jboolean
  proc isFocused*(): jboolean
  proc hasFocus*(): jboolean

