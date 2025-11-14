import jnim

jclass android.credentials.CredentialDescription* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getType*(): string
  proc getSupportedElementKeys*(): Set[string]
  proc getCredentialEntries*(): List[CredentialEntry]
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  CREATOR*: Parcelable.Creator[CredentialDescription] {.`static`.}

