import jnim

jclass android.net.LinkProperties* of JVMObject:
  proc compareProvisioning*(before: LinkProperties, after: LinkProperties): ProvisioningChange {.`static`.}
  proc setInterfaceName*(iface: string)
  proc getInterfaceName*(): string
  proc getAllInterfaceNames*(): List[string]
  proc getAddresses*(): List[InetAddress]
  proc getAllAddresses*(): List[InetAddress]
  proc addLinkAddress*(address: LinkAddress): jboolean
  proc removeLinkAddress*(toRemove: LinkAddress): jboolean
  proc getLinkAddresses*(): List[LinkAddress]
  proc getAllLinkAddresses*(): List[LinkAddress]
  proc setLinkAddresses*(addresses: Collection[LinkAddress])
  proc addDnsServer*(dnsServer: InetAddress): jboolean
  proc removeDnsServer*(dnsServer: InetAddress): jboolean
  proc setDnsServers*(dnsServers: Collection[InetAddress])
  proc getDnsServers*(): List[InetAddress]
  proc setUsePrivateDns*(usePrivateDns: jboolean)
  proc isPrivateDnsActive*(): jboolean
  proc setPrivateDnsServerName*(privateDnsServerName: string)
  proc setDhcpServerAddress*(serverAddress: Inet4Address)
  proc getDhcpServerAddress*(): Inet4Address
  proc getPrivateDnsServerName*(): string
  proc addValidatedPrivateDnsServer*(dnsServer: InetAddress): jboolean
  proc removeValidatedPrivateDnsServer*(dnsServer: InetAddress): jboolean
  proc setValidatedPrivateDnsServers*(dnsServers: Collection[InetAddress])
  proc getValidatedPrivateDnsServers*(): List[InetAddress]
  proc addPcscfServer*(pcscfServer: InetAddress): jboolean
  proc removePcscfServer*(pcscfServer: InetAddress): jboolean
  proc setPcscfServers*(pcscfServers: Collection[InetAddress])
  proc getPcscfServers*(): List[InetAddress]
  proc setDomains*(domains: string)
  proc getDomains*(): string
  proc setMtu*(mtu: jint)
  proc getMtu*(): jint
  proc setTcpBufferSizes*(tcpBufferSizes: string)
  proc getTcpBufferSizes*(): string
  proc addRoute*(route: RouteInfo): jboolean
  proc removeRoute*(route: RouteInfo): jboolean
  proc getRoutes*(): List[RouteInfo]
  proc ensureDirectlyConnectedRoutes*()
  proc getAllRoutes*(): List[RouteInfo]
  proc setHttpProxy*(proxy: ProxyInfo)
  proc getHttpProxy*(): ProxyInfo
  proc getNat64Prefix*(): IpPrefix
  proc setNat64Prefix*(prefix: IpPrefix)
  proc addStackedLink*(link: LinkProperties): jboolean
  proc removeStackedLink*(iface: string): jboolean
  proc getStackedLinks*(): List[LinkProperties]
  proc clear*()
  proc describeContents*(): jint
  proc toString*(): string
  proc hasIpv4Address*(): jboolean
  proc hasIPv4Address*(): jboolean
  proc hasGlobalIpv6Address*(): jboolean
  proc hasIpv4UnreachableDefaultRoute*(): jboolean
  proc hasGlobalIPv6Address*(): jboolean
  proc hasIpv4DefaultRoute*(): jboolean
  proc hasIpv6UnreachableDefaultRoute*(): jboolean
  proc hasIPv4DefaultRoute*(): jboolean
  proc hasIpv6DefaultRoute*(): jboolean
  proc hasIPv6DefaultRoute*(): jboolean
  proc hasIpv4DnsServer*(): jboolean
  proc hasIPv4DnsServer*(): jboolean
  proc hasIpv6DnsServer*(): jboolean
  proc hasIPv6DnsServer*(): jboolean
  proc hasIpv4PcscfServer*(): jboolean
  proc hasIpv6PcscfServer*(): jboolean
  proc isIpv4Provisioned*(): jboolean
  proc isIpv6Provisioned*(): jboolean
  proc isIPv6Provisioned*(): jboolean
  proc isProvisioned*(): jboolean
  proc isReachable*(ip: InetAddress): jboolean
  proc hasExcludeRoute*(): jboolean
  proc isIdenticalInterfaceName*(target: LinkProperties): jboolean
  proc isIdenticalDhcpServerAddress*(target: LinkProperties): jboolean
  proc isIdenticalAddresses*(target: LinkProperties): jboolean
  proc isIdenticalDnses*(target: LinkProperties): jboolean
  proc isIdenticalPrivateDns*(target: LinkProperties): jboolean
  proc isIdenticalValidatedPrivateDnses*(target: LinkProperties): jboolean
  proc isIdenticalPcscfs*(target: LinkProperties): jboolean
  proc isIdenticalRoutes*(target: LinkProperties): jboolean
  proc isIdenticalHttpProxy*(target: LinkProperties): jboolean
  proc isIdenticalStackedLinks*(target: LinkProperties): jboolean
  proc isIdenticalMtu*(target: LinkProperties): jboolean
  proc isIdenticalTcpBufferSizes*(target: LinkProperties): jboolean
  proc isIdenticalNat64Prefix*(target: LinkProperties): jboolean
  proc isIdenticalWakeOnLan*(target: LinkProperties): jboolean
  proc isIdenticalCaptivePortalApiUrl*(target: LinkProperties): jboolean
  proc isIdenticalCaptivePortalData*(target: LinkProperties): jboolean
  proc setWakeOnLanSupported*(supported: jboolean)
  proc isWakeOnLanSupported*(): jboolean
  proc setCaptivePortalApiUrl*(url: Uri)
  proc getCaptivePortalApiUrl*(): Uri
  proc setCaptivePortalData*(data: CaptivePortalData)
  proc getCaptivePortalData*(): CaptivePortalData
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc isValidMtu*(mtu: jint, ipv6: jboolean): jboolean {.`static`.}
  CREATOR*: Creator[LinkProperties] {.`static`.}

