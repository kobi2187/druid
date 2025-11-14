import jnim

jclass android.content.ContentProviderResult* of JVMObject:
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  uri*: Uri
  count*: Integer
  extras*: Bundle
  exception*: Throwable
  CREATOR*: Creator[ContentProviderResult] {.`static`.}

