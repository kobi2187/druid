import jnim

jclass android.graphics.PathMeasure* of JVMObject:
  proc setPath*(path: Path, forceClosed: jboolean)
  proc getLength*(): jfloat
  proc getPosTan*(distance: jfloat, pos: seq[jfloat], tan: seq[jfloat]): jboolean
  proc getMatrix*(distance: jfloat, matrix: Matrix, flags: jint): jboolean
  proc getSegment*(startD: jfloat, stopD: jfloat, dst: Path, startWithMoveTo: jboolean): jboolean
  proc isClosed*(): jboolean
  proc nextContour*(): jboolean
  POSITION_MATRIX_FLAG*: jint {.`static`.}
  TANGENT_MATRIX_FLAG*: jint {.`static`.}

