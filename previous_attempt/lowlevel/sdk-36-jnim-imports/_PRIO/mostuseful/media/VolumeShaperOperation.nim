import jnim

jclass android.media.VolumeShaperOperation* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  flags*: jint
  replaceId*: jint
  xOffset*: jfloat
  CREATOR*: android.os.Parcelable.Creator[VolumeShaperOperation] {.`static`.}

