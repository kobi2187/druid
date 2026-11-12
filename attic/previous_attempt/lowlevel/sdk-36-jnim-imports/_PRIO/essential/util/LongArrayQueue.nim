import jnim

jclass android.util.LongArrayQueue* of JVMObject:
  proc size*(): jint
  proc clear*()
  proc addLast*(value: jlong)
  proc removeFirst*(): jlong
  proc get*(position: jint): jlong
  proc peekFirst*(): jlong
  proc peekLast*(): jlong
  proc toString*(): string

