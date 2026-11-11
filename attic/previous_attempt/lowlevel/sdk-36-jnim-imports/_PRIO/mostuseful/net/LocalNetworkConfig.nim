import jnim

jclass android.net.LocalNetworkConfig* of JVMObject:
  proc getUpstreamSelector*(): NetworkRequest
  proc getUpstreamMulticastRoutingConfig*(): MulticastRoutingConfig
  proc getDownstreamMulticastRoutingConfig*(): MulticastRoutingConfig
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  CREATOR*: Creator[LocalNetworkConfig] {.`static`.}

jclass android.net.LocalNetworkConfig.Builder* of JVMObject:
  proc setUpstreamSelector*(upstreamSelector: NetworkRequest): Builder
  proc setUpstreamMulticastRoutingConfig*(cfg: MulticastRoutingConfig): Builder
  proc setDownstreamMulticastRoutingConfig*(cfg: MulticastRoutingConfig): Builder
  proc build*(): LocalNetworkConfig

jclass android.net.Builder* of JVMObject:
  proc setUpstreamSelector*(upstreamSelector: NetworkRequest): Builder
  proc setUpstreamMulticastRoutingConfig*(cfg: MulticastRoutingConfig): Builder
  proc setDownstreamMulticastRoutingConfig*(cfg: MulticastRoutingConfig): Builder
  proc build*(): LocalNetworkConfig

