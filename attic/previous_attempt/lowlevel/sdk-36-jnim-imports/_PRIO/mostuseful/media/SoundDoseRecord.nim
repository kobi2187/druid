import jnim

jclass android.media.SoundDoseRecord* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc toString*(): string
  proc describeContents*(): jint
  timestamp*: jlong
  duration*: jint
  value*: jfloat
  averageMel*: jfloat
  CREATOR*: android.os.Parcelable.Creator[SoundDoseRecord] {.`static`.}

