import jnim

jclass android.telephony.DomainSelectionService* of Service:
  proc onDomainSelection*(attr: SelectionAttributes, callback: TransportSelectorCallback)
  proc onServiceStateUpdated*(slotIndex: jint, subscriptionId: jint, serviceState: ServiceState)
  proc onBarringInfoUpdated*(slotIndex: jint, subscriptionId: jint, info: BarringInfo)
  proc onBind*(intent: Intent): IBinder
  proc getCreateExecutor*(): Executor
  proc getCachedExecutor*(): Executor
  proc getDomainName*(domain: jint): string {.`static`.}
  SERVICE_INTERFACE*: string {.`static`.}
  SELECTOR_TYPE_CALLING*: jint {.`static`.}
  SELECTOR_TYPE_SMS*: jint {.`static`.}
  SCAN_TYPE_NO_PREFERENCE*: jint {.`static`.}
  SCAN_TYPE_LIMITED_SERVICE*: jint {.`static`.}
  SCAN_TYPE_FULL_SERVICE*: jint {.`static`.}

jclass android.telephony.DomainSelectionService.SelectionAttributes* of JVMObject:
  proc getSlotIndex*(): jint
  proc getSubscriptionId*(): jint
  proc getCallId*(): string
  proc getAddress*(): Uri
  proc getSelectorType*(): jint
  proc isVideoCall*(): jboolean
  proc isEmergency*(): jboolean
  proc isTestEmergencyNumber*(): jboolean
  proc isExitedFromAirplaneMode*(): jboolean
  proc getPsDisconnectCause*(): ImsReasonInfo
  proc getCsDisconnectCause*(): jint
  proc getEmergencyRegistrationResult*(): EmergencyRegistrationResult
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)

jclass android.telephony.SelectionAttributes* of JVMObject:
  proc getSlotIndex*(): jint
  proc getSubscriptionId*(): jint
  proc getCallId*(): string
  proc getAddress*(): Uri
  proc getSelectorType*(): jint
  proc isVideoCall*(): jboolean
  proc isEmergency*(): jboolean
  proc isTestEmergencyNumber*(): jboolean
  proc isExitedFromAirplaneMode*(): jboolean
  proc getPsDisconnectCause*(): ImsReasonInfo
  proc getCsDisconnectCause*(): jint
  proc getEmergencyRegistrationResult*(): EmergencyRegistrationResult
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  CREATOR*: Creator[SelectionAttributes] {.`static`.}

jclass android.telephony.SelectionAttributes.Builder* of JVMObject:
  proc setCallId*(callId: string): Builder
  proc setAddress*(address: Uri): Builder
  proc setVideoCall*(isVideo: jboolean): Builder
  proc setEmergency*(isEmergency: jboolean): Builder
  proc setTestEmergencyNumber*(isTest: jboolean): Builder
  proc setExitedFromAirplaneMode*(exited: jboolean): Builder
  proc setPsDisconnectCause*(info: ImsReasonInfo): Builder
  proc setCsDisconnectCause*(cause: jint): Builder
  proc setEmergencyRegistrationResult*(regResult: EmergencyRegistrationResult): Builder
  proc build*(): SelectionAttributes

jclass android.telephony.Builder* of JVMObject:
  proc setCallId*(callId: string): Builder
  proc setAddress*(address: Uri): Builder
  proc setVideoCall*(isVideo: jboolean): Builder
  proc setEmergency*(isEmergency: jboolean): Builder
  proc setTestEmergencyNumber*(isTest: jboolean): Builder
  proc setExitedFromAirplaneMode*(exited: jboolean): Builder
  proc setPsDisconnectCause*(info: ImsReasonInfo): Builder
  proc setCsDisconnectCause*(cause: jint): Builder
  proc setEmergencyRegistrationResult*(regResult: EmergencyRegistrationResult): Builder
  proc build*(): SelectionAttributes

