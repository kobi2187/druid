import jnim

jclass android.media.TranscodingVideoTrackFormat* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  codecType*: jint
  width*: jint
  height*: jint
  bitrateBps*: jint
  profile*: jint
  level*: jint
  decoderOperatingRate*: jint
  encoderOperatingRate*: jint
  CREATOR*: android.os.Parcelable.Creator[TranscodingVideoTrackFormat] {.`static`.}

