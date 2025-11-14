import jnim

jclass android.net.PacProxySelector* of ProxySelector:
  proc select*(uri: URI): List[Proxy]
  proc connectFailed*(uri: URI, address: SocketAddress, failure: IOException)
  PROXY_SERVICE*: string {.`static`.}

