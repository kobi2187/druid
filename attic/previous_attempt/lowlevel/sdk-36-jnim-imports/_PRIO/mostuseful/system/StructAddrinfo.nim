import jnim

jclass android.system.StructAddrinfo* of JVMObject:
  proc toString*(): string
  ai_flags*: jint
  ai_family*: jint
  ai_socktype*: jint
  ai_protocol*: jint
  ai_addr*: InetAddress
  ai_next*: StructAddrinfo

