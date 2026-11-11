import jnim

jclass android.telephony.CarrierRestrictionRules* of JVMObject:
  proc newBuilder*(): Builder {.`static`.}
  proc isAllCarriersAllowed*(): jboolean
  proc getAllowedCarriers*(): List[CarrierIdentifier]
  proc getExcludedCarriers*(): List[CarrierIdentifier]
  proc getExcludedCarriersInfoList*(): List[CarrierInfo]
  proc getAllowedCarriersInfoList*(): List[CarrierInfo]
  proc getDefaultCarrierRestriction*(): jint
  proc getMultiSimPolicy*(): jint
  proc areCarrierIdentifiersAllowed*(carrierIds: List[CarrierIdentifier]): List[Boolean]
  proc getCarrierRestrictionStatus*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  CARRIER_RESTRICTION_DEFAULT_NOT_ALLOWED*: jint {.`static`.}
  CARRIER_RESTRICTION_DEFAULT_ALLOWED*: jint {.`static`.}
  MULTISIM_POLICY_NONE*: jint {.`static`.}
  MULTISIM_POLICY_ONE_VALID_SIM_MUST_BE_PRESENT*: jint {.`static`.}
  MULTISIM_POLICY_APPLY_TO_ALL_SLOTS*: jint {.`static`.}
  MULTISIM_POLICY_APPLY_TO_ONLY_SLOT_1*: jint {.`static`.}
  MULTISIM_POLICY_VALID_SIM_MUST_PRESENT_ON_SLOT_1*: jint {.`static`.}
  MULTISIM_POLICY_ACTIVE_SERVICE_ON_SLOT_1_TO_UNBLOCK_OTHER_SLOTS*: jint {.`static`.}
  MULTISIM_POLICY_ACTIVE_SERVICE_ON_ANY_SLOT_TO_UNBLOCK_OTHER_SLOTS*: jint {.`static`.}
  MULTISIM_POLICY_ALL_SIMS_MUST_BE_VALID*: jint {.`static`.}
  MULTISIM_POLICY_SLOT_POLICY_OTHER*: jint {.`static`.}
  CREATOR*: Creator[CarrierRestrictionRules] {.`static`.}

jclass android.telephony.CarrierRestrictionRules.Builder* of JVMObject:
  proc build*(): CarrierRestrictionRules
  proc setAllCarriersAllowed*(): Builder
  proc setAllowedCarriers*(allowedCarriers: List[CarrierIdentifier]): Builder
  proc setExcludedCarriers*(excludedCarriers: List[CarrierIdentifier]): Builder
  proc setDefaultCarrierRestriction*(carrierRestrictionDefault: jint): Builder
  proc setMultiSimPolicy*(multiSimPolicy: jint): Builder
  proc setCarrierRestrictionStatus*(carrierRestrictionStatus: jint): Builder
  proc setAllowedCarrierInfo*(allowedCarrierInfo: List[CarrierInfo]): Builder
  proc setExcludedCarrierInfo*(excludedCarrierInfo: List[CarrierInfo]): Builder
  proc setCarrierLockInfoFeature*(carrierLockInfoSupported: jboolean): Builder

jclass android.telephony.Builder* of JVMObject:
  proc build*(): CarrierRestrictionRules
  proc setAllCarriersAllowed*(): Builder
  proc setAllowedCarriers*(allowedCarriers: List[CarrierIdentifier]): Builder
  proc setExcludedCarriers*(excludedCarriers: List[CarrierIdentifier]): Builder
  proc setDefaultCarrierRestriction*(carrierRestrictionDefault: jint): Builder
  proc setMultiSimPolicy*(multiSimPolicy: jint): Builder
  proc setCarrierRestrictionStatus*(carrierRestrictionStatus: jint): Builder
  proc setAllowedCarrierInfo*(allowedCarrierInfo: List[CarrierInfo]): Builder
  proc setExcludedCarrierInfo*(excludedCarrierInfo: List[CarrierInfo]): Builder
  proc setCarrierLockInfoFeature*(carrierLockInfoSupported: jboolean): Builder

