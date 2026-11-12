import jnim

jclass android.permission.IPermissionChecker* of IInterface:
  proc checkPermission*(permission: string, attributionSource: android.content.AttributionSourceState, message: string, forDataDelivery: jboolean, startDataDelivery: jboolean, fromDatasource: jboolean, attributedOp: jint): jint
  proc finishDataDelivery*(op: jint, attributionSource: android.content.AttributionSourceState, fromDatasource: jboolean)
  proc checkOp*(op: jint, attributionSource: android.content.AttributionSourceState, message: string, forDataDelivery: jboolean, startDataDelivery: jboolean): jint
  DESCRIPTOR*: string {.`static`.}
  PERMISSION_GRANTED*: jint {.`static`.}
  PERMISSION_SOFT_DENIED*: jint {.`static`.}
  PERMISSION_HARD_DENIED*: jint {.`static`.}

jclass android.permission.IPermissionChecker.Default* of JVMObject:
  proc checkPermission*(permission: string, attributionSource: android.content.AttributionSourceState, message: string, forDataDelivery: jboolean, startDataDelivery: jboolean, fromDatasource: jboolean, attributedOp: jint): jint
  proc finishDataDelivery*(op: jint, attributionSource: android.content.AttributionSourceState, fromDatasource: jboolean)
  proc checkOp*(op: jint, attributionSource: android.content.AttributionSourceState, message: string, forDataDelivery: jboolean, startDataDelivery: jboolean): jint
  proc asBinder*(): android.os.IBinder

jclass android.permission.IPermissionChecker.Stub* of JVMObject:
  proc asInterface*(obj: android.os.IBinder): android.permission.IPermissionChecker {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

jclass android.permission.Default* of JVMObject:
  proc checkPermission*(permission: string, attributionSource: android.content.AttributionSourceState, message: string, forDataDelivery: jboolean, startDataDelivery: jboolean, fromDatasource: jboolean, attributedOp: jint): jint
  proc finishDataDelivery*(op: jint, attributionSource: android.content.AttributionSourceState, fromDatasource: jboolean)
  proc checkOp*(op: jint, attributionSource: android.content.AttributionSourceState, message: string, forDataDelivery: jboolean, startDataDelivery: jboolean): jint
  proc asBinder*(): android.os.IBinder

jclass android.permission.Stub* of Binder:
  proc asInterface*(obj: android.os.IBinder): android.permission.IPermissionChecker {.`static`.}
  proc asBinder*(): android.os.IBinder
  proc onTransact*(code: jint, data: android.os.Parcel, reply: android.os.Parcel, flags: jint): jboolean

