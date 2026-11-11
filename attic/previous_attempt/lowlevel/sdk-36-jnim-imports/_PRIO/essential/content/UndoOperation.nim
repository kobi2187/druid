import jnim

jclass android.content.UndoOperation* of JVMObject:
  proc getOwner*(): UndoOwner
  proc getOwnerData*(): DATA
  proc matchOwner*(owner: UndoOwner): jboolean
  proc hasData*(): jboolean
  proc allowMerge*(): jboolean
  proc commit*()
  proc undo*()
  proc redo*()
  proc describeContents*(): jint

