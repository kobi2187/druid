import jnim

jclass android.telephony.TelephonyManager* of JVMObject:
  proc srvccStateToString*(state: jint): string {.`static`.}
  proc getDefault*(): TelephonyManager {.`static`.}
  proc getMultiSimConfiguration*(): MultiSimVariants
  proc getPhoneCount*(): jint
  proc getActiveModemCount*(): jint
  proc getSupportedModemCount*(): jint
  proc getMaxNumberOfSimultaneouslyActiveSims*(): jint
  proc from*(context: Context): TelephonyManager {.`static`.}
  proc createForSubscriptionId*(subId: jint): TelephonyManager
  proc createForPhoneAccountHandle*(phoneAccountHandle: PhoneAccountHandle): TelephonyManager
  proc isMultiSimEnabled*(): jboolean
  proc getMaximumCallComposerPictureSize*(): jlong {.`static`.}
  proc getDeviceSoftwareVersion*(): string
  proc getDeviceSoftwareVersion*(slotIndex: jint): string
  proc getDeviceId*(): string
  proc getDeviceId*(slotIndex: jint): string
  proc getImei*(): string
  proc getImei*(slotIndex: jint): string
  proc getTypeAllocationCode*(): string
  proc getTypeAllocationCode*(slotIndex: jint): string
  proc getMeid*(): string
  proc getMeid*(slotIndex: jint): string
  proc getManufacturerCode*(): string
  proc getManufacturerCode*(slotIndex: jint): string
  proc getNai*(): string
  proc getCellLocation*(): CellLocation
  proc getNeighboringCellInfo*(): List[NeighboringCellInfo]
  proc getCurrentPhoneType*(): jint
  proc getCurrentPhoneType*(subId: jint): jint
  proc getCurrentPhoneTypeForSlot*(slotIndex: jint): jint
  proc getPhoneType*(): jint
  proc getPhoneType*(networkMode: jint): jint {.`static`.}
  proc getMaxNumberVerificationTimeoutMillis*(): jlong {.`static`.}
  proc getNetworkOperatorName*(): string
  proc getNetworkOperatorName*(subId: jint): string
  proc getNetworkOperator*(): string
  proc getNetworkOperator*(subId: jint): string
  proc getNetworkOperatorForPhone*(phoneId: jint): string
  proc getNetworkSpecifier*(): string
  proc getCarrierConfig*(): PersistableBundle
  proc isNetworkRoaming*(): jboolean
  proc isNetworkRoaming*(subId: jint): jboolean
  proc getNetworkCountryIso*(): string
  proc getNetworkCountryIso*(slotIndex: jint): string
  proc getNetworkCountryIsoForPhone*(phoneId: jint): string
  proc getAllNetworkTypes*(): seq[jint] {.`static`.}
  proc getNetworkType*(): jint
  proc getNetworkType*(subId: jint): jint
  proc getDataNetworkType*(): jint
  proc getDataNetworkType*(subId: jint): jint
  proc getVoiceNetworkType*(): jint
  proc getVoiceNetworkType*(subId: jint): jint
  proc getNetworkTypeName*(): string
  proc getNetworkTypeName*(type: jint): string {.`static`.}
  proc getBitMaskForNetworkType*(networkType: jint): jlong {.`static`.}
  proc hasIccCard*(): jboolean
  proc hasIccCard*(slotIndex: jint): jboolean
  proc getSimState*(): jint
  proc getSimCardState*(): jint
  proc getSimCardState*(physicalSlotIndex: jint): jint
  proc getSimCardState*(physicalSlotIndex: jint, portIndex: jint): jint
  proc getSimApplicationState*(): jint
  proc getSimApplicationState*(physicalSlotIndex: jint): jint
  proc getSimApplicationState*(physicalSlotIndex: jint, portIndex: jint): jint
  proc isApplicationOnUicc*(appType: jint): jboolean
  proc getSimState*(slotIndex: jint): jint
  proc getSimOperator*(): string
  proc getSimOperator*(subId: jint): string
  proc getSimOperatorNumeric*(): string
  proc getSimOperatorNumeric*(subId: jint): string
  proc getSimOperatorNumericForPhone*(phoneId: jint): string
  proc getSimOperatorName*(): string
  proc getSimOperatorName*(subId: jint): string
  proc getSimOperatorNameForPhone*(phoneId: jint): string
  proc getSimCountryIso*(): string
  proc getSimCountryIso*(subId: jint): string {.`static`.}
  proc getSimCountryIsoForPhone*(phoneId: jint): string {.`static`.}
  proc getSimSerialNumber*(): string
  proc getSimSerialNumber*(subId: jint): string
  proc isLteCdmaEvdoGsmWcdmaEnabled*(): jboolean
  proc getLteOnCdmaMode*(subId: jint): jint
  proc getCardIdForDefaultEuicc*(): jint
  proc getUiccCardsInfo*(): List[UiccCardInfo]
  proc getUiccSlotsInfo*(): seq[UiccSlotInfo]
  proc refreshUiccProfile*()
  proc switchSlots*(physicalSlots: seq[jint]): jboolean
  proc setSimSlotMapping*(slotMapping: Collection[UiccSlotMapping])
  proc getLogicalToPhysicalSlotMapping*(): Map[Integer, Integer]
  proc getSimSlotMapping*(): Collection[UiccSlotMapping]
  proc getSubscriberId*(): string
  proc getSubscriberId*(subId: jint): string
  proc getCarrierInfoForImsiEncryption*(keyType: jint): ImsiEncryptionInfo
  proc resetCarrierKeysForImsiEncryption*()
  proc setCarrierInfoForImsiEncryption*(imsiEncryptionInfo: ImsiEncryptionInfo)
  proc uploadCallComposerPicture*(pictureToUpload: Path, contentType: string, executor: Executor, callback: OutcomeReceiver[ParcelUuid, CallComposerException])
  proc uploadCallComposerPicture*(pictureToUpload: InputStream, contentType: string, executor: Executor, callback: OutcomeReceiver[ParcelUuid, CallComposerException])
  proc getGroupIdLevel1*(): string
  proc getGroupIdLevel1*(subId: jint): string
  proc getGroupIdLevel2*(): string
  proc getLine1Number*(): string
  proc getLine1Number*(subId: jint): string
  proc setLine1NumberForDisplay*(alphaTag: string, number: string): jboolean
  proc setLine1NumberForDisplay*(subId: jint, alphaTag: string, number: string): jboolean
  proc getLine1AlphaTag*(): string
  proc getLine1AlphaTag*(subId: jint): string
  proc getMergedSubscriberIds*(): seq[string]
  proc getMergedImsisFromGroup*(): seq[string]
  proc getMsisdn*(): string
  proc getMsisdn*(subId: jint): string
  proc getVoiceMailNumber*(): string
  proc getVoiceMailNumber*(subId: jint): string
  proc setVoiceMailNumber*(alphaTag: string, number: string): jboolean
  proc setVoiceMailNumber*(subId: jint, alphaTag: string, number: string): jboolean
  proc setVisualVoicemailEnabled*(phoneAccountHandle: PhoneAccountHandle, enabled: jboolean)
  proc isVisualVoicemailEnabled*(phoneAccountHandle: PhoneAccountHandle): jboolean
  proc getVisualVoicemailSettings*(): Bundle
  proc getVisualVoicemailPackageName*(): string
  proc setVisualVoicemailSmsFilterSettings*(settings: VisualVoicemailSmsFilterSettings)
  proc sendVisualVoicemailSms*(number: string, port: jint, text: string, sentIntent: PendingIntent)
  proc enableVisualVoicemailSmsFilter*(subId: jint, settings: VisualVoicemailSmsFilterSettings)
  proc disableVisualVoicemailSmsFilter*(subId: jint)
  proc getVisualVoicemailSmsFilterSettings*(subId: jint): VisualVoicemailSmsFilterSettings
  proc getActiveVisualVoicemailSmsFilterSettings*(subId: jint): VisualVoicemailSmsFilterSettings
  proc sendVisualVoicemailSmsForSubscriber*(subId: jint, number: string, port: jint, text: string, sentIntent: PendingIntent)
  proc setVoiceActivationState*(activationState: jint)
  proc setVoiceActivationState*(subId: jint, activationState: jint)
  proc setDataActivationState*(activationState: jint)
  proc setDataActivationState*(subId: jint, activationState: jint)
  proc getVoiceActivationState*(): jint
  proc getVoiceActivationState*(subId: jint): jint
  proc getDataActivationState*(): jint
  proc getDataActivationState*(subId: jint): jint
  proc getVoiceMessageCount*(): jint
  proc getVoiceMessageCount*(subId: jint): jint
  proc getVoiceMailAlphaTag*(): string
  proc getVoiceMailAlphaTag*(subId: jint): string
  proc sendDialerSpecialCode*(inputCode: string)
  proc getIsimImpi*(): string
  proc getImsPrivateUserIdentity*(): string
  proc getIsimDomain*(): string
  proc getIsimImpu*(): seq[string]
  proc getImsPublicUserIdentities*(): List[Uri]
  proc getCallState*(): jint
  proc getCallStateForSubscription*(): jint
  proc getCallState*(subId: jint): jint
  proc getDataActivity*(): jint
  proc getDataState*(): jint
  proc listen*(listener: PhoneStateListener, events: jint)
  proc getCdmaEnhancedRoamingIndicatorDisplayNumber*(): jint
  proc getCdmaEriIconIndex*(subId: jint): jint
  proc getCdmaEriIconMode*(subId: jint): jint
  proc getCdmaEriText*(): string
  proc getCdmaEriText*(subId: jint): string
  proc isVoiceCapable*(): jboolean
  proc isDeviceVoiceCapable*(): jboolean
  proc isSmsCapable*(): jboolean
  proc isDeviceSmsCapable*(): jboolean
  proc getAllCellInfo*(): List[CellInfo]
  proc requestCellInfoUpdate*(executor: Executor, callback: CellInfoCallback)
  proc requestCellInfoUpdate*(workSource: WorkSource, executor: Executor, callback: CellInfoCallback)
  proc setCellInfoListRate*(rateInMillis: jint, subId: jint)
  proc getMmsUserAgent*(): string
  proc getMmsUAProfUrl*(): string
  proc iccOpenLogicalChannel*(AID: string): IccOpenLogicalChannelResponse
  proc iccOpenLogicalChannelBySlot*(slotIndex: jint, aid: string, p2: jint): IccOpenLogicalChannelResponse
  proc iccOpenLogicalChannelByPort*(slotIndex: jint, portIndex: jint, aid: string, p2: jint): IccOpenLogicalChannelResponse
  proc iccOpenLogicalChannel*(AID: string, p2: jint): IccOpenLogicalChannelResponse
  proc iccOpenLogicalChannel*(subId: jint, AID: string, p2: jint): IccOpenLogicalChannelResponse
  proc iccCloseLogicalChannelBySlot*(slotIndex: jint, channel: jint): jboolean
  proc iccCloseLogicalChannelByPort*(slotIndex: jint, portIndex: jint, channel: jint)
  proc iccCloseLogicalChannel*(channel: jint): jboolean
  proc iccCloseLogicalChannel*(subId: jint, channel: jint): jboolean
  proc iccTransmitApduLogicalChannelBySlot*(slotIndex: jint, channel: jint, cla: jint, instruction: jint, p1: jint, p2: jint, p3: jint, data: string): string
  proc iccTransmitApduLogicalChannelByPort*(slotIndex: jint, portIndex: jint, channel: jint, cla: jint, instruction: jint, p1: jint, p2: jint, p3: jint, data: string): string
  proc iccTransmitApduLogicalChannel*(channel: jint, cla: jint, instruction: jint, p1: jint, p2: jint, p3: jint, data: string): string
  proc iccTransmitApduLogicalChannel*(subId: jint, channel: jint, cla: jint, instruction: jint, p1: jint, p2: jint, p3: jint, data: string): string
  proc iccTransmitApduBasicChannelBySlot*(slotIndex: jint, cla: jint, instruction: jint, p1: jint, p2: jint, p3: jint, data: string): string
  proc iccTransmitApduBasicChannelByPort*(slotIndex: jint, portIndex: jint, cla: jint, instruction: jint, p1: jint, p2: jint, p3: jint, data: string): string
  proc iccTransmitApduBasicChannel*(cla: jint, instruction: jint, p1: jint, p2: jint, p3: jint, data: string): string
  proc iccTransmitApduBasicChannel*(subId: jint, cla: jint, instruction: jint, p1: jint, p2: jint, p3: jint, data: string): string
  proc iccExchangeSimIO*(fileID: jint, command: jint, p1: jint, p2: jint, p3: jint, filePath: string): seq[jbyte]
  proc iccExchangeSimIO*(subId: jint, fileID: jint, command: jint, p1: jint, p2: jint, p3: jint, filePath: string): seq[jbyte]
  proc sendEnvelopeWithStatus*(content: string): string
  proc sendEnvelopeWithStatus*(subId: jint, content: string): string
  proc nvReadItem*(itemID: jint): string
  proc nvWriteItem*(itemID: jint, itemValue: string): jboolean
  proc nvWriteCdmaPrl*(preferredRoamingList: seq[jbyte]): jboolean
  proc nvResetConfig*(resetType: jint): jboolean
  proc resetRadioConfig*(): jboolean
  proc rebootRadio*(): jboolean
  proc rebootModem*()
  proc getSubscriptionId*(): jint
  proc getSlotIndex*(): jint
  proc requestNumberVerification*(range: PhoneNumberRange, timeoutMillis: jlong, executor: Executor, callback: NumberVerificationCallback)
  proc getIntAtIndex*(cr: android.content.ContentResolver, name: string, index: jint): jint {.`static`.}
  proc putIntAtIndex*(cr: android.content.ContentResolver, name: string, index: jint, value: jint): jboolean {.`static`.}
  proc getTelephonyProperty*(phoneId: jint, property: string, defaultVal: string): string {.`static`.}
  proc getTelephonyProperty*(property: string, defaultVal: string): string {.`static`.}
  proc getSimCount*(): jint
  proc getIsimIst*(): string
  proc getIsimPcscf*(): seq[string]
  proc getImsPcscfAddresses*(): List[string]
  proc getIccAuthentication*(appType: jint, authType: jint, data: string): string
  proc getIccAuthentication*(subId: jint, appType: jint, authType: jint, data: string): string
  proc getForbiddenPlmns*(): seq[string]
  proc getForbiddenPlmns*(subId: jint, appType: jint): seq[string]
  proc setForbiddenPlmns*(fplmns: List[string]): jint
  proc getSimServiceTable*(appType: jint): string
  proc getSimServiceTable*(appType: jint, executor: Executor, callback: OutcomeReceiver[seq[jbyte], Exception])
  proc resetIms*(slotIndex: jint)
  proc enableIms*(slotId: jint)
  proc disableIms*(slotId: jint)
  proc getImsRegistration*(slotIndex: jint, feature: jint): IImsRegistration
  proc getImsConfig*(slotIndex: jint, feature: jint): IImsConfig
  proc setImsRegistrationState*(registered: jboolean)
  proc getPreferredNetworkType*(subId: jint): jint
  proc getPreferredNetworkTypeBitmask*(): jlong
  proc getAllowedNetworkTypesBitmask*(): jlong
  proc getAllowedNetworkTypes*(): jlong
  proc setNetworkSelectionModeAutomatic*()
  proc getAvailableNetworks*(): CellNetworkScanResult
  proc requestNetworkScan*(request: NetworkScanRequest, executor: Executor, callback: TelephonyScanManager.NetworkScanCallback): NetworkScan
  proc requestNetworkScan*(includeLocationData: jint, request: NetworkScanRequest, executor: Executor, callback: TelephonyScanManager.NetworkScanCallback): NetworkScan
  proc requestNetworkScan*(request: NetworkScanRequest, callback: TelephonyScanManager.NetworkScanCallback): NetworkScan
  proc setNetworkSelectionModeManual*(operatorNumeric: string, persistSelection: jboolean): jboolean
  proc setNetworkSelectionModeManual*(operatorNumeric: string, persistSelection: jboolean, ran: jint): jboolean
  proc setNetworkSelectionModeManual*(operatorInfo: OperatorInfo, persistSelection: jboolean): jboolean
  proc getNetworkSelectionMode*(): jint
  proc getManualNetworkSelectionPlmn*(): string
  proc isInEmergencySmsMode*(): jboolean
  proc setPreferredNetworkType*(subId: jint, networkType: jint): jboolean
  proc setPreferredNetworkTypeBitmask*(networkTypeBitmask: jlong): jboolean
  proc setAllowedNetworkTypes*(allowedNetworkTypes: jlong): jboolean
  proc setAllowedNetworkTypesForReason*(reason: jint, allowedNetworkTypes: jlong)
  proc getAllowedNetworkTypesForReason*(reason: jint): jlong
  proc isValidAllowedNetworkTypesReason*(reason: jint): jboolean {.`static`.}
  proc getAllNetworkTypesBitmask*(): jlong {.`static`.}
  proc convertNetworkTypeBitmaskToString*(networkTypeBitmask: jlong): string {.`static`.}
  proc setPreferredNetworkTypeToGlobal*(): jboolean
  proc setPreferredNetworkTypeToGlobal*(subId: jint): jboolean
  proc isTetheringApnRequired*(): jboolean
  proc isTetheringApnRequired*(subId: jint): jboolean
  proc hasCarrierPrivileges*(): jboolean
  proc hasCarrierPrivileges*(subId: jint): jboolean
  proc setOperatorBrandOverride*(brand: string): jboolean
  proc setOperatorBrandOverride*(subId: jint, brand: string): jboolean
  proc setRoamingOverride*(gsmRoamingList: List[string], gsmNonRoamingList: List[string], cdmaRoamingList: List[string], cdmaNonRoamingList: List[string]): jboolean
  proc setRoamingOverride*(subId: jint, gsmRoamingList: List[string], gsmNonRoamingList: List[string], cdmaRoamingList: List[string], cdmaNonRoamingList: List[string]): jboolean
  proc getCdmaMdn*(): string
  proc getCdmaMdn*(subId: jint): string
  proc getCdmaMin*(): string
  proc getCdmaMin*(subId: jint): string
  proc checkCarrierPrivilegesForPackage*(pkgName: string): jint
  proc checkCarrierPrivilegesForPackageAnyPhone*(pkgName: string): jint
  proc getCarrierPackageNamesForIntent*(intent: Intent): List[string]
  proc getCarrierPackageNamesForIntentAndPhone*(intent: Intent, phoneId: jint): List[string]
  proc getCarrierServicePackageName*(): string
  proc getCarrierServicePackageNameForLogicalSlot*(logicalSlotIndex: jint): string
  proc getPackagesWithCarrierPrivileges*(): Set[string]
  proc getCarrierPrivilegedPackagesForAllActiveSubscriptions*(): List[string]
  proc setCallComposerStatus*(status: jint)
  proc getCallComposerStatus*(): jint
  proc dial*(number: string)
  proc call*(callingPackage: string, number: string)
  proc endCall*(): jboolean
  proc answerRingingCall*()
  proc silenceRinger*()
  proc isOffhook*(): jboolean
  proc isRinging*(): jboolean
  proc isIdle*(): jboolean
  proc isRadioOn*(): jboolean
  proc supplyPin*(pin: string): jboolean
  proc supplyPuk*(puk: string, pin: string): jboolean
  proc supplyPinReportResult*(pin: string): seq[jint]
  proc supplyPukReportResult*(puk: string, pin: string): seq[jint]
  proc supplyIccLockPin*(pin: string): PinResult
  proc supplyIccLockPuk*(puk: string, pin: string): PinResult
  proc sendUssdRequest*(ussdRequest: string, callback: UssdResponseCallback, handler: Handler)
  proc isConcurrentVoiceAndDataSupported*(): jboolean
  proc handlePinMmi*(dialString: string): jboolean
  proc handlePinMmiForSubscriber*(subId: jint, dialString: string): jboolean
  proc toggleRadioOnOff*()
  proc setRadio*(turnOn: jboolean): jboolean
  proc setRadioPower*(turnOn: jboolean): jboolean
  proc requestRadioPowerOffForReason*(reason: jint)
  proc clearRadioPowerOffForReason*(reason: jint)
  proc getRadioPowerOffReasons*(): Set[Integer]
  proc shutdownAllRadios*()
  proc isAnyRadioPoweredOn*(): jboolean
  proc getRadioPowerState*(): jint
  proc updateServiceLocation*()
  proc enableDataConnectivity*(): jboolean
  proc disableDataConnectivity*(): jboolean
  proc isDataConnectivityPossible*(): jboolean
  proc needsOtaServiceProvisioning*(): jboolean
  proc getMobileProvisioningUrl*(): string
  proc setDataEnabled*(enable: jboolean)
  proc setDataEnabled*(subId: jint, enable: jboolean)
  proc getDataEnabled*(): jboolean
  proc isDataEnabled*(): jboolean
  proc isDataRoamingEnabled*(): jboolean
  proc getCdmaRoamingMode*(): jint
  proc setCdmaRoamingMode*(mode: jint)
  proc getCdmaSubscriptionMode*(): jint
  proc setCdmaSubscriptionMode*(mode: jint)
  proc setDataRoamingEnabled*(isEnabled: jboolean)
  proc getDataEnabled*(subId: jint): jboolean
  proc enableVideoCalling*(enable: jboolean)
  proc isVideoCallingEnabled*(): jboolean
  proc canChangeDtmfToneLength*(): jboolean
  proc isWorldPhone*(): jboolean
  proc isTtyModeSupported*(): jboolean
  proc isRttSupported*(): jboolean
  proc isHearingAidCompatibilitySupported*(): jboolean
  proc isImsRegistered*(subId: jint): jboolean
  proc isImsRegistered*(): jboolean
  proc isVolteAvailable*(): jboolean
  proc isVideoTelephonyAvailable*(): jboolean
  proc isWifiCallingAvailable*(): jboolean
  proc getImsRegTechnologyForMmTel*(): jint
  proc setSimOperatorNumericForPhone*(phoneId: jint, numeric: string)
  proc setSimOperatorNameForPhone*(phoneId: jint, name: string)
  proc setSimCountryIso*(iso: string)
  proc setSimCountryIsoForPhone*(phoneId: jint, iso: string)
  proc setSimState*(state: string)
  proc setSimStateForPhone*(phoneId: jint, state: string)
  proc setSimPowerState*(state: jint)
  proc setSimPowerStateForSlot*(slotIndex: jint, state: jint)
  proc setSimPowerState*(state: jint, executor: Executor, callback: Consumer[Integer])
  proc setSimPowerStateForSlot*(slotIndex: jint, state: jint, executor: Executor, callback: Consumer[Integer])
  proc setBasebandVersionForPhone*(phoneId: jint, version: string)
  proc getBasebandVersion*(): string
  proc getBasebandVersionForPhone*(phoneId: jint): string
  proc setPhoneType*(phoneId: jint, type: jint)
  proc getOtaSpNumberSchemaForPhone*(phoneId: jint, defaultValue: string): string
  proc getSmsReceiveCapableForPhone*(phoneId: jint, defaultValue: jboolean): jboolean
  proc getSmsSendCapableForPhone*(phoneId: jint, defaultValue: jboolean): jboolean
  proc getAndUpdateDefaultRespondViaMessageApplication*(): ComponentName
  proc getDefaultRespondViaMessageApplication*(): ComponentName
  proc setNetworkOperatorNameForPhone*(phoneId: jint, name: string)
  proc setNetworkOperatorNumericForPhone*(phoneId: jint, numeric: string)
  proc setNetworkRoamingForPhone*(phoneId: jint, isRoaming: jboolean)
  proc setDataNetworkType*(type: jint)
  proc setDataNetworkTypeForPhone*(phoneId: jint, type: jint)
  proc getSubIdForPhoneAccount*(phoneAccount: PhoneAccount): jint
  proc getPhoneAccountHandle*(): PhoneAccountHandle
  proc getPhoneAccountHandleForSubscriptionId*(subscriptionId: jint): PhoneAccountHandle
  proc getSubscriptionId*(phoneAccountHandle: PhoneAccountHandle): jint
  proc factoryReset*(subId: jint)
  proc resetSettings*()
  proc getSimLocale*(): Locale
  proc requestModemActivityInfo*(executor: Executor, callback: OutcomeReceiver[ModemActivityInfo, ModemActivityInfoException])
  proc getServiceState*(): ServiceState
  proc getServiceState*(includeLocationData: jint): ServiceState
  proc getServiceStateForSubscriber*(subId: jint): ServiceState
  proc getServiceStateForSlot*(slotIndex: jint): ServiceState
  proc getVoicemailRingtoneUri*(accountHandle: PhoneAccountHandle): Uri
  proc setVoicemailRingtoneUri*(phoneAccountHandle: PhoneAccountHandle, uri: Uri)
  proc isVoicemailVibrationEnabled*(accountHandle: PhoneAccountHandle): jboolean
  proc setVoicemailVibrationEnabled*(phoneAccountHandle: PhoneAccountHandle, enabled: jboolean)
  proc getSimCarrierId*(): jint
  proc getSimCarrierIdName*(): CharSequence
  proc getSimSpecificCarrierId*(): jint
  proc getSimSpecificCarrierIdName*(): CharSequence
  proc getCarrierIdFromSimMccMnc*(): jint
  proc getCarrierIdFromMccMnc*(mccmnc: string): jint
  proc getCertsFromCarrierPrivilegeAccessRules*(): List[string]
  proc getAidForAppType*(appType: jint): string
  proc getAidForAppType*(subId: jint, appType: jint): string
  proc getEsn*(): string
  proc getEsn*(subId: jint): string
  proc getCdmaPrlVersion*(): string
  proc getCdmaPrlVersion*(subId: jint): string
  proc getTelephonyHistograms*(): List[TelephonyHistogram]
  proc setAllowedCarriers*(slotIndex: jint, carriers: List[CarrierIdentifier]): jint
  proc setCarrierRestrictionRules*(rules: CarrierRestrictionRules): jint
  proc getAllowedCarriers*(slotIndex: jint): List[CarrierIdentifier]
  proc getCarrierRestrictionRules*(): CarrierRestrictionRules
  proc getCarrierRestrictionStatus*(executor: Executor, resultListener: Consumer[Integer])
  proc getShaIdFromAllowList*(pkgName: string, carrierId: jint): List[string]
  proc setCarrierDataEnabled*(enabled: jboolean)
  proc setRadioEnabled*(enabled: jboolean)
  proc setVoNrEnabled*(enabled: jboolean): jint
  proc isVoNrEnabled*(): jboolean
  proc reportDefaultNetworkStatus*(report: jboolean)
  proc resetAllCarrierActions*()
  proc setPolicyDataEnabled*(enabled: jboolean)
  proc setDataEnabledForReason*(reason: jint, enabled: jboolean)
  proc isDataEnabledForReason*(reason: jint): jboolean
  proc getClientRequestStats*(subId: jint): List[ClientRequestStats]
  proc getEmergencyCallbackMode*(): jboolean
  proc getEmergencyCallbackMode*(subId: jint): jboolean
  proc isManualNetworkSelectionAllowed*(): jboolean
  proc getSignalStrength*(): SignalStrength
  proc isDataConnectionAllowed*(): jboolean
  proc isDataCapable*(): jboolean
  proc setCarrierTestOverride*(mccmnc: string, imsi: string, iccid: string, gid1: string, gid2: string, plmn: string, spn: string)
  proc setCarrierTestOverride*(mccmnc: string, imsi: string, iccid: string, gid1: string, gid2: string, plmn: string, spn: string, carrierPriviledgeRules: string, apn: string)
  proc getCarrierIdListVersion*(): jint
  proc getNumberOfModemsWithSimultaneousDataConnections*(): jint
  proc setOpportunisticNetworkState*(enable: jboolean): jboolean
  proc isOpportunisticNetworkEnabled*(): jboolean
  proc getSupportedRadioAccessFamily*(): jlong
  proc notifyOtaEmergencyNumberDbInstalled*()
  proc updateOtaEmergencyNumberDbFilePath*(otaParcelFileDescriptor: ParcelFileDescriptor)
  proc resetOtaEmergencyNumberDbFilePath*()
  proc isEmergencyAssistanceEnabled*(): jboolean
  proc getEmergencyAssistancePackageName*(): string
  proc getEmergencyNumberList*(): Map[Integer, List[EmergencyNumber]]
  proc getEmergencyNumberList*(categories: jint): Map[Integer, List[EmergencyNumber]]
  proc filterEmergencyNumbersByCategories*(emergencyNumberList: Map[Integer, List[EmergencyNumber]], categories: jint): Map[Integer, List[EmergencyNumber]]
  proc isEmergencyNumber*(number: string): jboolean
  proc isPotentialEmergencyNumber*(number: string): jboolean
  proc getEmergencyNumberDbVersion*(): jint
  proc setPreferredOpportunisticDataSubscription*(subId: jint, needValidation: jboolean, executor: Executor, callback: Consumer[Integer])
  proc getPreferredOpportunisticDataSubscription*(): jint
  proc updateAvailableNetworks*(availableNetworks: List[AvailableNetworkInfo], executor: Executor, callback: Consumer[Integer])
  proc enableModemForSlot*(slotIndex: jint, enable: jboolean): jboolean
  proc isModemEnabledForSlot*(slotIndex: jint): jboolean
  proc setMultiSimCarrierRestriction*(isMultiSimCarrierRestricted: jboolean)
  proc isMultiSimSupported*(): jint
  proc switchMultiSimConfig*(numOfSims: jint)
  proc doesSwitchMultiSimConfigTriggerReboot*(): jboolean
  proc getRadioHalVersion*(): Pair[Integer, Integer]
  proc getHalVersion*(halService: jint): Pair[Integer, Integer]
  proc getCarrierPrivilegeStatus*(uid: jint): jint
  proc getDevicePolicyOverrideApns*(context: Context): List[ApnSetting]
  proc addDevicePolicyOverrideApn*(context: Context, apnSetting: ApnSetting): jint
  proc modifyDevicePolicyOverrideApn*(context: Context, apnId: jint, apnSetting: ApnSetting): jboolean
  proc isDataEnabledForApn*(apnType: jint): jboolean
  proc isApnMetered*(apnType: jint): jboolean
  proc setSystemSelectionChannels*(specifiers: List[RadioAccessSpecifier], executor: Executor, callback: Consumer[Boolean])
  proc setSystemSelectionChannels*(specifiers: List[RadioAccessSpecifier])
  proc getSystemSelectionChannels*(): List[RadioAccessSpecifier]
  proc matchesCurrentSimOperator*(mccmnc: string, mvnoType: jint, mvnoMatchData: string): jboolean
  proc getCallForwarding*(callForwardingReason: jint, executor: Executor, callback: CallForwardingInfoCallback)
  proc setCallForwarding*(callForwardingInfo: CallForwardingInfo, executor: Executor, resultListener: Consumer[Integer])
  proc getCallWaitingStatus*(executor: Executor, resultListener: Consumer[Integer])
  proc setCallWaitingEnabled*(enabled: jboolean, executor: Executor, resultListener: Consumer[Integer])
  proc setMobileDataPolicyEnabled*(policy: jint, enabled: jboolean)
  proc isMobileDataPolicyEnabled*(policy: jint): jboolean
  proc isIccLockEnabled*(): jboolean
  proc setIccLockEnabled*(enabled: jboolean, pin: string): PinResult
  proc changeIccLockPin*(oldPin: string, newPin: string): PinResult
  proc notifyUserActivity*()
  proc setNrDualConnectivityState*(nrDualConnectivityState: jint): jint
  proc isNrDualConnectivityEnabled*(): jboolean
  proc disableServiceHandleCaching*() {.`static`.}
  proc enableServiceHandleCaching*() {.`static`.}
  proc setupITelephonyForTest*(telephony: ITelephony) {.`static`.}
  proc setupIPhoneSubInfoForTest*(iPhoneSubInfo: IPhoneSubInfo) {.`static`.}
  proc setupISubForTest*(iSub: ISub) {.`static`.}
  proc setupISmsForTest*(iSms: ISms) {.`static`.}
  proc canConnectTo5GInDsdsMode*(): jboolean
  proc getEquivalentHomePlmns*(): List[string]
  proc isRadioInterfaceCapabilitySupported*(capability: string): jboolean
  proc sendThermalMitigationRequest*(thermalMitigationRequest: ThermalMitigationRequest): jint
  proc registerTelephonyCallback*(executor: Executor, callback: TelephonyCallback)
  proc registerTelephonyCallback*(includeLocationData: jint, executor: Executor, callback: TelephonyCallback)
  proc unregisterTelephonyCallback*(callback: TelephonyCallback)
  proc bootstrapAuthenticationRequest*(appType: jint, nafId: Uri, securityProtocol: UaSecurityProtocolIdentifier, forceBootStrapping: jboolean, e: Executor, callback: BootstrapAuthenticationCallback)
  proc isNetworkTypeValid*(networkType: jint): jboolean {.`static`.}
  proc setSignalStrengthUpdateRequest*(request: SignalStrengthUpdateRequest)
  proc clearSignalStrengthUpdateRequest*(request: SignalStrengthUpdateRequest)
  proc getPhoneCapability*(): PhoneCapability
  proc prepareForUnattendedReboot*(): jint
  proc getNetworkSlicingConfiguration*(executor: Executor, callback: OutcomeReceiver[NetworkSlicingConfig, NetworkSlicingException])
  proc convertPremiumCapabilityToString*(capability: jint): string {.`static`.}
  proc isPremiumCapabilityAvailableForPurchase*(capability: jint): jboolean
  proc convertPurchaseResultToString*(result: jint): string {.`static`.}
  proc purchasePremiumCapability*(capability: jint, executor: Executor, callback: Consumer[Integer])
  proc getLastKnownCellIdentity*(): CellIdentity
  proc setVoiceServiceStateOverride*(hasService: jboolean)
  proc registerCarrierPrivilegesCallback*(logicalSlotIndex: jint, executor: Executor, callback: CarrierPrivilegesCallback)
  proc unregisterCarrierPrivilegesCallback*(callback: CarrierPrivilegesCallback)
  proc setRemovableEsimAsDefaultEuicc*(isDefault: jboolean)
  proc isRemovableEsimDefaultEuicc*(): jboolean
  proc getSimStateForSlotIndex*(slotIndex: jint): jint {.`static`.}
  proc persistEmergencyCallDiagnosticData*(dropboxTag: string, data: EmergencyCallDiagnosticData)
  proc setNullCipherAndIntegrityEnabled*(enabled: jboolean)
  proc isNullCipherAndIntegrityPreferenceEnabled*(): jboolean
  proc setEnableCellularIdentifierDisclosureNotifications*(enable: jboolean)
  proc isCellularIdentifierDisclosureNotificationsEnabled*(): jboolean
  proc setNullCipherNotificationsEnabled*(enable: jboolean)
  proc isNullCipherNotificationsEnabled*(): jboolean
  proc getCellBroadcastIdRanges*(): List[CellBroadcastIdRange]
  proc setCellBroadcastIdRanges*(ranges: List[CellBroadcastIdRange], executor: Executor, callback: Consumer[Integer])
  proc isDomainSelectionSupported*(): jboolean
  proc isAospDomainSelectionService*(): jboolean
  proc getPrimaryImei*(): string
  proc simStateToString*(state: jint): string {.`static`.}
  proc setTestEuiccUiComponent*(componentName: ComponentName)
  proc getTestEuiccUiComponent*(): ComponentName
  proc getCarrierIdFromCarrierIdentifier*(carrierIdentifier: CarrierIdentifier): jint
  MODEM_ACTIVITY_RESULT_KEY*: string {.`static`.}
  EXCEPTION_RESULT_KEY*: string {.`static`.}
  PHONE_PROCESS_NAME*: string {.`static`.}
  NETWORK_SELECTION_MODE_UNKNOWN*: jint {.`static`.}
  NETWORK_SELECTION_MODE_AUTO*: jint {.`static`.}
  NETWORK_SELECTION_MODE_MANUAL*: jint {.`static`.}
  RADIO_POWER_REASON_USER*: jint {.`static`.}
  RADIO_POWER_REASON_THERMAL*: jint {.`static`.}
  RADIO_POWER_REASON_CARRIER*: jint {.`static`.}
  RADIO_POWER_REASON_NEARBY_DEVICE*: jint {.`static`.}
  OTASP_UNINITIALIZED*: jint {.`static`.}
  OTASP_UNKNOWN*: jint {.`static`.}
  OTASP_NEEDED*: jint {.`static`.}
  OTASP_NOT_NEEDED*: jint {.`static`.}
  OTASP_SIM_UNPROVISIONED*: jint {.`static`.}
  KEY_TYPE_EPDG*: jint {.`static`.}
  KEY_TYPE_WLAN*: jint {.`static`.}
  SRVCC_STATE_HANDOVER_NONE*: jint {.`static`.}
  SRVCC_STATE_HANDOVER_STARTED*: jint {.`static`.}
  SRVCC_STATE_HANDOVER_COMPLETED*: jint {.`static`.}
  SRVCC_STATE_HANDOVER_FAILED*: jint {.`static`.}
  SRVCC_STATE_HANDOVER_CANCELED*: jint {.`static`.}
  UNSUPPORTED_CARD_ID*: jint {.`static`.}
  UNINITIALIZED_CARD_ID*: jint {.`static`.}
  DEFAULT_PORT_INDEX*: jint {.`static`.}
  INVALID_PORT_INDEX*: jint {.`static`.}
  PROPERTY_ENABLE_NULL_CIPHER_TOGGLE*: string {.`static`.}
  ENABLE_FEATURE_MAPPING*: jlong {.`static`.}
  CACHE_KEY_PHONE_ACCOUNT_TO_SUBID*: string {.`static`.}
  ACTION_PHONE_STATE_CHANGED*: string {.`static`.}
  ACTION_RESPOND_VIA_MESSAGE*: string {.`static`.}
  ACTION_EMERGENCY_ASSISTANCE*: string {.`static`.}
  METADATA_HIDE_VOICEMAIL_SETTINGS_MENU*: string {.`static`.}
  ACTION_CONFIGURE_VOICEMAIL*: string {.`static`.}
  EXTRA_HIDE_PUBLIC_SETTINGS*: string {.`static`.}
  EMERGENCY_ASSISTANCE_ENABLED*: jboolean {.`static`.}
  EXTRA_STATE*: string {.`static`.}
  EXTRA_STATE_IDLE*: string {.`static`.}
  EXTRA_STATE_RINGING*: string {.`static`.}
  EXTRA_STATE_OFFHOOK*: string {.`static`.}
  EXTRA_INCOMING_NUMBER*: string {.`static`.}
  ACTION_CALL_DISCONNECT_CAUSE_CHANGED*: string {.`static`.}
  EXTRA_DISCONNECT_CAUSE*: string {.`static`.}
  EXTRA_PRECISE_DISCONNECT_CAUSE*: string {.`static`.}
  ACTION_SHOW_VOICEMAIL_NOTIFICATION*: string {.`static`.}
  EXTRA_PHONE_ACCOUNT_HANDLE*: string {.`static`.}
  EXTRA_NOTIFICATION_COUNT*: string {.`static`.}
  EXTRA_VOICEMAIL_NUMBER*: string {.`static`.}
  EXTRA_CALL_VOICEMAIL_INTENT*: string {.`static`.}
  EXTRA_LAUNCH_VOICEMAIL_SETTINGS_INTENT*: string {.`static`.}
  EXTRA_IS_REFRESH*: string {.`static`.}
  EVENT_HANDOVER_VIDEO_FROM_WIFI_TO_LTE*: string {.`static`.}
  EVENT_HANDOVER_VIDEO_FROM_LTE_TO_WIFI*: string {.`static`.}
  EVENT_HANDOVER_TO_WIFI_FAILED*: string {.`static`.}
  EVENT_DOWNGRADE_DATA_LIMIT_REACHED*: string {.`static`.}
  EVENT_DOWNGRADE_DATA_DISABLED*: string {.`static`.}
  EVENT_NOTIFY_INTERNATIONAL_CALL_ON_WFC*: string {.`static`.}
  EVENT_CALL_FORWARDED*: string {.`static`.}
  EVENT_SUPPLEMENTARY_SERVICE_NOTIFICATION*: string {.`static`.}
  EVENT_DISPLAY_EMERGENCY_MESSAGE*: string {.`static`.}
  EXTRA_EMERGENCY_CALL_TO_SATELLITE_HANDOVER_TYPE*: string {.`static`.}
  EXTRA_EMERGENCY_CALL_TO_SATELLITE_LAUNCH_INTENT*: string {.`static`.}
  EXTRA_NOTIFICATION_TYPE*: string {.`static`.}
  EXTRA_NOTIFICATION_CODE*: string {.`static`.}
  EXTRA_NOTIFICATION_MESSAGE*: string {.`static`.}
  VVM_TYPE_OMTP*: string {.`static`.}
  VVM_TYPE_CVVM*: string {.`static`.}
  EXTRA_VISUAL_VOICEMAIL_ENABLED_BY_USER_BOOL*: string {.`static`.}
  EXTRA_VOICEMAIL_SCRAMBLED_PIN_STRING*: string {.`static`.}
  ACTION_MULTI_SIM_CONFIG_CHANGED*: string {.`static`.}
  EXTRA_ACTIVE_SIM_SUPPORTED_COUNT*: string {.`static`.}
  USSD_RESPONSE*: string {.`static`.}
  USSD_RETURN_SUCCESS*: jint {.`static`.}
  USSD_RETURN_FAILURE*: jint {.`static`.}
  USSD_ERROR_SERVICE_UNAVAIL*: jint {.`static`.}
  CDMA_ROAMING_MODE_RADIO_DEFAULT*: jint {.`static`.}
  CDMA_ROAMING_MODE_HOME*: jint {.`static`.}
  CDMA_ROAMING_MODE_AFFILIATED*: jint {.`static`.}
  CDMA_ROAMING_MODE_ANY*: jint {.`static`.}
  UNKNOWN_CARRIER_ID*: jint {.`static`.}
  UNKNOWN_CARRIER_ID_LIST_VERSION*: jint {.`static`.}
  ACTION_SUBSCRIPTION_CARRIER_IDENTITY_CHANGED*: string {.`static`.}
  EXTRA_CARRIER_ID*: string {.`static`.}
  EXTRA_CARRIER_NAME*: string {.`static`.}
  ACTION_SUBSCRIPTION_SPECIFIC_CARRIER_IDENTITY_CHANGED*: string {.`static`.}
  EXTRA_SPECIFIC_CARRIER_ID*: string {.`static`.}
  EXTRA_SPECIFIC_CARRIER_NAME*: string {.`static`.}
  EXTRA_SUBSCRIPTION_ID*: string {.`static`.}
  ACTION_SERVICE_PROVIDERS_UPDATED*: string {.`static`.}
  EXTRA_SHOW_PLMN*: string {.`static`.}
  EXTRA_PLMN*: string {.`static`.}
  EXTRA_SHOW_SPN*: string {.`static`.}
  EXTRA_SPN*: string {.`static`.}
  EXTRA_DATA_SPN*: string {.`static`.}
  ACTION_DATA_STALL_DETECTED*: string {.`static`.}
  ACTION_CARRIER_MESSAGING_CLIENT_SERVICE*: string {.`static`.}
  EXTRA_RECOVERY_ACTION*: string {.`static`.}
  ACTION_ANOMALY_REPORTED*: string {.`static`.}
  EXTRA_ANOMALY_ID*: string {.`static`.}
  EXTRA_ANOMALY_DESCRIPTION*: string {.`static`.}
  ACTION_PRIMARY_SUBSCRIPTION_LIST_CHANGED*: string {.`static`.}
  EXTRA_DEFAULT_SUBSCRIPTION_SELECT_TYPE*: string {.`static`.}
  EXTRA_DEFAULT_SUBSCRIPTION_SELECT_TYPE_NONE*: jint {.`static`.}
  EXTRA_DEFAULT_SUBSCRIPTION_SELECT_TYPE_DATA*: jint {.`static`.}
  EXTRA_DEFAULT_SUBSCRIPTION_SELECT_TYPE_VOICE*: jint {.`static`.}
  EXTRA_DEFAULT_SUBSCRIPTION_SELECT_TYPE_SMS*: jint {.`static`.}
  EXTRA_DEFAULT_SUBSCRIPTION_SELECT_TYPE_ALL*: jint {.`static`.}
  EXTRA_DEFAULT_SUBSCRIPTION_SELECT_TYPE_DISMISS*: jint {.`static`.}
  EXTRA_SIM_COMBINATION_WARNING_TYPE*: string {.`static`.}
  EXTRA_SIM_COMBINATION_WARNING_TYPE_NONE*: jint {.`static`.}
  EXTRA_SIM_COMBINATION_WARNING_TYPE_DUAL_CDMA*: jint {.`static`.}
  EXTRA_SIM_COMBINATION_NAMES*: string {.`static`.}
  ACTION_EMERGENCY_CALLBACK_MODE_CHANGED*: string {.`static`.}
  EXTRA_PHONE_IN_ECM_STATE*: string {.`static`.}
  ACTION_CARRIER_SIGNAL_REDIRECTED*: string {.`static`.}
  ACTION_CARRIER_SIGNAL_REQUEST_NETWORK_FAILED*: string {.`static`.}
  ACTION_CARRIER_SIGNAL_PCO_VALUE*: string {.`static`.}
  ACTION_CARRIER_SIGNAL_DEFAULT_NETWORK_AVAILABLE*: string {.`static`.}
  ACTION_CARRIER_SIGNAL_RESET*: string {.`static`.}
  EXTRA_REDIRECTION_URL*: string {.`static`.}
  EXTRA_DATA_FAIL_CAUSE*: string {.`static`.}
  EXTRA_APN_TYPE*: string {.`static`.}
  EXTRA_APN_PROTOCOL*: string {.`static`.}
  EXTRA_PCO_ID*: string {.`static`.}
  EXTRA_PCO_VALUE*: string {.`static`.}
  EXTRA_DEFAULT_NETWORK_AVAILABLE*: string {.`static`.}
  ACTION_EMERGENCY_CALL_STATE_CHANGED*: string {.`static`.}
  EXTRA_PHONE_IN_EMERGENCY_CALL*: string {.`static`.}
  ACTION_SHOW_NOTICE_ECM_BLOCK_OTHERS*: string {.`static`.}
  ACTION_DEFAULT_DATA_SUBSCRIPTION_CHANGED*: string {.`static`.}
  ACTION_DEFAULT_VOICE_SUBSCRIPTION_CHANGED*: string {.`static`.}
  ACTION_REQUEST_OMADM_CONFIGURATION_UPDATE*: string {.`static`.}
  ACTION_RESET_MOBILE_NETWORK_SETTINGS*: string {.`static`.}
  PHONE_TYPE_NONE*: jint {.`static`.}
  PHONE_TYPE_GSM*: jint {.`static`.}
  PHONE_TYPE_CDMA*: jint {.`static`.}
  PHONE_TYPE_SIP*: jint {.`static`.}
  PHONE_TYPE_IMS*: jint {.`static`.}
  PHONE_TYPE_THIRD_PARTY*: jint {.`static`.}
  NETWORK_TYPE_UNKNOWN*: jint {.`static`.}
  NETWORK_TYPE_GPRS*: jint {.`static`.}
  NETWORK_TYPE_EDGE*: jint {.`static`.}
  NETWORK_TYPE_UMTS*: jint {.`static`.}
  NETWORK_TYPE_CDMA*: jint {.`static`.}
  NETWORK_TYPE_EVDO_0*: jint {.`static`.}
  NETWORK_TYPE_EVDO_A*: jint {.`static`.}
  NETWORK_TYPE_1xRTT*: jint {.`static`.}
  NETWORK_TYPE_HSDPA*: jint {.`static`.}
  NETWORK_TYPE_HSUPA*: jint {.`static`.}
  NETWORK_TYPE_HSPA*: jint {.`static`.}
  NETWORK_TYPE_IDEN*: jint {.`static`.}
  NETWORK_TYPE_EVDO_B*: jint {.`static`.}
  NETWORK_TYPE_LTE*: jint {.`static`.}
  NETWORK_TYPE_EHRPD*: jint {.`static`.}
  NETWORK_TYPE_HSPAP*: jint {.`static`.}
  NETWORK_TYPE_GSM*: jint {.`static`.}
  NETWORK_TYPE_TD_SCDMA*: jint {.`static`.}
  NETWORK_TYPE_IWLAN*: jint {.`static`.}
  NETWORK_TYPE_LTE_CA*: jint {.`static`.}
  NETWORK_TYPE_NR*: jint {.`static`.}
  SIM_STATE_UNKNOWN*: jint {.`static`.}
  SIM_STATE_ABSENT*: jint {.`static`.}
  SIM_STATE_PIN_REQUIRED*: jint {.`static`.}
  SIM_STATE_PUK_REQUIRED*: jint {.`static`.}
  SIM_STATE_NETWORK_LOCKED*: jint {.`static`.}
  SIM_STATE_READY*: jint {.`static`.}
  SIM_STATE_NOT_READY*: jint {.`static`.}
  SIM_STATE_PERM_DISABLED*: jint {.`static`.}
  SIM_STATE_CARD_IO_ERROR*: jint {.`static`.}
  SIM_STATE_CARD_RESTRICTED*: jint {.`static`.}
  SIM_STATE_LOADED*: jint {.`static`.}
  SIM_STATE_PRESENT*: jint {.`static`.}
  EXTRA_SIM_STATE*: string {.`static`.}
  ACTION_SIM_CARD_STATE_CHANGED*: string {.`static`.}
  ACTION_SIM_APPLICATION_STATE_CHANGED*: string {.`static`.}
  ACTION_SIM_SLOT_STATUS_CHANGED*: string {.`static`.}
  ACTION_SECRET_CODE*: string {.`static`.}
  KEY_CALL_COMPOSER_PICTURE_HANDLE*: string {.`static`.}
  SIM_ACTIVATION_STATE_UNKNOWN*: jint {.`static`.}
  SIM_ACTIVATION_STATE_ACTIVATING*: jint {.`static`.}
  SIM_ACTIVATION_STATE_ACTIVATED*: jint {.`static`.}
  SIM_ACTIVATION_STATE_DEACTIVATED*: jint {.`static`.}
  SIM_ACTIVATION_STATE_RESTRICTED*: jint {.`static`.}
  CALL_STATE_IDLE*: jint {.`static`.}
  CALL_STATE_RINGING*: jint {.`static`.}
  CALL_STATE_OFFHOOK*: jint {.`static`.}
  DATA_ACTIVITY_NONE*: jint {.`static`.}
  DATA_ACTIVITY_IN*: jint {.`static`.}
  DATA_ACTIVITY_OUT*: jint {.`static`.}
  DATA_ACTIVITY_INOUT*: jint {.`static`.}
  DATA_ACTIVITY_DORMANT*: jint {.`static`.}
  DATA_UNKNOWN*: jint {.`static`.}
  DATA_DISCONNECTED*: jint {.`static`.}
  DATA_CONNECTING*: jint {.`static`.}
  DATA_CONNECTED*: jint {.`static`.}
  DATA_SUSPENDED*: jint {.`static`.}
  DATA_DISCONNECTING*: jint {.`static`.}
  DATA_HANDOVER_IN_PROGRESS*: jint {.`static`.}
  ERI_ON*: jint {.`static`.}
  ERI_OFF*: jint {.`static`.}
  ERI_FLASH*: jint {.`static`.}
  ERI_ICON_MODE_NORMAL*: jint {.`static`.}
  ERI_ICON_MODE_FLASH*: jint {.`static`.}
  APPTYPE_UNKNOWN*: jint {.`static`.}
  APPTYPE_SIM*: jint {.`static`.}
  APPTYPE_USIM*: jint {.`static`.}
  APPTYPE_RUIM*: jint {.`static`.}
  APPTYPE_CSIM*: jint {.`static`.}
  APPTYPE_ISIM*: jint {.`static`.}
  AUTHTYPE_EAP_SIM*: jint {.`static`.}
  AUTHTYPE_EAP_AKA*: jint {.`static`.}
  AUTHTYPE_GBA_BOOTSTRAP*: jint {.`static`.}
  AUTHTYPE_GBA_NAF_KEY_EXTERNAL*: jint {.`static`.}
  NETWORK_MODE_WCDMA_PREF*: jint {.`static`.}
  NETWORK_MODE_GSM_ONLY*: jint {.`static`.}
  NETWORK_MODE_WCDMA_ONLY*: jint {.`static`.}
  NETWORK_MODE_GSM_UMTS*: jint {.`static`.}
  NETWORK_MODE_CDMA_EVDO*: jint {.`static`.}
  NETWORK_MODE_CDMA_NO_EVDO*: jint {.`static`.}
  NETWORK_MODE_EVDO_NO_CDMA*: jint {.`static`.}
  NETWORK_MODE_GLOBAL*: jint {.`static`.}
  NETWORK_MODE_LTE_CDMA_EVDO*: jint {.`static`.}
  NETWORK_MODE_LTE_GSM_WCDMA*: jint {.`static`.}
  NETWORK_MODE_LTE_CDMA_EVDO_GSM_WCDMA*: jint {.`static`.}
  NETWORK_MODE_LTE_ONLY*: jint {.`static`.}
  NETWORK_MODE_LTE_WCDMA*: jint {.`static`.}
  NETWORK_MODE_TDSCDMA_ONLY*: jint {.`static`.}
  NETWORK_MODE_TDSCDMA_WCDMA*: jint {.`static`.}
  NETWORK_MODE_LTE_TDSCDMA*: jint {.`static`.}
  NETWORK_MODE_TDSCDMA_GSM*: jint {.`static`.}
  NETWORK_MODE_LTE_TDSCDMA_GSM*: jint {.`static`.}
  NETWORK_MODE_TDSCDMA_GSM_WCDMA*: jint {.`static`.}
  NETWORK_MODE_LTE_TDSCDMA_WCDMA*: jint {.`static`.}
  NETWORK_MODE_LTE_TDSCDMA_GSM_WCDMA*: jint {.`static`.}
  NETWORK_MODE_TDSCDMA_CDMA_EVDO_GSM_WCDMA*: jint {.`static`.}
  NETWORK_MODE_LTE_TDSCDMA_CDMA_EVDO_GSM_WCDMA*: jint {.`static`.}
  NETWORK_MODE_NR_ONLY*: jint {.`static`.}
  NETWORK_MODE_NR_LTE*: jint {.`static`.}
  NETWORK_MODE_NR_LTE_CDMA_EVDO*: jint {.`static`.}
  NETWORK_MODE_NR_LTE_GSM_WCDMA*: jint {.`static`.}
  NETWORK_MODE_NR_LTE_CDMA_EVDO_GSM_WCDMA*: jint {.`static`.}
  NETWORK_MODE_NR_LTE_WCDMA*: jint {.`static`.}
  NETWORK_MODE_NR_LTE_TDSCDMA*: jint {.`static`.}
  NETWORK_MODE_NR_LTE_TDSCDMA_GSM*: jint {.`static`.}
  NETWORK_MODE_NR_LTE_TDSCDMA_WCDMA*: jint {.`static`.}
  NETWORK_MODE_NR_LTE_TDSCDMA_GSM_WCDMA*: jint {.`static`.}
  NETWORK_MODE_NR_LTE_TDSCDMA_CDMA_EVDO_GSM_WCDMA*: jint {.`static`.}
  DEFAULT_PREFERRED_NETWORK_MODE*: jint {.`static`.}
  ALLOWED_NETWORK_TYPES_REASON_USER*: jint {.`static`.}
  ALLOWED_NETWORK_TYPES_REASON_POWER*: jint {.`static`.}
  ALLOWED_NETWORK_TYPES_REASON_CARRIER*: jint {.`static`.}
  ALLOWED_NETWORK_TYPES_REASON_ENABLE_2G*: jint {.`static`.}
  ALLOWED_NETWORK_TYPES_REASON_TEST*: jint {.`static`.}
  CARRIER_PRIVILEGE_STATUS_HAS_ACCESS*: jint {.`static`.}
  CARRIER_PRIVILEGE_STATUS_NO_ACCESS*: jint {.`static`.}
  CARRIER_PRIVILEGE_STATUS_RULES_NOT_LOADED*: jint {.`static`.}
  CARRIER_PRIVILEGE_STATUS_ERROR_LOADING_RULES*: jint {.`static`.}
  CALL_COMPOSER_STATUS_OFF*: jint {.`static`.}
  CALL_COMPOSER_STATUS_ON*: jint {.`static`.}
  CALL_COMPOSER_STATUS_BUSINESS_ONLY*: jint {.`static`.}
  RADIO_POWER_OFF*: jint {.`static`.}
  RADIO_POWER_ON*: jint {.`static`.}
  RADIO_POWER_UNAVAILABLE*: jint {.`static`.}
  CDMA_SUBSCRIPTION_UNKNOWN*: jint {.`static`.}
  CDMA_SUBSCRIPTION_RUIM_SIM*: jint {.`static`.}
  CDMA_SUBSCRIPTION_NV*: jint {.`static`.}
  CARD_POWER_DOWN*: jint {.`static`.}
  CARD_POWER_UP*: jint {.`static`.}
  CARD_POWER_UP_PASS_THROUGH*: jint {.`static`.}
  SET_CARRIER_RESTRICTION_SUCCESS*: jint {.`static`.}
  SET_CARRIER_RESTRICTION_NOT_SUPPORTED*: jint {.`static`.}
  SET_CARRIER_RESTRICTION_ERROR*: jint {.`static`.}
  SET_SIM_POWER_STATE_SUCCESS*: jint {.`static`.}
  SET_SIM_POWER_STATE_ALREADY_IN_STATE*: jint {.`static`.}
  SET_SIM_POWER_STATE_MODEM_ERROR*: jint {.`static`.}
  SET_SIM_POWER_STATE_SIM_ERROR*: jint {.`static`.}
  SET_SIM_POWER_STATE_NOT_SUPPORTED*: jint {.`static`.}
  CARRIER_RESTRICTION_STATUS_UNKNOWN*: jint {.`static`.}
  CARRIER_RESTRICTION_STATUS_NOT_RESTRICTED*: jint {.`static`.}
  CARRIER_RESTRICTION_STATUS_RESTRICTED*: jint {.`static`.}
  CARRIER_RESTRICTION_STATUS_RESTRICTED_TO_CALLER*: jint {.`static`.}
  ENABLE_VONR_SUCCESS*: jint {.`static`.}
  ENABLE_VONR_RADIO_NOT_AVAILABLE*: jint {.`static`.}
  ENABLE_VONR_RADIO_ERROR*: jint {.`static`.}
  ENABLE_VONR_RADIO_INVALID_STATE*: jint {.`static`.}
  ENABLE_VONR_REQUEST_NOT_SUPPORTED*: jint {.`static`.}
  DATA_ENABLED_REASON_UNKNOWN*: jint {.`static`.}
  DATA_ENABLED_REASON_USER*: jint {.`static`.}
  DATA_ENABLED_REASON_POLICY*: jint {.`static`.}
  DATA_ENABLED_REASON_CARRIER*: jint {.`static`.}
  DATA_ENABLED_REASON_THERMAL*: jint {.`static`.}
  DATA_ENABLED_REASON_OVERRIDE*: jint {.`static`.}
  INDICATION_FILTER_SIGNAL_STRENGTH*: jint {.`static`.}
  INDICATION_FILTER_FULL_NETWORK_STATE*: jint {.`static`.}
  INDICATION_FILTER_DATA_CALL_DORMANCY_CHANGED*: jint {.`static`.}
  INDICATION_FILTER_LINK_CAPACITY_ESTIMATE*: jint {.`static`.}
  INDICATION_FILTER_PHYSICAL_CHANNEL_CONFIG*: jint {.`static`.}
  NETWORK_TYPE_BITMASK_UNKNOWN*: jlong {.`static`.}
  NETWORK_TYPE_BITMASK_GSM*: jlong {.`static`.}
  NETWORK_TYPE_BITMASK_GPRS*: jlong {.`static`.}
  NETWORK_TYPE_BITMASK_EDGE*: jlong {.`static`.}
  NETWORK_TYPE_BITMASK_CDMA*: jlong {.`static`.}
  NETWORK_TYPE_BITMASK_1xRTT*: jlong {.`static`.}
  NETWORK_TYPE_BITMASK_EVDO_0*: jlong {.`static`.}
  NETWORK_TYPE_BITMASK_EVDO_A*: jlong {.`static`.}
  NETWORK_TYPE_BITMASK_EVDO_B*: jlong {.`static`.}
  NETWORK_TYPE_BITMASK_EHRPD*: jlong {.`static`.}
  NETWORK_TYPE_BITMASK_HSUPA*: jlong {.`static`.}
  NETWORK_TYPE_BITMASK_HSDPA*: jlong {.`static`.}
  NETWORK_TYPE_BITMASK_HSPA*: jlong {.`static`.}
  NETWORK_TYPE_BITMASK_IDEN*: jlong {.`static`.}
  NETWORK_TYPE_BITMASK_HSPAP*: jlong {.`static`.}
  NETWORK_TYPE_BITMASK_UMTS*: jlong {.`static`.}
  NETWORK_TYPE_BITMASK_TD_SCDMA*: jlong {.`static`.}
  NETWORK_TYPE_BITMASK_LTE*: jlong {.`static`.}
  NETWORK_TYPE_BITMASK_LTE_CA*: jlong {.`static`.}
  NETWORK_TYPE_BITMASK_NR*: jlong {.`static`.}
  NETWORK_TYPE_BITMASK_IWLAN*: jlong {.`static`.}
  NETWORK_CLASS_BITMASK_2G*: jlong {.`static`.}
  NETWORK_CLASS_BITMASK_3G*: jlong {.`static`.}
  NETWORK_CLASS_BITMASK_4G*: jlong {.`static`.}
  NETWORK_CLASS_BITMASK_5G*: jlong {.`static`.}
  NETWORK_STANDARDS_FAMILY_BITMASK_3GPP*: jlong {.`static`.}
  NETWORK_STANDARDS_FAMILY_BITMASK_3GPP2*: jlong {.`static`.}
  INVALID_EMERGENCY_NUMBER_DB_VERSION*: jint {.`static`.}
  SET_OPPORTUNISTIC_SUB_SUCCESS*: jint {.`static`.}
  SET_OPPORTUNISTIC_SUB_VALIDATION_FAILED*: jint {.`static`.}
  SET_OPPORTUNISTIC_SUB_INACTIVE_SUBSCRIPTION*: jint {.`static`.}
  SET_OPPORTUNISTIC_SUB_NO_OPPORTUNISTIC_SUB_AVAILABLE*: jint {.`static`.}
  SET_OPPORTUNISTIC_SUB_REMOTE_SERVICE_EXCEPTION*: jint {.`static`.}
  UPDATE_AVAILABLE_NETWORKS_SUCCESS*: jint {.`static`.}
  UPDATE_AVAILABLE_NETWORKS_UNKNOWN_FAILURE*: jint {.`static`.}
  UPDATE_AVAILABLE_NETWORKS_ABORTED*: jint {.`static`.}
  UPDATE_AVAILABLE_NETWORKS_INVALID_ARGUMENTS*: jint {.`static`.}
  UPDATE_AVAILABLE_NETWORKS_NO_CARRIER_PRIVILEGE*: jint {.`static`.}
  UPDATE_AVAILABLE_NETWORKS_DISABLE_MODEM_FAIL*: jint {.`static`.}
  UPDATE_AVAILABLE_NETWORKS_ENABLE_MODEM_FAIL*: jint {.`static`.}
  UPDATE_AVAILABLE_NETWORKS_MULTIPLE_NETWORKS_NOT_SUPPORTED*: jint {.`static`.}
  UPDATE_AVAILABLE_NETWORKS_NO_OPPORTUNISTIC_SUB_AVAILABLE*: jint {.`static`.}
  UPDATE_AVAILABLE_NETWORKS_REMOTE_SERVICE_EXCEPTION*: jint {.`static`.}
  UPDATE_AVAILABLE_NETWORKS_SERVICE_IS_DISABLED*: jint {.`static`.}
  UPDATE_AVAILABLE_NETWORKS_SIM_PORT_NOT_AVAILABLE*: jint {.`static`.}
  ACTION_NETWORK_COUNTRY_CHANGED*: string {.`static`.}
  EXTRA_NETWORK_COUNTRY*: string {.`static`.}
  EXTRA_LAST_KNOWN_NETWORK_COUNTRY*: string {.`static`.}
  MULTISIM_ALLOWED*: jint {.`static`.}
  MULTISIM_NOT_SUPPORTED_BY_HARDWARE*: jint {.`static`.}
  MULTISIM_NOT_SUPPORTED_BY_CARRIER*: jint {.`static`.}
  HAL_SERVICE_RADIO*: jint {.`static`.}
  HAL_SERVICE_DATA*: jint {.`static`.}
  HAL_SERVICE_MESSAGING*: jint {.`static`.}
  HAL_SERVICE_MODEM*: jint {.`static`.}
  HAL_SERVICE_NETWORK*: jint {.`static`.}
  HAL_SERVICE_SIM*: jint {.`static`.}
  HAL_SERVICE_VOICE*: jint {.`static`.}
  HAL_SERVICE_IMS*: jint {.`static`.}
  HAL_VERSION_UNKNOWN*: Pair {.`static`.}
  HAL_VERSION_UNSUPPORTED*: Pair {.`static`.}
  CALL_WAITING_STATUS_ENABLED*: jint {.`static`.}
  CALL_WAITING_STATUS_DISABLED*: jint {.`static`.}
  CALL_WAITING_STATUS_UNKNOWN_ERROR*: jint {.`static`.}
  CALL_WAITING_STATUS_NOT_SUPPORTED*: jint {.`static`.}
  CALL_WAITING_STATUS_FDN_CHECK_FAILURE*: jint {.`static`.}
  MOBILE_DATA_POLICY_DATA_ON_NON_DEFAULT_DURING_VOICE_CALL*: jint {.`static`.}
  MOBILE_DATA_POLICY_MMS_ALWAYS_ALLOWED*: jint {.`static`.}
  MOBILE_DATA_POLICY_AUTO_DATA_SWITCH*: jint {.`static`.}
  CHANGE_ICC_LOCK_SUCCESS*: jint {.`static`.}
  ENABLE_NR_DUAL_CONNECTIVITY_SUCCESS*: jint {.`static`.}
  ENABLE_NR_DUAL_CONNECTIVITY_NOT_SUPPORTED*: jint {.`static`.}
  ENABLE_NR_DUAL_CONNECTIVITY_RADIO_NOT_AVAILABLE*: jint {.`static`.}
  ENABLE_NR_DUAL_CONNECTIVITY_RADIO_ERROR*: jint {.`static`.}
  ENABLE_NR_DUAL_CONNECTIVITY_INVALID_STATE*: jint {.`static`.}
  NR_DUAL_CONNECTIVITY_ENABLE*: jint {.`static`.}
  NR_DUAL_CONNECTIVITY_DISABLE*: jint {.`static`.}
  NR_DUAL_CONNECTIVITY_DISABLE_IMMEDIATE*: jint {.`static`.}
  CAPABILITY_SECONDARY_LINK_BANDWIDTH_VISIBLE*: string {.`static`.}
  CAPABILITY_USES_ALLOWED_NETWORK_TYPES_BITMASK*: string {.`static`.}
  CAPABILITY_NR_DUAL_CONNECTIVITY_CONFIGURATION_AVAILABLE*: string {.`static`.}
  CAPABILITY_THERMAL_MITIGATION_DATA_THROTTLING*: string {.`static`.}
  CAPABILITY_SLICING_CONFIG_SUPPORTED*: string {.`static`.}
  CAPABILITY_PHYSICAL_CHANNEL_CONFIG_1_6_SUPPORTED*: string {.`static`.}
  CAPABILITY_SIM_PHONEBOOK_IN_MODEM*: string {.`static`.}
  THERMAL_MITIGATION_RESULT_SUCCESS*: jint {.`static`.}
  THERMAL_MITIGATION_RESULT_MODEM_ERROR*: jint {.`static`.}
  THERMAL_MITIGATION_RESULT_MODEM_NOT_AVAILABLE*: jint {.`static`.}
  THERMAL_MITIGATION_RESULT_INVALID_STATE*: jint {.`static`.}
  THERMAL_MITIGATION_RESULT_UNKNOWN_ERROR*: jint {.`static`.}
  INCLUDE_LOCATION_DATA_NONE*: jint {.`static`.}
  INCLUDE_LOCATION_DATA_COARSE*: jint {.`static`.}
  INCLUDE_LOCATION_DATA_FINE*: jint {.`static`.}
  GBA_FAILURE_REASON_UNKNOWN*: jint {.`static`.}
  GBA_FAILURE_REASON_FEATURE_NOT_SUPPORTED*: jint {.`static`.}
  GBA_FAILURE_REASON_FEATURE_NOT_READY*: jint {.`static`.}
  GBA_FAILURE_REASON_NETWORK_FAILURE*: jint {.`static`.}
  GBA_FAILURE_REASON_INCORRECT_NAF_ID*: jint {.`static`.}
  GBA_FAILURE_REASON_SECURITY_PROTOCOL_NOT_SUPPORTED*: jint {.`static`.}
  PREPARE_UNATTENDED_REBOOT_SUCCESS*: jint {.`static`.}
  PREPARE_UNATTENDED_REBOOT_PIN_REQUIRED*: jint {.`static`.}
  PREPARE_UNATTENDED_REBOOT_ERROR*: jint {.`static`.}
  KEY_SLICING_CONFIG_HANDLE*: string {.`static`.}
  PREMIUM_CAPABILITY_PRIORITIZE_LATENCY*: jint {.`static`.}
  PURCHASE_PREMIUM_CAPABILITY_RESULT_SUCCESS*: jint {.`static`.}
  PURCHASE_PREMIUM_CAPABILITY_RESULT_THROTTLED*: jint {.`static`.}
  PURCHASE_PREMIUM_CAPABILITY_RESULT_ALREADY_PURCHASED*: jint {.`static`.}
  PURCHASE_PREMIUM_CAPABILITY_RESULT_ALREADY_IN_PROGRESS*: jint {.`static`.}
  PURCHASE_PREMIUM_CAPABILITY_RESULT_NOT_FOREGROUND*: jint {.`static`.}
  PURCHASE_PREMIUM_CAPABILITY_RESULT_USER_CANCELED*: jint {.`static`.}
  PURCHASE_PREMIUM_CAPABILITY_RESULT_CARRIER_DISABLED*: jint {.`static`.}
  PURCHASE_PREMIUM_CAPABILITY_RESULT_CARRIER_ERROR*: jint {.`static`.}
  PURCHASE_PREMIUM_CAPABILITY_RESULT_TIMEOUT*: jint {.`static`.}
  PURCHASE_PREMIUM_CAPABILITY_RESULT_FEATURE_NOT_SUPPORTED*: jint {.`static`.}
  PURCHASE_PREMIUM_CAPABILITY_RESULT_REQUEST_FAILED*: jint {.`static`.}
  PURCHASE_PREMIUM_CAPABILITY_RESULT_NETWORK_NOT_AVAILABLE*: jint {.`static`.}
  PURCHASE_PREMIUM_CAPABILITY_RESULT_ENTITLEMENT_CHECK_FAILED*: jint {.`static`.}
  PURCHASE_PREMIUM_CAPABILITY_RESULT_NOT_DEFAULT_DATA_SUBSCRIPTION*: jint {.`static`.}
  PURCHASE_PREMIUM_CAPABILITY_RESULT_PENDING_NETWORK_SETUP*: jint {.`static`.}
  PURCHASE_PREMIUM_CAPABILITY_RESULT_USER_DISABLED*: jint {.`static`.}
  CELL_BROADCAST_RESULT_UNKNOWN*: jint {.`static`.}
  CELL_BROADCAST_RESULT_SUCCESS*: jint {.`static`.}
  CELL_BROADCAST_RESULT_UNSUPPORTED*: jint {.`static`.}
  CELL_BROADCAST_RESULT_FAIL_CONFIG*: jint {.`static`.}
  CELL_BROADCAST_RESULT_FAIL_ACTIVATION*: jint {.`static`.}
  EMERGENCY_CALLBACK_MODE_CALL*: jint {.`static`.}
  EMERGENCY_CALLBACK_MODE_SMS*: jint {.`static`.}
  STOP_REASON_UNKNOWN*: jint {.`static`.}
  STOP_REASON_OUTGOING_NORMAL_CALL_INITIATED*: jint {.`static`.}
  STOP_REASON_NORMAL_SMS_SENT*: jint {.`static`.}
  STOP_REASON_OUTGOING_EMERGENCY_CALL_INITIATED*: jint {.`static`.}
  STOP_REASON_EMERGENCY_SMS_SENT*: jint {.`static`.}
  STOP_REASON_TIMER_EXPIRED*: jint {.`static`.}
  STOP_REASON_USER_ACTION*: jint {.`static`.}

jclass android.telephony.TelephonyManager.CallComposerException* of JVMObject:
  proc getErrorCode*(): jint
  proc getIOException*(): IOException

jclass android.telephony.TelephonyManager.CellInfoCallback* of JVMObject:
  proc onCellInfo*(cellInfo: List[CellInfo])
  proc onError*(errorCode: jint, detail: Throwable)

jclass android.telephony.TelephonyManager.UssdResponseCallback* of JVMObject:
  proc onReceiveUssdResponse*(telephonyManager: TelephonyManager, request: string, response: CharSequence)
  proc onReceiveUssdResponseFailed*(telephonyManager: TelephonyManager, request: string, failureCode: jint)

jclass android.telephony.TelephonyManager.ModemActivityInfoException* of JVMObject:
  proc getErrorCode*(): jint
  proc toString*(): string

jclass android.telephony.TelephonyManager.BootstrapAuthenticationCallback* of JVMObject:
  proc onKeysAvailable*(gbaKey: seq[jbyte], transactionId: string)
  proc onAuthenticationFailure*(reason: jint)

jclass android.telephony.TelephonyManager.NetworkSlicingException* of JVMObject:
  proc toString*(): string

jclass android.telephony.TelephonyManager.EmergencyCallDiagnosticData* of JVMObject:
  proc isTelecomDumpsysCollectionEnabled*(): jboolean
  proc isTelephonyDumpsysCollectionEnabled*(): jboolean
  proc isLogcatCollectionEnabled*(): jboolean
  proc getLogcatCollectionStartTimeMillis*(): jlong
  proc toString*(): string


jclass android.telephony.CallComposerException* of Exception:
  proc getErrorCode*(): jint
  proc getIOException*(): IOException
  SUCCESS*: jint {.`static`.}
  ERROR_UNKNOWN*: jint {.`static`.}
  ERROR_REMOTE_END_CLOSED*: jint {.`static`.}
  ERROR_FILE_TOO_LARGE*: jint {.`static`.}
  ERROR_AUTHENTICATION_FAILED*: jint {.`static`.}
  ERROR_INPUT_CLOSED*: jint {.`static`.}
  ERROR_IO_EXCEPTION*: jint {.`static`.}
  ERROR_NETWORK_UNAVAILABLE*: jint {.`static`.}

jclass android.telephony.CellInfoCallback* of JVMObject:
  proc onCellInfo*(cellInfo: List[CellInfo])
  proc onError*(errorCode: jint, detail: Throwable)
  ERROR_TIMEOUT*: jint {.`static`.}
  ERROR_MODEM_ERROR*: jint {.`static`.}

jclass android.telephony.UssdResponseCallback* of JVMObject:
  proc onReceiveUssdResponse*(telephonyManager: TelephonyManager, request: string, response: CharSequence)
  proc onReceiveUssdResponseFailed*(telephonyManager: TelephonyManager, request: string, failureCode: jint)

jclass android.telephony.ModemActivityInfoException* of Exception:
  proc getErrorCode*(): jint
  proc toString*(): string
  ERROR_UNKNOWN*: jint {.`static`.}
  ERROR_PHONE_NOT_AVAILABLE*: jint {.`static`.}
  ERROR_INVALID_INFO_RECEIVED*: jint {.`static`.}
  ERROR_MODEM_RESPONSE_ERROR*: jint {.`static`.}


jclass android.telephony.BootstrapAuthenticationCallback* of JVMObject:
  proc onKeysAvailable*(gbaKey: seq[jbyte], transactionId: string)
  proc onAuthenticationFailure*(reason: jint)

jclass android.telephony.NetworkSlicingException* of Exception:
  proc toString*(): string
  SUCCESS*: jint {.`static`.}
  ERROR_TIMEOUT*: jint {.`static`.}
  ERROR_MODEM_ERROR*: jint {.`static`.}

jclass android.telephony.TimeoutException* of NetworkSlicingException:

jclass android.telephony.ModemErrorException* of NetworkSlicingException:


jclass android.telephony.EmergencyCallDiagnosticData* of JVMObject:
  proc isTelecomDumpsysCollectionEnabled*(): jboolean
  proc isTelephonyDumpsysCollectionEnabled*(): jboolean
  proc isLogcatCollectionEnabled*(): jboolean
  proc getLogcatCollectionStartTimeMillis*(): jlong
  proc toString*(): string

jclass android.telephony.EmergencyCallDiagnosticData.Builder* of JVMObject:
  proc setTelecomDumpsysCollectionEnabled*(collectTelecomDumpsys: jboolean): Builder
  proc setTelephonyDumpsysCollectionEnabled*(collectTelephonyDumpsys: jboolean): Builder
  proc setLogcatCollectionStartTimeMillis*(startTimeMillis: jlong): Builder
  proc build*(): EmergencyCallDiagnosticData

jclass android.telephony.Builder* of JVMObject:
  proc setTelecomDumpsysCollectionEnabled*(collectTelecomDumpsys: jboolean): Builder
  proc setTelephonyDumpsysCollectionEnabled*(collectTelephonyDumpsys: jboolean): Builder
  proc setLogcatCollectionStartTimeMillis*(startTimeMillis: jlong): Builder
  proc build*(): EmergencyCallDiagnosticData

