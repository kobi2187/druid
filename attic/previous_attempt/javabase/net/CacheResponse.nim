import jnim

jclass java.net.CacheResponse* of JVMObject:
  proc getHeaders*(): Map[string, List[string]]
  proc getBody*(): InputStream

