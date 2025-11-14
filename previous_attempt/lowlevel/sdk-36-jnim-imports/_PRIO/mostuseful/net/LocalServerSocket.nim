import jnim

jclass android.net.LocalServerSocket* of JVMObject:
  proc getLocalSocketAddress*(): LocalSocketAddress
  proc accept*(): LocalSocket
  proc getFileDescriptor*(): FileDescriptor
  proc close*()

