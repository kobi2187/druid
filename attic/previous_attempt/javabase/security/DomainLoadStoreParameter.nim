import jnim

jclass java.security.DomainLoadStoreParameter* of JVMObject:
  proc getConfiguration*(): URI
  proc getProtectionParams*(): Map[string, ProtectionParameter]
  proc getProtectionParameter*(): KeyStore.ProtectionParameter

