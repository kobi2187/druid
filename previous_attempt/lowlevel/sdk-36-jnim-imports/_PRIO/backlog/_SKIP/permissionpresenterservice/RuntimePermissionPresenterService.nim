import jnim

jclass android.permissionpresenterservice.RuntimePermissionPresenterService* of Service:
  proc attachBaseContext*(base: Context)
  proc onGetAppPermissions*(packageName: string): List[RuntimePermissionPresentationInfo]
  proc onBind*(intent: Intent): IBinder
  SERVICE_INTERFACE*: string {.`static`.}

