import jnim

jclass android.net.IpConfiguration* of JVMObject:
  proc getIpAssignment*(): IpAssignment
  proc setIpAssignment*(ipAssignment: IpAssignment)
  proc getStaticIpConfiguration*(): StaticIpConfiguration
  proc setStaticIpConfiguration*(staticIpConfiguration: StaticIpConfiguration)
  proc getProxySettings*(): ProxySettings
  proc setProxySettings*(proxySettings: ProxySettings)
  proc getHttpProxy*(): ProxyInfo
  proc setHttpProxy*(httpProxy: ProxyInfo)
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  ipAssignment*: IpAssignment
  staticIpConfiguration*: StaticIpConfiguration
  proxySettings*: ProxySettings
  httpProxy*: ProxyInfo
  CREATOR*: Creator[IpConfiguration] {.`static`.}

jclass android.net.IpConfiguration.Builder* of JVMObject:
  proc setStaticIpConfiguration*(config: StaticIpConfiguration): Builder
  proc setHttpProxy*(proxyInfo: ProxyInfo): Builder
  proc build*(): IpConfiguration

jclass android.net.Builder* of JVMObject:
  proc setStaticIpConfiguration*(config: StaticIpConfiguration): Builder
  proc setHttpProxy*(proxyInfo: ProxyInfo): Builder
  proc build*(): IpConfiguration

