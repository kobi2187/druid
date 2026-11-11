import jnim

jclass android.ranging.SessionHandle* of JVMObject:
  proc getId*(): jlong
  proc getPackageName*(): string
  proc getUid*(): jint
  proc getPid*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Creator[SessionHandle] {.`static`.}

