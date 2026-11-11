import jnim

jclass android.permission.PermissionControllerManager* of JVMObject:
  proc revokeRuntimePermissions*(request: Map[string, List[string]], doDryRun: jboolean, reason: jint, executor: Executor, callback: OnRevokeRuntimePermissionsCallback)
  proc setRuntimePermissionGrantStateByDeviceAdmin*(callerPackageName: string, params: AdminPermissionControlParams, executor: Executor, callback: Consumer[Boolean])
  proc getRuntimePermissionBackup*(user: UserHandle, executor: Executor, callback: Consumer[seq[jbyte]])
  proc stageAndApplyRuntimePermissionsBackup*(backup: seq[jbyte], user: UserHandle)
  proc applyStagedRuntimePermissionBackup*(packageName: string, user: UserHandle, executor: Executor, callback: Consumer[Boolean])
  proc dump*(fd: FileDescriptor, args: seq[string])
  proc getAppPermissions*(packageName: string, callback: OnGetAppPermissionResultCallback, handler: Handler)
  proc revokeRuntimePermission*(packageName: string, permissionName: string)
  proc countPermissionApps*(permissionNames: List[string], flags: jint, callback: OnCountPermissionAppsResultCallback, handler: Handler)
  proc getPermissionUsages*(countSystem: jboolean, numMillis: jlong, executor: Executor, callback: OnPermissionUsageResultCallback)
  proc grantOrUpgradeDefaultRuntimePermissions*(executor: Executor, callback: Consumer[Boolean])
  proc getPrivilegesDescriptionStringForProfile*(profileName: string, executor: Executor, callback: Consumer[CharSequence])
  proc updateUserSensitive*()
  proc updateUserSensitiveForApp*(uid: jint)
  proc notifyOneTimePermissionSessionTimeout*(packageName: string, deviceId: jint)
  proc getPlatformPermissionsForGroup*(permissionGroupName: string, executor: Executor, callback: Consumer[List[string]])
  proc getGroupOfPlatformPermission*(permissionName: string, executor: Executor, callback: Consumer[string])
  proc getUnusedAppCount*(executor: Executor, callback: IntConsumer)
  proc getHibernationEligibility*(packageName: string, executor: Executor, callback: IntConsumer)
  proc revokeSelfPermissionsOnKill*(packageName: string, permissions: List[string])
  REASON_MALWARE*: jint {.`static`.}
  REASON_INSTALLER_POLICY_VIOLATION*: jint {.`static`.}
  COUNT_ONLY_WHEN_GRANTED*: jint {.`static`.}
  COUNT_WHEN_SYSTEM*: jint {.`static`.}
  HIBERNATION_ELIGIBILITY_UNKNOWN*: jint {.`static`.}
  HIBERNATION_ELIGIBILITY_ELIGIBLE*: jint {.`static`.}
  HIBERNATION_ELIGIBILITY_EXEMPT_BY_SYSTEM*: jint {.`static`.}
  HIBERNATION_ELIGIBILITY_EXEMPT_BY_USER*: jint {.`static`.}

jclass android.permission.PermissionControllerManager.OnRevokeRuntimePermissionsCallback* of JVMObject:
  proc onRevokeRuntimePermissions*(revoked: Map[string, List[string]])

jclass android.permission.OnRevokeRuntimePermissionsCallback* of JVMObject:
  proc onRevokeRuntimePermissions*(revoked: Map[string, List[string]])



