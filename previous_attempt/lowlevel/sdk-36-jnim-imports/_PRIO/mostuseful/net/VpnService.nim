import jnim

jclass android.net.VpnService* of Service:
  proc prepare*(context: Context): Intent {.`static`.}
  proc prepareAndAuthorize*(context: Context) {.`static`.}
  proc protect*(socket: jint): jboolean
  proc protect*(socket: Socket): jboolean
  proc protect*(socket: DatagramSocket): jboolean
  proc addAddress*(address: InetAddress, prefixLength: jint): jboolean
  proc removeAddress*(address: InetAddress, prefixLength: jint): jboolean
  proc setUnderlyingNetworks*(networks: seq[Network]): jboolean
  proc isAlwaysOn*(): jboolean
  proc isLockdownEnabled*(): jboolean
  proc onBind*(intent: Intent): IBinder
  proc onRevoke*()
  SERVICE_INTERFACE*: string {.`static`.}
  SERVICE_META_DATA_SUPPORTS_ALWAYS_ON*: string {.`static`.}

jclass android.net.VpnService.Builder* of JVMObject:
  proc setSession*(session: string): Builder
  proc setConfigureIntent*(intent: PendingIntent): Builder
  proc setMtu*(mtu: jint): Builder
  proc setHttpProxy*(proxyInfo: ProxyInfo): Builder
  proc addAddress*(address: InetAddress, prefixLength: jint): Builder
  proc addAddress*(address: string, prefixLength: jint): Builder
  proc addRoute*(address: InetAddress, prefixLength: jint): Builder
  proc addRoute*(prefix: IpPrefix): Builder
  proc addRoute*(address: string, prefixLength: jint): Builder
  proc excludeRoute*(prefix: IpPrefix): Builder
  proc addDnsServer*(address: InetAddress): Builder
  proc addDnsServer*(address: string): Builder
  proc addSearchDomain*(domain: string): Builder
  proc allowFamily*(family: jint): Builder
  proc addAllowedApplication*(packageName: string): Builder
  proc addDisallowedApplication*(packageName: string): Builder
  proc allowBypass*(): Builder
  proc setBlocking*(blocking: jboolean): Builder
  proc setUnderlyingNetworks*(networks: seq[Network]): Builder
  proc setMetered*(isMetered: jboolean): Builder
  proc establish*(): ParcelFileDescriptor
  proc routes*(): List[RouteInfo]

jclass android.net.Builder* of JVMObject:
  proc setSession*(session: string): Builder
  proc setConfigureIntent*(intent: PendingIntent): Builder
  proc setMtu*(mtu: jint): Builder
  proc setHttpProxy*(proxyInfo: ProxyInfo): Builder
  proc addAddress*(address: InetAddress, prefixLength: jint): Builder
  proc addAddress*(address: string, prefixLength: jint): Builder
  proc addRoute*(address: InetAddress, prefixLength: jint): Builder
  proc addRoute*(prefix: IpPrefix): Builder
  proc addRoute*(address: string, prefixLength: jint): Builder
  proc excludeRoute*(prefix: IpPrefix): Builder
  proc addDnsServer*(address: InetAddress): Builder
  proc addDnsServer*(address: string): Builder
  proc addSearchDomain*(domain: string): Builder
  proc allowFamily*(family: jint): Builder
  proc addAllowedApplication*(packageName: string): Builder
  proc addDisallowedApplication*(packageName: string): Builder
  proc allowBypass*(): Builder
  proc setBlocking*(blocking: jboolean): Builder
  proc setUnderlyingNetworks*(networks: seq[Network]): Builder
  proc setMetered*(isMetered: jboolean): Builder
  proc establish*(): ParcelFileDescriptor
  proc routes*(): List[RouteInfo]

