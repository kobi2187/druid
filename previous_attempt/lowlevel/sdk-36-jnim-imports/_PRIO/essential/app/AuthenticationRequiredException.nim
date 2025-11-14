import jnim

jclass android.app.AuthenticationRequiredException* of SecurityException:
  proc getUserAction*(): PendingIntent
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[AuthenticationRequiredException] {.`static`.}

