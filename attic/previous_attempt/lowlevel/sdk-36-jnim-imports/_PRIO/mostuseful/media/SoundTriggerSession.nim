import jnim

jclass android.media.SoundTriggerSession* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  session*: jint
  ioHandle*: jint
  device*: android.media.audio.common.AudioDeviceDescription
  CREATOR*: android.os.Parcelable.Creator[SoundTriggerSession] {.`static`.}

