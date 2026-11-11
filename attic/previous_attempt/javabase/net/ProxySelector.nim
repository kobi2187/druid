import jnim

jclass java.net.ProxySelector* of JVMObject:
  proc getDefault*(): ProxySelector {.`static`.}
  proc setDefault*(ps: ProxySelector) {.`static`.}
  proc select*(uri: URI): List[Proxy]
  proc connectFailed*(uri: URI, sa: SocketAddress, ioe: IOException)
  proc of*(proxyAddress: InetSocketAddress): ProxySelector {.`static`.}

