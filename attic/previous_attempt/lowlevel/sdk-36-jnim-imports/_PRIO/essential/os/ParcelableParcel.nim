import jnim

jclass android.os.ParcelableParcel* of JVMObject:
  proc getParcel*(): Parcel
  proc getClassLoader*(): ClassLoader
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.ClassLoaderCreator[ParcelableParcel] {.`static`.}

