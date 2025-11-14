import jnim

jclass android.telephony.PreciseDataConnectionState* of JVMObject:
  proc getDataConnectionState*(): jint
  proc getTransportType*(): jint
  proc getId*(): jint
  proc getNetId*(): jint
  proc getState*(): jint
  proc getNetworkType*(): jint
  proc getDataConnectionApnTypeBitMask*(): jint
  proc getDataConnectionApn*(): string
  proc getLinkProperties*(): LinkProperties
  proc getDataConnectionFailCause*(): jint
  proc getLastCauseCode*(): jint
  proc getApnSetting*(): ApnSetting
  proc getDefaultQos*(): Qos
  proc getNetworkValidationStatus*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  proc networkValidationStatusToString*(networkValidationStatus: jint): string {.`static`.}
  NETWORK_VALIDATION_UNSUPPORTED*: jint {.`static`.}
  NETWORK_VALIDATION_NOT_REQUESTED*: jint {.`static`.}
  NETWORK_VALIDATION_IN_PROGRESS*: jint {.`static`.}
  NETWORK_VALIDATION_SUCCESS*: jint {.`static`.}
  NETWORK_VALIDATION_FAILURE*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[PreciseDataConnectionState] {.`static`.}

jclass android.telephony.PreciseDataConnectionState.Builder* of JVMObject:
  proc setTransportType*(transportType: jint): Builder
  proc setId*(id: jint): Builder
  proc setNetworkAgentId*(agentId: jint): Builder
  proc setState*(state: jint): Builder
  proc setNetworkType*(networkType: jint): Builder
  proc setLinkProperties*(linkProperties: LinkProperties): Builder
  proc setFailCause*(failCause: jint): Builder
  proc setApnSetting*(apnSetting: ApnSetting): Builder
  proc setDefaultQos*(qos: Qos): Builder
  proc setNetworkValidationStatus*(networkValidationStatus: jint): Builder
  proc build*(): PreciseDataConnectionState

jclass android.telephony.Builder* of JVMObject:
  proc setTransportType*(transportType: jint): Builder
  proc setId*(id: jint): Builder
  proc setNetworkAgentId*(agentId: jint): Builder
  proc setState*(state: jint): Builder
  proc setNetworkType*(networkType: jint): Builder
  proc setLinkProperties*(linkProperties: LinkProperties): Builder
  proc setFailCause*(failCause: jint): Builder
  proc setApnSetting*(apnSetting: ApnSetting): Builder
  proc setDefaultQos*(qos: Qos): Builder
  proc setNetworkValidationStatus*(networkValidationStatus: jint): Builder
  proc build*(): PreciseDataConnectionState

