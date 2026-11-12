import jnim

jclass android.media.AudioVibratorInfo* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  id*: jint
  resonantFrequency*: jfloat
  qFactor*: jfloat
  maxAmplitude*: jfloat
  CREATOR*: android.os.Parcelable.Creator[AudioVibratorInfo] {.`static`.}

