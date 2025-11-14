import jnim

jclass android.system.NetlinkSocketAddress* of SocketAddress:
  proc getPortId*(): jint
  proc getGroupsMask*(): jint
  proc toString*(): string

