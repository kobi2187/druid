import jnim

jclass android.media.IMediaTranscodingService* of IInterface:
  proc registerClient*(callback: android.media.ITranscodingClientCallback, clientName: string, opPackageName: string): android.media.ITranscodingClient
  proc getNumOfClients*(): jint
  DESCRIPTOR*: string {.`static`.}
  ERROR_PERMISSION_DENIED*: jint {.`static`.}
  ERROR_ALREADY_EXISTS*: jint {.`static`.}
  ERROR_ILLEGAL_ARGUMENT*: jint {.`static`.}
  ERROR_DISCONNECTED*: jint {.`static`.}
  ERROR_TIMED_OUT*: jint {.`static`.}
  ERROR_DISABLED*: jint {.`static`.}
  ERROR_INVALID_OPERATION*: jint {.`static`.}
  USE_CALLING_UID*: jint {.`static`.}
  USE_CALLING_PID*: jint {.`static`.}

jclass android.media.IMediaTranscodingService.Default* of JVMObject:
  proc registerClient*(callback: android.media.ITranscodingClientCallback, clientName: string, opPackageName: string): android.media.ITranscodingClient
  proc getNumOfClients*(): jint
  proc asBinder*(): android.os.IBinder

jclass android.media.IMediaTranscodingService.Stub* of JVMObject:
  proc asInterface*(obj: android.os.IBinder): android.media.IMediaTranscodingService {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

jclass android.media.Default* of JVMObject:
  proc registerClient*(callback: android.media.ITranscodingClientCallback, clientName: string, opPackageName: string): android.media.ITranscodingClient
  proc getNumOfClients*(): jint
  proc asBinder*(): android.os.IBinder

jclass android.media.Stub* of Binder:
  proc asInterface*(obj: android.os.IBinder): android.media.IMediaTranscodingService {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

