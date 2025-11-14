import jnim

jclass android.credentials.CreateCredentialResponse* of JVMObject:
  proc getData*(): Bundle
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  CREATOR*: Parcelable.Creator[CreateCredentialResponse] {.`static`.}

