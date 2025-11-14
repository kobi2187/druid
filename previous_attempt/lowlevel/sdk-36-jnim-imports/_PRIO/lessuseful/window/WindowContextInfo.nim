import jnim

jclass android.window.WindowContextInfo* of JVMObject:
  proc getConfiguration*(): Configuration
  proc getDisplayId*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Creator[WindowContextInfo] {.`static`.}

