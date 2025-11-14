import jnim

jclass android.media.ISoundDoseCallback* of IInterface:
  proc onMomentaryExposure*(currentMel: jfloat, deviceId: jint)
  proc onNewCsdValue*(currentCsd: jfloat, records: seq[android.media.SoundDoseRecord])
  DESCRIPTOR*: string {.`static`.}

jclass android.media.ISoundDoseCallback.Default* of JVMObject:
  proc onMomentaryExposure*(currentMel: jfloat, deviceId: jint)
  proc onNewCsdValue*(currentCsd: jfloat, records: seq[android.media.SoundDoseRecord])
  proc asBinder*(): android.os.IBinder

jclass android.media.ISoundDoseCallback.Stub* of JVMObject:
  proc asInterface*(obj: android.os.IBinder): android.media.ISoundDoseCallback {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

jclass android.media.Default* of JVMObject:
  proc onMomentaryExposure*(currentMel: jfloat, deviceId: jint)
  proc onNewCsdValue*(currentCsd: jfloat, records: seq[android.media.SoundDoseRecord])
  proc asBinder*(): android.os.IBinder

jclass android.media.Stub* of Binder:
  proc asInterface*(obj: android.os.IBinder): android.media.ISoundDoseCallback {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

