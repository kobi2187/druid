import jnim

jclass android.net.QosSocketFilter* of QosFilter:
  proc getQosSocketInfo*(): QosSocketInfo
  proc validate*(): jint
  proc getNetwork*(): Network
  proc matchesLocalAddress*(address: InetAddress, startPort: jint, endPort: jint): jboolean
  proc matchesRemoteAddress*(address: InetAddress, startPort: jint, endPort: jint): jboolean
  proc matchesProtocol*(protocol: jint): jboolean
  proc matchesAddress*(filterSocketAddress: InetSocketAddress, address: InetAddress, startPort: jint, endPort: jint): jboolean {.`static`.}

