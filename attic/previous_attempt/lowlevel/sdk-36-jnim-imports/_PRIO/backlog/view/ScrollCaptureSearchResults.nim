import jnim

jclass android.view.ScrollCaptureSearchResults* of JVMObject:
  proc addTarget*(target: ScrollCaptureTarget)
  proc isComplete*(): jboolean
  proc setOnCompleteListener*(onComplete: Runnable)
  proc isEmpty*(): jboolean
  proc finish*()
  proc getTargets*(): List[ScrollCaptureTarget]
  proc getTopResult*(): ScrollCaptureTarget

