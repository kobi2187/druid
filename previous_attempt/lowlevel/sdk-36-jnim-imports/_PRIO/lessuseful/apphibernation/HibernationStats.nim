import jnim

jclass android.apphibernation.HibernationStats* of JVMObject:
  proc getDiskBytesSaved*(): jlong
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[HibernationStats] {.`static`.}

