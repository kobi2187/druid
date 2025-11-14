import jnim

jclass android.media.MediaDataSource* of JVMObject:
  proc readAt*(position: jlong, buffer: seq[jbyte], offset: jint, size: jint): jint
  proc getSize*(): jlong

