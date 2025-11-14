import jnim

jclass android.view.WindowlessWindowLayout* of WindowLayout:
  proc computeFrames*(attrs: WindowManager.LayoutParams, state: InsetsState, displayCutoutSafe: Rect, windowBounds: Rect, windowingMode: jint, requestedWidth: jint, requestedHeight: jint, requestedVisibleTypes: jint, compatScale: jfloat, frames: ClientWindowFrames)

