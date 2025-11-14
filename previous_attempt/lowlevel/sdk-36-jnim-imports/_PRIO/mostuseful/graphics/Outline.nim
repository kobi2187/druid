import jnim

jclass android.graphics.Outline* of JVMObject:
  proc setEmpty*()
  proc isEmpty*(): jboolean
  proc canClip*(): jboolean
  proc setAlpha*(alpha: jfloat)
  proc getAlpha*(): jfloat
  proc set*(src: Outline)
  proc setRect*(left: jint, top: jint, right: jint, bottom: jint)
  proc setRect*(rect: Rect)
  proc setRoundRect*(left: jint, top: jint, right: jint, bottom: jint, radius: jfloat)
  proc setRoundRect*(rect: Rect, radius: jfloat)
  proc getRect*(outRect: Rect): jboolean
  proc getRadius*(): jfloat
  proc setOval*(left: jint, top: jint, right: jint, bottom: jint)
  proc setOval*(rect: Rect)
  proc setConvexPath*(convexPath: Path)
  proc setPath*(path: Path)
  proc offset*(dx: jint, dy: jint)
  MODE_EMPTY*: jint {.`static`.}
  MODE_ROUND_RECT*: jint {.`static`.}
  MODE_PATH*: jint {.`static`.}
  mMode*: jint
  mPath*: Path
  mRect*: Rect
  mRadius*: jfloat
  mAlpha*: jfloat

