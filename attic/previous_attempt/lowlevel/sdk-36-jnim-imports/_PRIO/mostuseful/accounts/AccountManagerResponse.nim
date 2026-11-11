import jnim

jclass android.accounts.AccountManagerResponse* of JVMObject:
  proc onResult*(result: Bundle)
  proc onError*(errorCode: jint, errorMessage: string)
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[AccountManagerResponse] {.`static`.}

