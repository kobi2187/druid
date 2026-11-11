import jnim

jclass android.net.NetworkTemplate* of JVMObject:
  proc buildTemplateMobileAll*(subscriberId: string): NetworkTemplate {.`static`.}
  proc buildTemplateMobileWildcard*(): NetworkTemplate {.`static`.}
  proc buildTemplateWifiWildcard*(): NetworkTemplate {.`static`.}
  proc buildTemplateWifi*(): NetworkTemplate {.`static`.}
  proc buildTemplateEthernet*(): NetworkTemplate {.`static`.}
  proc buildTemplateBluetooth*(): NetworkTemplate {.`static`.}
  proc buildTemplateProxy*(): NetworkTemplate {.`static`.}
  proc buildTemplateCarrierMetered*(subscriberId: string): NetworkTemplate {.`static`.}
  proc buildTemplateMobileWithRatType*(subscriberId: string, ratType: jint, metered: jint): NetworkTemplate {.`static`.}
  proc buildTemplateWifi*(wifiNetworkKey: string): NetworkTemplate {.`static`.}
  proc buildTemplateWifi*(wifiNetworkKey: string, subscriberId: string): NetworkTemplate {.`static`.}
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc isMatchRuleMobile*(): jboolean
  proc getMatchRule*(): jint
  proc getSubscriberId*(): string
  proc getSubscriberIds*(): Set[string]
  proc getWifiNetworkKeys*(): Set[string]
  proc getNetworkId*(): string
  proc getMeteredness*(): jint
  proc getRoaming*(): jint
  proc getDefaultNetworkStatus*(): jint
  proc getRatType*(): jint
  proc getOemManaged*(): jint
  proc matches*(ident: NetworkIdentity): jboolean
  proc matchesSubscriberId*(subscriberId: string): jboolean
  proc normalize*(template: NetworkTemplate, merged: seq[string]): NetworkTemplate {.`static`.}
  proc normalize*(template: NetworkTemplate, mergedList: List[seq[string]]): NetworkTemplate {.`static`.}
  MATCH_MOBILE*: jint {.`static`.}
  MATCH_WIFI*: jint {.`static`.}
  MATCH_ETHERNET*: jint {.`static`.}
  MATCH_BLUETOOTH*: jint {.`static`.}
  MATCH_PROXY*: jint {.`static`.}
  MATCH_CARRIER*: jint {.`static`.}
  MATCH_TEST*: jint {.`static`.}
  WIFI_NETWORKID_ALL*: string {.`static`.}
  WIFI_NETWORK_KEY_ALL*: string {.`static`.}
  NETWORK_TYPE_ALL*: jint {.`static`.}
  OEM_MANAGED_ALL*: jint {.`static`.}
  OEM_MANAGED_NO*: jint {.`static`.}
  OEM_MANAGED_YES*: jint {.`static`.}
  OEM_MANAGED_PAID*: jint {.`static`.}
  OEM_MANAGED_PRIVATE*: jint {.`static`.}
  CREATOR*: Creator[NetworkTemplate] {.`static`.}

jclass android.net.NetworkTemplate.Builder* of JVMObject:
  proc setSubscriberIds*(subscriberIds: Set[string]): Builder
  proc setWifiNetworkKeys*(wifiNetworkKeys: Set[string]): Builder
  proc setMeteredness*(metered: jint): Builder
  proc setRoaming*(roaming: jint): Builder
  proc setDefaultNetworkStatus*(defaultNetwork: jint): Builder
  proc setRatType*(ratType: jint): Builder
  proc setOemManaged*(oemManaged: jint): Builder
  proc build*(): NetworkTemplate

jclass android.net.Builder* of JVMObject:
  proc setSubscriberIds*(subscriberIds: Set[string]): Builder
  proc setWifiNetworkKeys*(wifiNetworkKeys: Set[string]): Builder
  proc setMeteredness*(metered: jint): Builder
  proc setRoaming*(roaming: jint): Builder
  proc setDefaultNetworkStatus*(defaultNetwork: jint): Builder
  proc setRatType*(ratType: jint): Builder
  proc setOemManaged*(oemManaged: jint): Builder
  proc build*(): NetworkTemplate

