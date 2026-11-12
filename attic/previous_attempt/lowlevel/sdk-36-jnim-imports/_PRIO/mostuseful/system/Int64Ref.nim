import jnim

jclass android.system.Int64Ref* of JVMObject:
  proc toString*(): string
  value*: jlong

