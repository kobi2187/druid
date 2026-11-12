import jnim

jclass android.os.ParcelDuration* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, parcelableFlags: jint)
  proc getDuration*(): Duration
  proc toString*(): string
  CREATOR*: Parcelable.Creator[ParcelDuration] {.`static`.}

