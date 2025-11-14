import jnim

jclass android.media.AudioHalVersionInfo* of JVMObject:
  proc getHalType*(): jint
  proc getMajorVersion*(): jint
  proc getMinorVersion*(): jint
  proc toString*(): string
  proc compareTo*(other: AudioHalVersionInfo): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:android.os.Parcel, flag: jint)
  AUDIO_HAL_TYPE_HIDL*: jint {.`static`.}
  AUDIO_HAL_TYPE_AIDL*: jint {.`static`.}
  AIDL_1_0*: AudioHalVersionInfo {.`static`.}
  HIDL_7_1*: AudioHalVersionInfo {.`static`.}
  HIDL_7_0*: AudioHalVersionInfo {.`static`.}
  HIDL_6_0*: AudioHalVersionInfo {.`static`.}
  HIDL_5_0*: AudioHalVersionInfo {.`static`.}
  HIDL_4_0*: AudioHalVersionInfo {.`static`.}
  HIDL_2_0*: AudioHalVersionInfo {.`static`.}
  VERSIONS*: List[AudioHalVersionInfo] {.`static`.}
  CREATOR*: Parcelable.Creator[AudioHalVersionInfo] {.`static`.}

