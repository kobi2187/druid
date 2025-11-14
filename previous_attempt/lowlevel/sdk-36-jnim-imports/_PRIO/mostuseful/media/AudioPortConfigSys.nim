import jnim

jclass android.media.AudioPortConfigSys* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  role*: jint
  typ*: jint
  ext*: android.media.AudioPortExtSys
  CREATOR*: android.os.Parcelable.Creator[AudioPortConfigSys] {.`static`.}

