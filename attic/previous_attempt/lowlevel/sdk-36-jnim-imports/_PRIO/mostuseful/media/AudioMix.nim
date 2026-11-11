import jnim

jclass android.media.AudioMix* of JVMObject:
  proc writeToParcel*(_aidl_parcel: android.os.Parcel, _aidl_flag: jint)
  proc readFromParcel*(_aidl_parcel: android.os.Parcel)
  proc describeContents*(): jint
  criteria*: android.media.AudioMixMatchCriterion
  mixType*: jint
  format*: android.media.audio.common.AudioConfig
  routeFlags*: jint
  device*: android.media.audio.common.AudioDevice
  cbFlags*: jint
  allowPrivilegedMediaPlaybackCapture*: jboolean
  voiceCommunicationCaptureAllowed*: jboolean
  mToken*: android.os.IBinder
  mVirtualDeviceId*: jint
  CREATOR*: android.os.Parcelable.Creator[AudioMix] {.`static`.}

