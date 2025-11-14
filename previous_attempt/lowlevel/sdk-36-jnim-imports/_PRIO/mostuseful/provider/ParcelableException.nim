import jnim

jclass android.provider.ParcelableException* of RuntimeException:
  proc maybeRethrow*(clazz: Class[T])
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[ParcelableException] {.`static`.}

