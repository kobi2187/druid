import jnim

jclass android.telephony.VopsSupportInfo* of JVMObject:
  proc isVopsSupported*(): jboolean
  proc isEmergencyServiceSupported*(): jboolean
  proc isEmergencyServiceFallbackSupported*(): jboolean
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc hashCode*(): jint
  proc equals*(o: JObject): jboolean
  CREATOR*: Creator[VopsSupportInfo] {.`static`.}

