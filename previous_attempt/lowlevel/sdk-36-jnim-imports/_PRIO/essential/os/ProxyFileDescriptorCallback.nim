import jnim

jclass android.os.ProxyFileDescriptorCallback* of JVMObject:
  proc onGetSize*(): jlong
  proc onRead*(offset: jlong, size: jint, data: seq[jbyte]): jint
  proc onWrite*(offset: jlong, size: jint, data: seq[jbyte]): jint
  proc onFsync*()
  proc onRelease*()

