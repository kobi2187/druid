import jnim

jclass android.media.ICaptureStateListener* of IInterface:
  proc setCaptureState*(active: jboolean)
  DESCRIPTOR*: string {.`static`.}

jclass android.media.ICaptureStateListener.Default* of JVMObject:
  proc setCaptureState*(active: jboolean)
  proc asBinder*(): android.os.IBinder

jclass android.media.ICaptureStateListener.Stub* of JVMObject:
  proc asInterface*(obj: android.os.IBinder): android.media.ICaptureStateListener {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

jclass android.media.Default* of JVMObject:
  proc setCaptureState*(active: jboolean)
  proc asBinder*(): android.os.IBinder

jclass android.media.Stub* of Binder:
  proc asInterface*(obj: android.os.IBinder): android.media.ICaptureStateListener {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

