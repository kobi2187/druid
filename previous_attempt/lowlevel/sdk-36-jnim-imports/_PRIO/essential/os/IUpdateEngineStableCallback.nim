import jnim

jclass android.os.IUpdateEngineStableCallback* of IInterface:
  proc onStatusUpdate*(status_code: jint, percentage: jfloat)
  proc onPayloadApplicationComplete*(error_code: jint)
  proc getInterfaceVersion*(): jint
  proc getInterfaceHash*(): string
  VERSION*: jint {.`static`.}
  HASH*: string {.`static`.}
  DESCRIPTOR*: string {.`static`.}

jclass android.os.IUpdateEngineStableCallback.Default* of JVMObject:
  proc onStatusUpdate*(status_code: jint, percentage: jfloat)
  proc onPayloadApplicationComplete*(error_code: jint)
  proc getInterfaceVersion*(): jint
  proc getInterfaceHash*(): string
  proc asBinder*(): android.os.IBinder

jclass android.os.IUpdateEngineStableCallback.Stub* of JVMObject:
  proc asInterface*(obj: android.os.IBinder): android.os.IUpdateEngineStableCallback {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

jclass android.os.Default* of JVMObject:
  proc onStatusUpdate*(status_code: jint, percentage: jfloat)
  proc onPayloadApplicationComplete*(error_code: jint)
  proc getInterfaceVersion*(): jint
  proc getInterfaceHash*(): string
  proc asBinder*(): android.os.IBinder

jclass android.os.Stub* of Binder:
  proc asInterface*(obj: android.os.IBinder): android.os.IUpdateEngineStableCallback {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

