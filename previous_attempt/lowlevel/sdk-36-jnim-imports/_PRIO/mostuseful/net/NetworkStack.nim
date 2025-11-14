import jnim

jclass android.net.NetworkStack* of JVMObject:
  proc getService*(): IBinder {.`static`.}
  proc setServiceForTest*(mockService: IBinder) {.`static`.}
  proc checkNetworkStackPermission*(context: Context) {.`static`.}
  proc checkNetworkStackPermissionOr*(context: Context, otherPermissions: string) {.`static`.}
  PERMISSION_MAINLINE_NETWORK_STACK*: string {.`static`.}

