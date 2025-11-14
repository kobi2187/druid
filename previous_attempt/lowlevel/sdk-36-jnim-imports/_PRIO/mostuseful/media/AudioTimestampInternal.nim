import jnim

jclass android.media.AudioTimestampInternal* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  position*: jlong
  sec*: jlong
  nsec*: jint
  CREATOR*: android.os.Parcelable.Creator[AudioTimestampInternal] {.`static`.}

