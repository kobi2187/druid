import jnim

jclass android.net.LocalSocket* of JVMObject:
  proc toString*(): string
  proc connect*(endpoint: LocalSocketAddress)
  proc bind*(bindpoint: LocalSocketAddress)
  proc getLocalSocketAddress*(): LocalSocketAddress
  proc getInputStream*(): InputStream
  proc getOutputStream*(): OutputStream
  proc close*()
  proc shutdownInput*()
  proc shutdownOutput*()
  proc setReceiveBufferSize*(size: jint)
  proc getReceiveBufferSize*(): jint
  proc setSoTimeout*(n: jint)
  proc getSoTimeout*(): jint
  proc setSendBufferSize*(n: jint)
  proc getSendBufferSize*(): jint
  proc getRemoteSocketAddress*(): LocalSocketAddress
  proc isConnected*(): jboolean
  proc isClosed*(): jboolean
  proc isBound*(): jboolean
  proc isOutputShutdown*(): jboolean
  proc isInputShutdown*(): jboolean
  proc connect*(endpoint: LocalSocketAddress, timeout: jint)
  proc setFileDescriptorsForSend*(fds: seq[FileDescriptor])
  proc getAncillaryFileDescriptors*(): seq[FileDescriptor]
  proc getPeerCredentials*(): Credentials
  proc getFileDescriptor*(): FileDescriptor
  SOCKET_DGRAM*: jint {.`static`.}
  SOCKET_STREAM*: jint {.`static`.}
  SOCKET_SEQPACKET*: jint {.`static`.}

