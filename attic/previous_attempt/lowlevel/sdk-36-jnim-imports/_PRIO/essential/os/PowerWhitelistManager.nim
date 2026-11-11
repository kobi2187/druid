import jnim

jclass android.os.PowerWhitelistManager* of JVMObject:
  proc addToWhitelist*(packageName: string)
  proc addToWhitelist*(packageNames: List[string])
  proc getWhitelistedAppIds*(includingIdle: jboolean): seq[jint]
  proc isWhitelisted*(packageName: string, includingIdle: jboolean): jboolean
  proc removeFromWhitelist*(packageName: string)
  proc whitelistAppTemporarily*(packageName: string, durationMs: jlong, reasonCode: jint, reason: string)
  proc whitelistAppTemporarily*(packageName: string, durationMs: jlong)
  proc whitelistAppTemporarilyForEvent*(packageName: string, event: jint, reason: string): jlong
  proc whitelistAppTemporarilyForEvent*(packageName: string, event: jint, reasonCode: jint, reason: string): jlong
  proc getReasonCodeFromProcState*(procState: jint): jint {.`static`.}
  proc reasonCodeToString*(reasonCode: jint): string {.`static`.}
  EVENT_UNSPECIFIED*: jint {.`static`.}
  EVENT_SMS*: jint {.`static`.}
  EVENT_MMS*: jint {.`static`.}
  TEMPORARY_ALLOWLIST_TYPE_FOREGROUND_SERVICE_ALLOWED*: jint {.`static`.}
  TEMPORARY_ALLOWLIST_TYPE_FOREGROUND_SERVICE_NOT_ALLOWED*: jint {.`static`.}
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
  REASON_GEOFENCING*: jint {.`static`.}
  REASON_PUSH_MESSAGING*: jint {.`static`.}
  REASON_PUSH_MESSAGING_OVER_QUOTA*: jint {.`static`.}
  REASON_ACTIVITY_RECOGNITION*: jint {.`static`.}
  REASON_BOOT_COMPLETED*: jint {.`static`.}
  REASON_PRE_BOOT_COMPLETED*: jint {.`static`.}
  REASON_LOCKED_BOOT_COMPLETED*: jint {.`static`.}
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
  REASON_TILE_ONCLICK*: jint {.`static`.}

