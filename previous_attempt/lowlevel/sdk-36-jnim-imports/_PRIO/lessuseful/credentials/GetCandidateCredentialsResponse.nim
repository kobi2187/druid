import jnim

jclass android.credentials.GetCandidateCredentialsResponse* of JVMObject:
  proc getCandidateProviderDataList*(): List[GetCredentialProviderData]
  proc getPrimaryProviderComponentName*(): ComponentName
  proc getIntent*(): Intent
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Creator[GetCandidateCredentialsResponse] {.`static`.}

