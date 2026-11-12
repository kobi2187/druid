import jnim

jclass android.credentials.PrepareGetCredentialResponse* of JVMObject:
  proc hasCredentialResults*(credentialType: string): jboolean
  proc hasAuthenticationResults*(): jboolean
  proc hasRemoteResults*(): jboolean
  proc getPendingGetCredentialHandle*(): PendingGetCredentialHandle

