import jnim

jclass android.system.StructStatVfs* of JVMObject:
  proc toString*(): string
  f_bsize*: jlong
  f_frsize*: jlong
  f_blocks*: jlong
  f_bfree*: jlong
  f_bavail*: jlong
  f_files*: jlong
  f_ffree*: jlong
  f_favail*: jlong
  f_fsid*: jlong
  f_flag*: jlong
  f_namemax*: jlong

