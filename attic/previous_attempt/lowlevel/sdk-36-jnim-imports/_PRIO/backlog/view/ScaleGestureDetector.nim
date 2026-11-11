import jnim

jclass android.view.ScaleGestureDetector* of JVMObject:
  proc onTouchEvent*(event: MotionEvent): jboolean
  proc setQuickScaleEnabled*(scales: jboolean)
  proc isQuickScaleEnabled*(): jboolean
  proc setStylusScaleEnabled*(scales: jboolean)
  proc isStylusScaleEnabled*(): jboolean
  proc isInProgress*(): jboolean
  proc getFocusX*(): jfloat
  proc getFocusY*(): jfloat
  proc getCurrentSpan*(): jfloat
  proc getCurrentSpanX*(): jfloat
  proc getCurrentSpanY*(): jfloat
  proc getPreviousSpan*(): jfloat
  proc getPreviousSpanX*(): jfloat
  proc getPreviousSpanY*(): jfloat
  proc getScaleFactor*(): jfloat
  proc getTimeDelta*(): jlong
  proc getEventTime*(): jlong

jclass android.view.ScaleGestureDetector.OnScaleGestureListener* of JVMObject:
  proc onScale*(detector: ScaleGestureDetector): jboolean
  proc onScaleBegin*(detector: ScaleGestureDetector): jboolean
  proc onScaleEnd*(detector: ScaleGestureDetector)

jclass android.view.ScaleGestureDetector.SimpleOnScaleGestureListener* of JVMObject:
  proc onScale*(detector: ScaleGestureDetector): jboolean
  proc onScaleBegin*(detector: ScaleGestureDetector): jboolean
  proc onScaleEnd*(detector: ScaleGestureDetector)

jclass android.view.OnScaleGestureListener* of JVMObject:
  proc onScale*(detector: ScaleGestureDetector): jboolean
  proc onScaleBegin*(detector: ScaleGestureDetector): jboolean
  proc onScaleEnd*(detector: ScaleGestureDetector)

jclass android.view.SimpleOnScaleGestureListener* of JVMObject:
  proc onScale*(detector: ScaleGestureDetector): jboolean
  proc onScaleBegin*(detector: ScaleGestureDetector): jboolean
  proc onScaleEnd*(detector: ScaleGestureDetector)

