import jnim

jclass android.credentials.PrepareGetCredentialResponseInternal* of JVMObject:
  proc getPendingIntent*(): PendingIntent
  proc hasCredentialResults*(credentialType: string): jboolean
  proc hasAuthenticationResults*(): jboolean
  proc hasRemoteResults*(): jboolean
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Creator[PrepareGetCredentialResponseInternal] {.`static`.}

