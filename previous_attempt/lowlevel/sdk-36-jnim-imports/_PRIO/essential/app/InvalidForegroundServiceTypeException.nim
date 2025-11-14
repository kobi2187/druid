import jnim

jclass android.app.InvalidForegroundServiceTypeException* of ForegroundServiceTypeException:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[android.app.InvalidForegroundServiceTypeException] {.`static`.}

