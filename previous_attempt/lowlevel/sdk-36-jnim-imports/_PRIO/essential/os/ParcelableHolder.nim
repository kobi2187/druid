import jnim

jclass android.os.ParcelableHolder* of JVMObject:
  proc getStability*(): jint
  proc setParcelable*(p: Parcelable)
  proc getParcelable*(clazz: Class[T]): T
  proc readFromParcel*(parcel: Parcel)
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc describeContents*(): jint
  CREATOR*: Parcelable.Creator[ParcelableHolder] {.`static`.}

