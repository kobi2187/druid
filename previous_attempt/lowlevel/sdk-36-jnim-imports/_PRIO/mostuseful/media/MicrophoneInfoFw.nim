import jnim

jclass android.media.MicrophoneInfoFw* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  info*: android.media.audio.common.MicrophoneInfo
  dynamic*: android.media.audio.common.MicrophoneDynamicInfo
  portId*: jint
  CREATOR*: android.os.Parcelable.Creator[MicrophoneInfoFw] {.`static`.}

