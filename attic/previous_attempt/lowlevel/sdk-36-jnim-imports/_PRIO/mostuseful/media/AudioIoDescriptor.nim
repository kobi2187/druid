import jnim

jclass android.media.AudioIoDescriptor* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  ioHandle*: jint
  patch*: android.media.AudioPatchFw
  isInput*: jboolean
  samplingRate*: jint
  format*: android.media.audio.common.AudioFormatDescription
  channelMask*: android.media.audio.common.AudioChannelLayout
  frameCount*: jlong
  frameCountHAL*: jlong
  latency*: jint
  portId*: jint
  CREATOR*: android.os.Parcelable.Creator[AudioIoDescriptor] {.`static`.}

