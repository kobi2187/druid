import jnim

jclass android.telephony.SubscriptionInfo* of JVMObject:
  proc getSubscriptionId*(): jint
  proc getIccId*(): string
  proc getSimSlotIndex*(): jint
  proc getCarrierId*(): jint
  proc getDisplayName*(): CharSequence
  proc getCarrierName*(): CharSequence
  proc getDisplayNameSource*(): jint
  proc createIconBitmap*(context: Context): Bitmap
  proc getIconTint*(): jint
  proc getNumber*(): string
  proc getDataRoaming*(): jint
  proc getMcc*(): jint
  proc getMnc*(): jint
  proc getMccString*(): string
  proc getMncString*(): string
  proc getCountryIso*(): string
  proc isEmbedded*(): jboolean
  proc isOpportunistic*(): jboolean
  proc isActive*(): jboolean
  proc getGroupUuid*(): ParcelUuid
  proc getEhplmns*(): List[string]
  proc getHplmns*(): List[string]
  proc getGroupOwner*(): string
  proc getProfileClass*(): jint
  proc getSubscriptionType*(): jint
  proc canManageSubscription*(context: Context): jboolean
  proc canManageSubscription*(context: Context, packageName: string): jboolean
  proc getAccessRules*(): List[UiccAccessRule]
  proc getCardString*(): string
  proc getCardId*(): jint
  proc getPortIndex*(): jint
  proc isGroupDisabled*(): jboolean
  proc areUiccApplicationsEnabled*(): jboolean
  proc getUsageSetting*(): jint
  proc isOnlyNonTerrestrialNetwork*(): jboolean
  proc isSatelliteESOSSupported*(): jboolean
  proc getServiceCapabilities*(): Set[Integer]
  proc getTransferStatus*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc getPrintableId*(id: string): string {.`static`.}
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  CREATOR*: Parcelable.Creator[SubscriptionInfo] {.`static`.}

jclass android.telephony.SubscriptionInfo.Builder* of JVMObject:
  proc setId*(id: jint): Builder
  proc setIccId*(iccId: string): Builder
  proc setSimSlotIndex*(simSlotIndex: jint): Builder
  proc setDisplayName*(displayName: CharSequence): Builder
  proc setCarrierName*(carrierName: CharSequence): Builder
  proc setDisplayNameSource*(displayNameSource: jint): Builder
  proc setIconTint*(iconTint: jint): Builder
  proc setNumber*(number: string): Builder
  proc setDataRoaming*(dataRoaming: jint): Builder
  proc setIcon*(iconBitmap: Bitmap): Builder
  proc setMcc*(mcc: string): Builder
  proc setMnc*(mnc: string): Builder
  proc setEhplmns*(ehplmns: seq[string]): Builder
  proc setHplmns*(hplmns: seq[string]): Builder
  proc setCountryIso*(countryIso: string): Builder
  proc setEmbedded*(isEmbedded: jboolean): Builder
  proc setNativeAccessRules*(nativeAccessRules: seq[UiccAccessRule]): Builder
  proc setCardString*(cardString: string): Builder
  proc setCardId*(cardId: jint): Builder
  proc setOpportunistic*(isOpportunistic: jboolean): Builder
  proc setGroupUuid*(groupUuid: string): Builder
  proc setGroupDisabled*(isGroupDisabled: jboolean): Builder
  proc setCarrierId*(carrierId: jint): Builder
  proc setProfileClass*(profileClass: jint): Builder
  proc setType*(type: jint): Builder
  proc setGroupOwner*(groupOwner: string): Builder
  proc setCarrierConfigAccessRules*(carrierConfigAccessRules: seq[UiccAccessRule]): Builder
  proc setUiccApplicationsEnabled*(uiccApplicationsEnabled: jboolean): Builder
  proc setPortIndex*(portIndex: jint): Builder
  proc setUsageSetting*(usageSetting: jint): Builder
  proc setOnlyNonTerrestrialNetwork*(isOnlyNonTerrestrialNetwork: jboolean): Builder
  proc setServiceCapabilities*(capabilities: Set[Integer]): Builder
  proc setTransferStatus*(status: jint): Builder
  proc setSatelliteESOSSupported*(isSatelliteESOSSupported: jboolean): Builder
  proc build*(): SubscriptionInfo

jclass android.telephony.Builder* of JVMObject:
  proc setId*(id: jint): Builder
  proc setIccId*(iccId: string): Builder
  proc setSimSlotIndex*(simSlotIndex: jint): Builder
  proc setDisplayName*(displayName: CharSequence): Builder
  proc setCarrierName*(carrierName: CharSequence): Builder
  proc setDisplayNameSource*(displayNameSource: jint): Builder
  proc setIconTint*(iconTint: jint): Builder
  proc setNumber*(number: string): Builder
  proc setDataRoaming*(dataRoaming: jint): Builder
  proc setIcon*(iconBitmap: Bitmap): Builder
  proc setMcc*(mcc: string): Builder
  proc setMnc*(mnc: string): Builder
  proc setEhplmns*(ehplmns: seq[string]): Builder
  proc setHplmns*(hplmns: seq[string]): Builder
  proc setCountryIso*(countryIso: string): Builder
  proc setEmbedded*(isEmbedded: jboolean): Builder
  proc setNativeAccessRules*(nativeAccessRules: seq[UiccAccessRule]): Builder
  proc setCardString*(cardString: string): Builder
  proc setCardId*(cardId: jint): Builder
  proc setOpportunistic*(isOpportunistic: jboolean): Builder
  proc setGroupUuid*(groupUuid: string): Builder
  proc setGroupDisabled*(isGroupDisabled: jboolean): Builder
  proc setCarrierId*(carrierId: jint): Builder
  proc setProfileClass*(profileClass: jint): Builder
  proc setType*(type: jint): Builder
  proc setGroupOwner*(groupOwner: string): Builder
  proc setCarrierConfigAccessRules*(carrierConfigAccessRules: seq[UiccAccessRule]): Builder
  proc setUiccApplicationsEnabled*(uiccApplicationsEnabled: jboolean): Builder
  proc setPortIndex*(portIndex: jint): Builder
  proc setUsageSetting*(usageSetting: jint): Builder
  proc setOnlyNonTerrestrialNetwork*(isOnlyNonTerrestrialNetwork: jboolean): Builder
  proc setServiceCapabilities*(capabilities: Set[Integer]): Builder
  proc setTransferStatus*(status: jint): Builder
  proc setSatelliteESOSSupported*(isSatelliteESOSSupported: jboolean): Builder
  proc build*(): SubscriptionInfo

