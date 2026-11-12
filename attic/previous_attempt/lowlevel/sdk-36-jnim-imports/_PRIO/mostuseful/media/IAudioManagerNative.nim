import jnim

jclass android.media.IAudioManagerNative* of IInterface:
  proc playbackHardeningEvent*(uid: jint, type: jbyte, bypassed: jboolean)
  proc permissionUpdateBarrier*()
  proc portMuteEvent*(portId: jint, event: jint)
  DESCRIPTOR*: string {.`static`.}

jclass android.media.IAudioManagerNative.Default* of JVMObject:
  proc playbackHardeningEvent*(uid: jint, type: jbyte, bypassed: jboolean)
  proc permissionUpdateBarrier*()
  proc portMuteEvent*(portId: jint, event: jint)
  proc asBinder*(): android.os.IBinder

jclass android.media.IAudioManagerNative.Stub* of JVMObject:
  proc asInterface*(obj: android.os.IBinder): android.media.IAudioManagerNative {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

jclass android.media.Default* of JVMObject:
  proc playbackHardeningEvent*(uid: jint, type: jbyte, bypassed: jboolean)
  proc permissionUpdateBarrier*()
  proc portMuteEvent*(portId: jint, event: jint)
  proc asBinder*(): android.os.IBinder

jclass android.media.Stub* of Binder:
  proc asInterface*(obj: android.os.IBinder): android.media.IAudioManagerNative {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

