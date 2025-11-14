import jnim

jclass android.system.StructRlimit* of JVMObject:
  proc toString*(): string
  rlim_cur*: jlong
  rlim_max*: jlong

