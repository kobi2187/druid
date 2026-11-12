import jnim

jclass android.permission.PermissionManager* of JVMObject:
  proc checkPermissionForDataDelivery*(permission: string, attributionSource: AttributionSource, message: string): jint
  proc checkPermissionForStartDataDelivery*(permission: string, attributionSource: AttributionSource, message: string): jint
  proc finishDataDelivery*(permission: string, attributionSource: AttributionSource)
  proc checkPermissionForDataDeliveryFromDataSource*(permission: string, attributionSource: AttributionSource, message: string): jint
  proc checkPermissionForPreflight*(permission: string, attributionSource: AttributionSource): jint
  proc getPermissionInfo*(permissionName: string, flags: jint): PermissionInfo
  proc queryPermissionsByGroup*(groupName: string, flags: jint): List[PermissionInfo]
  proc addPermission*(permissionInfo: PermissionInfo, async: jboolean): jboolean
  proc removePermission*(permissionName: string)
  proc getPermissionGroupInfo*(groupName: string, flags: jint): PermissionGroupInfo
  proc getAllPermissionGroups*(flags: jint): List[PermissionGroupInfo]
  proc isPermissionRevokedByPolicy*(packageName: string, permissionName: string): jboolean
  proc shouldTraceGrant*(packageName: string, permissionName: string, userId: jint): jboolean {.`static`.}
  proc grantRuntimePermission*(packageName: string, permissionName: string, user: UserHandle)
  proc grantRuntimePermission*(packageName: string, permissionName: string, persistentDeviceId: string)
  proc revokeRuntimePermission*(packageName: string, permissionName: string, user: UserHandle, reason: string)
  proc revokeRuntimePermission*(packageName: string, permissionName: string, persistentDeviceId: string, reason: string)
  proc getPermissionFlags*(packageName: string, permissionName: string, user: UserHandle): jint
  proc getPermissionFlags*(packageName: string, permissionName: string, persistentDeviceId: string): jint
  proc updatePermissionFlags*(packageName: string, permissionName: string, flagMask: jint, flagValues: jint, user: UserHandle)
  proc updatePermissionFlags*(packageName: string, permissionName: string, persistentDeviceId: string, flagMask: jint, flagValues: jint)
  proc getAllowlistedRestrictedPermissions*(packageName: string, allowlistFlag: jint): Set[string]
  proc addAllowlistedRestrictedPermission*(packageName: string, permissionName: string, allowlistFlags: jint): jboolean
  proc removeAllowlistedRestrictedPermission*(packageName: string, permissionName: string, allowlistFlags: jint): jboolean
  proc isAutoRevokeExempted*(packageName: string): jboolean
  proc setAutoRevokeExempted*(packageName: string, exempted: jboolean): jboolean
  proc shouldShowRequestPermissionRationale*(permissionName: string): jboolean
  proc addOnPermissionsChangeListener*(listener: PackageManager.OnPermissionsChangedListener)
  proc removeOnPermissionsChangeListener*(listener: PackageManager.OnPermissionsChangedListener)
  proc getRuntimePermissionsVersion*(): jint
  proc setRuntimePermissionsVersion*(version: jint)
  proc getSplitPermissions*(): List[SplitPermissionInfo]
  proc initializeUsageHelper*()
  proc tearDownUsageHelper*()
  proc getIndicatorAppOpUsageData*(): List[PermissionGroupUsage]
  proc getIndicatorAppOpUsageData*(micMuted: jboolean): List[PermissionGroupUsage]
  proc shouldShowPackageForIndicatorCached*(context: Context, packageName: string): jboolean {.`static`.}
  proc getIndicatorExemptedPackages*(context: Context): Set[string] {.`static`.}
  proc updateIndicatorExemptedPackages*(context: Context) {.`static`.}
  proc getAutoRevokeExemptionRequestedPackages*(): Set[string]
  proc getAutoRevokeExemptionGrantedPackages*(): Set[string]
  proc splitPermissionInfoListToParcelableList*(splitPermissionsList: List[SplitPermissionInfo]): List[SplitPermissionInfoParcelable] {.`static`.}
  proc startOneTimePermissionSession*(packageName: string, timeoutMillis: jlong, importanceToResetTimer: jint, importanceToKeepSessionAlive: jint)
  proc startOneTimePermissionSession*(packageName: string, timeoutMillis: jlong, revokeAfterKilledDelayMillis: jlong, importanceToResetTimer: jint, importanceToKeepSessionAlive: jint)
  proc stopOneTimePermissionSession*(packageName: string)
  proc checkDeviceIdentifierAccess*(packageName: string, message: string, callingFeatureId: string, pid: jint, uid: jint): jint
  proc registerAttributionSource*(source: AttributionSource): AttributionSource
  proc isRegisteredAttributionSource*(source: AttributionSource): jboolean
  proc getRegisteredAttributionSourceCountForTest*(uid: jint): jint
  proc revokePostNotificationPermissionWithoutKillForTest*(packageName: string, userId: jint)
  proc checkPermission*(permission: string, pid: jint, uid: jint, deviceId: jint): jint {.`static`.}
  proc getPermissionRequestState*(packageName: string, permission: string, deviceId: jint): jint
  proc getAllPermissionStates*(packageName: string, persistentDeviceId: string): Map[string, PermissionState]
  proc disablePermissionCache*() {.`static`.}
  proc checkPackageNamePermission*(permName: string, pkgName: string, deviceId: jint, userId: jint): jint
  proc resolveDeviceIdForPermissionCheck*(context: Context, deviceId: jint, permission: string): jint {.`static`.}
  proc checkPermission*(permissionName: string, packageName: string, persistentDeviceId: string): jint
  proc disablePackageNamePermissionCache*() {.`static`.}
  PERMISSION_GRANTED*: jint {.`static`.}
  PERMISSION_SOFT_DENIED*: jint {.`static`.}
  PERMISSION_HARD_DENIED*: jint {.`static`.}
  EXPLICIT_SET_FLAGS*: jint {.`static`.}
  ACTION_REVIEW_PERMISSION_DECISIONS*: string {.`static`.}
  LOG_TAG_TRACE_GRANTS*: string {.`static`.}
  KILL_APP_REASON_PERMISSIONS_REVOKED*: string {.`static`.}
  KILL_APP_REASON_GIDS_CHANGED*: string {.`static`.}
  CANNOT_INSTALL_WITH_BAD_PERMISSION_GROUPS*: jlong {.`static`.}
  USE_ACCESS_CHECKING_SERVICE*: jboolean {.`static`.}
  DEBUG_TRACE_GRANTS*: jboolean {.`static`.}
  DEBUG_TRACE_PERMISSION_UPDATES*: jboolean {.`static`.}
  DEBUG_DEVICE_PERMISSIONS*: jboolean {.`static`.}
  EXTRA_PERMISSION_USAGES*: string {.`static`.}
  DEVICE_AWARE_PERMISSIONS*: Set[string] {.`static`.}
  CACHE_KEY_PACKAGE_INFO_NOTIFY*: string {.`static`.}
  CACHE_KEY_PACKAGE_INFO_CACHE*: string {.`static`.}

jclass android.permission.PermissionManager.SplitPermissionInfo* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc getSplitPermission*(): string
  proc getNewPermissions*(): List[string]
  proc getTargetSdk*(): jint

jclass android.permission.PermissionManager.PermissionState* of JVMObject:
  proc isGranted*(): jboolean
  proc getFlags*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

jclass android.permission.SplitPermissionInfo* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc getSplitPermission*(): string
  proc getNewPermissions*(): List[string]
  proc getTargetSdk*(): jint

jclass android.permission.PermissionState* of JVMObject:
  proc isGranted*(): jboolean
  proc getFlags*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  CREATOR*: Creator[PermissionState] {.`static`.}

