import jnim

jclass android.net.NetworkUtils* of JVMObject:
  proc attachDropAllBPFFilter*(fd: FileDescriptor) {.`static`.}
  proc detachBPFFilter*(fd: FileDescriptor) {.`static`.}
  proc bindProcessToNetwork*(netId: jint): jboolean {.`static`.}
  proc getBoundNetworkForProcess*(): jint {.`static`.}
  proc bindProcessToNetworkForHostResolution*(netId: jint): jboolean {.`static`.}
  proc bindSocketToNetwork*(fd: FileDescriptor, netId: jint): jint {.`static`.}
  proc queryUserAccess*(uid: jint, netId: jint): jboolean {.`static`.}
  proc resNetworkSend*(netId: jint, msg: seq[jbyte], msglen: jint, flags: jint): FileDescriptor {.`static`.}
  proc resNetworkQuery*(netId: jint, dname: string, nsClass: jint, nsType: jint, flags: jint): FileDescriptor {.`static`.}
  proc resNetworkResult*(fd: FileDescriptor): DnsResolver.DnsResponse {.`static`.}
  proc resNetworkCancel*(fd: FileDescriptor) {.`static`.}
  proc getDnsNetwork*(): Network {.`static`.}
  proc getTcpRepairWindow*(fd: FileDescriptor): TcpRepairWindow {.`static`.}
  proc intToInetAddress*(hostAddress: jint): InetAddress {.`static`.}
  proc inetAddressToInt*(inetAddr: Inet4Address): jint {.`static`.}
  proc prefixLengthToNetmaskInt*(prefixLength: jint): jint {.`static`.}
  proc netmaskIntToPrefixLength*(netmask: jint): jint {.`static`.}
  proc netmaskToPrefixLength*(netmask: Inet4Address): jint {.`static`.}
  proc numericToInetAddress*(addrString: string): InetAddress {.`static`.}
  proc getImplicitNetmask*(address: Inet4Address): jint {.`static`.}
  proc parseIpAndMask*(ipAndMaskString: string): Pair[InetAddress, Integer] {.`static`.}
  proc legacyParseIpAndMask*(ipAndMaskString: string): Pair[InetAddress, Integer] {.`static`.}
  proc hexToInet6Address*(addrHexString: string): InetAddress {.`static`.}
  proc trimV4AddrZeros*(addr: string): string {.`static`.}
  proc routedIPv4AddressCount*(prefixes: TreeSet[IpPrefix]): jlong {.`static`.}
  proc routedIPv6AddressCount*(prefixes: TreeSet[IpPrefix]): BigInteger {.`static`.}
  proc setsockoptBytes*(fd: FileDescriptor, level: jint, option: jint, value: seq[jbyte]) {.`static`.}
  proc isKernel64Bit*(): jboolean {.`static`.}
  proc isKernelX86*(): jboolean {.`static`.}
  proc getSocketCookie*(fd: FileDescriptor): jlong {.`static`.}

