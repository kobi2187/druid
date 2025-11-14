import jnim

jclass android.net.KeepalivePacketData* of JVMObject:
  proc getSrcAddress*(): InetAddress
  proc getDstAddress*(): InetAddress
  proc getSrcPort*(): jint
  proc getDstPort*(): jint
  proc getPacket*(): seq[jbyte]
  proc toString*(): string

