import jnim

jclass android.view.Gravity* of JVMObject:
  proc apply*(gravity: jint, w: jint, h: jint, container: Rect, outRect: Rect) {.`static`.}
  proc apply*(gravity: jint, w: jint, h: jint, container: Rect, outRect: Rect, layoutDirection: jint) {.`static`.}
  proc apply*(gravity: jint, w: jint, h: jint, container: Rect, xAdj: jint, yAdj: jint, outRect: Rect) {.`static`.}
  proc apply*(gravity: jint, w: jint, h: jint, container: Rect, xAdj: jint, yAdj: jint, outRect: Rect, layoutDirection: jint) {.`static`.}
  proc applyDisplay*(gravity: jint, display: Rect, inoutObj: Rect) {.`static`.}
  proc applyDisplay*(gravity: jint, display: Rect, inoutObj: Rect, layoutDirection: jint) {.`static`.}
  proc isVertical*(gravity: jint): jboolean {.`static`.}
  proc isHorizontal*(gravity: jint): jboolean {.`static`.}
  proc getAbsoluteGravity*(gravity: jint, layoutDirection: jint): jint {.`static`.}
  proc toString*(gravity: jint): string {.`static`.}
  NO_GRAVITY*: jint {.`static`.}
  AXIS_SPECIFIED*: jint {.`static`.}
  AXIS_PULL_BEFORE*: jint {.`static`.}
  AXIS_PULL_AFTER*: jint {.`static`.}
  AXIS_CLIP*: jint {.`static`.}
  AXIS_X_SHIFT*: jint {.`static`.}
  AXIS_Y_SHIFT*: jint {.`static`.}
  TOP*: jint {.`static`.}
  BOTTOM*: jint {.`static`.}
  LEFT*: jint {.`static`.}
  RIGHT*: jint {.`static`.}
  CENTER_VERTICAL*: jint {.`static`.}
  FILL_VERTICAL*: jint {.`static`.}
  CENTER_HORIZONTAL*: jint {.`static`.}
  FILL_HORIZONTAL*: jint {.`static`.}
  CENTER*: jint {.`static`.}
  FILL*: jint {.`static`.}
  CLIP_VERTICAL*: jint {.`static`.}
  CLIP_HORIZONTAL*: jint {.`static`.}
  RELATIVE_LAYOUT_DIRECTION*: jint {.`static`.}
  HORIZONTAL_GRAVITY_MASK*: jint {.`static`.}
  VERTICAL_GRAVITY_MASK*: jint {.`static`.}
  DISPLAY_CLIP_VERTICAL*: jint {.`static`.}
  DISPLAY_CLIP_HORIZONTAL*: jint {.`static`.}
  START*: jint {.`static`.}
  END*: jint {.`static`.}
  RELATIVE_HORIZONTAL_GRAVITY_MASK*: jint {.`static`.}

