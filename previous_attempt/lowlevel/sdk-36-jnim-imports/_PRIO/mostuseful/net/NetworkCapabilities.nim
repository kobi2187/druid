import jnim

jclass android.net.NetworkCapabilities* of JVMObject:
  proc getEnterpriseIdsInternal*(): jint
  proc getEnterpriseIds*(): seq[jint]
  proc hasEnterpriseId*(enterpriseId: jint): jboolean
  proc clearAll*()
  proc set*(nc: NetworkCapabilities)
  proc addCapability*(capability: jint): NetworkCapabilities
  proc addForbiddenCapability*(capability: jint)
  proc removeCapability*(capability: jint): NetworkCapabilities
  proc removeForbiddenCapability*(capability: jint): NetworkCapabilities
  proc removeAllForbiddenCapabilities*(): NetworkCapabilities
  proc setCapability*(capability: jint, value: jboolean): NetworkCapabilities
  proc getCapabilitiesInternal*(): jlong
  proc getCapabilities*(): seq[jint]
  proc getForbiddenCapabilities*(): seq[jint]
  proc setCapabilities*(capabilities: seq[jint], forbiddenCapabilities: seq[jint])
  proc setCapabilities*(capabilities: seq[jint])
  proc addEnterpriseId*(enterpriseId: jint): NetworkCapabilities
  proc setUnderlyingNetworks*(networks: List[Network])
  proc getUnderlyingNetworks*(): List[Network]
  proc hasCapability*(capability: jint): jboolean
  proc hasForbiddenCapability*(capability: jint): jboolean
  proc hasConnectivityManagedCapability*(): jboolean
  proc getCapabilityCarrierName*(capability: jint): string {.`static`.}
  proc describeFirstNonRequestableCapability*(): string
  proc equalsNetCapabilities*(nc: NetworkCapabilities): jboolean
  proc maybeMarkCapabilitiesRestricted*()
  proc restrictCapabilitesForTestNetwork*(creatorUid: jint)
  proc restrictCapabilitiesForTestNetwork*(creatorUid: jint)
  proc isValidTransport*(transportType: jint): jboolean {.`static`.}
  proc addTransportType*(transportType: jint): NetworkCapabilities
  proc removeTransportType*(transportType: jint): NetworkCapabilities
  proc setTransportType*(transportType: jint, value: jboolean): NetworkCapabilities
  proc getTransportTypes*(): seq[jint]
  proc getTransportTypesInternal*(): jlong
  proc setTransportTypes*(transportTypes: seq[jint])
  proc hasTransport*(transportType: jint): jboolean
  proc hasSingleTransport*(transportType: jint): jboolean
  proc hasSingleTransportBesidesTest*(transportType: jint): jboolean
  proc equalsTransportTypes*(nc: NetworkCapabilities): jboolean
  proc setOwnerUid*(uid: jint): NetworkCapabilities
  proc getOwnerUid*(): jint
  proc setAdministratorUids*(administratorUids: seq[jint]): NetworkCapabilities
  proc getAdministratorUids*(): seq[jint]
  proc equalsAdministratorUids*(nc: NetworkCapabilities): jboolean
  proc setLinkUpstreamBandwidthKbps*(upKbps: jint): NetworkCapabilities
  proc getLinkUpstreamBandwidthKbps*(): jint
  proc setLinkDownstreamBandwidthKbps*(downKbps: jint): NetworkCapabilities
  proc getLinkDownstreamBandwidthKbps*(): jint
  proc minBandwidth*(a: jint, b: jint): jint {.`static`.}
  proc maxBandwidth*(a: jint, b: jint): jint {.`static`.}
  proc setNetworkSpecifier*(networkSpecifier: NetworkSpecifier): NetworkCapabilities
  proc setTransportInfo*(transportInfo: TransportInfo): NetworkCapabilities
  proc getNetworkSpecifier*(): NetworkSpecifier
  proc getTransportInfo*(): TransportInfo
  proc setSignalStrength*(signalStrength: jint): NetworkCapabilities
  proc hasSignalStrength*(): jboolean
  proc getSignalStrength*(): jint
  proc setSingleUid*(uid: jint): NetworkCapabilities
  proc setUids*(uids: Set[Range[Integer]]): NetworkCapabilities
  proc getUids*(): Set[Range[Integer]]
  proc getUidRanges*(): Set[UidRange]
  proc appliesToUid*(uid: jint): jboolean
  proc equalsUids*(nc: NetworkCapabilities): jboolean
  proc satisfiedByUids*(nc: NetworkCapabilities): jboolean
  proc appliesToUidRange*(requiredRange: UidRange): jboolean
  proc setAllowedUids*(uids: Set[Integer])
  proc getAllowedUids*(): Set[Integer]
  proc getAllowedUidsNoCopy*(): ArraySet[Integer]
  proc isUidWithAccess*(uid: jint): jboolean
  proc hasAllowedUids*(): jboolean
  proc setSSID*(ssid: string): NetworkCapabilities
  proc getSsid*(): string
  proc equalsSSID*(nc: NetworkCapabilities): jboolean
  proc satisfiedBySSID*(nc: NetworkCapabilities): jboolean
  proc satisfiedByNetworkCapabilities*(nc: NetworkCapabilities): jboolean
  proc satisfiedByImmutableNetworkCapabilities*(nc: NetworkCapabilities): jboolean
  proc describeImmutableDifferences*(that: NetworkCapabilities): string
  proc describeCapsDifferencesFrom*(old: NetworkCapabilities): string
  proc equalRequestableCapabilities*(nc: NetworkCapabilities): jboolean
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc capabilityNamesOf*(capabilities: seq[jint]): string {.`static`.}
  proc capabilityNameOf*(capability: jint): string {.`static`.}
  proc transportNamesOf*(types: seq[jint]): string {.`static`.}
  proc transportNameOf*(transport: jint): string {.`static`.}
  proc isMetered*(): jboolean
  proc isPrivateDnsBroken*(): jboolean
  proc setPrivateDnsBroken*(broken: jboolean)
  proc setRequestorUid*(uid: jint): NetworkCapabilities
  proc getRequestorUid*(): jint
  proc setRequestorPackageName*(packageName: string): NetworkCapabilities
  proc getRequestorPackageName*(): string
  proc setRequestorUidAndPackageName*(uid: jint, packageName: string): NetworkCapabilities
  proc setSubscriptionIds*(subIds: Set[Integer]): NetworkCapabilities
  proc getSubscriptionIds*(): Set[Integer]
  proc getReservationId*(): jint
  proc setReservationId*(resId: jint)
  proc getMatchNonThreadLocalNetworks*(): jboolean
  proc setMatchNonThreadLocalNetworks*(enabled: jboolean)
  proc getApplicableRedactions*(): jlong
  REDACT_NONE*: jlong {.`static`.}
  REDACT_FOR_ACCESS_FINE_LOCATION*: jlong {.`static`.}
  REDACT_FOR_LOCAL_MAC_ADDRESS*: jlong {.`static`.}
  REDACT_FOR_NETWORK_SETTINGS*: jlong {.`static`.}
  REDACT_ALL*: jlong {.`static`.}
  NET_ENTERPRISE_ID_1*: jint {.`static`.}
  NET_ENTERPRISE_ID_2*: jint {.`static`.}
  NET_ENTERPRISE_ID_3*: jint {.`static`.}
  NET_ENTERPRISE_ID_4*: jint {.`static`.}
  NET_ENTERPRISE_ID_5*: jint {.`static`.}
  NET_CAPABILITY_MMS*: jint {.`static`.}
  NET_CAPABILITY_SUPL*: jint {.`static`.}
  NET_CAPABILITY_DUN*: jint {.`static`.}
  NET_CAPABILITY_FOTA*: jint {.`static`.}
  NET_CAPABILITY_IMS*: jint {.`static`.}
  NET_CAPABILITY_CBS*: jint {.`static`.}
  NET_CAPABILITY_WIFI_P2P*: jint {.`static`.}
  NET_CAPABILITY_IA*: jint {.`static`.}
  NET_CAPABILITY_RCS*: jint {.`static`.}
  NET_CAPABILITY_XCAP*: jint {.`static`.}
  NET_CAPABILITY_EIMS*: jint {.`static`.}
  NET_CAPABILITY_NOT_METERED*: jint {.`static`.}
  NET_CAPABILITY_INTERNET*: jint {.`static`.}
  NET_CAPABILITY_NOT_RESTRICTED*: jint {.`static`.}
  NET_CAPABILITY_TRUSTED*: jint {.`static`.}
  NET_CAPABILITY_NOT_VPN*: jint {.`static`.}
  NET_CAPABILITY_VALIDATED*: jint {.`static`.}
  NET_CAPABILITY_CAPTIVE_PORTAL*: jint {.`static`.}
  NET_CAPABILITY_NOT_ROAMING*: jint {.`static`.}
  NET_CAPABILITY_FOREGROUND*: jint {.`static`.}
  NET_CAPABILITY_NOT_CONGESTED*: jint {.`static`.}
  NET_CAPABILITY_NOT_SUSPENDED*: jint {.`static`.}
  NET_CAPABILITY_OEM_PAID*: jint {.`static`.}
  NET_CAPABILITY_MCX*: jint {.`static`.}
  NET_CAPABILITY_PARTIAL_CONNECTIVITY*: jint {.`static`.}
  NET_CAPABILITY_TEMPORARILY_NOT_METERED*: jint {.`static`.}
  NET_CAPABILITY_OEM_PRIVATE*: jint {.`static`.}
  NET_CAPABILITY_VEHICLE_INTERNAL*: jint {.`static`.}
  NET_CAPABILITY_NOT_VCN_MANAGED*: jint {.`static`.}
  NET_CAPABILITY_ENTERPRISE*: jint {.`static`.}
  NET_CAPABILITY_VSIM*: jint {.`static`.}
  NET_CAPABILITY_BIP*: jint {.`static`.}
  NET_CAPABILITY_HEAD_UNIT*: jint {.`static`.}
  NET_CAPABILITY_MMTEL*: jint {.`static`.}
  NET_CAPABILITY_PRIORITIZE_LATENCY*: jint {.`static`.}
  NET_CAPABILITY_PRIORITIZE_BANDWIDTH*: jint {.`static`.}
  NET_CAPABILITY_LOCAL_NETWORK*: jint {.`static`.}
  NET_CAPABILITY_NOT_BANDWIDTH_CONSTRAINED*: jint {.`static`.}
  CONNECTIVITY_MANAGED_CAPABILITIES*: jlong {.`static`.}
  TRANSPORT_CELLULAR*: jint {.`static`.}
  TRANSPORT_WIFI*: jint {.`static`.}
  TRANSPORT_BLUETOOTH*: jint {.`static`.}
  TRANSPORT_ETHERNET*: jint {.`static`.}
  TRANSPORT_VPN*: jint {.`static`.}
  TRANSPORT_WIFI_AWARE*: jint {.`static`.}
  TRANSPORT_LOWPAN*: jint {.`static`.}
  TRANSPORT_TEST*: jint {.`static`.}
  TRANSPORT_USB*: jint {.`static`.}
  TRANSPORT_THREAD*: jint {.`static`.}
  TRANSPORT_SATELLITE*: jint {.`static`.}
  MIN_TRANSPORT*: jint {.`static`.}
  MAX_TRANSPORT*: jint {.`static`.}
  LINK_BANDWIDTH_UNSPECIFIED*: jint {.`static`.}
  SIGNAL_STRENGTH_UNSPECIFIED*: jint {.`static`.}
  CREATOR*: Creator[NetworkCapabilities] {.`static`.}
  RES_ID_UNSET*: jint {.`static`.}
  RES_ID_MATCH_ALL_RESERVATIONS*: jint {.`static`.}

jclass android.net.NetworkCapabilities.Builder* of JVMObject:
  proc withoutDefaultCapabilities*(): Builder {.`static`.}
  proc addTransportType*(transportType: jint): Builder
  proc removeTransportType*(transportType: jint): Builder
  proc addCapability*(capability: jint): Builder
  proc removeCapability*(capability: jint): Builder
  proc addForbiddenCapability*(capability: jint): Builder
  proc removeForbiddenCapability*(capability: jint): Builder
  proc addEnterpriseId*(enterpriseId: jint): Builder
  proc removeEnterpriseId*(enterpriseId: jint): Builder
  proc setOwnerUid*(ownerUid: jint): Builder
  proc setAdministratorUids*(administratorUids: seq[jint]): Builder
  proc setLinkUpstreamBandwidthKbps*(upKbps: jint): Builder
  proc setLinkDownstreamBandwidthKbps*(downKbps: jint): Builder
  proc setNetworkSpecifier*(specifier: NetworkSpecifier): Builder
  proc setTransportInfo*(info: TransportInfo): Builder
  proc setSignalStrength*(signalStrength: jint): Builder
  proc setSsid*(ssid: string): Builder
  proc setRequestorUid*(uid: jint): Builder
  proc setRequestorPackageName*(packageName: string): Builder
  proc setSubscriptionIds*(subIds: Set[Integer]): Builder
  proc setUids*(uids: Set[Range[Integer]]): Builder
  proc setAllowedUids*(uids: Set[Integer]): Builder
  proc setUnderlyingNetworks*(networks: List[Network]): Builder
  proc build*(): NetworkCapabilities

jclass android.net.Builder* of JVMObject:
  proc withoutDefaultCapabilities*(): Builder {.`static`.}
  proc addTransportType*(transportType: jint): Builder
  proc removeTransportType*(transportType: jint): Builder
  proc addCapability*(capability: jint): Builder
  proc removeCapability*(capability: jint): Builder
  proc addForbiddenCapability*(capability: jint): Builder
  proc removeForbiddenCapability*(capability: jint): Builder
  proc addEnterpriseId*(enterpriseId: jint): Builder
  proc removeEnterpriseId*(enterpriseId: jint): Builder
  proc setOwnerUid*(ownerUid: jint): Builder
  proc setAdministratorUids*(administratorUids: seq[jint]): Builder
  proc setLinkUpstreamBandwidthKbps*(upKbps: jint): Builder
  proc setLinkDownstreamBandwidthKbps*(downKbps: jint): Builder
  proc setNetworkSpecifier*(specifier: NetworkSpecifier): Builder
  proc setTransportInfo*(info: TransportInfo): Builder
  proc setSignalStrength*(signalStrength: jint): Builder
  proc setSsid*(ssid: string): Builder
  proc setRequestorUid*(uid: jint): Builder
  proc setRequestorPackageName*(packageName: string): Builder
  proc setSubscriptionIds*(subIds: Set[Integer]): Builder
  proc setUids*(uids: Set[Range[Integer]]): Builder
  proc setAllowedUids*(uids: Set[Integer]): Builder
  proc setUnderlyingNetworks*(networks: List[Network]): Builder
  proc build*(): NetworkCapabilities

