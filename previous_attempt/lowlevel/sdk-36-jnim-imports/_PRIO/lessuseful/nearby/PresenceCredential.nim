import jnim

jclass android.nearby.PresenceCredential* of JVMObject:
  proc getType*(): jint
  proc getIdentityType*(): jint
  proc getSecretId*(): seq[jbyte]
  proc getAuthenticityKey*(): seq[jbyte]
  proc getCredentialElements*(): List[CredentialElement]
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREDENTIAL_TYPE_PRIVATE*: jint {.`static`.}
  CREDENTIAL_TYPE_PUBLIC*: jint {.`static`.}
  IDENTITY_TYPE_UNKNOWN*: jint {.`static`.}
  IDENTITY_TYPE_PRIVATE*: jint {.`static`.}
  IDENTITY_TYPE_PROVISIONED*: jint {.`static`.}
  IDENTITY_TYPE_TRUSTED*: jint {.`static`.}

