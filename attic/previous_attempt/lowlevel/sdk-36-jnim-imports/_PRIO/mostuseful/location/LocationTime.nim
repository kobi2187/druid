import jnim

jclass android.location.LocationTime* of JVMObject:
  proc getUnixEpochTimeMillis*(): jlong
  proc getElapsedRealtimeNanos*(): jlong
  proc writeToParcel*(output:Parcel, flags: jint)
  proc describeContents*(): jint
  proc toString*(): string
  CREATOR*: Parcelable.Creator[LocationTime] {.`static`.}

