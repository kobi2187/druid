import jnim

jclass android.net.RouteInfo* of JVMObject:
  proc makeHostRoute*(host: InetAddress, iface: string): RouteInfo {.`static`.}
  proc makeHostRoute*(host: InetAddress, gateway: InetAddress, iface: string): RouteInfo {.`static`.}
  proc getDestination*(): IpPrefix
  proc getDestinationLinkAddress*(): LinkAddress
  proc getGateway*(): InetAddress
  proc getInterface*(): string
  proc getType*(): jint
  proc getMtu*(): jint
  proc isDefaultRoute*(): jboolean
  proc isIPv4Default*(): jboolean
  proc isIPv4UnreachableDefault*(): jboolean
  proc isIPv6Default*(): jboolean
  proc isIPv6UnreachableDefault*(): jboolean
  proc isHostRoute*(): jboolean
  proc hasGateway*(): jboolean
  proc matches*(destination: InetAddress): jboolean
  proc selectBestRoute*(routes: Collection[RouteInfo], dest: InetAddress): RouteInfo {.`static`.}
  proc toString*(): string
  proc equals*(obj: JObject): jboolean
  proc getRouteKey*(): RouteKey
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  RTN_UNICAST*: jint {.`static`.}
  RTN_UNREACHABLE*: jint {.`static`.}
  RTN_THROW*: jint {.`static`.}
  CREATOR*: Creator[RouteInfo] {.`static`.}

jclass android.net.RouteInfo.RouteKey* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.net.RouteKey* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

