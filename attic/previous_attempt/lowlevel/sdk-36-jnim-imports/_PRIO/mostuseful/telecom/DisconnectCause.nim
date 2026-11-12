import jnim

jclass android.telecom.DisconnectCause* of JVMObject:
  proc getCode*(): jint
  proc getLabel*(): CharSequence
  proc getDescription*(): CharSequence
  proc getReason*(): string
  proc getTelephonyDisconnectCause*(): jint
  proc getTelephonyPreciseDisconnectCause*(): jint
  proc getImsReasonInfo*(): ImsReasonInfo
  proc getTone*(): jint
  proc writeToParcel*(destination: Parcel, flags: jint)
  proc describeContents*(): jint
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  UNKNOWN*: jint {.`static`.}
  ERROR*: jint {.`static`.}
  LOCAL*: jint {.`static`.}
  REMOTE*: jint {.`static`.}
  CANCELED*: jint {.`static`.}
  MISSED*: jint {.`static`.}
  REJECTED*: jint {.`static`.}
  BUSY*: jint {.`static`.}
  RESTRICTED*: jint {.`static`.}
  OTHER*: jint {.`static`.}
  CONNECTION_MANAGER_NOT_SUPPORTED*: jint {.`static`.}
  ANSWERED_ELSEWHERE*: jint {.`static`.}
  CALL_PULLED*: jint {.`static`.}
  REASON_WIFI_ON_BUT_WFC_OFF*: string {.`static`.}
  REASON_IMS_ACCESS_BLOCKED*: string {.`static`.}
  REASON_EMULATING_SINGLE_CALL*: string {.`static`.}
  REASON_EMERGENCY_CALL_PLACED*: string {.`static`.}
  CREATOR*: Creator[DisconnectCause] {.`static`.}

jclass android.telecom.DisconnectCause.Builder* of JVMObject:
  proc setLabel*(label: CharSequence): DisconnectCause.Builder
  proc setDescription*(description: CharSequence): DisconnectCause.Builder
  proc setReason*(reason: string): DisconnectCause.Builder
  proc setTone*(toneToPlay: jint): DisconnectCause.Builder
  proc setTelephonyDisconnectCause*(telephonyDisconnectCause: jint): DisconnectCause.Builder
  proc setTelephonyPreciseDisconnectCause*(telephonyPreciseDisconnectCause: jint): DisconnectCause.Builder
  proc setImsReasonInfo*(imsReasonInfo: ImsReasonInfo): DisconnectCause.Builder
  proc build*(): DisconnectCause

jclass android.telecom.Builder* of JVMObject:
  proc setLabel*(label: CharSequence): DisconnectCause.Builder
  proc setDescription*(description: CharSequence): DisconnectCause.Builder
  proc setReason*(reason: string): DisconnectCause.Builder
  proc setTone*(toneToPlay: jint): DisconnectCause.Builder
  proc setTelephonyDisconnectCause*(telephonyDisconnectCause: jint): DisconnectCause.Builder
  proc setTelephonyPreciseDisconnectCause*(telephonyPreciseDisconnectCause: jint): DisconnectCause.Builder
  proc setImsReasonInfo*(imsReasonInfo: ImsReasonInfo): DisconnectCause.Builder
  proc build*(): DisconnectCause

