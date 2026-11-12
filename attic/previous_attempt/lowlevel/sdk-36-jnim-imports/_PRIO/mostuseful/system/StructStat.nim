import jnim

jclass android.system.StructStat* of JVMObject:
  proc toString*(): string
  st_dev*: jlong
  st_ino*: jlong
  st_mode*: jint
  st_nlink*: jlong
  st_uid*: jint
  st_gid*: jint
  st_rdev*: jlong
  st_size*: jlong
  st_atime*: jlong
  st_atim*: StructTimespec
  st_mtime*: jlong
  st_mtim*: StructTimespec
  st_ctime*: jlong
  st_ctim*: StructTimespec
  st_blksize*: jlong
  st_blocks*: jlong

