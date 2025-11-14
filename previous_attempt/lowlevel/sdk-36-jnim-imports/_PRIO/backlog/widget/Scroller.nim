import jnim

jclass android.widget.Scroller* of JVMObject:
  proc setFriction*(friction: jfloat)
  proc isFinished*(): jboolean
  proc forceFinished*(finished: jboolean)
  proc getDuration*(): jint
  proc getCurrX*(): jint
  proc getCurrY*(): jint
  proc getCurrVelocity*(): jfloat
  proc getStartX*(): jint
  proc getStartY*(): jint
  proc getFinalX*(): jint
  proc getFinalY*(): jint
  proc computeScrollOffset*(): jboolean
  proc startScroll*(startX: jint, startY: jint, dx: jint, dy: jint)
  proc startScroll*(startX: jint, startY: jint, dx: jint, dy: jint, duration: jint)
  proc fling*(startX: jint, startY: jint, velocityX: jint, velocityY: jint, minX: jint, maxX: jint, minY: jint, maxY: jint)
  proc abortAnimation*()
  proc extendDuration*(extend: jint)
  proc timePassed*(): jint
  proc setFinalX*(newX: jint)
  proc setFinalY*(newY: jint)
  proc isScrollingInDirection*(xvel: jfloat, yvel: jfloat): jboolean

