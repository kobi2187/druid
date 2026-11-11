import jnim

jclass android.media.VolumeShaperConfiguration* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  typ*: jint
  id*: jint
  optionFlags*: jint
  durationMs*: jdouble
  interpolatorConfig*: android.media.InterpolatorConfig
  CREATOR*: android.os.Parcelable.Creator[VolumeShaperConfiguration] {.`static`.}

