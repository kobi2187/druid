import jnim

jclass android.net.ConnectivityManager* of JVMObject:
  proc isNetworkTypeValid*(networkType: jint): jboolean {.`static`.}
  proc getNetworkTypeName*(type: jint): string {.`static`.}
  proc systemReady*()
  proc isNetworkTypeMobile*(networkType: jint): jboolean {.`static`.}
  proc isNetworkTypeWifi*(networkType: jint): jboolean {.`static`.}
  proc setNetworkPreference*(preference: jint)
  proc getNetworkPreference*(): jint
  proc getActiveNetworkInfo*(): NetworkInfo
  proc getActiveNetwork*(): Network
  proc getActiveNetworkForUid*(uid: jint): Network
  proc getActiveNetworkForUid*(uid: jint, ignoreBlocked: jboolean): Network
  proc setRequireVpnForUids*(requireVpn: jboolean, ranges: Collection[Range[Integer]])
  proc setVpnDefaultForUids*(session: string, ranges: Collection[Range[Integer]])
  proc setTestLowTcpPollingTimerForKeepalive*(timeMs: jlong)
  proc setLegacyLockdownVpnEnabled*(enabled: jboolean)
  proc getActiveNetworkInfoForUid*(uid: jint): NetworkInfo
  proc getActiveNetworkInfoForUid*(uid: jint, ignoreBlocked: jboolean): NetworkInfo
  proc getNetworkInfo*(networkType: jint): NetworkInfo
  proc getNetworkInfo*(network: Network): NetworkInfo
  proc getNetworkInfoForUid*(network: Network, uid: jint, ignoreBlocked: jboolean): NetworkInfo
  proc getAllNetworkInfo*(): seq[NetworkInfo]
  proc getAllNetworkStateSnapshots*(): List[NetworkStateSnapshot]
  proc getNetworkForType*(networkType: jint): Network
  proc getAllNetworks*(): seq[Network]
  proc getDefaultNetworkCapabilitiesForUser*(userId: jint): seq[NetworkCapabilities]
  proc getActiveLinkProperties*(): LinkProperties
  proc getLinkProperties*(networkType: jint): LinkProperties
  proc getLinkProperties*(network: Network): LinkProperties
  proc getRedactedLinkPropertiesForPackage*(lp: LinkProperties, uid: jint, packageName: string): LinkProperties
  proc getNetworkCapabilities*(network: Network): NetworkCapabilities
  proc getRedactedNetworkCapabilitiesForPackage*(nc: NetworkCapabilities, uid: jint, packageName: string): NetworkCapabilities
  proc getCaptivePortalServerUrl*(): string
  proc startUsingNetworkFeature*(networkType: jint, feature: string): jint
  proc stopUsingNetworkFeature*(networkType: jint, feature: string): jint
  proc networkCapabilitiesForType*(type: jint): NetworkCapabilities {.`static`.}
  proc startNattKeepalive*(network: Network, intervalSeconds: jint, callback: PacketKeepaliveCallback, srcAddr: InetAddress, srcPort: jint, dstAddr: InetAddress): PacketKeepalive
  proc createSocketKeepalive*(network: Network, socket: UdpEncapsulationSocket, source: InetAddress, destination: InetAddress, executor: Executor, callback: Callback): SocketKeepalive
  proc createNattKeepalive*(network: Network, pfd: ParcelFileDescriptor, source: InetAddress, destination: InetAddress, executor: Executor, callback: Callback): SocketKeepalive
  proc createSocketKeepalive*(network: Network, socket: Socket, executor: Executor, callback: Callback): SocketKeepalive
  proc getSupportedKeepalives*(): seq[jint]
  proc requestRouteToHost*(networkType: jint, hostAddress: jint): jboolean
  proc requestRouteToHostAddress*(networkType: jint, hostAddress: InetAddress): jboolean
  proc getBackgroundDataSetting*(): jboolean
  proc setBackgroundDataSetting*(allowBackgroundData: jboolean)
  proc getMobileDataEnabled*(): jboolean
  proc addDefaultNetworkActiveListener*(l: OnNetworkActiveListener)
  proc removeDefaultNetworkActiveListener*(l: OnNetworkActiveListener)
  proc isDefaultNetworkActive*(): jboolean
  proc from*(context: Context): ConnectivityManager {.`static`.}
  proc getDefaultRequest*(): NetworkRequest
  proc getTetherableIfaces*(): seq[string]
  proc getTetheredIfaces*(): seq[string]
  proc getTetheringErroredIfaces*(): seq[string]
  proc getTetheredDhcpRanges*(): seq[string]
  proc tether*(iface: string): jint
  proc untether*(iface: string): jint
  proc isTetheringSupported*(): jboolean
  proc startTethering*(type: jint, showProvisioningUi: jboolean, callback: OnStartTetheringCallback)
  proc startTethering*(type: jint, showProvisioningUi: jboolean, callback: OnStartTetheringCallback, handler: Handler)
  proc stopTethering*(type: jint)
  proc registerTetheringEventCallback*(executor: Executor, callback: OnTetheringEventCallback)
  proc unregisterTetheringEventCallback*(callback: OnTetheringEventCallback)
  proc getTetherableUsbRegexs*(): seq[string]
  proc getTetherableWifiRegexs*(): seq[string]
  proc getTetherableBluetoothRegexs*(): seq[string]
  proc setUsbTethering*(enable: jboolean): jint
  proc getLastTetherError*(iface: string): jint
  proc getLatestTetheringEntitlementResult*(type: jint, showEntitlementUi: jboolean, executor: Executor, listener: OnTetheringEntitlementResultListener)
  proc reportInetCondition*(networkType: jint, percentage: jint)
  proc reportBadNetwork*(network: Network)
  proc reportNetworkConnectivity*(network: Network, hasConnectivity: jboolean)
  proc setGlobalProxy*(p: ProxyInfo)
  proc getGlobalProxy*(): ProxyInfo
  proc getProxyForNetwork*(network: Network): ProxyInfo
  proc getDefaultProxy*(): ProxyInfo
  proc isNetworkSupported*(networkType: jint): jboolean
  proc isActiveNetworkMetered*(): jboolean
  proc setProvisioningNotificationVisible*(visible: jboolean, networkType: jint, action: string)
  proc setAirplaneMode*(enable: jboolean)
  proc registerNetworkProvider*(provider: NetworkProvider): jint
  proc unregisterNetworkProvider*(provider: NetworkProvider)
  proc offerNetwork*(providerId: jint, score: NetworkScore, caps: NetworkCapabilities, callback: INetworkOfferCallback)
  proc unofferNetwork*(callback: INetworkOfferCallback)
  proc declareNetworkRequestUnfulfillable*(request: NetworkRequest)
  proc registerNetworkAgent*(na: INetworkAgent, ni: NetworkInfo, lp: LinkProperties, nc: NetworkCapabilities, score: NetworkScore, config: NetworkAgentConfig, providerId: jint): NetworkAndAgentRegistryParcelable
  proc registerNetworkAgent*(na: INetworkAgent, ni: NetworkInfo, lp: LinkProperties, nc: NetworkCapabilities, localNetworkConfig: LocalNetworkConfig, score: NetworkScore, config: NetworkAgentConfig, providerId: jint): NetworkAndAgentRegistryParcelable
  proc getCallbackName*(whichCallback: jint): string {.`static`.}
  proc isFeatureEnabled*(connectivityManagerFeature: jlong): jboolean
  proc requestNetwork*(request: NetworkRequest, timeoutMs: jint, legacyType: jint, handler: Handler, networkCallback: NetworkCallback)
  proc requestNetwork*(request: NetworkRequest, networkCallback: NetworkCallback)
  proc requestNetwork*(request: NetworkRequest, networkCallback: NetworkCallback, handler: Handler)
  proc reserveNetwork*(request: NetworkRequest, handler: Handler, networkCallback: NetworkCallback)
  proc requestNetwork*(request: NetworkRequest, networkCallback: NetworkCallback, timeoutMs: jint)
  proc requestNetwork*(request: NetworkRequest, networkCallback: NetworkCallback, handler: Handler, timeoutMs: jint)
  proc requestNetwork*(request: NetworkRequest, operation: PendingIntent)
  proc releaseNetworkRequest*(operation: PendingIntent)
  proc registerNetworkCallback*(request: NetworkRequest, networkCallback: NetworkCallback)
  proc registerNetworkCallback*(request: NetworkRequest, networkCallback: NetworkCallback, handler: Handler)
  proc registerNetworkCallback*(request: NetworkRequest, operation: PendingIntent)
  proc registerDefaultNetworkCallback*(networkCallback: NetworkCallback)
  proc registerDefaultNetworkCallback*(networkCallback: NetworkCallback, handler: Handler)
  proc registerDefaultNetworkCallbackForUid*(uid: jint, networkCallback: NetworkCallback, handler: Handler)
  proc registerSystemDefaultNetworkCallback*(networkCallback: NetworkCallback, handler: Handler)
  proc registerBestMatchingNetworkCallback*(request: NetworkRequest, networkCallback: NetworkCallback, handler: Handler)
  proc requestBandwidthUpdate*(network: Network): jboolean
  proc unregisterNetworkCallback*(networkCallback: NetworkCallback)
  proc unregisterNetworkCallback*(operation: PendingIntent)
  proc setAcceptUnvalidated*(network: Network, accept: jboolean, always: jboolean)
  proc setAcceptPartialConnectivity*(network: Network, accept: jboolean, always: jboolean)
  proc setAvoidUnvalidated*(network: Network)
  proc setTestAllowBadWifiUntil*(timeMs: jlong)
  proc startCaptivePortalApp*(network: Network)
  proc startCaptivePortalApp*(network: Network, appExtras: Bundle)
  proc shouldAvoidBadWifi*(): jboolean
  proc getMultipathPreference*(network: Network): jint
  proc factoryReset*()
  proc bindProcessToNetwork*(network: Network): jboolean
  proc setProcessDefaultNetwork*(network: Network): jboolean {.`static`.}
  proc getBoundNetworkForProcess*(): Network
  proc getProcessDefaultNetwork*(): Network {.`static`.}
  proc setProcessDefaultNetworkForHostResolution*(network: Network): jboolean {.`static`.}
  proc getRestrictBackgroundStatus*(): jint
  proc getNetworkWatchlistConfigHash*(): seq[jbyte]
  proc getConnectionOwnerUid*(protocol: jint, local: InetSocketAddress, remote: InetSocketAddress): jint
  proc startOrGetTestNetworkManager*(): TestNetworkManager
  proc createDiagnosticsManager*(): ConnectivityDiagnosticsManager
  proc simulateDataStall*(detectionMethod: jint, timestampMillis: jlong, network: Network, extras: PersistableBundle)
  proc registerQosCallback*(socketInfo: QosSocketInfo, executor: Executor, callback: QosCallback)
  proc unregisterQosCallback*(callback: QosCallback)
  proc requestBackgroundNetwork*(request: NetworkRequest, networkCallback: NetworkCallback, handler: Handler)
  proc setOemNetworkPreference*(preference: OemNetworkPreferences, executor: Executor, listener: Runnable)
  proc setProfileNetworkPreference*(profile: UserHandle, preference: jint, executor: Executor, listener: Runnable)
  proc setProfileNetworkPreferences*(profile: UserHandle, profileNetworkPreferences: List[ProfileNetworkPreference], executor: Executor, listener: Runnable)
  proc getIpSecNetIdRange*(): Range[Integer] {.`static`.}
  proc setDataSaverEnabled*(enable: jboolean)
  proc addUidToMeteredNetworkAllowList*(uid: jint)
  proc removeUidFromMeteredNetworkAllowList*(uid: jint)
  proc addUidToMeteredNetworkDenyList*(uid: jint)
  proc removeUidFromMeteredNetworkDenyList*(uid: jint)
  proc setUidFirewallRule*(chain: jint, uid: jint, rule: jint)
  proc getUidFirewallRule*(chain: jint, uid: jint): jint
  proc setFirewallChainEnabled*(chain: jint, enable: jboolean)
  proc getFirewallChainEnabled*(chain: jint): jboolean
  proc replaceFirewallChain*(chain: jint, uids: seq[jint])
  proc isUidNetworkingBlocked*(uid: jint, isNetworkMetered: jboolean): jboolean
  proc getCompanionDeviceManagerProxyService*(): IBinder
  proc getRoutingCoordinatorService*(): IBinder
  proc isConnectivityServiceFeatureEnabledForTesting*(featureFlag: string): jboolean
  CONNECTIVITY_ACTION*: string {.`static`.}
  ACTION_CAPTIVE_PORTAL_SIGN_IN*: string {.`static`.}
  EXTRA_NETWORK_INFO*: string {.`static`.}
  EXTRA_NETWORK_TYPE*: string {.`static`.}
  EXTRA_IS_FAILOVER*: string {.`static`.}
  EXTRA_OTHER_NETWORK_INFO*: string {.`static`.}
  EXTRA_NO_CONNECTIVITY*: string {.`static`.}
  EXTRA_REASON*: string {.`static`.}
  EXTRA_EXTRA_INFO*: string {.`static`.}
  EXTRA_INET_CONDITION*: string {.`static`.}
  EXTRA_CAPTIVE_PORTAL*: string {.`static`.}
  EXTRA_CAPTIVE_PORTAL_URL*: string {.`static`.}
  EXTRA_CAPTIVE_PORTAL_PROBE_SPEC*: string {.`static`.}
  EXTRA_CAPTIVE_PORTAL_USER_AGENT*: string {.`static`.}
  ACTION_DATA_ACTIVITY_CHANGE*: string {.`static`.}
  EXTRA_DEVICE_TYPE*: string {.`static`.}
  EXTRA_IS_ACTIVE*: string {.`static`.}
  EXTRA_REALTIME_NS*: string {.`static`.}
  ACTION_BACKGROUND_DATA_SETTING_CHANGED*: string {.`static`.}
  INET_CONDITION_ACTION*: string {.`static`.}
  ACTION_TETHER_STATE_CHANGED*: string {.`static`.}
  EXTRA_AVAILABLE_TETHER*: string {.`static`.}
  EXTRA_ACTIVE_LOCAL_ONLY*: string {.`static`.}
  EXTRA_ACTIVE_TETHER*: string {.`static`.}
  EXTRA_ERRORED_TETHER*: string {.`static`.}
  ACTION_CAPTIVE_PORTAL_TEST_COMPLETED*: string {.`static`.}
  EXTRA_IS_CAPTIVE_PORTAL*: string {.`static`.}
  ACTION_PROMPT_UNVALIDATED*: string {.`static`.}
  ACTION_PROMPT_LOST_VALIDATION*: string {.`static`.}
  ACTION_PROMPT_PARTIAL_CONNECTIVITY*: string {.`static`.}
  ACTION_CLEAR_DNS_CACHE*: string {.`static`.}
  TETHERING_INVALID*: jint {.`static`.}
  TETHERING_WIFI*: jint {.`static`.}
  TETHERING_USB*: jint {.`static`.}
  TETHERING_BLUETOOTH*: jint {.`static`.}
  TETHERING_WIFI_P2P*: jint {.`static`.}
  EXTRA_ADD_TETHER_TYPE*: string {.`static`.}
  EXTRA_REM_TETHER_TYPE*: string {.`static`.}
  EXTRA_SET_ALARM*: string {.`static`.}
  EXTRA_RUN_PROVISION*: string {.`static`.}
  EXTRA_PROVISION_CALLBACK*: string {.`static`.}
  TYPE_NONE*: jint {.`static`.}
  TYPE_MOBILE*: jint {.`static`.}
  TYPE_WIFI*: jint {.`static`.}
  TYPE_MOBILE_MMS*: jint {.`static`.}
  TYPE_MOBILE_SUPL*: jint {.`static`.}
  TYPE_MOBILE_DUN*: jint {.`static`.}
  TYPE_MOBILE_HIPRI*: jint {.`static`.}
  TYPE_WIMAX*: jint {.`static`.}
  TYPE_BLUETOOTH*: jint {.`static`.}
  TYPE_DUMMY*: jint {.`static`.}
  TYPE_ETHERNET*: jint {.`static`.}
  TYPE_MOBILE_FOTA*: jint {.`static`.}
  TYPE_MOBILE_IMS*: jint {.`static`.}
  TYPE_MOBILE_CBS*: jint {.`static`.}
  TYPE_WIFI_P2P*: jint {.`static`.}
  TYPE_MOBILE_IA*: jint {.`static`.}
  TYPE_MOBILE_EMERGENCY*: jint {.`static`.}
  TYPE_PROXY*: jint {.`static`.}
  TYPE_VPN*: jint {.`static`.}
  TYPE_TEST*: jint {.`static`.}
  MAX_RADIO_TYPE*: jint {.`static`.}
  MAX_NETWORK_TYPE*: jint {.`static`.}
  DEFAULT_NETWORK_PREFERENCE*: jint {.`static`.}
  REQUEST_ID_UNSET*: jint {.`static`.}
  NETID_UNSET*: jint {.`static`.}
  BLOCKED_REASON_NONE*: jint {.`static`.}
  BLOCKED_REASON_BATTERY_SAVER*: jint {.`static`.}
  BLOCKED_REASON_DOZE*: jint {.`static`.}
  BLOCKED_REASON_APP_STANDBY*: jint {.`static`.}
  BLOCKED_REASON_RESTRICTED_MODE*: jint {.`static`.}
  BLOCKED_REASON_LOCKDOWN_VPN*: jint {.`static`.}
  BLOCKED_REASON_LOW_POWER_STANDBY*: jint {.`static`.}
  BLOCKED_REASON_APP_BACKGROUND*: jint {.`static`.}
  BLOCKED_REASON_OEM_DENY*: jint {.`static`.}
  BLOCKED_REASON_NETWORK_RESTRICTED*: jint {.`static`.}
  BLOCKED_METERED_REASON_DATA_SAVER*: jint {.`static`.}
  BLOCKED_METERED_REASON_USER_RESTRICTED*: jint {.`static`.}
  BLOCKED_METERED_REASON_ADMIN_DISABLED*: jint {.`static`.}
  BLOCKED_METERED_REASON_MASK*: jint {.`static`.}
  FIREWALL_CHAIN_DOZABLE*: jint {.`static`.}
  FIREWALL_CHAIN_STANDBY*: jint {.`static`.}
  FIREWALL_CHAIN_POWERSAVE*: jint {.`static`.}
  FIREWALL_CHAIN_RESTRICTED*: jint {.`static`.}
  FIREWALL_CHAIN_LOW_POWER_STANDBY*: jint {.`static`.}
  FIREWALL_CHAIN_BACKGROUND*: jint {.`static`.}
  FIREWALL_CHAIN_OEM_DENY_1*: jint {.`static`.}
  FIREWALL_CHAIN_OEM_DENY_2*: jint {.`static`.}
  FIREWALL_CHAIN_OEM_DENY_3*: jint {.`static`.}
  FIREWALL_CHAIN_METERED_ALLOW*: jint {.`static`.}
  FIREWALL_CHAIN_METERED_DENY_USER*: jint {.`static`.}
  FIREWALL_CHAIN_METERED_DENY_ADMIN*: jint {.`static`.}
  FIREWALL_RULE_DEFAULT*: jint {.`static`.}
  FIREWALL_RULE_ALLOW*: jint {.`static`.}
  FIREWALL_RULE_DENY*: jint {.`static`.}
  FEATURE_USE_DECLARED_METHODS_FOR_CALLBACKS*: jlong {.`static`.}
  FEATURE_QUEUE_NETWORK_AGENT_EVENTS_IN_SYSTEM_SERVER*: jlong {.`static`.}
  PROFILE_NETWORK_PREFERENCE_DEFAULT*: jint {.`static`.}
  PROFILE_NETWORK_PREFERENCE_ENTERPRISE*: jint {.`static`.}
  PROFILE_NETWORK_PREFERENCE_ENTERPRISE_NO_FALLBACK*: jint {.`static`.}
  PROFILE_NETWORK_PREFERENCE_ENTERPRISE_BLOCKING*: jint {.`static`.}
  TETHER_ERROR_NO_ERROR*: jint {.`static`.}
  TETHER_ERROR_UNKNOWN_IFACE*: jint {.`static`.}
  TETHER_ERROR_SERVICE_UNAVAIL*: jint {.`static`.}
  TETHER_ERROR_UNSUPPORTED*: jint {.`static`.}
  TETHER_ERROR_UNAVAIL_IFACE*: jint {.`static`.}
  TETHER_ERROR_MASTER_ERROR*: jint {.`static`.}
  TETHER_ERROR_TETHER_IFACE_ERROR*: jint {.`static`.}
  TETHER_ERROR_UNTETHER_IFACE_ERROR*: jint {.`static`.}
  TETHER_ERROR_ENABLE_NAT_ERROR*: jint {.`static`.}
  TETHER_ERROR_DISABLE_NAT_ERROR*: jint {.`static`.}
  TETHER_ERROR_IFACE_CFG_ERROR*: jint {.`static`.}
  TETHER_ERROR_PROVISION_FAILED*: jint {.`static`.}
  TETHER_ERROR_DHCPSERVER_ERROR*: jint {.`static`.}
  TETHER_ERROR_ENTITLEMENT_UNKONWN*: jint {.`static`.}
  CALLBACK_PRECHECK*: jint {.`static`.}
  CALLBACK_AVAILABLE*: jint {.`static`.}
  CALLBACK_LOSING*: jint {.`static`.}
  CALLBACK_LOST*: jint {.`static`.}
  CALLBACK_UNAVAIL*: jint {.`static`.}
  CALLBACK_CAP_CHANGED*: jint {.`static`.}
  CALLBACK_IP_CHANGED*: jint {.`static`.}
  CALLBACK_SUSPENDED*: jint {.`static`.}
  CALLBACK_RESUMED*: jint {.`static`.}
  CALLBACK_BLK_CHANGED*: jint {.`static`.}
  CALLBACK_LOCAL_NETWORK_INFO_CHANGED*: jint {.`static`.}
  CALLBACK_RESERVED*: jint {.`static`.}
  EXTRA_NETWORK*: string {.`static`.}
  EXTRA_NETWORK_REQUEST*: string {.`static`.}
  MULTIPATH_PREFERENCE_HANDOVER*: jint {.`static`.}
  MULTIPATH_PREFERENCE_RELIABILITY*: jint {.`static`.}
  MULTIPATH_PREFERENCE_PERFORMANCE*: jint {.`static`.}
  MULTIPATH_PREFERENCE_UNMETERED*: jint {.`static`.}
  RESTRICT_BACKGROUND_STATUS_DISABLED*: jint {.`static`.}
  RESTRICT_BACKGROUND_STATUS_WHITELISTED*: jint {.`static`.}
  RESTRICT_BACKGROUND_STATUS_ENABLED*: jint {.`static`.}
  ACTION_RESTRICT_BACKGROUND_CHANGED*: string {.`static`.}

jclass android.net.ConnectivityManager.MockHelpers* of JVMObject:
  proc registerNetworkAgentResult*(network: Network, registry: INetworkAgentRegistry): NetworkAndAgentRegistryParcelable {.`static`.}

jclass android.net.ConnectivityManager.PacketKeepaliveCallback* of JVMObject:
  proc onStarted*()
  proc onResumed*()
  proc onStopped*()
  proc onPaused*()
  proc onError*(error: jint)

jclass android.net.ConnectivityManager.PacketKeepalive* of JVMObject:
  proc stop*()

jclass android.net.ConnectivityManager.OnStartTetheringCallback* of JVMObject:
  proc onTetheringStarted*()
  proc onTetheringFailed*()

jclass android.net.ConnectivityManager.OnTetheringEventCallback* of JVMObject:
  proc onUpstreamChanged*(network: Network)

jclass android.net.ConnectivityManager.NetworkCallback* of JVMObject:
  proc onPreCheck*(network: Network)
  proc onAvailable*(network: Network, networkCapabilities: NetworkCapabilities, linkProperties: LinkProperties, localInfo: LocalNetworkInfo, blocked: jint)
  proc onAvailable*(network: Network, networkCapabilities: NetworkCapabilities, linkProperties: LinkProperties, blocked: jboolean)
  proc onAvailable*(network: Network)
  proc onLosing*(network: Network, maxMsToLive: jint)
  proc onLost*(network: Network)
  proc onUnavailable*()
  proc onCapabilitiesChanged*(network: Network, networkCapabilities: NetworkCapabilities)
  proc onLinkPropertiesChanged*(network: Network, linkProperties: LinkProperties)
  proc onLocalNetworkInfoChanged*(network: Network, localNetworkInfo: LocalNetworkInfo)
  proc onNetworkSuspended*(network: Network)
  proc onNetworkResumed*(network: Network)
  proc onBlockedStatusChanged*(network: Network, blocked: jboolean)
  proc onBlockedStatusChanged*(network: Network, blocked: jint)
  proc onReserved*(networkCapabilities: NetworkCapabilities)

jclass android.net.MockHelpers* of JVMObject:
  proc registerNetworkAgentResult*(network: Network, registry: INetworkAgentRegistry): NetworkAndAgentRegistryParcelable {.`static`.}

jclass android.net.PacketKeepaliveCallback* of JVMObject:
  proc onStarted*()
  proc onResumed*()
  proc onStopped*()
  proc onPaused*()
  proc onError*(error: jint)

jclass android.net.PacketKeepalive* of JVMObject:
  proc stop*()
  SUCCESS*: jint {.`static`.}
  NO_KEEPALIVE*: jint {.`static`.}
  BINDER_DIED*: jint {.`static`.}
  ERROR_INVALID_NETWORK*: jint {.`static`.}
  ERROR_INVALID_IP_ADDRESS*: jint {.`static`.}
  ERROR_INVALID_PORT*: jint {.`static`.}
  ERROR_INVALID_LENGTH*: jint {.`static`.}
  ERROR_INVALID_INTERVAL*: jint {.`static`.}
  ERROR_HARDWARE_UNSUPPORTED*: jint {.`static`.}
  ERROR_HARDWARE_ERROR*: jint {.`static`.}
  NATT_PORT*: jint {.`static`.}
  MIN_INTERVAL*: jint {.`static`.}


jclass android.net.OnStartTetheringCallback* of JVMObject:
  proc onTetheringStarted*()
  proc onTetheringFailed*()

jclass android.net.OnTetheringEventCallback* of JVMObject:
  proc onUpstreamChanged*(network: Network)


jclass android.net.NetworkCallback* of JVMObject:
  proc onPreCheck*(network: Network)
  proc onAvailable*(network: Network, networkCapabilities: NetworkCapabilities, linkProperties: LinkProperties, localInfo: LocalNetworkInfo, blocked: jint)
  proc onAvailable*(network: Network, networkCapabilities: NetworkCapabilities, linkProperties: LinkProperties, blocked: jboolean)
  proc onAvailable*(network: Network)
  proc onLosing*(network: Network, maxMsToLive: jint)
  proc onLost*(network: Network)
  proc onUnavailable*()
  proc onCapabilitiesChanged*(network: Network, networkCapabilities: NetworkCapabilities)
  proc onLinkPropertiesChanged*(network: Network, linkProperties: LinkProperties)
  proc onLocalNetworkInfoChanged*(network: Network, localNetworkInfo: LocalNetworkInfo)
  proc onNetworkSuspended*(network: Network)
  proc onNetworkResumed*(network: Network)
  proc onBlockedStatusChanged*(network: Network, blocked: jboolean)
  proc onBlockedStatusChanged*(network: Network, blocked: jint)
  proc onReserved*(networkCapabilities: NetworkCapabilities)
  DECLARED_METHODS_ALL*: jint {.`static`.}
  DECLARED_METHODS_NONE*: jint {.`static`.}
  FLAG_NONE*: jint {.`static`.}
  FLAG_INCLUDE_LOCATION_INFO*: jint {.`static`.}


jclass android.net.TooManyRequestsException* of RuntimeException:

jclass android.net.NetworkCallbackMethod* of JVMObject:
  mName*: string
  mParameterTypes*: Class[?]
  mCallbacksCallingThisMethod*: jint

jclass android.net.NetworkCallbackMethodsHolder* of JVMObject:
  NETWORK_CB_METHODS*: NetworkCallbackMethod {.`static`.}

