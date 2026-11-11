import jnim

jclass android.net.NetworkAgent* of JVMObject:
  proc isFeatureEnabled*(context: Context, feature: jlong): jboolean
  proc register*(): Network
  proc registerForTest*(network: Network, registry: INetworkAgentRegistry): INetworkAgent
  proc waitForIdle*(timeoutMs: jlong): jboolean
  proc getNetwork*(): Network
  proc sendLinkProperties*(linkProperties: LinkProperties)
  proc setUnderlyingNetworks*(underlyingNetworks: List[Network])
  proc markConnected*()
  proc unregister*()
  proc setTeardownDelayMillis*(teardownDelayMillis: jint)
  proc unregisterAfterReplacement*(timeoutMillis: jint)
  proc setLegacySubtype*(legacySubtype: jint, legacySubtypeName: string)
  proc setLegacyExtraInfo*(extraInfo: string)
  proc sendNetworkCapabilities*(networkCapabilities: NetworkCapabilities)
  proc sendLocalNetworkConfig*(config: LocalNetworkConfig)
  proc sendNetworkScore*(score: NetworkScore)
  proc sendNetworkScore*(score: jint)
  proc explicitlySelected*(acceptUnvalidated: jboolean)
  proc explicitlySelected*(explicitlySelected: jboolean, acceptUnvalidated: jboolean)
  proc onNetworkUnwanted*()
  proc onBandwidthUpdateRequested*()
  proc onValidationStatus*(status: jint, redirectUri: Uri)
  proc onSaveAcceptUnvalidated*(accept: jboolean)
  proc onNetworkCreated*()
  proc onNetworkDestroyed*()
  proc onDscpPolicyStatusUpdated*(policyId: jint, status: jint)
  proc onStartSocketKeepalive*(slot: jint, interval: Duration, packet: KeepalivePacketData)
  proc onStopSocketKeepalive*(slot: jint)
  proc sendSocketKeepaliveEvent*(slot: jint, event: jint)
  proc onSocketKeepaliveEvent*(slot: jint, reason: jint)
  proc onAddKeepalivePacketFilter*(slot: jint, packet: KeepalivePacketData)
  proc onRemoveKeepalivePacketFilter*(slot: jint)
  proc onSignalStrengthThresholdsUpdated*(thresholds: seq[jint])
  proc onAutomaticReconnectDisabled*()
  proc onQosCallbackRegistered*(qosCallbackId: jint, filter: QosFilter)
  proc onQosCallbackUnregistered*(qosCallbackId: jint)
  proc sendQosSessionAvailable*(qosCallbackId: jint, sessionId: jint, attributes: QosSessionAttributes)
  proc sendQosSessionLost*(qosCallbackId: jint, sessionId: jint, qosSessionType: jint)
  proc sendQosCallbackError*(qosCallbackId: jint, exceptionType: jint)
  proc setLingerDuration*(duration: Duration)
  proc sendAddDscpPolicy*(policy: DscpPolicy)
  proc sendRemoveDscpPolicy*(policyId: jint)
  proc sendRemoveAllDscpPolicies*()
  MIN_LINGER_TIMER_MS*: jint {.`static`.}
  providerId*: jint
  CMD_SUSPECT_BAD*: jint {.`static`.}
  EVENT_NETWORK_INFO_CHANGED*: jint {.`static`.}
  EVENT_NETWORK_CAPABILITIES_CHANGED*: jint {.`static`.}
  EVENT_NETWORK_PROPERTIES_CHANGED*: jint {.`static`.}
  WIFI_BASE_SCORE*: jint {.`static`.}
  EVENT_NETWORK_SCORE_CHANGED*: jint {.`static`.}
  EVENT_UNDERLYING_NETWORKS_CHANGED*: jint {.`static`.}
  EVENT_TEARDOWN_DELAY_CHANGED*: jint {.`static`.}
  MAX_TEARDOWN_DELAY_MS*: jint {.`static`.}
  CMD_REPORT_NETWORK_STATUS*: jint {.`static`.}
  VALIDATION_STATUS_VALID*: jint {.`static`.}
  VALIDATION_STATUS_NOT_VALID*: jint {.`static`.}
  VALID_NETWORK*: jint {.`static`.}
  INVALID_NETWORK*: jint {.`static`.}
  REDIRECT_URL_KEY*: string {.`static`.}
  EVENT_SET_EXPLICITLY_SELECTED*: jint {.`static`.}
  CMD_SAVE_ACCEPT_UNVALIDATED*: jint {.`static`.}
  CMD_REQUEST_BANDWIDTH_UPDATE*: jint {.`static`.}
  CMD_START_SOCKET_KEEPALIVE*: jint {.`static`.}
  CMD_STOP_SOCKET_KEEPALIVE*: jint {.`static`.}
  EVENT_SOCKET_KEEPALIVE*: jint {.`static`.}
  CMD_SET_SIGNAL_STRENGTH_THRESHOLDS*: jint {.`static`.}
  CMD_PREVENT_AUTOMATIC_RECONNECT*: jint {.`static`.}
  CMD_ADD_KEEPALIVE_PACKET_FILTER*: jint {.`static`.}
  CMD_REMOVE_KEEPALIVE_PACKET_FILTER*: jint {.`static`.}
  CMD_REGISTER_QOS_CALLBACK*: jint {.`static`.}
  CMD_UNREGISTER_QOS_CALLBACK*: jint {.`static`.}
  CMD_NETWORK_CREATED*: jint {.`static`.}
  CMD_NETWORK_DESTROYED*: jint {.`static`.}
  EVENT_LINGER_DURATION_CHANGED*: jint {.`static`.}
  EVENT_ADD_DSCP_POLICY*: jint {.`static`.}
  EVENT_REMOVE_DSCP_POLICY*: jint {.`static`.}
  EVENT_REMOVE_ALL_DSCP_POLICIES*: jint {.`static`.}
  CMD_DSCP_POLICY_STATUS*: jint {.`static`.}
  EVENT_UNREGISTER_AFTER_REPLACEMENT*: jint {.`static`.}
  EVENT_LOCAL_NETWORK_CONFIG_CHANGED*: jint {.`static`.}
  DSCP_POLICY_STATUS_SUCCESS*: jint {.`static`.}
  DSCP_POLICY_STATUS_REQUEST_DECLINED*: jint {.`static`.}
  DSCP_POLICY_STATUS_REQUESTED_CLASSIFIER_NOT_SUPPORTED*: jint {.`static`.}
  DSCP_POLICY_STATUS_INSUFFICIENT_PROCESSING_RESOURCES*: jint {.`static`.}
  DSCP_POLICY_STATUS_DELETED*: jint {.`static`.}
  DSCP_POLICY_STATUS_POLICY_NOT_FOUND*: jint {.`static`.}

