import jnim

jclass android.media.EffectDescriptor* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  typ*: android.media.audio.common.AudioUuid
  uuid*: android.media.audio.common.AudioUuid
  apiVersion*: jint
  flags*: jint
  cpuLoad*: jint
  memoryUsage*: jint
  name*: string
  implementor*: string
  CREATOR*: android.os.Parcelable.Creator[EffectDescriptor] {.`static`.}

