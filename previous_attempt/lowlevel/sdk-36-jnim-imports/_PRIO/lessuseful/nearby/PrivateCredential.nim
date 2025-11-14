import jnim

jclass android.nearby.PrivateCredential* of PresenceCredential:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getMetadataEncryptionKey*(): seq[jbyte]
  proc getDeviceName*(): string
  CREATOR*: Creator[PrivateCredential] {.`static`.}

jclass android.nearby.PrivateCredential.Builder* of JVMObject:
  proc setIdentityType*(identityType: jint): Builder
  proc addCredentialElement*(credentialElement: CredentialElement): Builder
  proc build*(): PrivateCredential

jclass android.nearby.Builder* of JVMObject:
  proc setIdentityType*(identityType: jint): Builder
  proc addCredentialElement*(credentialElement: CredentialElement): Builder
  proc build*(): PrivateCredential

