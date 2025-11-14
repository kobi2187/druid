import jnim

jclass android.permission.PermissionControllerService* of Service:
  proc onRevokeRuntimePermissions*(requests: Map[string, List[string]], doDryRun: jboolean, reason: jint, callerPackageName: string, callback: Consumer[Map<String, List[String>]])
  proc onGetRuntimePermissionsBackup*(user: UserHandle, backup: OutputStream, callback: Runnable)
  proc onRestoreRuntimePermissionsBackup*(user: UserHandle, backup: InputStream, callback: Runnable)
  proc onStageAndApplyRuntimePermissionsBackup*(user: UserHandle, backup: InputStream, callback: Runnable)
  proc onRestoreDelayedRuntimePermissionsBackup*(packageName: string, user: UserHandle, callback: Consumer[Boolean])
  proc onApplyStagedRuntimePermissionBackup*(packageName: string, user: UserHandle, callback: Consumer[Boolean])
  proc onGetAppPermissions*(packageName: string, callback: Consumer[List[RuntimePermissionPresentationInfo]])
  proc onRevokeRuntimePermission*(packageName: string, permissionName: string, callback: Runnable)
  proc onCountPermissionApps*(permissionNames: List[string], flags: jint, callback: IntConsumer)
  proc onGetPermissionUsages*(countSystem: jboolean, numMillis: jlong, callback: Consumer[List[RuntimePermissionUsageInfo]])
  proc onGrantOrUpgradeDefaultRuntimePermissions*(callback: Runnable)
  proc onUpdateUserSensitivePermissionFlags*(uid: jint, executor: Executor, callback: Runnable)
  proc onUpdateUserSensitivePermissionFlags*(uid: jint, callback: Runnable)
  proc onSetRuntimePermissionGrantStateByDeviceAdmin*(callerPackageName: string, packageName: string, permission: string, grantState: jint, callback: Consumer[Boolean])
  proc onSetRuntimePermissionGrantStateByDeviceAdmin*(callerPackageName: string, params: AdminPermissionControlParams, callback: Consumer[Boolean])
  proc onOneTimePermissionSessionTimeout*(packageName: string)
  proc onOneTimePermissionSessionTimeout*(packageName: string, deviceId: jint)
  proc onGetPlatformPermissionsForGroup*(permissionGroupName: string, callback: Consumer[List[string]])
  proc onGetGroupOfPlatformPermission*(permissionName: string, callback: Consumer[string])
  proc onRevokeSelfPermissionsOnKill*(packageName: string, permissions: List[string], callback: Runnable)
  proc onRevokeSelfPermissionsOnKill*(packageName: string, permissions: List[string], deviceId: jint, callback: Runnable)
  proc getPrivilegesDescriptionStringForProfile*(deviceProfileName: string): string
  proc onGetUnusedAppCount*(callback: IntConsumer)
  proc onGetHibernationEligibility*(packageName: string, callback: IntConsumer)
  proc onBind*(intent: Intent): IBinder
  SERVICE_INTERFACE*: string {.`static`.}

