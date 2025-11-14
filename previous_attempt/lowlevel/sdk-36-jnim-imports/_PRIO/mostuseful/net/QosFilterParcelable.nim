import jnim

jclass android.net.QosFilterParcelable* of JVMObject:
  proc getQosFilter*(): QosFilter
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Creator[QosFilterParcelable] {.`static`.}

