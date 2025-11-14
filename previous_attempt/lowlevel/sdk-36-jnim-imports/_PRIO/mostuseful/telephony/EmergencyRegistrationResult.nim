import jnim

jclass android.telephony.EmergencyRegistrationResult* of JVMObject:
  proc getAccessNetwork*(): jint
  proc getRegState*(): jint
  proc getDomain*(): jint
  proc isVopsSupported*(): jboolean
  proc isEmcBearerSupported*(): jboolean
  proc getNwProvidedEmc*(): jint
  proc getNwProvidedEmf*(): jint
  proc getMcc*(): string
  proc getMnc*(): string
  proc getCountryIso*(): string
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  CREATOR*: Creator[EmergencyRegistrationResult] {.`static`.}

