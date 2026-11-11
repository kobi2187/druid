import jnim

jclass android.telephony.SubscriptionManager* of JVMObject:
  proc getUriForSubscriptionId*(subscriptionId: jint): Uri {.`static`.}
  proc from*(context: Context): SubscriptionManager {.`static`.}
  proc addOnSubscriptionsChangedListener*(listener: OnSubscriptionsChangedListener)
  proc addOnSubscriptionsChangedListener*(executor: Executor, listener: OnSubscriptionsChangedListener)
  proc removeOnSubscriptionsChangedListener*(listener: OnSubscriptionsChangedListener)
  proc addOnOpportunisticSubscriptionsChangedListener*(executor: Executor, listener: OnOpportunisticSubscriptionsChangedListener)
  proc removeOnOpportunisticSubscriptionsChangedListener*(listener: OnOpportunisticSubscriptionsChangedListener)
  proc getActiveSubscriptionInfo*(subId: jint): SubscriptionInfo
  proc getActiveSubscriptionInfoForIcc*(iccId: string): SubscriptionInfo
  proc getActiveSubscriptionInfoForSimSlotIndex*(slotIndex: jint): SubscriptionInfo
  proc getAllSubscriptionInfoList*(): List[SubscriptionInfo]
  proc getActiveSubscriptionInfoList*(): List[SubscriptionInfo]
  proc getCompleteActiveSubscriptionInfoList*(): List[SubscriptionInfo]
  proc createForAllUserProfiles*(): SubscriptionManager
  proc getActiveSubscriptionInfoList*(userVisibleOnly: jboolean): List[SubscriptionInfo]
  proc getAvailableSubscriptionInfoList*(): List[SubscriptionInfo]
  proc getAccessibleSubscriptionInfoList*(): List[SubscriptionInfo]
  proc requestEmbeddedSubscriptionInfoListRefresh*()
  proc requestEmbeddedSubscriptionInfoListRefresh*(cardId: jint)
  proc getActiveSubscriptionInfoCount*(): jint
  proc getActiveSubscriptionInfoCountMax*(): jint
  proc addSubscriptionInfoRecord*(iccId: string, slotIndex: jint): Uri
  proc addSubscriptionInfoRecord*(uniqueId: string, displayName: string, slotIndex: jint, subscriptionType: jint)
  proc removeSubscriptionInfoRecord*(uniqueId: string, subscriptionType: jint)
  proc setIconTint*(tint: jint, subId: jint): jint
  proc setDisplayName*(displayName: string, subId: jint, nameSource: jint): jint
  proc setDisplayNumber*(number: string, subId: jint): jint
  proc setDataRoaming*(roaming: jint, subId: jint): jint
  proc getSlotIndex*(subscriptionId: jint): jint {.`static`.}
  proc getSubscriptionIds*(slotIndex: jint): seq[jint]
  proc getSubId*(slotIndex: jint): seq[jint] {.`static`.}
  proc getSubscriptionId*(slotIndex: jint): jint {.`static`.}
  proc getPhoneId*(subId: jint): jint {.`static`.}
  proc getDefaultSubscriptionId*(): jint {.`static`.}
  proc getDefaultVoiceSubscriptionId*(): jint {.`static`.}
  proc setDefaultVoiceSubscriptionId*(subscriptionId: jint)
  proc setDefaultVoiceSubId*(subId: jint)
  proc getDefaultVoiceSubscriptionInfo*(): SubscriptionInfo
  proc getDefaultVoicePhoneId*(): jint {.`static`.}
  proc getDefaultSmsSubscriptionId*(): jint {.`static`.}
  proc setDefaultSmsSubId*(subscriptionId: jint)
  proc getDefaultDataSubscriptionId*(): jint {.`static`.}
  proc setDefaultDataSubId*(subscriptionId: jint)
  proc getDefaultDataSubscriptionInfo*(): SubscriptionInfo
  proc isValidSubscriptionId*(subscriptionId: jint): jboolean {.`static`.}
  proc isUsableSubscriptionId*(subscriptionId: jint): jboolean {.`static`.}
  proc isUsableSubIdValue*(subId: jint): jboolean {.`static`.}
  proc isValidSlotIndex*(slotIndex: jint): jboolean {.`static`.}
  proc isValidPhoneId*(phoneId: jint): jboolean {.`static`.}
  proc putPhoneIdAndSubIdExtra*(intent: Intent, phoneId: jint) {.`static`.}
  proc putPhoneIdAndSubIdExtra*(intent: Intent, phoneId: jint, subId: jint) {.`static`.}
  proc putPhoneIdAndMaybeSubIdExtra*(intent: Intent, phoneId: jint, subId: jint) {.`static`.}
  proc getActiveSubscriptionIdList*(): seq[jint]
  proc getCompleteActiveSubscriptionIdList*(): seq[jint]
  proc getActiveSubscriptionIdList*(visibleOnly: jboolean): seq[jint]
  proc isNetworkRoaming*(subId: jint): jboolean
  proc setSubscriptionProperty*(subscriptionId: jint, columnName: string, value: string) {.`static`.}
  proc serializeUriLists*(uris: List[Uri]): string {.`static`.}
  proc getBooleanSubscriptionProperty*(subscriptionId: jint, columnName: string, defaultValue: jboolean, context: Context): jboolean {.`static`.}
  proc getIntegerSubscriptionProperty*(subscriptionId: jint, columnName: string, defaultValue: jint, context: Context): jint {.`static`.}
  proc getLongSubscriptionProperty*(subscriptionId: jint, columnName: string, defaultValue: jlong, context: Context): jlong {.`static`.}
  proc getResourcesForSubId*(context: Context, subId: jint): Resources {.`static`.}
  proc getResourcesForSubId*(context: Context, subId: jint, useRootLocale: jboolean): Resources {.`static`.}
  proc isActiveSubscriptionId*(subscriptionId: jint): jboolean
  proc isActiveSubId*(subId: jint): jboolean
  proc getSubscriptionPlans*(subId: jint): List[SubscriptionPlan]
  proc setSubscriptionPlans*(subId: jint, plans: List[SubscriptionPlan])
  proc setSubscriptionPlans*(subId: jint, plans: List[SubscriptionPlan], expirationDurationMillis: jlong)
  proc setSubscriptionOverrideUnmetered*(subId: jint, overrideUnmetered: jboolean, expirationDurationMillis: jlong)
  proc setSubscriptionOverrideUnmetered*(subId: jint, overrideUnmetered: jboolean, networkTypes: seq[jint], expirationDurationMillis: jlong)
  proc setSubscriptionOverrideCongested*(subId: jint, overrideCongested: jboolean, expirationDurationMillis: jlong)
  proc setSubscriptionOverrideCongested*(subId: jint, overrideCongested: jboolean, networkTypes: seq[jint], expirationDurationMillis: jlong)
  proc canManageSubscription*(info: SubscriptionInfo): jboolean
  proc canManageSubscription*(info: SubscriptionInfo, packageName: string): jboolean
  proc canManageSubscriptionAsUser*(info: SubscriptionInfo, packageName: string, user: UserHandle): jboolean
  proc setPreferredDataSubscriptionId*(subId: jint, needValidation: jboolean, executor: Executor, callback: Consumer[Integer])
  proc getPreferredDataSubscriptionId*(): jint
  proc getOpportunisticSubscriptions*(): List[SubscriptionInfo]
  proc switchToSubscription*(subId: jint, callbackIntent: PendingIntent)
  proc setOpportunistic*(opportunistic: jboolean, subId: jint): jboolean
  proc createSubscriptionGroup*(subIdList: List[Integer]): ParcelUuid
  proc addSubscriptionsIntoGroup*(subIdList: List[Integer], groupUuid: ParcelUuid)
  proc removeSubscriptionsFromGroup*(subIdList: List[Integer], groupUuid: ParcelUuid)
  proc getSubscriptionsInGroup*(groupUuid: ParcelUuid): List[SubscriptionInfo]
  proc isSubscriptionVisible*(info: SubscriptionInfo): jboolean
  proc getSelectableSubscriptionInfoList*(): List[SubscriptionInfo]
  proc setSubscriptionEnabled*(subscriptionId: jint, enable: jboolean): jboolean
  proc setUiccApplicationsEnabled*(subscriptionId: jint, enabled: jboolean)
  proc canDisablePhysicalSubscription*(): jboolean
  proc isSubscriptionEnabled*(subscriptionId: jint): jboolean
  proc setDeviceToDeviceStatusSharingPreference*(subscriptionId: jint, sharing: jint)
  proc getDeviceToDeviceStatusSharingPreference*(subscriptionId: jint): jint
  proc setDeviceToDeviceStatusSharingContacts*(subscriptionId: jint, contacts: List[Uri])
  proc getDeviceToDeviceStatusSharingContacts*(subscriptionId: jint): List[Uri]
  proc getEnabledSubscriptionId*(slotIndex: jint): jint
  proc getActiveDataSubscriptionId*(): jint {.`static`.}
  proc putSubscriptionIdExtra*(intent: Intent, subId: jint) {.`static`.}
  proc invalidateSubscriptionManagerServiceCaches*() {.`static`.}
  proc disableCaching*() {.`static`.}
  proc clearCaches*() {.`static`.}
  proc getAllSimSpecificSettingsForBackup*(): seq[jbyte]
  proc restoreAllSimSpecificSettingsFromBackup*(data: seq[jbyte])
  proc getPhoneNumber*(subscriptionId: jint, source: jint): string
  proc getPhoneNumber*(subscriptionId: jint): string
  proc setCarrierPhoneNumber*(subscriptionId: jint, number: string)
  proc phoneNumberSourceToString*(source: jint): string {.`static`.}
  proc displayNameSourceToString*(source: jint): string {.`static`.}
  proc subscriptionTypeToString*(type: jint): string {.`static`.}
  proc usageSettingToString*(usageSetting: jint): string {.`static`.}
  proc setGroupOwner*(subscriptionId: jint, groupOwner: string)
  proc setSubscriptionUserHandle*(subscriptionId: jint, userHandle: UserHandle)
  proc getSubscriptionUserHandle*(subscriptionId: jint): UserHandle
  proc isSubscriptionAssociatedWithUser*(subscriptionId: jint, userHandle: UserHandle): jboolean
  proc isSubscriptionAssociatedWithUser*(subscriptionId: jint): jboolean
  proc getSubscriptionInfoListAssociatedWithUser*(userHandle: UserHandle): List[SubscriptionInfo]
  proc getAllServiceCapabilityBitmasks*(): jint {.`static`.}
  proc getServiceCapabilitiesSet*(combinedServiceCapabilities: jint): Set[Integer] {.`static`.}
  proc serviceCapabilityToBitmask*(capability: jint): jint {.`static`.}
  proc setTransferStatus*(subscriptionId: jint, status: jint)
  INVALID_SUBSCRIPTION_ID*: jint {.`static`.}
  PLACEHOLDER_SUBSCRIPTION_ID_BASE*: jint {.`static`.}
  INVALID_PHONE_INDEX*: jint {.`static`.}
  INVALID_SIM_SLOT_INDEX*: jint {.`static`.}
  DEFAULT_SUBSCRIPTION_ID*: jint {.`static`.}
  DEFAULT_PHONE_INDEX*: jint {.`static`.}
  DEFAULT_SIM_SLOT_INDEX*: jint {.`static`.}
  MIN_SUBSCRIPTION_ID_VALUE*: jint {.`static`.}
  MAX_SUBSCRIPTION_ID_VALUE*: jint {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  GET_SIM_SPECIFIC_SETTINGS_METHOD_NAME*: string {.`static`.}
  RESTORE_SIM_SPECIFIC_SETTINGS_METHOD_NAME*: string {.`static`.}
  RESTORE_SIM_SPECIFIC_SETTINGS_DATABASE_UPDATED*: string {.`static`.}
  KEY_SIM_SPECIFIC_SETTINGS_DATA*: string {.`static`.}
  WFC_ENABLED_CONTENT_URI*: Uri {.`static`.}
  ADVANCED_CALLING_ENABLED_CONTENT_URI*: Uri {.`static`.}
  WFC_MODE_CONTENT_URI*: Uri {.`static`.}
  WFC_ROAMING_MODE_CONTENT_URI*: Uri {.`static`.}
  VT_ENABLED_CONTENT_URI*: Uri {.`static`.}
  WFC_ROAMING_ENABLED_CONTENT_URI*: Uri {.`static`.}
  SIM_INFO_BACKUP_AND_RESTORE_CONTENT_URI*: Uri {.`static`.}
  SIM_INFO_SUW_RESTORE_CONTENT_URI*: Uri {.`static`.}
  CROSS_SIM_ENABLED_CONTENT_URI*: Uri {.`static`.}
  UNIQUE_KEY_SUBSCRIPTION_ID*: string {.`static`.}
  ICC_ID*: string {.`static`.}
  SIM_SLOT_INDEX*: string {.`static`.}
  SIM_NOT_INSERTED*: jint {.`static`.}
  SLOT_INDEX_FOR_REMOTE_SIM_SUB*: jint {.`static`.}
  SUBSCRIPTION_TYPE*: string {.`static`.}
  TP_MESSAGE_REF*: string {.`static`.}
  ENABLED_MOBILE_DATA_POLICIES*: string {.`static`.}
  SUBSCRIPTION_TYPE_LOCAL_SIM*: jint {.`static`.}
  SUBSCRIPTION_TYPE_REMOTE_SIM*: jint {.`static`.}
  DISPLAY_NAME*: string {.`static`.}
  CARRIER_NAME*: string {.`static`.}
  DEFAULT_NAME_RES*: jint {.`static`.}
  NAME_SOURCE*: string {.`static`.}
  NAME_SOURCE_UNKNOWN*: jint {.`static`.}
  NAME_SOURCE_CARRIER_ID*: jint {.`static`.}
  NAME_SOURCE_SIM_SPN*: jint {.`static`.}
  NAME_SOURCE_USER_INPUT*: jint {.`static`.}
  NAME_SOURCE_CARRIER*: jint {.`static`.}
  NAME_SOURCE_SIM_PNN*: jint {.`static`.}
  D2D_SHARING_DISABLED*: jint {.`static`.}
  D2D_SHARING_ALL_CONTACTS*: jint {.`static`.}
  D2D_SHARING_SELECTED_CONTACTS*: jint {.`static`.}
  D2D_SHARING_ALL*: jint {.`static`.}
  D2D_STATUS_SHARING*: string {.`static`.}
  D2D_STATUS_SHARING_SELECTED_CONTACTS*: string {.`static`.}
  HUE*: string {.`static`.}
  NUMBER*: string {.`static`.}
  DATA_ROAMING*: string {.`static`.}
  DATA_ROAMING_ENABLE*: jint {.`static`.}
  DATA_ROAMING_DISABLE*: jint {.`static`.}
  CARRIER_ID*: string {.`static`.}
  EHPLMNS*: string {.`static`.}
  HPLMNS*: string {.`static`.}
  MCC_STRING*: string {.`static`.}
  MNC_STRING*: string {.`static`.}
  MCC*: string {.`static`.}
  MNC*: string {.`static`.}
  ISO_COUNTRY_CODE*: string {.`static`.}
  IS_EMBEDDED*: string {.`static`.}
  CARD_ID*: string {.`static`.}
  ACCESS_RULES*: string {.`static`.}
  ACCESS_RULES_FROM_CARRIER_CONFIGS*: string {.`static`.}
  IS_REMOVABLE*: string {.`static`.}
  CB_EXTREME_THREAT_ALERT*: string {.`static`.}
  CB_SEVERE_THREAT_ALERT*: string {.`static`.}
  CB_AMBER_ALERT*: string {.`static`.}
  CB_EMERGENCY_ALERT*: string {.`static`.}
  CB_ALERT_SOUND_DURATION*: string {.`static`.}
  CB_ALERT_REMINDER_INTERVAL*: string {.`static`.}
  CB_ALERT_VIBRATE*: string {.`static`.}
  CB_ALERT_SPEECH*: string {.`static`.}
  CB_ETWS_TEST_ALERT*: string {.`static`.}
  CB_CHANNEL_50_ALERT*: string {.`static`.}
  CB_CMAS_TEST_ALERT*: string {.`static`.}
  CB_OPT_OUT_DIALOG*: string {.`static`.}
  ENHANCED_4G_MODE_ENABLED*: string {.`static`.}
  VT_IMS_ENABLED*: string {.`static`.}
  WFC_IMS_ENABLED*: string {.`static`.}
  WFC_IMS_MODE*: string {.`static`.}
  WFC_IMS_ROAMING_MODE*: string {.`static`.}
  WFC_IMS_ROAMING_ENABLED*: string {.`static`.}
  IMS_RCS_UCE_ENABLED*: string {.`static`.}
  CROSS_SIM_CALLING_ENABLED*: string {.`static`.}
  IS_OPPORTUNISTIC*: string {.`static`.}
  GROUP_UUID*: string {.`static`.}
  GROUP_OWNER*: string {.`static`.}
  PROFILE_CLASS*: string {.`static`.}
  PORT_INDEX*: string {.`static`.}
  VOIMS_OPT_IN_STATUS*: string {.`static`.}
  NR_ADVANCED_CALLING_ENABLED*: string {.`static`.}
  PROFILE_CLASS_TESTING*: jint {.`static`.}
  PROFILE_CLASS_PROVISIONING*: jint {.`static`.}
  PROFILE_CLASS_OPERATIONAL*: jint {.`static`.}
  PROFILE_CLASS_UNSET*: jint {.`static`.}
  PROFILE_CLASS_DEFAULT*: jint {.`static`.}
  IMSI*: string {.`static`.}
  UICC_APPLICATIONS_ENABLED*: string {.`static`.}
  ALLOWED_NETWORK_TYPES*: string {.`static`.}
  USER_HANDLE*: string {.`static`.}
  SATELLITE_ENABLED*: string {.`static`.}
  SATELLITE_ATTACH_ENABLED_FOR_CARRIER*: string {.`static`.}
  IS_ONLY_NTN*: string {.`static`.}
  SERVICE_CAPABILITIES*: string {.`static`.}
  TRANSFER_STATUS*: string {.`static`.}
  SATELLITE_ENTITLEMENT_STATUS*: string {.`static`.}
  SATELLITE_ENTITLEMENT_PLMNS*: string {.`static`.}
  SATELLITE_ESOS_SUPPORTED*: string {.`static`.}
  IS_SATELLITE_PROVISIONED_FOR_NON_IP_DATAGRAM*: string {.`static`.}
  SATELLITE_ENTITLEMENT_BARRED_PLMNS*: string {.`static`.}
  SATELLITE_ENTITLEMENT_DATA_PLAN_PLMNS*: string {.`static`.}
  SATELLITE_ENTITLEMENT_SERVICE_TYPE_MAP*: string {.`static`.}
  SATELLITE_ENTITLEMENT_DATA_SERVICE_POLICY*: string {.`static`.}
  SATELLITE_ENTITLEMENT_VOICE_SERVICE_POLICY*: string {.`static`.}
  USAGE_SETTING_UNKNOWN*: jint {.`static`.}
  USAGE_SETTING_DEFAULT*: jint {.`static`.}
  USAGE_SETTING_VOICE_CENTRIC*: jint {.`static`.}
  USAGE_SETTING_DATA_CENTRIC*: jint {.`static`.}
  USAGE_SETTING*: string {.`static`.}
  SUB_DEFAULT_CHANGED_ACTION*: string {.`static`.}
  ACTION_DEFAULT_SUBSCRIPTION_CHANGED*: string {.`static`.}
  ACTION_DEFAULT_SMS_SUBSCRIPTION_CHANGED*: string {.`static`.}
  ACTION_MANAGE_SUBSCRIPTION_PLANS*: string {.`static`.}
  ACTION_REFRESH_SUBSCRIPTION_PLANS*: string {.`static`.}
  ACTION_SUBSCRIPTION_PLANS_CHANGED*: string {.`static`.}
  EXTRA_SUBSCRIPTION_INDEX*: string {.`static`.}
  EXTRA_SLOT_INDEX*: string {.`static`.}
  PHONE_NUMBER_SOURCE_UICC*: jint {.`static`.}
  PHONE_NUMBER_SOURCE_CARRIER*: jint {.`static`.}
  PHONE_NUMBER_SOURCE_IMS*: jint {.`static`.}
  SERVICE_CAPABILITY_VOICE*: jint {.`static`.}
  SERVICE_CAPABILITY_SMS*: jint {.`static`.}
  SERVICE_CAPABILITY_DATA*: jint {.`static`.}
  SERVICE_CAPABILITY_MAX*: jint {.`static`.}
  SERVICE_CAPABILITY_VOICE_BITMASK*: jint {.`static`.}
  SERVICE_CAPABILITY_SMS_BITMASK*: jint {.`static`.}
  SERVICE_CAPABILITY_DATA_BITMASK*: jint {.`static`.}
  TRANSFER_STATUS_NONE*: jint {.`static`.}
  TRANSFER_STATUS_TRANSFERRED_OUT*: jint {.`static`.}
  TRANSFER_STATUS_CONVERTED*: jint {.`static`.}

jclass android.telephony.SubscriptionManager.OnSubscriptionsChangedListener* of JVMObject:
  proc getCreatorLooper*(): Looper
  proc onSubscriptionsChanged*()
  proc onAddListenerFailed*()

jclass android.telephony.SubscriptionManager.OnOpportunisticSubscriptionsChangedListener* of JVMObject:
  proc onOpportunisticSubscriptionsChanged*()

jclass android.telephony.OnSubscriptionsChangedListener* of JVMObject:
  proc getCreatorLooper*(): Looper
  proc onSubscriptionsChanged*()
  proc onAddListenerFailed*()

jclass android.telephony.OnOpportunisticSubscriptionsChangedListener* of JVMObject:
  proc onOpportunisticSubscriptionsChanged*()

