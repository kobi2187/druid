import jnim

jclass android.os.RemoteCallback* of JVMObject:
  proc sendResult*(result: Bundle)
  proc getInterface*(): IRemoteCallback
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[RemoteCallback] {.`static`.}

