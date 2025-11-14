import jnim

jclass android.media.AudioPortExtSys* of JVMObject:
  proc getTag*(): jint
  proc unspecified*(_value: jboolean): AudioPortExtSys {.`static`.}
  proc getUnspecified*(): jboolean
  proc setUnspecified*(_value: jboolean)
  proc device*(_value: android.media.AudioPortDeviceExtSys): AudioPortExtSys {.`static`.}
  proc getDevice*(): android.media.AudioPortDeviceExtSys
  proc setDevice*(_value: android.media.AudioPortDeviceExtSys)
  proc mix*(_value: android.media.AudioPortMixExtSys): AudioPortExtSys {.`static`.}
  proc getMix*(): android.media.AudioPortMixExtSys
  proc setMix*(_value: android.media.AudioPortMixExtSys)
  proc session*(_value: jint): AudioPortExtSys {.`static`.}
  proc getSession*(): jint
  proc setSession*(_value: jint)
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  unspecified*: jint {.`static`.}
  device*: jint {.`static`.}
  mix*: jint {.`static`.}
  session*: jint {.`static`.}
  CREATOR*: android.os.Parcelable.Creator[AudioPortExtSys] {.`static`.}

