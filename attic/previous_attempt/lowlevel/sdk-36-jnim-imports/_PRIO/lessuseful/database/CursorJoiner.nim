import jnim

jclass android.database.CursorJoiner* of JVMObject:
  proc iterator*(): Iterator[Result]
  proc hasNext*(): jboolean
  proc next*(): Result
  proc remove*()

