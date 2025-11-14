import jnim

jclass android.app.ForegroundServiceTypePolicy* of JVMObject:
  proc getForegroundServiceTypePolicyInfo*(type: jint, defaultToType: jint): ForegroundServiceTypePolicyInfo
  proc checkForegroundServiceTypePolicy*(context: Context, packageName: string, callerUid: jint, callerPid: jint, allowWhileInUse: jboolean, policy: ForegroundServiceTypePolicyInfo): jint
  proc updatePermissionEnforcementFlagIfNecessary*(flag: string)
  proc getDefaultPolicy*(): ForegroundServiceTypePolicy {.`static`.}
  FGS_TYPE_NONE_DEPRECATION_CHANGE_ID*: jlong {.`static`.}
  FGS_TYPE_NONE_DISABLED_CHANGE_ID*: jlong {.`static`.}
  FGS_TYPE_DATA_SYNC_DEPRECATION_CHANGE_ID*: jlong {.`static`.}
  FGS_TYPE_DATA_SYNC_DISABLED_CHANGE_ID*: jlong {.`static`.}
  FGS_TYPE_PERMISSION_CHANGE_ID*: jlong {.`static`.}
  FGS_TYPE_POLICY_MANIFEST*: ForegroundServiceTypePolicyInfo {.`static`.}
  FGS_TYPE_POLICY_NONE*: ForegroundServiceTypePolicyInfo {.`static`.}
  FGS_TYPE_POLICY_DATA_SYNC*: ForegroundServiceTypePolicyInfo {.`static`.}
  FGS_TYPE_POLICY_MEDIA_PLAYBACK*: ForegroundServiceTypePolicyInfo {.`static`.}
  FGS_TYPE_POLICY_PHONE_CALL*: ForegroundServiceTypePolicyInfo {.`static`.}
  FGS_TYPE_POLICY_LOCATION*: ForegroundServiceTypePolicyInfo {.`static`.}
  FGS_TYPE_POLICY_CONNECTED_DEVICE*: ForegroundServiceTypePolicyInfo {.`static`.}
  FGS_TYPE_POLICY_MEDIA_PROJECTION*: ForegroundServiceTypePolicyInfo {.`static`.}
  FGS_TYPE_POLICY_CAMERA*: ForegroundServiceTypePolicyInfo {.`static`.}
  FGS_TYPE_POLICY_MICROPHONE*: ForegroundServiceTypePolicyInfo {.`static`.}
  FGS_TYPE_POLICY_HEALTH*: ForegroundServiceTypePolicyInfo {.`static`.}
  FGS_TYPE_POLICY_REMOTE_MESSAGING*: ForegroundServiceTypePolicyInfo {.`static`.}
  FGS_TYPE_POLICY_SYSTEM_EXEMPTED*: ForegroundServiceTypePolicyInfo {.`static`.}
  FGS_TYPE_POLICY_SHORT_SERVICE*: ForegroundServiceTypePolicyInfo {.`static`.}
  FGS_TYPE_POLICY_FILE_MANAGEMENT*: ForegroundServiceTypePolicyInfo {.`static`.}
  FGS_TYPE_POLICY_MEDIA_PROCESSING*: ForegroundServiceTypePolicyInfo {.`static`.}
  FGS_TYPE_POLICY_SPECIAL_USE*: ForegroundServiceTypePolicyInfo {.`static`.}
  FGS_TYPE_POLICY_CHECK_UNKNOWN*: jint {.`static`.}
  FGS_TYPE_POLICY_CHECK_OK*: jint {.`static`.}
  FGS_TYPE_POLICY_CHECK_DEPRECATED*: jint {.`static`.}
  FGS_TYPE_POLICY_CHECK_DISABLED*: jint {.`static`.}
  FGS_TYPE_POLICY_CHECK_PERMISSION_DENIED_PERMISSIVE*: jint {.`static`.}
  FGS_TYPE_POLICY_CHECK_PERMISSION_DENIED_ENFORCED*: jint {.`static`.}

jclass android.app.ForegroundServiceTypePolicy.ForegroundServiceTypePolicyInfo* of JVMObject:
  proc getForegroundServiceType*(): jint
  proc toString*(): string
  proc toPermissionString*(): string
  proc setCustomPermission*(customPermission: ForegroundServiceTypePermission)
  proc getRequiredAllOfPermissionsForTest*(context: Context): Optional[seq[string]]
  proc getRequiredAnyOfPermissionsForTest*(context: Context): Optional[seq[string]]
  proc isTypeDisabled*(callerUid: jint): jboolean
  proc hasForegroundOnlyPermission*(): jboolean
  proc setTypeDisabledForTest*(disabled: jboolean, packageName: string)
  proc clearTypeDisabledForTest*(packageName: string)
  proc getPermissionEnforcementFlagForTest*(): string

jclass android.app.ForegroundServiceTypePolicy.ForegroundServiceTypePermissions* of JVMObject:
  proc checkPermissions*(context: Context, callerUid: jint, callerPid: jint, packageName: string, allowWhileInUse: jboolean): jint
  proc toString*(): string

jclass android.app.ForegroundServiceTypePolicy.ForegroundServiceTypePermission* of JVMObject:
  proc checkPermission*(context: Context, callerUid: jint, callerPid: jint, packageName: string, allowWhileInUse: jboolean): jint
  proc toString*(): string

jclass android.app.ForegroundServiceTypePolicy.DefaultForegroundServiceTypePolicy* of JVMObject:
  proc getForegroundServiceTypePolicyInfo*(type: jint, defaultToType: jint): ForegroundServiceTypePolicyInfo
  proc checkForegroundServiceTypePolicy*(context: Context, packageName: string, callerUid: jint, callerPid: jint, allowWhileInUse: jboolean, policy: ForegroundServiceTypePolicyInfo): jint
  proc updatePermissionEnforcementFlagIfNecessary*(flagName: string)

jclass android.app.ForegroundServiceTypePolicyInfo* of JVMObject:
  proc getForegroundServiceType*(): jint
  proc toString*(): string
  proc toPermissionString*(): string
  proc setCustomPermission*(customPermission: ForegroundServiceTypePermission)
  proc getRequiredAllOfPermissionsForTest*(context: Context): Optional[seq[string]]
  proc getRequiredAnyOfPermissionsForTest*(context: Context): Optional[seq[string]]
  proc isTypeDisabled*(callerUid: jint): jboolean
  proc hasForegroundOnlyPermission*(): jboolean
  proc setTypeDisabledForTest*(disabled: jboolean, packageName: string)
  proc clearTypeDisabledForTest*(packageName: string)
  proc getPermissionEnforcementFlagForTest*(): string

jclass android.app.ForegroundServiceTypePermissions* of JVMObject:
  proc checkPermissions*(context: Context, callerUid: jint, callerPid: jint, packageName: string, allowWhileInUse: jboolean): jint
  proc toString*(): string

jclass android.app.ForegroundServiceTypePermission* of JVMObject:
  proc checkPermission*(context: Context, callerUid: jint, callerPid: jint, packageName: string, allowWhileInUse: jboolean): jint
  proc toString*(): string

jclass android.app.DefaultForegroundServiceTypePolicy* of ForegroundServiceTypePolicy:
  proc getForegroundServiceTypePolicyInfo*(type: jint, defaultToType: jint): ForegroundServiceTypePolicyInfo
  proc checkForegroundServiceTypePolicy*(context: Context, packageName: string, callerUid: jint, callerPid: jint, allowWhileInUse: jboolean, policy: ForegroundServiceTypePolicyInfo): jint
  proc updatePermissionEnforcementFlagIfNecessary*(flagName: string)

