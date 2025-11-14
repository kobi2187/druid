import jnim

jclass android.nearby.BroadcastRequestParcelable* of JVMObject:
  proc getBroadcastRequest*(): BroadcastRequest
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[BroadcastRequestParcelable] {.`static`.}

