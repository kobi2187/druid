import jnim

jclass android.window.BackEvent* of JVMObject:
  proc fromBackMotionEvent*(backMotionEvent: BackMotionEvent): BackEvent {.`static`.}
  proc getProgress*(): jfloat
  proc getTouchX*(): jfloat
  proc getTouchY*(): jfloat
  proc getSwipeEdge*(): jint
  proc getFrameTimeMillis*(): jlong
  proc equals*(other: JObject): jboolean
  proc toString*(): string
  EDGE_LEFT*: jint {.`static`.}
  EDGE_RIGHT*: jint {.`static`.}
  EDGE_NONE*: jint {.`static`.}

