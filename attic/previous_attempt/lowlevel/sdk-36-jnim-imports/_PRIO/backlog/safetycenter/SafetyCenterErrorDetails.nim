import jnim

jclass android.safetycenter.SafetyCenterErrorDetails* of JVMObject:
  proc getErrorMessage*(): CharSequence
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[SafetyCenterErrorDetails] {.`static`.}

