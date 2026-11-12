import jnim

jclass android.net.NetworkPolicyManager* of JVMObject:
  proc from*(context: Context): NetworkPolicyManager {.`static`.}
  proc setUidPolicy*(uid: jint, policy: jint)
  proc addUidPolicy*(uid: jint, policy: jint)
  proc removeUidPolicy*(uid: jint, policy: jint)
  proc getUidPolicy*(uid: jint): jint
  proc getUidsWithPolicy*(policy: jint): seq[jint]
  proc registerListener*(listener: INetworkPolicyListener)
  proc unregisterListener*(listener: INetworkPolicyListener)
  proc registerSubscriptionCallback*(callback: SubscriptionCallback)
  proc unregisterSubscriptionCallback*(callback: SubscriptionCallback)
  proc setNetworkPolicies*(policies: seq[NetworkPolicy])
  proc getNetworkPolicies*(): seq[NetworkPolicy]
  proc setRestrictBackground*(restrictBackground: jboolean)
  proc getRestrictBackground*(): jboolean
  proc getRestrictBackgroundStatus*(uid: jint): jint
  proc setSubscriptionOverride*(subId: jint, overrideMask: jint, overrideValue: jint, networkTypes: seq[jint], expirationDurationMillis: jlong, callingPackage: string)
  proc setSubscriptionPlans*(subId: jint, plans: seq[SubscriptionPlan], expirationDurationMillis: jlong, callingPackage: string)
  proc getSubscriptionPlans*(subId: jint, callingPackage: string): seq[SubscriptionPlan]
  proc getSubscriptionPlan*(template: NetworkTemplate): SubscriptionPlan
  proc notifyStatsProviderWarningReached*()
  proc notifyStatsProviderLimitReached*()
  proc factoryReset*(subscriber: string)
  proc isUidNetworkingBlocked*(uid: jint, meteredNetwork: jboolean): jboolean
  proc isUidRestrictedOnMeteredNetworks*(uid: jint): jboolean
  proc getMultipathPreference*(network: Network): jint
  proc cycleIterator*(policy: NetworkPolicy): Iterator[Pair<ZonedDateTime, ZonedDateTime>] {.`static`.}
  proc isUidValidForPolicy*(context: Context, uid: jint): jboolean {.`static`.}
  proc uidRulesToString*(uidRules: jint): string {.`static`.}
  proc uidPoliciesToString*(uidPolicies: jint): string {.`static`.}
  proc getDefaultProcessNetworkCapabilities*(procState: jint): jint {.`static`.}
  proc isProcStateAllowedWhileIdleOrPowerSaveMode*(uidState: UidState): jboolean {.`static`.}
  proc isProcStateAllowedWhileIdleOrPowerSaveMode*(procState: jint, capability: jint): jboolean {.`static`.}
  proc isProcStateAllowedWhileInLowPowerStandby*(uidState: UidState): jboolean {.`static`.}
  proc isProcStateAllowedNetworkWhileBackground*(uidState: UidState): jboolean {.`static`.}
  proc isProcStateAllowedWhileOnRestrictBackground*(uidState: UidState): jboolean {.`static`.}
  proc isProcStateAllowedWhileOnRestrictBackground*(procState: jint, capabilities: jint): jboolean {.`static`.}
  proc resolveNetworkId*(config: WifiConfiguration): string {.`static`.}
  proc resolveNetworkId*(ssid: string): string {.`static`.}
  proc blockedReasonsToString*(blockedReasons: jint): string {.`static`.}
  proc allowedReasonsToString*(allowedReasons: jint): string {.`static`.}
  proc registerNetworkPolicyCallback*(executor: Executor, callback: NetworkPolicyCallback)
  proc unregisterNetworkPolicyCallback*(callback: NetworkPolicyCallback)
  POLICY_NONE*: jint {.`static`.}
  POLICY_REJECT_METERED_BACKGROUND*: jint {.`static`.}
  POLICY_ALLOW_METERED_BACKGROUND*: jint {.`static`.}
  RULE_NONE*: jint {.`static`.}
  RULE_ALLOW_METERED*: jint {.`static`.}
  RULE_TEMPORARY_ALLOW_METERED*: jint {.`static`.}
  RULE_REJECT_METERED*: jint {.`static`.}
  RULE_ALLOW_ALL*: jint {.`static`.}
  RULE_REJECT_ALL*: jint {.`static`.}
  RULE_REJECT_RESTRICTED_MODE*: jint {.`static`.}
  MASK_METERED_NETWORKS*: jint {.`static`.}
  MASK_ALL_NETWORKS*: jint {.`static`.}
  MASK_RESTRICTED_MODE_NETWORKS*: jint {.`static`.}
  FIREWALL_RULE_DEFAULT*: jint {.`static`.}
  FIREWALL_CHAIN_NAME_NONE*: string {.`static`.}
  FIREWALL_CHAIN_NAME_DOZABLE*: string {.`static`.}
  FIREWALL_CHAIN_NAME_STANDBY*: string {.`static`.}
  FIREWALL_CHAIN_NAME_POWERSAVE*: string {.`static`.}
  FIREWALL_CHAIN_NAME_RESTRICTED*: string {.`static`.}
  FIREWALL_CHAIN_NAME_LOW_POWER_STANDBY*: string {.`static`.}
  FIREWALL_CHAIN_NAME_BACKGROUND*: string {.`static`.}
  FIREWALL_CHAIN_NAME_METERED_ALLOW*: string {.`static`.}
  FIREWALL_CHAIN_NAME_METERED_DENY_USER*: string {.`static`.}
  FIREWALL_CHAIN_NAME_METERED_DENY_ADMIN*: string {.`static`.}
  FOREGROUND_THRESHOLD_STATE*: jint {.`static`.}
  TOP_THRESHOLD_STATE*: jint {.`static`.}
  BACKGROUND_THRESHOLD_STATE*: jint {.`static`.}
  EXTRA_NETWORK_TEMPLATE*: string {.`static`.}
  SUBSCRIPTION_OVERRIDE_UNMETERED*: jint {.`static`.}
  SUBSCRIPTION_OVERRIDE_CONGESTED*: jint {.`static`.}
  ALLOWED_REASON_NONE*: jint {.`static`.}
  ALLOWED_REASON_SYSTEM*: jint {.`static`.}
  ALLOWED_REASON_FOREGROUND*: jint {.`static`.}
  ALLOWED_REASON_POWER_SAVE_ALLOWLIST*: jint {.`static`.}
  ALLOWED_REASON_POWER_SAVE_EXCEPT_IDLE_ALLOWLIST*: jint {.`static`.}
  ALLOWED_REASON_RESTRICTED_MODE_PERMISSIONS*: jint {.`static`.}
  ALLOWED_REASON_TOP*: jint {.`static`.}
  ALLOWED_REASON_LOW_POWER_STANDBY_ALLOWLIST*: jint {.`static`.}
  ALLOWED_REASON_NOT_IN_BACKGROUND*: jint {.`static`.}
  ALLOWED_METERED_REASON_USER_EXEMPTED*: jint {.`static`.}
  ALLOWED_METERED_REASON_SYSTEM*: jint {.`static`.}
  ALLOWED_METERED_REASON_FOREGROUND*: jint {.`static`.}
  ALLOWED_METERED_REASON_MASK*: jint {.`static`.}

jclass android.net.NetworkPolicyManager.UidState* of JVMObject:
  proc toString*(): string

jclass android.net.NetworkPolicyManager.NetworkPolicyCallbackProxy* of JVMObject:
  proc onBlockedReasonChanged*(uid: jint, oldBlockedReasons: jint, newBlockedReasons: jint)

jclass android.net.NetworkPolicyManager.SubscriptionCallback* of JVMObject:
  proc onSubscriptionOverride*(subId: jint, overrideMask: jint, overrideValue: jint, networkTypes: seq[jint])
  proc onSubscriptionPlansChanged*(subId: jint, plans: seq[SubscriptionPlan])

jclass android.net.NetworkPolicyManager.SubscriptionCallbackProxy* of JVMObject:
  proc onSubscriptionOverride*(subId: jint, overrideMask: jint, overrideValue: jint, networkTypes: seq[jint])
  proc onSubscriptionPlansChanged*(subId: jint, plans: seq[SubscriptionPlan])

jclass android.net.NetworkPolicyManager.Listener* of JVMObject:
  proc onUidRulesChanged*(uid: jint, uidRules: jint)
  proc onMeteredIfacesChanged*(meteredIfaces: seq[string])
  proc onRestrictBackgroundChanged*(restrictBackground: jboolean)
  proc onUidPoliciesChanged*(uid: jint, uidPolicies: jint)
  proc onSubscriptionOverride*(subId: jint, overrideMask: jint, overrideValue: jint, networkTypes: seq[jint])
  proc onSubscriptionPlansChanged*(subId: jint, plans: seq[SubscriptionPlan])
  proc onBlockedReasonChanged*(uid: jint, oldBlockedReasons: jint, newBlockedReasons: jint)

jclass android.net.UidState* of JVMObject:
  proc toString*(): string
  uid*: jint
  procState*: jint
  procStateSeq*: jlong
  capability*: jint


jclass android.net.NetworkPolicyCallbackProxy* of Listener:
  proc onBlockedReasonChanged*(uid: jint, oldBlockedReasons: jint, newBlockedReasons: jint)

jclass android.net.SubscriptionCallback* of JVMObject:
  proc onSubscriptionOverride*(subId: jint, overrideMask: jint, overrideValue: jint, networkTypes: seq[jint])
  proc onSubscriptionPlansChanged*(subId: jint, plans: seq[SubscriptionPlan])

jclass android.net.SubscriptionCallbackProxy* of Listener:
  proc onSubscriptionOverride*(subId: jint, overrideMask: jint, overrideValue: jint, networkTypes: seq[jint])
  proc onSubscriptionPlansChanged*(subId: jint, plans: seq[SubscriptionPlan])

jclass android.net.Listener* of Stub:
  proc onUidRulesChanged*(uid: jint, uidRules: jint)
  proc onMeteredIfacesChanged*(meteredIfaces: seq[string])
  proc onRestrictBackgroundChanged*(restrictBackground: jboolean)
  proc onUidPoliciesChanged*(uid: jint, uidPolicies: jint)
  proc onSubscriptionOverride*(subId: jint, overrideMask: jint, overrideValue: jint, networkTypes: seq[jint])
  proc onSubscriptionPlansChanged*(subId: jint, plans: seq[SubscriptionPlan])
  proc onBlockedReasonChanged*(uid: jint, oldBlockedReasons: jint, newBlockedReasons: jint)

