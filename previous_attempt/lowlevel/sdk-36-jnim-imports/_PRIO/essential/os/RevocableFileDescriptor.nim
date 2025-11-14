import jnim

jclass android.os.RevocableFileDescriptor* of JVMObject:
  proc init*(context: Context, fd: FileDescriptor)
  proc init*(context: Context, fd: FileDescriptor, handler: Handler)
  proc getRevocableFileDescriptor*(): ParcelFileDescriptor
  proc revoke*()
  proc addOnCloseListener*(onCloseListener: ParcelFileDescriptor.OnCloseListener)
  proc isRevoked*(): jboolean

