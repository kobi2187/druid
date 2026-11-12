import jnim

jclass android.view.WindowLayout* of JVMObject:
  proc computeFrames*(attrs: WindowManager.LayoutParams, state: InsetsState, displayCutoutSafe: Rect, windowBounds: Rect, windowingMode: jint, requestedWidth: jint, requestedHeight: jint, requestedVisibleTypes: jint, compatScale: jfloat, frames: ClientWindowFrames)
  proc extendFrameByCutout*(displayCutoutSafe: Rect, displayFrame: Rect, inOutFrame: Rect, tempRect: Rect) {.`static`.}
  proc computeSurfaceSize*(attrs: WindowManager.LayoutParams, maxBounds: Rect, requestedWidth: jint, requestedHeight: jint, winFrame: Rect, dragResizing: jboolean, outSurfaceSize: Point) {.`static`.}
  UNSPECIFIED_LENGTH*: jint {.`static`.}

