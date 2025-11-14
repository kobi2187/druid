import jnim

jclass android.os.ParcelableException* of RuntimeException:
  proc maybeRethrow*(clazz: Class[T])
  proc readFromParcel*(in: Parcel): Throwable {.`static`.}
  proc writeToParcel*(output:Parcel, t: Throwable) {.`static`.}
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[ParcelableException] {.`static`.}

