import jnim

jclass android.app.ContentProviderHolder* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  info*: ProviderInfo
  provider*: IContentProvider
  connection*: IBinder
  noReleaseNeeded*: jboolean
  mLocal*: jboolean
  CREATOR*: Parcelable.Creator[ContentProviderHolder] {.`static`.}

