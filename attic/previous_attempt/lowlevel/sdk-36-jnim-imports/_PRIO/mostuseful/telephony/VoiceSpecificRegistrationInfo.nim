import jnim

jclass android.telephony.VoiceSpecificRegistrationInfo* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  cssSupported*: jboolean
  roamingIndicator*: jint
  systemIsInPrl*: jint
  defaultRoamingIndicator*: jint
  CREATOR*: Parcelable.Creator[VoiceSpecificRegistrationInfo] {.`static`.}

