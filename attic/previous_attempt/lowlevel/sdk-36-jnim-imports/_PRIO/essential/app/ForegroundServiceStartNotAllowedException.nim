import jnim

jclass android.app.ForegroundServiceStartNotAllowedException* of ServiceStartNotAllowedException:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[android.app.ForegroundServiceStartNotAllowedException] {.`static`.}

