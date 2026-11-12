import jnim

jclass android.net.QosFilter* of JVMObject:
  proc getNetwork*(): Network
  proc validate*(): jint
  proc matchesLocalAddress*(address: InetAddress, startPort: jint, endPort: jint): jboolean
  proc matchesRemoteAddress*(address: InetAddress, startPort: jint, endPort: jint): jboolean
  proc matchesProtocol*(protocol: jint): jboolean

