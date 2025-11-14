import jnim

jclass android.os.NativeHandle* of JVMObject:
  proc hasSingleFileDescriptor*(): jboolean
  proc dup*(): NativeHandle
  proc close*()
  proc getFileDescriptor*(): FileDescriptor
  proc getFileDescriptors*(): seq[FileDescriptor]
  proc getInts*(): seq[jint]

