import jnim

jclass android.provider.FontRequest* of JVMObject:
  proc getProviderAuthority*(): string
  proc getProviderPackage*(): string
  proc getQuery*(): string
  proc getCertificates*(): List[List[seq[jbyte]]]
  proc getIdentifier*(): string
  proc toString*(): string

