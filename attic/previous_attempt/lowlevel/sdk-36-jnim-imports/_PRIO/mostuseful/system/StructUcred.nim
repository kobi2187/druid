import jnim

jclass android.system.StructUcred* of JVMObject:
  proc toString*(): string
  pid*: jint
  uid*: jint
  gid*: jint

