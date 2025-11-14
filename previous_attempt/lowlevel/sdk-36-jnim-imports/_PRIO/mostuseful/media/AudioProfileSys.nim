import jnim

jclass android.media.AudioProfileSys* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  isDynamicFormat*: jboolean
  isDynamicChannels*: jboolean
  isDynamicRate*: jboolean
  CREATOR*: android.os.Parcelable.Creator[AudioProfileSys] {.`static`.}

