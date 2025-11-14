import jnim

jclass android.media.AudioMixerAttributesInternal* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  config*: android.media.audio.common.AudioConfigBase
  mixerBehavior*: jint
  CREATOR*: android.os.Parcelable.Creator[AudioMixerAttributesInternal] {.`static`.}

