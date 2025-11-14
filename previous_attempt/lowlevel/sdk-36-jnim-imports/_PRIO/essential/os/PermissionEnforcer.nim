import jnim

jclass android.os.PermissionEnforcer* of JVMObject:
  proc enforcePermission*(permission: string, source: AttributionSource)
  proc enforcePermission*(permission: string, pid: jint, uid: jint)
  proc enforcePermissionAllOf*(permissions: seq[string], source: AttributionSource)
  proc enforcePermissionAllOf*(permissions: seq[string], pid: jint, uid: jint)
  proc enforcePermissionAnyOf*(permissions: seq[string], source: AttributionSource)
  proc enforcePermissionAnyOf*(permissions: seq[string], pid: jint, uid: jint)
  proc fromContext*(context: Context): PermissionEnforcer {.`static`.}

