import jnim

jclass android.media.AudioPolicyConfig* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  modules*: android.media.AudioHwModule
  supportedModes*: jint
  surroundSoundConfig*: android.media.SurroundSoundConfig
  engineConfig*: android.media.audio.common.AudioHalEngineConfig
  CREATOR*: android.os.Parcelable.Creator[AudioPolicyConfig] {.`static`.}

