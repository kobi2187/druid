import jnim

jclass android.widget.SlidingDrawer* of ViewGroup:
  proc onInterceptTouchEvent*(event: MotionEvent): jboolean
  proc onTouchEvent*(event: MotionEvent): jboolean
  proc toggle*()
  proc animateToggle*()
  proc open*()
  proc close*()
  proc animateClose*()
  proc animateOpen*()
  proc getAccessibilityClassName*(): CharSequence
  proc setOnDrawerOpenListener*(onDrawerOpenListener: OnDrawerOpenListener)
  proc setOnDrawerCloseListener*(onDrawerCloseListener: OnDrawerCloseListener)
  proc setOnDrawerScrollListener*(onDrawerScrollListener: OnDrawerScrollListener)
  proc getHandle*(): View
  proc getContent*(): View
  proc unlock*()
  proc lock*()
  proc isOpened*(): jboolean
  proc isMoving*(): jboolean
  ORIENTATION_HORIZONTAL*: jint {.`static`.}
  ORIENTATION_VERTICAL*: jint {.`static`.}

jclass android.widget.SlidingDrawer.OnDrawerOpenListener* of JVMObject:
  proc onDrawerOpened*()

jclass android.widget.SlidingDrawer.OnDrawerCloseListener* of JVMObject:
  proc onDrawerClosed*()

jclass android.widget.SlidingDrawer.OnDrawerScrollListener* of JVMObject:
  proc onScrollStarted*()
  proc onScrollEnded*()

jclass android.widget.OnDrawerOpenListener* of JVMObject:
  proc onDrawerOpened*()

jclass android.widget.OnDrawerCloseListener* of JVMObject:
  proc onDrawerClosed*()

jclass android.widget.OnDrawerScrollListener* of JVMObject:
  proc onScrollStarted*()
  proc onScrollEnded*()

