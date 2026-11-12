import jnim

jclass android.media.AudioPortSys* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  role*: jint
  typ*: jint
  profiles*: android.media.AudioProfileSys
  gains*: android.media.AudioGainSys
  activeConfig*: android.media.AudioPortConfigFw
  ext*: android.media.AudioPortExtSys
  CREATOR*: android.os.Parcelable.Creator[AudioPortSys] {.`static`.}

