import jnim

jclass android.system.StructPasswd* of JVMObject:
  proc toString*(): string
  pw_name*: string
  pw_uid*: jint
  pw_gid*: jint
  pw_dir*: string
  pw_shell*: string

