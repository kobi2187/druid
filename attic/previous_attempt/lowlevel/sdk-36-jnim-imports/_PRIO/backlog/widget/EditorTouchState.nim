import jnim

jclass android.widget.EditorTouchState* of JVMObject:
  proc getLastDownX*(): jfloat
  proc getLastDownY*(): jfloat
  proc getLastUpX*(): jfloat
  proc getLastUpY*(): jfloat
  proc isDoubleTap*(): jboolean
  proc isTripleClick*(): jboolean
  proc isMultiTap*(): jboolean
  proc isMultiTapInSameArea*(): jboolean
  proc isMovedEnoughForDrag*(): jboolean
  proc getInitialDragDirectionXYRatio*(): jfloat
  proc setIsOnHandle*(onHandle: jboolean)
  proc isOnHandle*(): jboolean
  proc update*(event: MotionEvent, config: ViewConfiguration)
  proc isDistanceWithin*(x1: jfloat, y1: jfloat, x2: jfloat, y2: jfloat, maxDistance: jint): jboolean {.`static`.}
  proc getXYRatio*(angleFromVerticalInDegrees: jint): jfloat {.`static`.}

