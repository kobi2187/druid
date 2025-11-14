import jnim

jclass android.app.GrantedUriPermission* of JVMObject:
  proc toString*(): string
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  uri*: Uri
  packageName*: string
  CREATOR*: Parcelable.Creator[GrantedUriPermission] {.`static`.}

