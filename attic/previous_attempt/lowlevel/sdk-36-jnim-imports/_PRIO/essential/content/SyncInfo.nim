import jnim

jclass android.content.SyncInfo* of JVMObject:
  proc createAccountRedacted*(authorityId: jint, authority: string, startTime: jlong): SyncInfo {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  authorityId*: jint
  account*: Account
  authority*: string
  startTime*: jlong
  CREATOR*: Creator[SyncInfo] {.`static`.}

