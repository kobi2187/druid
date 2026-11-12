import jnim

jclass java.net.SecureCacheResponse* of CacheResponse:
  proc getCipherSuite*(): string
  proc getLocalCertificateChain*(): List[Certificate]
  proc getServerCertificateChain*(): List[Certificate]
  proc getPeerPrincipal*(): Principal
  proc getLocalPrincipal*(): Principal
  proc getSSLSession*(): Optional[SSLSession]

