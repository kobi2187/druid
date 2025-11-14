import jnim

jclass android.telecom.CallAttributes* of JVMObject:
  proc getPhoneAccountHandle*(): PhoneAccountHandle
  proc getDisplayName*(): CharSequence
  proc getAddress*(): Uri
  proc getDirection*(): jint
  proc getCallType*(): jint
  proc getCallCapabilities*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  CALL_CAPABILITIES_KEY*: string {.`static`.}
  DISPLAY_NAME_KEY*: string {.`static`.}
  CALLER_PID_KEY*: string {.`static`.}
  CALLER_UID_KEY*: string {.`static`.}
  DIRECTION_INCOMING*: jint {.`static`.}
  DIRECTION_OUTGOING*: jint {.`static`.}
  AUDIO_CALL*: jint {.`static`.}
  VIDEO_CALL*: jint {.`static`.}
  SUPPORTS_SET_INACTIVE*: jint {.`static`.}
  SUPPORTS_STREAM*: jint {.`static`.}
  SUPPORTS_TRANSFER*: jint {.`static`.}
  SUPPORTS_VIDEO_CALLING*: jint {.`static`.}
  CREATOR*: Parcelable.Creator[CallAttributes] {.`static`.}

jclass android.telecom.CallAttributes.Builder* of JVMObject:
  proc setCallType*(callType: jint): Builder
  proc setCallCapabilities*(callCapabilities: jint): Builder
  proc build*(): CallAttributes

jclass android.telecom.Builder* of JVMObject:
  proc setCallType*(callType: jint): Builder
  proc setCallCapabilities*(callCapabilities: jint): Builder
  proc build*(): CallAttributes

