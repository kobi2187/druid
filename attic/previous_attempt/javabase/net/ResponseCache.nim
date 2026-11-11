import jnim

jclass java.net.ResponseCache* of JVMObject:
  proc getDefault*(): ResponseCache {.`static`.}
  proc setDefault*(responseCache: ResponseCache) {.`static`.}
  proc get*(uri: URI, rqstMethod: string, rqstHeaders: Map[string, List[string]]): CacheResponse
  proc put*(uri: URI, conn: URLConnection): CacheRequest

