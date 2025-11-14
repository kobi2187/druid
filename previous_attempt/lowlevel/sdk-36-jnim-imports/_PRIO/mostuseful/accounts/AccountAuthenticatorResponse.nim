import jnim

jclass android.accounts.AccountAuthenticatorResponse* of JVMObject:
  proc onResult*(result: Bundle)
  proc onRequestContinued*()
  proc onError*(errorCode: jint, errorMessage: string)
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[AccountAuthenticatorResponse] {.`static`.}

