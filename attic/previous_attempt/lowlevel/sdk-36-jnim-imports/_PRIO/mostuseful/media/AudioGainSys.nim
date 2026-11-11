import jnim

jclass android.media.AudioGainSys* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  index*: jint
  isInput*: jboolean
  CREATOR*: android.os.Parcelable.Creator[AudioGainSys] {.`static`.}

