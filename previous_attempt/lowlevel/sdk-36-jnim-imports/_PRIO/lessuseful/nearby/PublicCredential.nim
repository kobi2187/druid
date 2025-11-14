import jnim

jclass android.nearby.PublicCredential* of PresenceCredential:
  proc getPublicKey*(): seq[jbyte]
  proc getEncryptedMetadata*(): seq[jbyte]
  proc getEncryptedMetadataKeyTag*(): seq[jbyte]
  proc describeContents*(): jint
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[PublicCredential] {.`static`.}

jclass android.nearby.PublicCredential.Builder* of JVMObject:
  proc setIdentityType*(identityType: jint): Builder
  proc addCredentialElement*(credentialElement: CredentialElement): Builder
  proc build*(): PublicCredential

jclass android.nearby.Builder* of JVMObject:
  proc setIdentityType*(identityType: jint): Builder
  proc addCredentialElement*(credentialElement: CredentialElement): Builder
  proc build*(): PublicCredential

