import jnim

jclass android.safetycenter.SafetySourceErrorDetails* of JVMObject:
  proc getSafetyEvent*(): SafetyEvent
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[SafetySourceErrorDetails] {.`static`.}

