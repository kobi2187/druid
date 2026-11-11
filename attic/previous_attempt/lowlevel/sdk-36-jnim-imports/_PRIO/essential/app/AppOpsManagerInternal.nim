import jnim

jclass android.app.AppOpsManagerInternal* of JVMObject:
  proc setDeviceAndProfileOwners*(owners: SparseIntArray)
  proc updateAppWidgetVisibility*(uidPackageNames: SparseArray[string], visible: jboolean)
  proc setUidModeFromPermissionPolicy*(code: jint, uid: jint, mode: jint, callback: IAppOpsCallback)
  proc setModeFromPermissionPolicy*(code: jint, uid: jint, packageName: string, mode: jint, callback: IAppOpsCallback)
  proc setGlobalRestriction*(code: jint, restricted: jboolean, token: IBinder)
  proc getOpRestrictionCount*(code: jint, user: UserHandle, pkg: string, attributionTag: string): jint
  proc onPackageAdded*(pkgName: string, uid: jint)

