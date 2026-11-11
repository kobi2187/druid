import jnim

jclass android.text.PackedIntVector* of JVMObject:
  proc getValue*(row: jint, column: jint): jint
  proc setValue*(row: jint, column: jint, value: jint)
  proc adjustValuesBelow*(startRow: jint, column: jint, delta: jint)
  proc insertAt*(row: jint, values: seq[jint])
  proc deleteAt*(row: jint, count: jint)
  proc size*(): jint
  proc width*(): jint

