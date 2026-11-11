import jnim

jclass android.credentials.ClearCredentialStateRequest* of JVMObject:
  proc getData*(): Bundle
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  CREATOR*: Creator[ClearCredentialStateRequest] {.`static`.}

