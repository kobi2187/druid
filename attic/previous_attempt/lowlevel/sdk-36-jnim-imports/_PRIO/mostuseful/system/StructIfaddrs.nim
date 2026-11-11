import jnim

jclass android.system.StructIfaddrs* of JVMObject:
  proc toString*(): string
  ifa_name*: string
  ifa_flags*: jint
  ifa_addr*: InetAddress
  ifa_netmask*: InetAddress
  ifa_broadaddr*: InetAddress
  hwaddr*: jbyte

