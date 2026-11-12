import jnim

jclass android.media.AudioRoute* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  sourcePortIds*: jint
  sinkPortId*: jint
  isExclusive*: jboolean
  CREATOR*: android.os.Parcelable.Creator[AudioRoute] {.`static`.}

