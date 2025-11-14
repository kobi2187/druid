import jnim

jclass android.media.GetInputForAttrResponse* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  input*: jint
  selectedDeviceId*: jint
  portId*: jint
  virtualDeviceId*: jint
  config*: android.media.audio.common.AudioConfigBase
  source*: jint
  CREATOR*: android.os.Parcelable.Creator[GetInputForAttrResponse] {.`static`.}

