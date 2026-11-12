import jnim

jclass android.system.StructCapUserHeader* of JVMObject:
  proc toString*(): string
  version*: jint
  pid*: jint

