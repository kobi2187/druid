import jnim

jclass java.security.Certificate* of JVMObject:
  proc getGuarantor*(): Principal
  proc getPrincipal*(): Principal
  proc getPublicKey*(): PublicKey
  proc encode*(stream: OutputStream)
  proc decode*(stream: InputStream)
  proc getFormat*(): string
  proc toString*(detailed: jboolean): string

