import jnim

jclass android.media.AudioHwModule* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  handle*: jint
  name*: string
  ports*: android.media.audio.common.AudioPort
  routes*: android.media.AudioRoute
  CREATOR*: android.os.Parcelable.Creator[AudioHwModule] {.`static`.}

