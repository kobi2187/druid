import jnim

jclass android.view.ScrollCaptureSession* of JVMObject:
  proc getSurface*(): Surface
  proc getScrollBounds*(): Rect
  proc getPositionInWindow*(): Point

