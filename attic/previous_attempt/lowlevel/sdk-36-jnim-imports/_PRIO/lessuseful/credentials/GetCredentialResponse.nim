import jnim

jclass android.credentials.GetCredentialResponse* of JVMObject:
  proc getCredential*(): Credential
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  proc getAutofillId*(): AutofillId
  CREATOR*: Parcelable.Creator[GetCredentialResponse] {.`static`.}

