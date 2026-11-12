import jnim

jclass android.graphics.Path* of JVMObject:
  proc reset*()
  proc rewind*()
  proc set*(src: Path)
  proc getPathIterator*(): PathIterator
  proc op*(path: Path, op: Op): jboolean
  proc op*(path1: Path, path2: Path, op: Op): jboolean
  proc isConvex*(): jboolean
  proc getFillType*(): FillType
  proc setFillType*(ft: FillType)
  proc isInverseFillType*(): jboolean
  proc toggleInverseFillType*()
  proc isEmpty*(): jboolean
  proc isRect*(rect: RectF): jboolean
  proc computeBounds*(bounds: RectF, exact: jboolean)
  proc computeBounds*(bounds: RectF)
  proc incReserve*(extraPtCount: jint)
  proc moveTo*(x: jfloat, y: jfloat)
  proc rMoveTo*(dx: jfloat, dy: jfloat)
  proc lineTo*(x: jfloat, y: jfloat)
  proc rLineTo*(dx: jfloat, dy: jfloat)
  proc quadTo*(x1: jfloat, y1: jfloat, x2: jfloat, y2: jfloat)
  proc rQuadTo*(dx1: jfloat, dy1: jfloat, dx2: jfloat, dy2: jfloat)
  proc conicTo*(x1: jfloat, y1: jfloat, x2: jfloat, y2: jfloat, weight: jfloat)
  proc rConicTo*(dx1: jfloat, dy1: jfloat, dx2: jfloat, dy2: jfloat, weight: jfloat)
  proc cubicTo*(x1: jfloat, y1: jfloat, x2: jfloat, y2: jfloat, x3: jfloat, y3: jfloat)
  proc rCubicTo*(x1: jfloat, y1: jfloat, x2: jfloat, y2: jfloat, x3: jfloat, y3: jfloat)
  proc arcTo*(oval: RectF, startAngle: jfloat, sweepAngle: jfloat, forceMoveTo: jboolean)
  proc arcTo*(oval: RectF, startAngle: jfloat, sweepAngle: jfloat)
  proc arcTo*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat, startAngle: jfloat, sweepAngle: jfloat, forceMoveTo: jboolean)
  proc close*()
  proc addRect*(rect: RectF, dir: Direction)
  proc addRect*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat, dir: Direction)
  proc addOval*(oval: RectF, dir: Direction)
  proc addOval*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat, dir: Direction)
  proc addCircle*(x: jfloat, y: jfloat, radius: jfloat, dir: Direction)
  proc addArc*(oval: RectF, startAngle: jfloat, sweepAngle: jfloat)
  proc addArc*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat, startAngle: jfloat, sweepAngle: jfloat)
  proc addRoundRect*(rect: RectF, rx: jfloat, ry: jfloat, dir: Direction)
  proc addRoundRect*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat, rx: jfloat, ry: jfloat, dir: Direction)
  proc addRoundRect*(rect: RectF, radii: seq[jfloat], dir: Direction)
  proc addRoundRect*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat, radii: seq[jfloat], dir: Direction)
  proc addPath*(src: Path, dx: jfloat, dy: jfloat)
  proc addPath*(src: Path)
  proc addPath*(src: Path, matrix: Matrix)
  proc offset*(dx: jfloat, dy: jfloat, dst: Path)
  proc offset*(dx: jfloat, dy: jfloat)
  proc setLastPoint*(dx: jfloat, dy: jfloat)
  proc transform*(matrix: Matrix, dst: Path)
  proc transform*(matrix: Matrix)
  proc readOnlyNI*(): jlong
  proc approximate*(acceptableError: jfloat): seq[jfloat]
  proc getGenerationId*(): jint
  proc isInterpolatable*(otherPath: Path): jboolean
  proc interpolate*(otherPath: Path, t: jfloat, interpolatedPath: Path): jboolean
  mNativePath*: jlong

