import jnim

jclass android.content.CursorEntityIterator* of JVMObject:
  proc getEntityAndIncrementCursor*(cursor: Cursor): Entity
  proc hasNext*(): jboolean
  proc next*(): Entity
  proc remove*()
  proc reset*()
  proc close*()

