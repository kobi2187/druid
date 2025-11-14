import jnim

jclass android.permission.LegacyPermissionManager* of JVMObject:
  proc checkDeviceIdentifierAccess*(packageName: string, message: string, callingFeatureId: string, pid: jint, uid: jint): jint
  proc checkPhoneNumberAccess*(packageName: string, message: string, callingFeatureId: string, pid: jint, uid: jint): jint
  proc grantDefaultPermissionsToLuiApp*(packageName: string, user: UserHandle, executor: Executor, callback: Consumer[Boolean])
  proc revokeDefaultPermissionsFromLuiApps*(packageNames: seq[string], user: UserHandle, executor: Executor, callback: Consumer[Boolean])
  proc grantDefaultPermissionsToEnabledImsServices*(packageNames: seq[string], user: UserHandle, executor: Executor, callback: Consumer[Boolean])
  proc grantDefaultPermissionsToEnabledTelephonyDataServices*(packageNames: seq[string], user: UserHandle, executor: Executor, callback: Consumer[Boolean])
  proc revokeDefaultPermissionsFromDisabledTelephonyDataServices*(packageNames: seq[string], user: UserHandle, executor: Executor, callback: Consumer[Boolean])
  proc grantDefaultPermissionsToEnabledCarrierApps*(packageNames: seq[string], user: UserHandle, executor: Executor, callback: Consumer[Boolean])
  proc grantDefaultPermissionsToCarrierServiceApp*(packageName: string, userId: jint)

