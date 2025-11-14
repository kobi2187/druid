import jnim

jclass android.graphics.Canvas* of BaseCanvas:
  proc getNativeCanvasWrapper*(): jlong
  proc isHardwareAccelerated*(): jboolean
  proc isHighContrastTextEnabled*(): jboolean
  proc setBitmap*(bitmap: Bitmap)
  proc enableZ*()
  proc disableZ*()
  proc isOpaque*(): jboolean
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc getDensity*(): jint
  proc setDensity*(density: jint)
  proc setScreenDensity*(density: jint)
  proc getMaximumBitmapWidth*(): jint
  proc getMaximumBitmapHeight*(): jint
  proc save*(): jint
  proc save*(saveFlags: jint): jint
  proc saveLayer*(bounds: RectF, paint: Paint, saveFlags: jint): jint
  proc saveLayer*(bounds: RectF, paint: Paint): jint
  proc saveUnclippedLayer*(left: jint, top: jint, right: jint, bottom: jint): jint
  proc restoreUnclippedLayer*(saveCount: jint, paint: Paint)
  proc saveLayer*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat, paint: Paint, saveFlags: jint): jint
  proc saveLayer*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat, paint: Paint): jint
  proc saveLayerAlpha*(bounds: RectF, alpha: jint, saveFlags: jint): jint
  proc saveLayerAlpha*(bounds: RectF, alpha: jint): jint
  proc saveLayerAlpha*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat, alpha: jint, saveFlags: jint): jint
  proc saveLayerAlpha*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat, alpha: jint): jint
  proc restore*()
  proc getSaveCount*(): jint
  proc restoreToCount*(saveCount: jint)
  proc translate*(dx: jfloat, dy: jfloat)
  proc scale*(sx: jfloat, sy: jfloat)
  proc scale*(sx: jfloat, sy: jfloat, px: jfloat, py: jfloat)
  proc rotate*(degrees: jfloat)
  proc rotate*(degrees: jfloat, px: jfloat, py: jfloat)
  proc skew*(sx: jfloat, sy: jfloat)
  proc concat*(matrix: Matrix)
  proc concat*(m: Matrix44)
  proc setMatrix*(matrix: Matrix)
  proc getMatrix*(ctm: Matrix)
  proc getMatrix*(): Matrix
  proc clipRect*(rect: RectF, op: Region.Op): jboolean
  proc clipRect*(rect: Rect, op: Region.Op): jboolean
  proc clipRectUnion*(rect: Rect): jboolean
  proc clipRect*(rect: RectF): jboolean
  proc clipOutRect*(rect: RectF): jboolean
  proc clipRect*(rect: Rect): jboolean
  proc clipOutRect*(rect: Rect): jboolean
  proc clipRect*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat, op: Region.Op): jboolean
  proc clipRect*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat): jboolean
  proc clipOutRect*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat): jboolean
  proc clipRect*(left: jint, top: jint, right: jint, bottom: jint): jboolean
  proc clipOutRect*(left: jint, top: jint, right: jint, bottom: jint): jboolean
  proc clipPath*(path: Path, op: Region.Op): jboolean
  proc clipPath*(path: Path): jboolean
  proc clipOutPath*(path: Path): jboolean
  proc clipRegion*(region: Region, op: Region.Op): jboolean
  proc clipRegion*(region: Region): jboolean
  proc clipShader*(shader: Shader)
  proc clipOutShader*(shader: Shader)
  proc getDrawFilter*(): DrawFilter
  proc setDrawFilter*(filter: DrawFilter)
  proc quickReject*(rect: RectF, type: EdgeType): jboolean
  proc quickReject*(rect: RectF): jboolean
  proc quickReject*(path: Path, type: EdgeType): jboolean
  proc quickReject*(path: Path): jboolean
  proc quickReject*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat, type: EdgeType): jboolean
  proc quickReject*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat): jboolean
  proc getClipBounds*(bounds: Rect): jboolean
  proc getClipBounds*(): Rect
  proc drawPicture*(picture: Picture)
  proc drawPicture*(picture: Picture, dst: RectF)
  proc drawPicture*(picture: Picture, dst: Rect)
  proc release*()
  proc freeCaches*() {.`static`.}
  proc freeTextLayoutCaches*() {.`static`.}
  proc drawArc*(oval: RectF, startAngle: jfloat, sweepAngle: jfloat, useCenter: jboolean, paint: Paint)
  proc drawArc*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat, startAngle: jfloat, sweepAngle: jfloat, useCenter: jboolean, paint: Paint)
  proc drawARGB*(a: jint, r: jint, g: jint, b: jint)
  proc drawBitmap*(bitmap: Bitmap, left: jfloat, top: jfloat, paint: Paint)
  proc drawBitmap*(bitmap: Bitmap, src: Rect, dst: RectF, paint: Paint)
  proc drawBitmap*(bitmap: Bitmap, src: Rect, dst: Rect, paint: Paint)
  proc drawBitmap*(colors: seq[jint], offset: jint, stride: jint, x: jfloat, y: jfloat, width: jint, height: jint, hasAlpha: jboolean, paint: Paint)
  proc drawBitmap*(colors: seq[jint], offset: jint, stride: jint, x: jint, y: jint, width: jint, height: jint, hasAlpha: jboolean, paint: Paint)
  proc drawBitmap*(bitmap: Bitmap, matrix: Matrix, paint: Paint)
  proc drawBitmapMesh*(bitmap: Bitmap, meshWidth: jint, meshHeight: jint, verts: seq[jfloat], vertOffset: jint, colors: seq[jint], colorOffset: jint, paint: Paint)
  proc drawCircle*(cx: jfloat, cy: jfloat, radius: jfloat, paint: Paint)
  proc drawColor*(color: jint)
  proc drawColor*(color: jlong)
  proc drawColor*(color: jint, mode: PorterDuff.Mode)
  proc drawColor*(color: jint, mode: BlendMode)
  proc drawColor*(color: jlong, mode: BlendMode)
  proc drawLine*(startX: jfloat, startY: jfloat, stopX: jfloat, stopY: jfloat, paint: Paint)
  proc drawLines*(pts: seq[jfloat], offset: jint, count: jint, paint: Paint)
  proc drawLines*(pts: seq[jfloat], paint: Paint)
  proc drawOval*(oval: RectF, paint: Paint)
  proc drawOval*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat, paint: Paint)
  proc drawPaint*(paint: Paint)
  proc drawPatch*(patch: NinePatch, dst: Rect, paint: Paint)
  proc drawPatch*(patch: NinePatch, dst: RectF, paint: Paint)
  proc drawPath*(path: Path, paint: Paint)
  proc drawRegion*(region: Region, paint: Paint)
  proc drawPoint*(x: jfloat, y: jfloat, paint: Paint)
  proc drawPoints*(pts: seq[jfloat], offset: jint, count: jint, paint: Paint)
  proc drawPoints*(pts: seq[jfloat], paint: Paint)
  proc drawPosText*(text: seq[jchar], index: jint, count: jint, pos: seq[jfloat], paint: Paint)
  proc drawPosText*(text: string, pos: seq[jfloat], paint: Paint)
  proc drawRect*(rect: RectF, paint: Paint)
  proc drawRect*(r: Rect, paint: Paint)
  proc drawRect*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat, paint: Paint)
  proc drawRGB*(r: jint, g: jint, b: jint)
  proc drawRoundRect*(rect: RectF, rx: jfloat, ry: jfloat, paint: Paint)
  proc drawRoundRect*(left: jfloat, top: jfloat, right: jfloat, bottom: jfloat, rx: jfloat, ry: jfloat, paint: Paint)
  proc drawDoubleRoundRect*(outer: RectF, outerRx: jfloat, outerRy: jfloat, inner: RectF, innerRx: jfloat, innerRy: jfloat, paint: Paint)
  proc drawDoubleRoundRect*(outer: RectF, outerRadii: seq[jfloat], inner: RectF, innerRadii: seq[jfloat], paint: Paint)
  proc drawGlyphs*(glyphIds: seq[jint], glyphIdOffset: jint, positions: seq[jfloat], positionOffset: jint, glyphCount: jint, font: Font, paint: Paint)
  proc drawText*(text: seq[jchar], index: jint, count: jint, x: jfloat, y: jfloat, paint: Paint)
  proc drawText*(text: string, x: jfloat, y: jfloat, paint: Paint)
  proc drawText*(text: string, start: jint, end: jint, x: jfloat, y: jfloat, paint: Paint)
  proc drawText*(text: CharSequence, start: jint, end: jint, x: jfloat, y: jfloat, paint: Paint)
  proc drawTextOnPath*(text: seq[jchar], index: jint, count: jint, path: Path, hOffset: jfloat, vOffset: jfloat, paint: Paint)
  proc drawTextOnPath*(text: string, path: Path, hOffset: jfloat, vOffset: jfloat, paint: Paint)
  proc drawTextRun*(text: seq[jchar], index: jint, count: jint, contextIndex: jint, contextCount: jint, x: jfloat, y: jfloat, isRtl: jboolean, paint: Paint)
  proc drawTextRun*(text: CharSequence, start: jint, end: jint, contextStart: jint, contextEnd: jint, x: jfloat, y: jfloat, isRtl: jboolean, paint: Paint)
  proc drawTextRun*(text: MeasuredText, start: jint, end: jint, contextStart: jint, contextEnd: jint, x: jfloat, y: jfloat, isRtl: jboolean, paint: Paint)
  proc drawVertices*(mode: VertexMode, vertexCount: jint, verts: seq[jfloat], vertOffset: jint, texs: seq[jfloat], texOffset: jint, colors: seq[jint], colorOffset: jint, indices: seq[jshort], indexOffset: jint, indexCount: jint, paint: Paint)
  proc drawRenderNode*(renderNode: RenderNode)
  MATRIX_SAVE_FLAG*: jint {.`static`.}
  CLIP_SAVE_FLAG*: jint {.`static`.}
  HAS_ALPHA_LAYER_SAVE_FLAG*: jint {.`static`.}
  FULL_COLOR_LAYER_SAVE_FLAG*: jint {.`static`.}
  CLIP_TO_LAYER_SAVE_FLAG*: jint {.`static`.}
  ALL_SAVE_FLAG*: jint {.`static`.}

