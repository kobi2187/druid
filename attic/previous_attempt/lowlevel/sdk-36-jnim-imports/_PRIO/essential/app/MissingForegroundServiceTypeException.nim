import jnim

jclass android.app.MissingForegroundServiceTypeException* of ForegroundServiceTypeException:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[android.app.MissingForegroundServiceTypeException] {.`static`.}

