import jnim

jclass android.media.TranscodingSessionParcel* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  sessionId*: jint
  request*: android.media.TranscodingRequestParcel
  videoTrackFormat*: android.media.TranscodingVideoTrackFormat
  awaitNumberOfSessions*: jint
  CREATOR*: android.os.Parcelable.Creator[TranscodingSessionParcel] {.`static`.}

