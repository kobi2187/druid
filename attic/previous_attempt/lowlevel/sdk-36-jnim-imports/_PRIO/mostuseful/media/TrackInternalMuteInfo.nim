import jnim

jclass android.media.TrackInternalMuteInfo* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  portId*: jint
  muted*: jboolean
  CREATOR*: android.os.Parcelable.Creator[TrackInternalMuteInfo] {.`static`.}

