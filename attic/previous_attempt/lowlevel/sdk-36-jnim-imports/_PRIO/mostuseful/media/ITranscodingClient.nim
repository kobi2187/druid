import jnim

jclass android.media.ITranscodingClient* of IInterface:
  proc submitRequest*(request: android.media.TranscodingRequestParcel, session: android.media.TranscodingSessionParcel): jboolean
  proc cancelSession*(sessionId: jint): jboolean
  proc getSessionWithId*(sessionId: jint, session: android.media.TranscodingSessionParcel): jboolean
  proc addClientUid*(sessionId: jint, clientUid: jint): jboolean
  proc getClientUids*(sessionId: jint): seq[jint]
  proc unregister*()
  DESCRIPTOR*: string {.`static`.}

jclass android.media.ITranscodingClient.Default* of JVMObject:
  proc submitRequest*(request: android.media.TranscodingRequestParcel, session: android.media.TranscodingSessionParcel): jboolean
  proc cancelSession*(sessionId: jint): jboolean
  proc getSessionWithId*(sessionId: jint, session: android.media.TranscodingSessionParcel): jboolean
  proc addClientUid*(sessionId: jint, clientUid: jint): jboolean
  proc getClientUids*(sessionId: jint): seq[jint]
  proc unregister*()
  proc asBinder*(): android.os.IBinder

jclass android.media.ITranscodingClient.Stub* of JVMObject:
  proc asInterface*(obj: android.os.IBinder): android.media.ITranscodingClient {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

jclass android.media.Default* of JVMObject:
  proc submitRequest*(request: android.media.TranscodingRequestParcel, session: android.media.TranscodingSessionParcel): jboolean
  proc cancelSession*(sessionId: jint): jboolean
  proc getSessionWithId*(sessionId: jint, session: android.media.TranscodingSessionParcel): jboolean
  proc addClientUid*(sessionId: jint, clientUid: jint): jboolean
  proc getClientUids*(sessionId: jint): seq[jint]
  proc unregister*()
  proc asBinder*(): android.os.IBinder

jclass android.media.Stub* of Binder:
  proc asInterface*(obj: android.os.IBinder): android.media.ITranscodingClient {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

