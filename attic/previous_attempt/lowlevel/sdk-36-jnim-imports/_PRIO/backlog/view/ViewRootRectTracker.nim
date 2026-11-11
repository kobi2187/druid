import jnim

jclass android.view.ViewRootRectTracker* of JVMObject:
  proc updateRectsForView*(view: View)
  proc computeChangedRects*(): List[Rect]
  proc computeChanges*(): jboolean
  proc isWaitingForComputeChanges*(): jboolean
  proc getLastComputedRects*(): List[Rect]
  proc setRootRects*(rects: List[Rect])
  proc getRootRects*(): List[Rect]

