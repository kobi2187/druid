import jnim

jclass android.credentials.SetEnabledProvidersRequest* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getProviderComponentNames*(): List[string]
  CREATOR*: Creator[SetEnabledProvidersRequest] {.`static`.}

