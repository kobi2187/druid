import jnim

jclass android.credentials.CredentialOption* of JVMObject:
  proc getType*(): string
  proc getCredentialRetrievalData*(): Bundle
  proc getCandidateQueryData*(): Bundle
  proc isSystemProviderRequired*(): jboolean
  proc getAllowedProviders*(): Set[ComponentName]
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  SUPPORTED_ELEMENT_KEYS*: string {.`static`.}
  CREATOR*: Parcelable.Creator[CredentialOption] {.`static`.}

jclass android.credentials.CredentialOption.Builder* of JVMObject:
  proc setIsSystemProviderRequired*(isSystemProviderRequired: jboolean): Builder
  proc addAllowedProvider*(allowedProvider: ComponentName): Builder
  proc setAllowedProviders*(allowedProviders: Set[ComponentName]): Builder
  proc build*(): CredentialOption

jclass android.credentials.Builder* of JVMObject:
  proc setIsSystemProviderRequired*(isSystemProviderRequired: jboolean): Builder
  proc addAllowedProvider*(allowedProvider: ComponentName): Builder
  proc setAllowedProviders*(allowedProviders: Set[ComponentName]): Builder
  proc build*(): CredentialOption

