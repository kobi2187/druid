import jnim

jclass android.telephony.PhoneNumberRange* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc matches*(number: string): jboolean
  CREATOR*: Creator[PhoneNumberRange] {.`static`.}

