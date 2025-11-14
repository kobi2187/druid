import jnim

jclass android.media.TrackSecondaryOutputInfo* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  portId*: jint
  secondaryOutputIds*: jint
  CREATOR*: android.os.Parcelable.Creator[TrackSecondaryOutputInfo] {.`static`.}

