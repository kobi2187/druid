import jnim

jclass android.media.GetOutputForAttrResponse* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  output*: jint
  stream*: jint
  selectedDeviceIds*: jint
  portId*: jint
  secondaryOutputs*: jint
  isSpatialized*: jboolean
  configBase*: android.media.audio.common.AudioConfigBase
  isBitPerfect*: jboolean
  attr*: android.media.audio.common.AudioAttributes
  volume*: jfloat
  muted*: jboolean
  CREATOR*: android.os.Parcelable.Creator[GetOutputForAttrResponse] {.`static`.}

