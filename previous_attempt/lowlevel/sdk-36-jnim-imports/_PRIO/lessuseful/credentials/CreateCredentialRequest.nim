import jnim

jclass android.credentials.CreateCredentialRequest* of JVMObject:
  proc getType*(): string
  proc getCredentialData*(): Bundle
  proc getCandidateQueryData*(): Bundle
  proc isSystemProviderRequired*(): jboolean
  proc alwaysSendAppInfoToProvider*(): jboolean
  proc getOrigin*(): string
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  CREATOR*: Parcelable.Creator[CreateCredentialRequest] {.`static`.}

jclass android.credentials.CreateCredentialRequest.Builder* of JVMObject:
  proc setAlwaysSendAppInfoToProvider*(value: jboolean): CreateCredentialRequest.Builder
  proc setIsSystemProviderRequired*(value: jboolean): CreateCredentialRequest.Builder
  proc setOrigin*(origin: string): CreateCredentialRequest.Builder
  proc build*(): CreateCredentialRequest

jclass android.credentials.Builder* of JVMObject:
  proc setAlwaysSendAppInfoToProvider*(value: jboolean): CreateCredentialRequest.Builder
  proc setIsSystemProviderRequired*(value: jboolean): CreateCredentialRequest.Builder
  proc setOrigin*(origin: string): CreateCredentialRequest.Builder
  proc build*(): CreateCredentialRequest

