import jnim

jclass android.net.DnsResolverServiceManager* of JVMObject:
  proc getService*(): IBinder
  DNS_RESOLVER_SERVICE*: string {.`static`.}

