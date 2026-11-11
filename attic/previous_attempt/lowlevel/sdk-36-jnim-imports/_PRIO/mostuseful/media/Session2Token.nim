import jnim

jclass android.media.Session2Token* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc toString*(): string
  proc getUid*(): jint
  proc getPackageName*(): string
  proc getServiceName*(): string
  proc getType*(): jint
  proc getExtras*(): Bundle
  CREATOR*: Creator[Session2Token] {.`static`.}
  TYPE_SESSION*: jint {.`static`.}
  TYPE_SESSION_SERVICE*: jint {.`static`.}

