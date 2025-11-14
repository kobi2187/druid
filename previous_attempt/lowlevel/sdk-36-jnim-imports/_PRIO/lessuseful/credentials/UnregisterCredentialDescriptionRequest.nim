import jnim

jclass android.credentials.UnregisterCredentialDescriptionRequest* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getCredentialDescriptions*(): Set[CredentialDescription]
  CREATOR*: Parcelable.Creator[UnregisterCredentialDescriptionRequest] {.`static`.}

