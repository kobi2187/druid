import jnim

jclass android.telephony.CallState* of JVMObject:
  proc toString*(): string
  proc getCallState*(): jint
  proc getNetworkType*(): jint
  proc getCallQuality*(): CallQuality
  proc getCallClassification*(): jint
  proc getImsCallSessionId*(): string
  proc getImsCallServiceType*(): jint
  proc getImsCallType*(): jint
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CALL_CLASSIFICATION_UNKNOWN*: jint {.`static`.}
  CALL_CLASSIFICATION_RINGING*: jint {.`static`.}
  CALL_CLASSIFICATION_FOREGROUND*: jint {.`static`.}
  CALL_CLASSIFICATION_BACKGROUND*: jint {.`static`.}
  CALL_CLASSIFICATION_MAX*: jint {.`static`.}
  CREATOR*: Creator[CallState] {.`static`.}

jclass android.telephony.CallState.Builder* of JVMObject:
  proc setNetworkType*(networkType: jint): CallState.Builder
  proc setCallQuality*(callQuality: CallQuality): CallState.Builder
  proc setCallClassification*(classification: jint): CallState.Builder
  proc setImsCallSessionId*(imsCallId: string): CallState.Builder
  proc setImsCallServiceType*(serviceType: jint): CallState.Builder
  proc setImsCallType*(callType: jint): CallState.Builder
  proc build*(): CallState

jclass android.telephony.Builder* of JVMObject:
  proc setNetworkType*(networkType: jint): CallState.Builder
  proc setCallQuality*(callQuality: CallQuality): CallState.Builder
  proc setCallClassification*(classification: jint): CallState.Builder
  proc setImsCallSessionId*(imsCallId: string): CallState.Builder
  proc setImsCallServiceType*(serviceType: jint): CallState.Builder
  proc setImsCallType*(callType: jint): CallState.Builder
  proc build*(): CallState

