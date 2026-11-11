import jnim

jclass android.os.PooledStringReader* of JVMObject:
  proc getStringCount*(): jint
  proc readString*(): string

