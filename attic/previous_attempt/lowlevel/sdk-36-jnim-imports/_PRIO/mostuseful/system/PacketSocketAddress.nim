import jnim

jclass android.system.PacketSocketAddress* of SocketAddress:
  proc toString*(): string
  sll_protocol*: jint
  sll_ifindex*: jint
  sll_hatype*: jint
  sll_pkttype*: jint
  sll_addr*: jbyte

