import jnim

jclass android.content.UriPermission* of JVMObject:
  proc getUri*(): Uri
  proc isReadPermission*(): jboolean
  proc isWritePermission*(): jboolean
  proc getPersistedTime*(): jlong
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  INVALID_TIME*: jlong {.`static`.}
  CREATOR*: Creator[UriPermission] {.`static`.}

