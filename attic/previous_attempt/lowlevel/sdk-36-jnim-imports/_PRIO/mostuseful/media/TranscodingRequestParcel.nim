import jnim

jclass android.media.TranscodingRequestParcel* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  sourceFilePath*: string
  sourceFd*: android.os.ParcelFileDescriptor
  destinationFilePath*: string
  destinationFd*: android.os.ParcelFileDescriptor
  clientUid*: jint
  clientPid*: jint
  clientPackageName*: string
  transcodingType*: jint
  requestedVideoTrackFormat*: android.media.TranscodingVideoTrackFormat
  priority*: jint
  requestProgressUpdate*: jboolean
  requestSessionEventUpdate*: jboolean
  isForTesting*: jboolean
  testConfig*: android.media.TranscodingTestConfig
  enableStats*: jboolean
  CREATOR*: android.os.Parcelable.Creator[TranscodingRequestParcel] {.`static`.}

