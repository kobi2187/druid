import jnim

jclass android.uwb.SessionHandle* of JVMObject:
  proc getId*(): jint
  proc getPackageName*(): string
  proc getUid*(): jint
  proc getPid*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Creator[SessionHandle] {.`static`.}

