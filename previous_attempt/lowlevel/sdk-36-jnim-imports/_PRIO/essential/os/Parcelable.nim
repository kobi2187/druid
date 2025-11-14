import jnim

jclass android.os.Parcelable* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  PARCELABLE_WRITE_RETURN_VALUE*: jint {.`static`.}
  PARCELABLE_ELIDE_DUPLICATES*: jint {.`static`.}
  PARCELABLE_STABILITY_LOCAL*: jint {.`static`.}
  PARCELABLE_STABILITY_VINTF*: jint {.`static`.}
  CONTENTS_FILE_DESCRIPTOR*: jint {.`static`.}

jclass android.os.Parcelable.Creator* of JVMObject:
  proc createFromParcel*(source: Parcel): T
  proc newArray*(size: jint): seq[T]

jclass android.os.Parcelable.ClassLoaderCreator* of JVMObject:
  proc createFromParcel*(source: Parcel, loader: ClassLoader): T

jclass android.os.Creator* of JVMObject:
  proc createFromParcel*(source: Parcel): T
  proc newArray*(size: jint): seq[T]

jclass android.os.ClassLoaderCreator* of Creator:
  proc createFromParcel*(source: Parcel, loader: ClassLoader): T

