import jnim

jclass java.net.CacheRequest* of JVMObject:
  proc getBody*(): OutputStream
  proc abort*()

