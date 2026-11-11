import jnim

jclass android.permission.AdminPermissionControlParams* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc getGranteePackageName*(): string
  proc getPermission*(): string
  proc getGrantState*(): jint
  proc canAdminGrantSensorsPermissions*(): jboolean
  proc toString*(): string
  CREATOR*: Creator[AdminPermissionControlParams] {.`static`.}

