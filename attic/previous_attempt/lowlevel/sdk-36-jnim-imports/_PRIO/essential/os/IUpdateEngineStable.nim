import jnim

jclass android.os.IUpdateEngineStable* of IInterface:
  proc applyPayloadFd*(pfd: android.os.ParcelFileDescriptor, payload_offset: jlong, payload_size: jlong, headerKeyValuePairs: seq[string])
  proc bind*(callback: android.os.IUpdateEngineStableCallback): jboolean
  proc unbind*(callback: android.os.IUpdateEngineStableCallback): jboolean
  proc getInterfaceVersion*(): jint
  proc getInterfaceHash*(): string
  VERSION*: jint {.`static`.}
  HASH*: string {.`static`.}
  DESCRIPTOR*: string {.`static`.}

jclass android.os.IUpdateEngineStable.Default* of JVMObject:
  proc applyPayloadFd*(pfd: android.os.ParcelFileDescriptor, payload_offset: jlong, payload_size: jlong, headerKeyValuePairs: seq[string])
  proc bind*(callback: android.os.IUpdateEngineStableCallback): jboolean
  proc unbind*(callback: android.os.IUpdateEngineStableCallback): jboolean
  proc getInterfaceVersion*(): jint
  proc getInterfaceHash*(): string
  proc asBinder*(): android.os.IBinder

jclass android.os.IUpdateEngineStable.Stub* of JVMObject:
  proc asInterface*(obj: android.os.IBinder): android.os.IUpdateEngineStable {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

jclass android.os.Default* of JVMObject:
  proc applyPayloadFd*(pfd: android.os.ParcelFileDescriptor, payload_offset: jlong, payload_size: jlong, headerKeyValuePairs: seq[string])
  proc bind*(callback: android.os.IUpdateEngineStableCallback): jboolean
  proc unbind*(callback: android.os.IUpdateEngineStableCallback): jboolean
  proc getInterfaceVersion*(): jint
  proc getInterfaceHash*(): string
  proc asBinder*(): android.os.IBinder

jclass android.os.Stub* of Binder:
  proc asInterface*(obj: android.os.IBinder): android.os.IUpdateEngineStable {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

