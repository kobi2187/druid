import jnim

jclass android.devicelock.ParcelableException* of Exception:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getException*(): Exception
  CREATOR*: Creator[ParcelableException] {.`static`.}

