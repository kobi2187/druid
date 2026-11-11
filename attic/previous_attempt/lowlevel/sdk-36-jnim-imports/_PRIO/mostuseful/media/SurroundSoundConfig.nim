import jnim

jclass android.media.SurroundSoundConfig* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  formatFamilies*: android.media.SurroundSoundConfig.SurroundFormatFamily
  CREATOR*: android.os.Parcelable.Creator[SurroundSoundConfig] {.`static`.}

jclass android.media.SurroundSoundConfig.SurroundFormatFamily* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint

jclass android.media.SurroundFormatFamily* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  primaryFormat*: android.media.audio.common.AudioFormatDescription
  subFormats*: android.media.audio.common.AudioFormatDescription
  CREATOR*: android.os.Parcelable.Creator[SurroundFormatFamily] {.`static`.}

