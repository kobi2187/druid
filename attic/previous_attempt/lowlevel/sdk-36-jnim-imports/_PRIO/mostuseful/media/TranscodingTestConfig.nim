import jnim

jclass android.media.TranscodingTestConfig* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  passThroughMode*: jboolean
  processingTotalTimeMs*: jint
  CREATOR*: android.os.Parcelable.Creator[TranscodingTestConfig] {.`static`.}

