import jnim

jclass android.media.AudioVolumeGroup* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  groupId*: jint
  name*: string
  audioAttributes*: android.media.audio.common.AudioAttributes
  streams*: jint
  CREATOR*: android.os.Parcelable.Creator[AudioVolumeGroup] {.`static`.}

