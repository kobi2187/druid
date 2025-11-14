import jnim

jclass android.content.PermissionChecker* of JVMObject:
  proc checkPermissionForDataDelivery*(context: Context, permission: string, pid: jint, uid: jint, packageName: string, attributionTag: string, message: string, startDataDelivery: jboolean): jint {.`static`.}
  proc checkPermissionForDataDelivery*(context: Context, permission: string, pid: jint, uid: jint, packageName: string, attributionTag: string, message: string): jint {.`static`.}
  proc checkPermissionForDataDeliveryFromDataSource*(context: Context, permission: string, pid: jint, attributionSource: AttributionSource, message: string): jint {.`static`.}
  proc checkPermissionForDataDelivery*(context: Context, permission: string, pid: jint, attributionSource: AttributionSource, message: string): jint {.`static`.}
  proc checkPermissionForDataDelivery*(context: Context, permission: string, pid: jint, attributionSource: AttributionSource, message: string, startDataDelivery: jboolean): jint {.`static`.}
  proc checkPermissionAndStartDataDelivery*(context: Context, permission: string, attributionSource: AttributionSource, message: string): jint {.`static`.}
  proc startOpForDataDelivery*(context: Context, opName: string, attributionSource: AttributionSource, message: string): jint {.`static`.}
  proc finishDataDelivery*(context: Context, op: string, attributionSource: AttributionSource) {.`static`.}
  proc finishDataDeliveryFromDatasource*(context: Context, op: string, attributionSource: AttributionSource) {.`static`.}
  proc checkOpForPreflight*(context: Context, opName: string, attributionSource: AttributionSource, message: string): jint {.`static`.}
  proc checkOpForDataDelivery*(context: Context, opName: string, attributionSource: AttributionSource, message: string): jint {.`static`.}
  proc checkPermissionForPreflight*(context: Context, permission: string, pid: jint, uid: jint, packageName: string): jint {.`static`.}
  proc checkPermissionForPreflight*(context: Context, permission: string, attributionSource: AttributionSource): jint {.`static`.}
  proc checkSelfPermissionForDataDelivery*(context: Context, permission: string, message: string): jint {.`static`.}
  proc checkSelfPermissionForPreflight*(context: Context, permission: string): jint {.`static`.}
  proc checkCallingPermissionForDataDelivery*(context: Context, permission: string, callingPackageName: string, callingAttributionTag: string, message: string): jint {.`static`.}
  proc checkCallingPermissionForPreflight*(context: Context, permission: string, packageName: string): jint {.`static`.}
  proc checkCallingOrSelfPermissionForDataDelivery*(context: Context, permission: string, callingPackageName: string, callingAttributionTag: string, message: string): jint {.`static`.}
  proc checkCallingOrSelfPermissionForPreflight*(context: Context, permission: string): jint {.`static`.}
  PERMISSION_GRANTED*: jint {.`static`.}
  PERMISSION_SOFT_DENIED*: jint {.`static`.}
  PERMISSION_HARD_DENIED*: jint {.`static`.}
  PID_UNKNOWN*: jint {.`static`.}

