import jnim

jclass android.graphics.NinePatch* of JVMObject:
  proc getName*(): string
  proc getPaint*(): Paint
  proc setPaint*(p: Paint)
  proc getBitmap*(): Bitmap
  proc draw*(canvas: Canvas, location: RectF)
  proc draw*(canvas: Canvas, location: Rect)
  proc draw*(canvas: Canvas, location: Rect, paint: Paint)
  proc getDensity*(): jint
  proc getWidth*(): jint
  proc getHeight*(): jint
  proc hasAlpha*(): jboolean
  proc getTransparentRegion*(bounds: Rect): Region
  proc isNinePatchChunk*(chunk: seq[jbyte]): jboolean {.`static`.}
  mNativeChunk*: jlong

jclass android.graphics.NinePatch.InsetStruct* of JVMObject:
  proc scaleInsets*(left: jint, top: jint, right: jint, bottom: jint, scale: jfloat): Rect {.`static`.}

jclass android.graphics.InsetStruct* of JVMObject:
  proc scaleInsets*(left: jint, top: jint, right: jint, bottom: jint, scale: jfloat): Rect {.`static`.}
  opticalRect*: Rect
  outlineRect*: Rect
  outlineRadius*: jfloat
  outlineAlpha*: jfloat

