import jnim

jclass android.widget.OverScroller* of JVMObject:
  proc setFriction*(friction: jfloat)
  proc isFinished*(): jboolean
  proc forceFinished*(finished: jboolean)
  proc getCurrX*(): jint
  proc getCurrY*(): jint
  proc getCurrVelocity*(): jfloat
  proc getStartX*(): jint
  proc getStartY*(): jint
  proc getFinalX*(): jint
  proc getFinalY*(): jint
  proc getDuration*(): jint
  proc extendDuration*(extend: jint)
  proc setFinalX*(newX: jint)
  proc setFinalY*(newY: jint)
  proc computeScrollOffset*(): jboolean
  proc startScroll*(startX: jint, startY: jint, dx: jint, dy: jint)
  proc startScroll*(startX: jint, startY: jint, dx: jint, dy: jint, duration: jint)
  proc springBack*(startX: jint, startY: jint, minX: jint, maxX: jint, minY: jint, maxY: jint): jboolean
  proc fling*(startX: jint, startY: jint, velocityX: jint, velocityY: jint, minX: jint, maxX: jint, minY: jint, maxY: jint)
  proc fling*(startX: jint, startY: jint, velocityX: jint, velocityY: jint, minX: jint, maxX: jint, minY: jint, maxY: jint, overX: jint, overY: jint)
  proc notifyHorizontalEdgeReached*(startX: jint, finalX: jint, overX: jint)
  proc notifyVerticalEdgeReached*(startY: jint, finalY: jint, overY: jint)
  proc isOverScrolled*(): jboolean
  proc abortAnimation*()
  proc timePassed*(): jint
  proc isScrollingInDirection*(xvel: jfloat, yvel: jfloat): jboolean

