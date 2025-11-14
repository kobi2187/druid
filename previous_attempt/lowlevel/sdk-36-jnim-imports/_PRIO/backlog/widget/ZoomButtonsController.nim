import jnim

jclass android.widget.ZoomButtonsController* of JVMObject:
  proc setZoomInEnabled*(enabled: jboolean)
  proc setZoomOutEnabled*(enabled: jboolean)
  proc setZoomSpeed*(speed: jlong)
  proc setOnZoomListener*(listener: OnZoomListener)
  proc setFocusable*(focusable: jboolean)
  proc isAutoDismissed*(): jboolean
  proc setAutoDismissed*(autoDismiss: jboolean)
  proc isVisible*(): jboolean
  proc setVisible*(visible: jboolean)
  proc getContainer*(): ViewGroup
  proc getZoomControls*(): View
  proc onTouch*(v: View, event: MotionEvent): jboolean

