import jnim

jclass android.media.INativeSpatializerCallback* of IInterface:
  proc onLevelChanged*(level: jbyte)
  proc onOutputChanged*(output: jint)
  DESCRIPTOR*: string {.`static`.}

jclass android.media.INativeSpatializerCallback.Default* of JVMObject:
  proc onLevelChanged*(level: jbyte)
  proc onOutputChanged*(output: jint)
  proc asBinder*(): android.os.IBinder

jclass android.media.INativeSpatializerCallback.Stub* of JVMObject:
  proc asInterface*(obj: android.os.IBinder): android.media.INativeSpatializerCallback {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

jclass android.media.Default* of JVMObject:
  proc onLevelChanged*(level: jbyte)
  proc onOutputChanged*(output: jint)
  proc asBinder*(): android.os.IBinder

jclass android.media.Stub* of Binder:
  proc asInterface*(obj: android.os.IBinder): android.media.INativeSpatializerCallback {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

