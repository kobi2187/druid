import jnim

jclass android.net.StaticIpConfiguration* of JVMObject:
  proc clear*()
  proc getIpAddress*(): LinkAddress
  proc getGateway*(): InetAddress
  proc getDnsServers*(): List[InetAddress]
  proc getDomains*(): string
  proc addDnsServer*(server: InetAddress)
  proc getRoutes*(iface: string): List[RouteInfo]
  proc toLinkProperties*(iface: string): LinkProperties
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc readFromParcel*(in: Parcel): StaticIpConfiguration {.`static`.}
  ipAddress*: LinkAddress
  gateway*: InetAddress
  dnsServers*: ArrayList[InetAddress]
  domains*: string
  CREATOR*: Creator[StaticIpConfiguration] {.`static`.}

jclass android.net.StaticIpConfiguration.Builder* of JVMObject:
  proc setIpAddress*(ipAddress: LinkAddress): Builder
  proc setGateway*(gateway: InetAddress): Builder
  proc setDnsServers*(dnsServers: Iterable[InetAddress]): Builder
  proc setDomains*(newDomains: string): Builder
  proc build*(): StaticIpConfiguration

jclass android.net.Builder* of JVMObject:
  proc setIpAddress*(ipAddress: LinkAddress): Builder
  proc setGateway*(gateway: InetAddress): Builder
  proc setDnsServers*(dnsServers: Iterable[InetAddress]): Builder
  proc setDomains*(newDomains: string): Builder
  proc build*(): StaticIpConfiguration

