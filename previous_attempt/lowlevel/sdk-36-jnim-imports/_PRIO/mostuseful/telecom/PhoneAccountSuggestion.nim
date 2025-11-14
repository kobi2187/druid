import jnim

jclass android.telecom.PhoneAccountSuggestion* of JVMObject:
  proc getPhoneAccountHandle*(): PhoneAccountHandle
  proc getReason*(): jint
  proc shouldAutoSelect*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  REASON_NONE*: jint {.`static`.}
  REASON_INTRA_CARRIER*: jint {.`static`.}
  REASON_FREQUENT*: jint {.`static`.}
  REASON_USER_SET*: jint {.`static`.}
  REASON_OTHER*: jint {.`static`.}
  CREATOR*: Creator[PhoneAccountSuggestion] {.`static`.}

