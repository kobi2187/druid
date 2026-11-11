import jnim

jclass android.view.ScrollCaptureTarget* of JVMObject:
  proc getHint*(): jint
  proc getCallback*(): ScrollCaptureCallback
  proc getContainingView*(): View
  proc getLocalVisibleRect*(): Rect
  proc getPositionInWindow*(): Point
  proc getScrollBounds*(): Rect
  proc setScrollBounds*(scrollBounds: Rect)
  proc updatePositionInWindow*()
  proc toString*(): string

