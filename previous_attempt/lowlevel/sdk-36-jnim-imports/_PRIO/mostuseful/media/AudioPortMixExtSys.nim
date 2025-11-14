import jnim

jclass android.media.AudioPortMixExtSys* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  hwModule*: jint
  CREATOR*: android.os.Parcelable.Creator[AudioPortMixExtSys] {.`static`.}

