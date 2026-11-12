import jnim

jclass android.app.BackgroundServiceStartNotAllowedException* of ServiceStartNotAllowedException:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[android.app.BackgroundServiceStartNotAllowedException] {.`static`.}

