import jnim

jclass android.media.InterpolatorConfig* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  typ*: jint
  firstSlope*: jfloat
  lastSlope*: jfloat
  xy*: jfloat
  CREATOR*: android.os.Parcelable.Creator[InterpolatorConfig] {.`static`.}

