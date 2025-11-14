import jnim

jclass android.credentials.Credential* of JVMObject:
  proc getType*(): string
  proc getData*(): Bundle
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  TYPE_PASSWORD_CREDENTIAL*: string {.`static`.}
  CREATOR*: Parcelable.Creator[Credential] {.`static`.}

