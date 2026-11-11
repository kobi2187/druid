import jnim

jclass android.media.TranscodingResultParcel* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  sessionId*: jint
  actualBitrateBps*: jint
  sessionStats*: android.media.TranscodingSessionStats
  CREATOR*: android.os.Parcelable.Creator[TranscodingResultParcel] {.`static`.}

