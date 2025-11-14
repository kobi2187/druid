import jnim

jclass android.net.NetworkIdentity* of JVMObject:
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  proc dumpDebug*(proto: ProtoOutputStream, tag: jlong)
  proc getType*(): jint
  proc getRatType*(): jint
  proc getSubscriberId*(): string
  proc getWifiNetworkKey*(): string
  proc getRoaming*(): jboolean
  proc isRoaming*(): jboolean
  proc getMetered*(): jboolean
  proc isMetered*(): jboolean
  proc getDefaultNetwork*(): jboolean
  proc isDefaultNetwork*(): jboolean
  proc getOemManaged*(): jint
  proc getSubId*(): jint
  proc buildNetworkIdentity*(context: Context, snapshot: NetworkStateSnapshot, defaultNetwork: jboolean, ratType: jint): NetworkIdentity {.`static`.}
  proc getOemBitfield*(nc: NetworkCapabilities): jint {.`static`.}
  proc compare*(left: NetworkIdentity, right: NetworkIdentity): jint {.`static`.}
  SUBTYPE_COMBINED*: jint {.`static`.}
  OEM_NONE*: jint {.`static`.}
  OEM_PAID*: jint {.`static`.}
  OEM_PRIVATE*: jint {.`static`.}

jclass android.net.NetworkIdentity.Builder* of JVMObject:
  proc setNetworkStateSnapshot*(snapshot: NetworkStateSnapshot): Builder
  proc setType*(type: jint): Builder
  proc setRatType*(ratType: jint): Builder
  proc clearRatType*(): Builder
  proc setSubscriberId*(subscriberId: string): Builder
  proc setWifiNetworkKey*(wifiNetworkKey: string): Builder
  proc setRoaming*(roaming: jboolean): Builder
  proc setMetered*(metered: jboolean): Builder
  proc setDefaultNetwork*(defaultNetwork: jboolean): Builder
  proc setOemManaged*(oemManaged: jint): Builder
  proc setSubId*(subId: jint): Builder
  proc build*(): NetworkIdentity

jclass android.net.Builder* of JVMObject:
  proc setNetworkStateSnapshot*(snapshot: NetworkStateSnapshot): Builder
  proc setType*(type: jint): Builder
  proc setRatType*(ratType: jint): Builder
  proc clearRatType*(): Builder
  proc setSubscriberId*(subscriberId: string): Builder
  proc setWifiNetworkKey*(wifiNetworkKey: string): Builder
  proc setRoaming*(roaming: jboolean): Builder
  proc setMetered*(metered: jboolean): Builder
  proc setDefaultNetwork*(defaultNetwork: jboolean): Builder
  proc setOemManaged*(oemManaged: jint): Builder
  proc setSubId*(subId: jint): Builder
  proc build*(): NetworkIdentity

