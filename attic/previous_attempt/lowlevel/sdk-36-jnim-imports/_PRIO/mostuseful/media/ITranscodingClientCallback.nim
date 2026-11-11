import jnim

jclass android.media.ITranscodingClientCallback* of IInterface:
  proc openFileDescriptor*(fileUri: string, mode: string): android.os.ParcelFileDescriptor
  proc onTranscodingStarted*(sessionId: jint)
  proc onTranscodingPaused*(sessionId: jint)
  proc onTranscodingResumed*(sessionId: jint)
  proc onTranscodingFinished*(sessionId: jint, result: android.media.TranscodingResultParcel)
  proc onTranscodingFailed*(sessionId: jint, errorCode: jint)
  proc onAwaitNumberOfSessionsChanged*(sessionId: jint, oldAwaitNumber: jint, newAwaitNumber: jint)
  proc onProgressUpdate*(sessionId: jint, progress: jint)
  DESCRIPTOR*: string {.`static`.}

jclass android.media.ITranscodingClientCallback.Default* of JVMObject:
  proc openFileDescriptor*(fileUri: string, mode: string): android.os.ParcelFileDescriptor
  proc onTranscodingStarted*(sessionId: jint)
  proc onTranscodingPaused*(sessionId: jint)
  proc onTranscodingResumed*(sessionId: jint)
  proc onTranscodingFinished*(sessionId: jint, result: android.media.TranscodingResultParcel)
  proc onTranscodingFailed*(sessionId: jint, errorCode: jint)
  proc onAwaitNumberOfSessionsChanged*(sessionId: jint, oldAwaitNumber: jint, newAwaitNumber: jint)
  proc onProgressUpdate*(sessionId: jint, progress: jint)
  proc asBinder*(): android.os.IBinder

jclass android.media.ITranscodingClientCallback.Stub* of JVMObject:
  proc asInterface*(obj: android.os.IBinder): android.media.ITranscodingClientCallback {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

jclass android.media.Default* of JVMObject:
  proc openFileDescriptor*(fileUri: string, mode: string): android.os.ParcelFileDescriptor
  proc onTranscodingStarted*(sessionId: jint)
  proc onTranscodingPaused*(sessionId: jint)
  proc onTranscodingResumed*(sessionId: jint)
  proc onTranscodingFinished*(sessionId: jint, result: android.media.TranscodingResultParcel)
  proc onTranscodingFailed*(sessionId: jint, errorCode: jint)
  proc onAwaitNumberOfSessionsChanged*(sessionId: jint, oldAwaitNumber: jint, newAwaitNumber: jint)
  proc onProgressUpdate*(sessionId: jint, progress: jint)
  proc asBinder*(): android.os.IBinder

jclass android.media.Stub* of Binder:
  proc asInterface*(obj: android.os.IBinder): android.media.ITranscodingClientCallback {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

