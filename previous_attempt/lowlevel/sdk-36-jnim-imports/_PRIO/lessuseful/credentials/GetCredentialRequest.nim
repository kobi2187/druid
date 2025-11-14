import jnim

jclass android.credentials.GetCredentialRequest* of JVMObject:
  proc getCredentialOptions*(): List[CredentialOption]
  proc getData*(): Bundle
  proc getOrigin*(): string
  proc alwaysSendAppInfoToProvider*(): jboolean
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  CREATOR*: Parcelable.Creator[GetCredentialRequest] {.`static`.}

jclass android.credentials.GetCredentialRequest.Builder* of JVMObject:
  proc addCredentialOption*(credentialOption: CredentialOption): Builder
  proc setAlwaysSendAppInfoToProvider*(value: jboolean): Builder
  proc setCredentialOptions*(credentialOptions: List[CredentialOption]): Builder
  proc setOrigin*(origin: string): Builder
  proc build*(): GetCredentialRequest

jclass android.credentials.Builder* of JVMObject:
  proc addCredentialOption*(credentialOption: CredentialOption): Builder
  proc setAlwaysSendAppInfoToProvider*(value: jboolean): Builder
  proc setCredentialOptions*(credentialOptions: List[CredentialOption]): Builder
  proc setOrigin*(origin: string): Builder
  proc build*(): GetCredentialRequest

