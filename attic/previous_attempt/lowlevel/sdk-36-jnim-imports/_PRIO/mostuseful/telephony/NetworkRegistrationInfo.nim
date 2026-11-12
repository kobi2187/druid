import jnim

jclass android.telephony.NetworkRegistrationInfo* of JVMObject:
  proc getTransportType*(): jint
  proc getDomain*(): jint
  proc getNrState*(): jint
  proc setNrState*(nrState: jint)
  proc getRegistrationState*(): jint
  proc getNetworkRegistrationState*(): jint
  proc isRegistered*(): jboolean
  proc isNetworkRegistered*(): jboolean
  proc isSearching*(): jboolean
  proc isNetworkSearching*(): jboolean
  proc getRegisteredPlmn*(): string
  proc isRoaming*(): jboolean
  proc isNetworkRoaming*(): jboolean
  proc isInService*(): jboolean
  proc setRoamingType*(roamingType: jint)
  proc getRoamingType*(): jint
  proc isEmergencyEnabled*(): jboolean
  proc getAvailableServices*(): List[Integer]
  proc setAvailableServices*(availableServices: List[Integer])
  proc getAccessNetworkTechnology*(): jint
  proc setAccessNetworkTechnology*(tech: jint)
  proc getRejectCause*(): jint
  proc getCellIdentity*(): CellIdentity
  proc setIsUsingCarrierAggregation*(isUsingCarrierAggregation: jboolean)
  proc isUsingCarrierAggregation*(): jboolean
  proc setIsNonTerrestrialNetwork*(isNonTerrestrialNetwork: jboolean)
  proc isNonTerrestrialNetwork*(): jboolean
  proc getVoiceSpecificInfo*(): VoiceSpecificRegistrationInfo
  proc getDataSpecificInfo*(): DataSpecificRegistrationInfo
  proc describeContents*(): jint
  proc serviceTypeToString*(serviceType: jint): string {.`static`.}
  proc registrationStateToString*(registrationState: jint): string {.`static`.}
  proc nrStateToString*(nrState: jint): string {.`static`.}
  proc isNonTerrestrialNetworkToString*(isNonTerrestrialNetwork: jboolean): string {.`static`.}
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc updateNrState*()
  proc sanitizeLocationInfo*(): NetworkRegistrationInfo
  RETURN_REGISTRATION_STATE_EMERGENCY*: jlong {.`static`.}
  DOMAIN_UNKNOWN*: jint {.`static`.}
  DOMAIN_CS*: jint {.`static`.}
  DOMAIN_PS*: jint {.`static`.}
  DOMAIN_CS_PS*: jint {.`static`.}
  REGISTRATION_STATE_NOT_REGISTERED_OR_SEARCHING*: jint {.`static`.}
  REGISTRATION_STATE_HOME*: jint {.`static`.}
  REGISTRATION_STATE_NOT_REGISTERED_SEARCHING*: jint {.`static`.}
  REGISTRATION_STATE_DENIED*: jint {.`static`.}
  REGISTRATION_STATE_UNKNOWN*: jint {.`static`.}
  REGISTRATION_STATE_ROAMING*: jint {.`static`.}
  REGISTRATION_STATE_EMERGENCY*: jint {.`static`.}
  NR_STATE_NONE*: jint {.`static`.}
  NR_STATE_RESTRICTED*: jint {.`static`.}
  NR_STATE_NOT_RESTRICTED*: jint {.`static`.}
  NR_STATE_CONNECTED*: jint {.`static`.}
  SERVICE_TYPE_UNKNOWN*: jint {.`static`.}
  SERVICE_TYPE_VOICE*: jint {.`static`.}
  SERVICE_TYPE_DATA*: jint {.`static`.}
  SERVICE_TYPE_SMS*: jint {.`static`.}
  SERVICE_TYPE_VIDEO*: jint {.`static`.}
  SERVICE_TYPE_EMERGENCY*: jint {.`static`.}
  SERVICE_TYPE_MMS*: jint {.`static`.}
  FIRST_SERVICE_TYPE*: jint {.`static`.}
  LAST_SERVICE_TYPE*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[NetworkRegistrationInfo] {.`static`.}

jclass android.telephony.NetworkRegistrationInfo.Builder* of JVMObject:
  proc setDomain*(domain: jint): Builder
  proc setTransportType*(transportType: jint): Builder
  proc setRegistrationState*(registrationState: jint): Builder
  proc setAccessNetworkTechnology*(accessNetworkTechnology: jint): Builder
  proc setRejectCause*(rejectCause: jint): Builder
  proc setEmergencyOnly*(emergencyOnly: jboolean): Builder
  proc setAvailableServices*(availableServices: List[Integer]): Builder
  proc setCellIdentity*(cellIdentity: CellIdentity): Builder
  proc setRegisteredPlmn*(rplmn: string): Builder
  proc setVoiceSpecificInfo*(info: VoiceSpecificRegistrationInfo): Builder
  proc setDataSpecificInfo*(info: DataSpecificRegistrationInfo): Builder
  proc setIsNonTerrestrialNetwork*(isNonTerrestrialNetwork: jboolean): Builder
  proc build*(): NetworkRegistrationInfo

jclass android.telephony.Builder* of JVMObject:
  proc setDomain*(domain: jint): Builder
  proc setTransportType*(transportType: jint): Builder
  proc setRegistrationState*(registrationState: jint): Builder
  proc setAccessNetworkTechnology*(accessNetworkTechnology: jint): Builder
  proc setRejectCause*(rejectCause: jint): Builder
  proc setEmergencyOnly*(emergencyOnly: jboolean): Builder
  proc setAvailableServices*(availableServices: List[Integer]): Builder
  proc setCellIdentity*(cellIdentity: CellIdentity): Builder
  proc setRegisteredPlmn*(rplmn: string): Builder
  proc setVoiceSpecificInfo*(info: VoiceSpecificRegistrationInfo): Builder
  proc setDataSpecificInfo*(info: DataSpecificRegistrationInfo): Builder
  proc setIsNonTerrestrialNetwork*(isNonTerrestrialNetwork: jboolean): Builder
  proc build*(): NetworkRegistrationInfo

