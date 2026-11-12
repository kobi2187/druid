import jnim

jclass android.net.NetworkAgentConfig* of JVMObject:
  proc isExplicitlySelected*(): jboolean
  proc isBypassableVpn*(): jboolean
  proc isUnvalidatedConnectivityAcceptable*(): jboolean
  proc isPartialConnectivityAcceptable*(): jboolean
  proc isProvisioningNotificationEnabled*(): jboolean
  proc getSubscriberId*(): string
  proc isNat64DetectionEnabled*(): jboolean
  proc getLegacyType*(): jint
  proc getLegacyTypeName*(): string
  proc getLegacyExtraInfo*(): string
  proc areLocalRoutesExcludedForVpn*(): jboolean
  proc isVpnValidationRequired*(): jboolean
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  allowBypass*: jboolean
  explicitlySelected*: jboolean
  acceptUnvalidated*: jboolean
  acceptPartialConnectivity*: jboolean
  provisioningNotificationDisabled*: jboolean
  subscriberId*: string
  skip464xlat*: jboolean
  legacyType*: jint
  legacySubType*: jint
  hasShownBroken*: jboolean
  legacyTypeName*: string
  legacySubTypeName*: string
  excludeLocalRouteVpn*: jboolean
  CREATOR*: Creator[NetworkAgentConfig] {.`static`.}

jclass android.net.NetworkAgentConfig.Builder* of JVMObject:
  proc setExplicitlySelected*(explicitlySelected: jboolean): Builder
  proc setUnvalidatedConnectivityAcceptable*(unvalidatedConnectivityAcceptable: jboolean): Builder
  proc setPartialConnectivityAcceptable*(partialConnectivityAcceptable: jboolean): Builder
  proc setSubscriberId*(subscriberId: string): Builder
  proc setNat64DetectionEnabled*(enabled: jboolean): Builder
  proc setProvisioningNotificationEnabled*(enabled: jboolean): Builder
  proc setLegacyType*(legacyType: jint): Builder
  proc setLegacySubType*(legacySubType: jint): Builder
  proc setLegacyTypeName*(legacyTypeName: string): Builder
  proc setLegacySubTypeName*(legacySubTypeName: string): Builder
  proc setLegacyExtraInfo*(legacyExtraInfo: string): Builder
  proc setVpnRequiresValidation*(vpnRequiresValidation: jboolean): Builder
  proc setBypassableVpn*(allowBypass: jboolean): Builder
  proc setLocalRoutesExcludedForVpn*(excludeLocalRoutes: jboolean): Builder
  proc build*(): NetworkAgentConfig

jclass android.net.Builder* of JVMObject:
  proc setExplicitlySelected*(explicitlySelected: jboolean): Builder
  proc setUnvalidatedConnectivityAcceptable*(unvalidatedConnectivityAcceptable: jboolean): Builder
  proc setPartialConnectivityAcceptable*(partialConnectivityAcceptable: jboolean): Builder
  proc setSubscriberId*(subscriberId: string): Builder
  proc setNat64DetectionEnabled*(enabled: jboolean): Builder
  proc setProvisioningNotificationEnabled*(enabled: jboolean): Builder
  proc setLegacyType*(legacyType: jint): Builder
  proc setLegacySubType*(legacySubType: jint): Builder
  proc setLegacyTypeName*(legacyTypeName: string): Builder
  proc setLegacySubTypeName*(legacySubTypeName: string): Builder
  proc setLegacyExtraInfo*(legacyExtraInfo: string): Builder
  proc setVpnRequiresValidation*(vpnRequiresValidation: jboolean): Builder
  proc setBypassableVpn*(allowBypass: jboolean): Builder
  proc setLocalRoutesExcludedForVpn*(excludeLocalRoutes: jboolean): Builder
  proc build*(): NetworkAgentConfig

