import jnim

jclass android.credentials.GetCandidateCredentialsRequest* of JVMObject:
  proc getCredentialOptions*(): List[CredentialOption]
  proc getData*(): Bundle
  proc getOrigin*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  CREATOR*: Creator[GetCandidateCredentialsRequest] {.`static`.}

