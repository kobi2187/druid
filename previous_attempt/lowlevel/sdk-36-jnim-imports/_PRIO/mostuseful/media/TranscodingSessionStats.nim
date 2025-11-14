import jnim

jclass android.media.TranscodingSessionStats* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  sessionCreatedTimeUs*: jlong
  sessionFinishedTimeUs*: jlong
  totalProcessingTimeUs*: jlong
  totalTimeUs*: jlong
  CREATOR*: android.os.Parcelable.Creator[TranscodingSessionStats] {.`static`.}

