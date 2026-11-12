import jnim

jclass java.net.DatagramSocket* of JVMObject:
  proc bind*(addr: SocketAddress)
  proc connect*(address: InetAddress, port: jint)
  proc connect*(addr: SocketAddress)
  proc disconnect*()
  proc isBound*(): jboolean
  proc isConnected*(): jboolean
  proc getInetAddress*(): InetAddress
  proc getPort*(): jint
  proc getRemoteSocketAddress*(): SocketAddress
  proc getLocalSocketAddress*(): SocketAddress
  proc send*(p: DatagramPacket)
  proc receive*(p: DatagramPacket)
  proc getLocalAddress*(): InetAddress
  proc getLocalPort*(): jint
  proc setSoTimeout*(timeout: jint)
  proc getSoTimeout*(): jint
  proc setSendBufferSize*(size: jint)
  proc getSendBufferSize*(): jint
  proc setReceiveBufferSize*(size: jint)
  proc getReceiveBufferSize*(): jint
  proc setReuseAddress*(on: jboolean)
  proc getReuseAddress*(): jboolean
  proc setBroadcast*(on: jboolean)
  proc getBroadcast*(): jboolean
  proc setTrafficClass*(tc: jint)
  proc getTrafficClass*(): jint
  proc close*()
  proc isClosed*(): jboolean
  proc getChannel*(): DatagramChannel
  proc setDatagramSocketImplFactory*(fac: DatagramSocketImplFactory) {.`static`.}
  proc setOption*(name: SocketOption[T], value: T): DatagramSocket
  proc getOption*(name: SocketOption[T]): T
  proc supportedOptions*(): Set[SocketOption[?]]
  proc joinGroup*(mcastaddr: SocketAddress, netIf: NetworkInterface)
  proc leaveGroup*(mcastaddr: SocketAddress, netIf: NetworkInterface)

