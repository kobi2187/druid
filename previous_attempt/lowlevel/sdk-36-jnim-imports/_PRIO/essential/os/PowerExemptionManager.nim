import jnim

jclass android.os.PowerExemptionManager* of JVMObject:
  proc addToPermanentAllowList*(packageName: string)
  proc addToPermanentAllowList*(packageNames: List[string])
  proc getAllowListedAppIds*(includingIdle: jboolean): seq[jint]
  proc isAllowListed*(packageName: string, includingIdle: jboolean): jboolean
  proc removeFromPermanentAllowList*(packageName: string)
  proc addToTemporaryAllowList*(packageName: string, reasonCode: jint, reason: string, durationMs: jlong)
  proc addToTemporaryAllowListForEvent*(packageName: string, reasonCode: jint, reason: string, event: jint): jlong
  proc getReasonCodeFromProcState*(procState: jint): jint {.`static`.}
  proc getExemptionReasonForStatsd*(reasonCode: jint): jint {.`static`.}
  proc reasonCodeToString*(reasonCode: jint): string {.`static`.}
  EVENT_UNSPECIFIED*: jint {.`static`.}
  EVENT_SMS*: jint {.`static`.}
  EVENT_MMS*: jint {.`static`.}
  TEMPORARY_ALLOW_LIST_TYPE_NONE*: jint {.`static`.}
  TEMPORARY_ALLOW_LIST_TYPE_FOREGROUND_SERVICE_ALLOWED*: jint {.`static`.}
  TEMPORARY_ALLOW_LIST_TYPE_FOREGROUND_SERVICE_NOT_ALLOWED*: jint {.`static`.}
  TEMPORARY_ALLOW_LIST_TYPE_APP_FREEZING_DELAYED*: jint {.`static`.}
  REASON_DENIED*: jint {.`static`.}
  REASON_UNKNOWN*: jint {.`static`.}
  REASON_OTHER*: jint {.`static`.}
  REASON_PROC_STATE_PERSISTENT*: jint {.`static`.}
  REASON_PROC_STATE_PERSISTENT_UI*: jint {.`static`.}
  REASON_PROC_STATE_TOP*: jint {.`static`.}
  REASON_PROC_STATE_BTOP*: jint {.`static`.}
  REASON_PROC_STATE_FGS*: jint {.`static`.}
  REASON_PROC_STATE_BFGS*: jint {.`static`.}
  REASON_UID_VISIBLE*: jint {.`static`.}
  REASON_SYSTEM_UID*: jint {.`static`.}
  REASON_ACTIVITY_STARTER*: jint {.`static`.}
  REASON_START_ACTIVITY_FLAG*: jint {.`static`.}
  REASON_FGS_BINDING*: jint {.`static`.}
  REASON_DEVICE_OWNER*: jint {.`static`.}
  REASON_PROFILE_OWNER*: jint {.`static`.}
  REASON_COMPANION_DEVICE_MANAGER*: jint {.`static`.}
  REASON_BACKGROUND_ACTIVITY_PERMISSION*: jint {.`static`.}
  REASON_BACKGROUND_FGS_PERMISSION*: jint {.`static`.}
  REASON_INSTR_BACKGROUND_ACTIVITY_PERMISSION*: jint {.`static`.}
  REASON_INSTR_BACKGROUND_FGS_PERMISSION*: jint {.`static`.}
  REASON_SYSTEM_ALERT_WINDOW_PERMISSION*: jint {.`static`.}
  REASON_DEVICE_DEMO_MODE*: jint {.`static`.}
  REASON_ALLOWLISTED_PACKAGE*: jint {.`static`.}
  REASON_APPOP*: jint {.`static`.}
  REASON_ACTIVITY_VISIBILITY_GRACE_PERIOD*: jint {.`static`.}
  REASON_OP_ACTIVATE_VPN*: jint {.`static`.}
  REASON_OP_ACTIVATE_PLATFORM_VPN*: jint {.`static`.}
  REASON_TEMP_ALLOWED_WHILE_IN_USE*: jint {.`static`.}
  REASON_CURRENT_INPUT_METHOD*: jint {.`static`.}
  REASON_GEOFENCING*: jint {.`static`.}
  REASON_PUSH_MESSAGING*: jint {.`static`.}
  REASON_PUSH_MESSAGING_OVER_QUOTA*: jint {.`static`.}
  REASON_ACTIVITY_RECOGNITION*: jint {.`static`.}
  REASON_ACCOUNT_TRANSFER*: jint {.`static`.}
  REASON_PUSH_MESSAGING_DEFERRABLE*: jint {.`static`.}
  REASON_BOOT_COMPLETED*: jint {.`static`.}
  REASON_PRE_BOOT_COMPLETED*: jint {.`static`.}
  REASON_LOCKED_BOOT_COMPLETED*: jint {.`static`.}
  REASON_BLUETOOTH_BROADCAST*: jint {.`static`.}
  REASON_TIMEZONE_CHANGED*: jint {.`static`.}
  REASON_TIME_CHANGED*: jint {.`static`.}
  REASON_LOCALE_CHANGED*: jint {.`static`.}
  REASON_SCHEDULE_EXACT_ALARM_PERMISSION_STATE_CHANGED*: jint {.`static`.}
  REASON_REFRESH_SAFETY_SOURCES*: jint {.`static`.}
  REASON_SYSTEM_ALLOW_LISTED*: jint {.`static`.}
  REASON_ALARM_MANAGER_ALARM_CLOCK*: jint {.`static`.}
  REASON_ALARM_MANAGER_WHILE_IDLE*: jint {.`static`.}
  REASON_SERVICE_LAUNCH*: jint {.`static`.}
  REASON_KEY_CHAIN*: jint {.`static`.}
  REASON_PACKAGE_VERIFIER*: jint {.`static`.}
  REASON_SYNC_MANAGER*: jint {.`static`.}
  REASON_DOMAIN_VERIFICATION_V1*: jint {.`static`.}
  REASON_DOMAIN_VERIFICATION_V2*: jint {.`static`.}
  REASON_VPN*: jint {.`static`.}
  REASON_NOTIFICATION_SERVICE*: jint {.`static`.}
  REASON_PACKAGE_REPLACED*: jint {.`static`.}
  REASON_LOCATION_PROVIDER*: jint {.`static`.}
  REASON_MEDIA_BUTTON*: jint {.`static`.}
  REASON_EVENT_SMS*: jint {.`static`.}
  REASON_EVENT_MMS*: jint {.`static`.}
  REASON_SHELL*: jint {.`static`.}
  REASON_MEDIA_SESSION_CALLBACK*: jint {.`static`.}
  REASON_ROLE_DIALER*: jint {.`static`.}
  REASON_ROLE_EMERGENCY*: jint {.`static`.}
  REASON_SYSTEM_MODULE*: jint {.`static`.}
  REASON_CARRIER_PRIVILEGED_APP*: jint {.`static`.}
  REASON_DPO_PROTECTED_APP*: jint {.`static`.}
  REASON_DISALLOW_APPS_CONTROL*: jint {.`static`.}
  REASON_ACTIVE_DEVICE_ADMIN*: jint {.`static`.}
  REASON_MEDIA_NOTIFICATION_TRANSFER*: jint {.`static`.}
  REASON_PACKAGE_INSTALLER*: jint {.`static`.}
  REASON_SYSTEM_EXEMPT_APP_OP*: jint {.`static`.}
  REASON_PACKAGE_UNARCHIVE*: jint {.`static`.}
  REASON_TILE_ONCLICK*: jint {.`static`.}
  REASON_OPT_OUT_REQUESTED*: jint {.`static`.}

