import jnim

jclass android.os.MemoryFile* of JVMObject:
  proc close*()
  proc length*(): jint
  proc isPurgingAllowed*(): jboolean
  proc allowPurging*(allowPurging: jboolean): jboolean
  proc getInputStream*(): InputStream
  proc getOutputStream*(): OutputStream
  proc readBytes*(buffer: seq[jbyte], srcOffset: jint, destOffset: jint, count: jint): jint
  proc writeBytes*(buffer: seq[jbyte], srcOffset: jint, destOffset: jint, count: jint)
  proc getFileDescriptor*(): FileDescriptor
  proc getSize*(fd: FileDescriptor): jint {.`static`.}

