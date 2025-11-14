import jnim

jclass android.credentials.ListEnabledProvidersResponse* of JVMObject:
  proc create*(providers: List[string]): ListEnabledProvidersResponse {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getProviderComponentNames*(): List[string]
  CREATOR*: Creator[ListEnabledProvidersResponse] {.`static`.}

