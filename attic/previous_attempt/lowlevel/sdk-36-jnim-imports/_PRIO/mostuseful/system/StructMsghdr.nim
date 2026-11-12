import jnim

jclass android.system.StructMsghdr* of JVMObject:
  msg_name*: SocketAddress
  msg_iov*: ByteBuffer
  msg_control*: StructCmsghdr
  msg_flags*: jint

