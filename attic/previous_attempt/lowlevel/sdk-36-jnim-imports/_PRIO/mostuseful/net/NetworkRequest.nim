import jnim

jclass android.net.NetworkRequest* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc isListen*(): jboolean
  proc isListenForBest*(): jboolean
  proc isRequest*(): jboolean
  proc isBackgroundRequest*(): jboolean
  proc hasCapability*(capability: jint): jboolean
  proc hasForbiddenCapability*(capability: jint): jboolean
  proc canBeSatisfiedBy*(nc: NetworkCapabilities): jboolean
  proc hasTransport*(transportType: jint): jboolean
  proc getNetworkSpecifier*(): NetworkSpecifier
  proc getRequestorUid*(): jint
  proc getRequestorPackageName*(): string
  proc toString*(): string
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc getCapabilities*(): seq[jint]
  proc getEnterpriseIds*(): seq[jint]
  proc hasEnterpriseId*(enterpriseId: jint): jboolean
  proc getForbiddenCapabilities*(): seq[jint]
  proc getTransportTypes*(): seq[jint]
  proc getSubscriptionIds*(): Set[Integer]
  FIRST_REQUEST_ID*: jint {.`static`.}
  REQUEST_ID_NONE*: jint {.`static`.}
  networkCapabilities*: NetworkCapabilities
  requestId*: jint
  legacyType*: jint
  typ*: Type
  CREATOR*: Creator[NetworkRequest] {.`static`.}

jclass android.net.NetworkRequest.Builder* of JVMObject:
  proc build*(): NetworkRequest
  proc addCapability*(capability: jint): Builder
  proc removeCapability*(capability: jint): Builder
  proc setCapabilities*(nc: NetworkCapabilities): Builder
  proc setUids*(uids: Set[Range[Integer]]): Builder
  proc addForbiddenCapability*(capability: jint): Builder
  proc removeForbiddenCapability*(capability: jint): Builder
  proc clearCapabilities*(): Builder
  proc addTransportType*(transportType: jint): Builder
  proc removeTransportType*(transportType: jint): Builder
  proc setLinkUpstreamBandwidthKbps*(upKbps: jint): Builder
  proc setLinkDownstreamBandwidthKbps*(downKbps: jint): Builder
  proc setNetworkSpecifier*(networkSpecifier: string): Builder
  proc setNetworkSpecifier*(networkSpecifier: NetworkSpecifier): Builder
  proc setSignalStrength*(signalStrength: jint): Builder
  proc setSubscriptionIds*(subIds: Set[Integer]): Builder
  proc setIncludeOtherUidNetworks*(include: jboolean): Builder

jclass android.net.Builder* of JVMObject:
  proc build*(): NetworkRequest
  proc addCapability*(capability: jint): Builder
  proc removeCapability*(capability: jint): Builder
  proc setCapabilities*(nc: NetworkCapabilities): Builder
  proc setUids*(uids: Set[Range[Integer]]): Builder
  proc addForbiddenCapability*(capability: jint): Builder
  proc removeForbiddenCapability*(capability: jint): Builder
  proc clearCapabilities*(): Builder
  proc addTransportType*(transportType: jint): Builder
  proc removeTransportType*(transportType: jint): Builder
  proc setLinkUpstreamBandwidthKbps*(upKbps: jint): Builder
  proc setLinkDownstreamBandwidthKbps*(downKbps: jint): Builder
  proc setNetworkSpecifier*(networkSpecifier: string): Builder
  proc setNetworkSpecifier*(networkSpecifier: NetworkSpecifier): Builder
  proc setSignalStrength*(signalStrength: jint): Builder
  proc setSubscriptionIds*(subIds: Set[Integer]): Builder
  proc setIncludeOtherUidNetworks*(include: jboolean): Builder

