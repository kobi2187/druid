import jnim

jclass java.net.MulticastSocket* of DatagramSocket:
  proc setTTL*(ttl: jbyte)
  proc setTimeToLive*(ttl: jint)
  proc getTTL*(): jbyte
  proc getTimeToLive*(): jint
  proc joinGroup*(mcastaddr: InetAddress)
  proc leaveGroup*(mcastaddr: InetAddress)
  proc joinGroup*(mcastaddr: SocketAddress, netIf: NetworkInterface)
  proc leaveGroup*(mcastaddr: SocketAddress, netIf: NetworkInterface)
  proc setInterface*(inf: InetAddress)
  proc getInterface*(): InetAddress
  proc setNetworkInterface*(netIf: NetworkInterface)
  proc getNetworkInterface*(): NetworkInterface
  proc setLoopbackMode*(disable: jboolean)
  proc getLoopbackMode*(): jboolean
  proc send*(p: DatagramPacket, ttl: jbyte)

