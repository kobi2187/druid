import jnim

jclass android.permission.PermissionCheckerManager* of JVMObject:
  proc checkPermission*(permission: string, attributionSource: AttributionSourceState, message: string, forDataDelivery: jboolean, startDataDelivery: jboolean, fromDatasource: jboolean, attributedOp: jint): jint
  proc finishDataDelivery*(op: jint, attributionSource: AttributionSourceState, fromDatasource: jboolean)
  proc checkOp*(op: jint, attributionSource: AttributionSourceState, message: string, forDataDelivery: jboolean, startDataDelivery: jboolean): jint
  PERMISSION_GRANTED*: jint {.`static`.}
  PERMISSION_SOFT_DENIED*: jint {.`static`.}
  PERMISSION_HARD_DENIED*: jint {.`static`.}

