import jnim

jclass android.os.PooledStringWriter* of JVMObject:
  proc writeString*(str: string)
  proc getStringCount*(): jint
  proc finish*()

