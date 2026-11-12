import jnim

jclass android.media.INativeAudioVolumeGroupCallback* of IInterface:
  proc onAudioVolumeGroupChanged*(volumeChangeEvent: android.media.audio.common.AudioVolumeGroupChangeEvent)
  DESCRIPTOR*: string {.`static`.}

jclass android.media.INativeAudioVolumeGroupCallback.Default* of JVMObject:
  proc onAudioVolumeGroupChanged*(volumeChangeEvent: android.media.audio.common.AudioVolumeGroupChangeEvent)
  proc asBinder*(): android.os.IBinder

jclass android.media.INativeAudioVolumeGroupCallback.Stub* of JVMObject:
  proc asInterface*(obj: android.os.IBinder): android.media.INativeAudioVolumeGroupCallback {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

jclass android.media.Default* of JVMObject:
  proc onAudioVolumeGroupChanged*(volumeChangeEvent: android.media.audio.common.AudioVolumeGroupChangeEvent)
  proc asBinder*(): android.os.IBinder

jclass android.media.Stub* of Binder:
  proc asInterface*(obj: android.os.IBinder): android.media.INativeAudioVolumeGroupCallback {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

