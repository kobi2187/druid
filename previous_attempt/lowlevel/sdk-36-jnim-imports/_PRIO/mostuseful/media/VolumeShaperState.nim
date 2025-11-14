import jnim

jclass android.media.VolumeShaperState* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  volume*: jfloat
  xOffset*: jfloat
  CREATOR*: android.os.Parcelable.Creator[VolumeShaperState] {.`static`.}

