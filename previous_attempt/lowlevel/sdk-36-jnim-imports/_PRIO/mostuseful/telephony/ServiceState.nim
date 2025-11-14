import jnim

jclass android.telephony.ServiceState* of JVMObject:
  proc getRoamingLogString*(roamingType: jint): string {.`static`.}
  proc newFromBundle*(m: Bundle): ServiceState {.`static`.}
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  proc getState*(): jint
  proc getVoiceRegState*(): jint
  proc getDataRegState*(): jint
  proc getDataRegistrationState*(): jint
  proc getDuplexMode*(): jint
  proc getChannelNumber*(): jint
  proc getCellBandwidths*(): seq[jint]
  proc getRoaming*(): jboolean
  proc getVoiceRoaming*(): jboolean
  proc getVoiceRoamingType*(): jint
  proc getDataRoaming*(): jboolean
  proc setDataRoamingFromRegistration*(dataRoaming: jboolean)
  proc getDataRoamingFromRegistration*(): jboolean
  proc getDataRoamingType*(): jint
  proc isEmergencyOnly*(): jboolean
  proc getCdmaRoamingIndicator*(): jint
  proc getCdmaDefaultRoamingIndicator*(): jint
  proc getCdmaEriIconIndex*(): jint
  proc getCdmaEriIconMode*(): jint
  proc getOperatorAlphaLong*(): string
  proc getVoiceOperatorAlphaLong*(): string
  proc getOperatorAlphaShort*(): string
  proc getVoiceOperatorAlphaShort*(): string
  proc getDataOperatorAlphaShort*(): string
  proc getOperatorAlpha*(): string
  proc getOperatorNumeric*(): string
  proc getVoiceOperatorNumeric*(): string
  proc getDataOperatorNumeric*(): string
  proc getIsManualSelection*(): jboolean
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc roamingTypeToString*(roamingType: jint): string {.`static`.}
  proc rilRadioTechnologyToString*(rt: jint): string {.`static`.}
  proc frequencyRangeToString*(range: jint): string {.`static`.}
  proc rilServiceStateToString*(serviceState: jint): string {.`static`.}
  proc toString*(): string
  proc setStateOutOfService*()
  proc setStateOff*()
  proc setOutOfService*(powerOff: jboolean)
  proc setState*(state: jint)
  proc setVoiceRegState*(state: jint)
  proc setDataRegState*(state: jint)
  proc setCellBandwidths*(bandwidths: seq[jint])
  proc setChannelNumber*(channelNumber: jint)
  proc setRoaming*(roaming: jboolean)
  proc setVoiceRoaming*(roaming: jboolean)
  proc setVoiceRoamingType*(type: jint)
  proc setDataRoaming*(dataRoaming: jboolean)
  proc setDataRoamingType*(type: jint)
  proc setEmergencyOnly*(emergencyOnly: jboolean)
  proc setCdmaRoamingIndicator*(roaming: jint)
  proc setCdmaDefaultRoamingIndicator*(roaming: jint)
  proc setCdmaEriIconIndex*(index: jint)
  proc setCdmaEriIconMode*(mode: jint)
  proc setOperatorName*(longName: string, shortName: string, numeric: string)
  proc setOperatorAlphaLong*(longName: string)
  proc setIsManualSelection*(isManual: jboolean)
  proc fillInNotifierBundle*(m: Bundle)
  proc setRilVoiceRadioTechnology*(rt: jint)
  proc setRilDataRadioTechnology*(rt: jint)
  proc isUsingCarrierAggregation*(): jboolean
  proc getNrFrequencyRange*(): jint
  proc getNrState*(): jint
  proc setNrFrequencyRange*(nrFrequencyRange: jint)
  proc getArfcnRsrpBoost*(): jint
  proc setArfcnRsrpBoost*(arfcnRsrpBoost: jint)
  proc setCssIndicator*(css: jint)
  proc setCdmaSystemAndNetworkId*(systemId: jint, networkId: jint)
  proc getRilVoiceRadioTechnology*(): jint
  proc getRilDataRadioTechnology*(): jint
  proc rilRadioTechnologyToNetworkType*(rat: jint): jint {.`static`.}
  proc rilRadioTechnologyToAccessNetworkType*(rt: jint): jint {.`static`.}
  proc networkTypeToRilRadioTechnology*(networkType: jint): jint {.`static`.}
  proc getDataNetworkType*(): jint
  proc getVoiceNetworkType*(): jint
  proc getCssIndicator*(): jint
  proc getCdmaNetworkId*(): jint
  proc getCdmaSystemId*(): jint
  proc isGsm*(radioTechnology: jint): jboolean {.`static`.}
  proc isCdma*(radioTechnology: jint): jboolean {.`static`.}
  proc isPsOnlyTech*(radioTechnology: jint): jboolean {.`static`.}
  proc bearerBitmapHasCdma*(networkTypeBitmask: jint): jboolean {.`static`.}
  proc bitmaskHasTech*(bearerBitmask: jint, radioTech: jint): jboolean {.`static`.}
  proc getBitmaskForTech*(radioTech: jint): jint {.`static`.}
  proc getBitmaskFromString*(bearerList: string): jint {.`static`.}
  proc convertNetworkTypeBitmaskToBearerBitmask*(networkTypeBitmask: jint): jint {.`static`.}
  proc convertBearerBitmaskToNetworkTypeBitmask*(bearerBitmask: jint): jint {.`static`.}
  proc mergeServiceStates*(baseSs: ServiceState, voiceSs: ServiceState): ServiceState {.`static`.}
  proc getNetworkRegistrationInfoList*(): List[NetworkRegistrationInfo]
  proc getNetworkRegistrationInfoListForTransportType*(transportType: jint): List[NetworkRegistrationInfo]
  proc getNetworkRegistrationInfoListForDomain*(domain: jint): List[NetworkRegistrationInfo]
  proc getNetworkRegistrationInfo*(domain: jint, transportType: jint): NetworkRegistrationInfo
  proc addNetworkRegistrationInfo*(nri: NetworkRegistrationInfo)
  proc createLocationInfoSanitizedCopy*(removeCoarseLocation: jboolean): ServiceState
  proc setOperatorAlphaLongRaw*(operatorAlphaLong: string)
  proc getOperatorAlphaLongRaw*(): string
  proc setOperatorAlphaShortRaw*(operatorAlphaShort: string)
  proc getOperatorAlphaShortRaw*(): string
  proc setIwlanPreferred*(isIwlanPreferred: jboolean)
  proc isIwlanPreferred*(): jboolean
  proc isSearching*(): jboolean
  proc isFrequencyRangeValid*(frequencyRange: jint): jboolean {.`static`.}
  proc isUsingNonTerrestrialNetwork*(): jboolean
  STATE_IN_SERVICE*: jint {.`static`.}
  STATE_OUT_OF_SERVICE*: jint {.`static`.}
  STATE_EMERGENCY_ONLY*: jint {.`static`.}
  STATE_POWER_OFF*: jint {.`static`.}
  FREQUENCY_RANGE_UNKNOWN*: jint {.`static`.}
  FREQUENCY_RANGE_LOW*: jint {.`static`.}
  FREQUENCY_RANGE_MID*: jint {.`static`.}
  FREQUENCY_RANGE_HIGH*: jint {.`static`.}
  FREQUENCY_RANGE_MMWAVE*: jint {.`static`.}
  FREQUENCY_RANGE_COUNT*: jint {.`static`.}
  DUPLEX_MODE_UNKNOWN*: jint {.`static`.}
  DUPLEX_MODE_FDD*: jint {.`static`.}
  DUPLEX_MODE_TDD*: jint {.`static`.}
  RIL_RADIO_TECHNOLOGY_UNKNOWN*: jint {.`static`.}
  RIL_RADIO_TECHNOLOGY_GPRS*: jint {.`static`.}
  RIL_RADIO_TECHNOLOGY_EDGE*: jint {.`static`.}
  RIL_RADIO_TECHNOLOGY_UMTS*: jint {.`static`.}
  RIL_RADIO_TECHNOLOGY_IS95A*: jint {.`static`.}
  RIL_RADIO_TECHNOLOGY_IS95B*: jint {.`static`.}
  RIL_RADIO_TECHNOLOGY_1xRTT*: jint {.`static`.}
  RIL_RADIO_TECHNOLOGY_EVDO_0*: jint {.`static`.}
  RIL_RADIO_TECHNOLOGY_EVDO_A*: jint {.`static`.}
  RIL_RADIO_TECHNOLOGY_HSDPA*: jint {.`static`.}
  RIL_RADIO_TECHNOLOGY_HSUPA*: jint {.`static`.}
  RIL_RADIO_TECHNOLOGY_HSPA*: jint {.`static`.}
  RIL_RADIO_TECHNOLOGY_EVDO_B*: jint {.`static`.}
  RIL_RADIO_TECHNOLOGY_EHRPD*: jint {.`static`.}
  RIL_RADIO_TECHNOLOGY_LTE*: jint {.`static`.}
  RIL_RADIO_TECHNOLOGY_HSPAP*: jint {.`static`.}
  RIL_RADIO_TECHNOLOGY_GSM*: jint {.`static`.}
  RIL_RADIO_TECHNOLOGY_TD_SCDMA*: jint {.`static`.}
  RIL_RADIO_TECHNOLOGY_IWLAN*: jint {.`static`.}
  RIL_RADIO_TECHNOLOGY_LTE_CA*: jint {.`static`.}
  RIL_RADIO_TECHNOLOGY_NR*: jint {.`static`.}
  RIL_RADIO_CDMA_TECHNOLOGY_BITMASK*: jint {.`static`.}
  ROAMING_TYPE_NOT_ROAMING*: jint {.`static`.}
  ROAMING_TYPE_UNKNOWN*: jint {.`static`.}
  ROAMING_TYPE_DOMESTIC*: jint {.`static`.}
  ROAMING_TYPE_INTERNATIONAL*: jint {.`static`.}
  UNKNOWN_ID*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[ServiceState] {.`static`.}

