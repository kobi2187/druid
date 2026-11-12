import jnim

jclass android.media.AudioHalVersion* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  typ*: jint
  major*: jint
  minor*: jint
  CREATOR*: android.os.Parcelable.Creator[AudioHalVersion] {.`static`.}

