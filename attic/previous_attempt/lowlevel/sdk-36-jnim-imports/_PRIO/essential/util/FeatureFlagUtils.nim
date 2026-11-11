import jnim

jclass android.util.FeatureFlagUtils* of JVMObject:
  proc isEnabled*(context: Context, feature: string): jboolean {.`static`.}
  proc setEnabled*(context: Context, feature: string, enabled: jboolean) {.`static`.}
  proc getAllFeatureFlags*(): Map[string, string] {.`static`.}
  FFLAG_PREFIX*: string {.`static`.}
  FFLAG_OVERRIDE_PREFIX*: string {.`static`.}
  PERSIST_PREFIX*: string {.`static`.}
  HEARING_AID_SETTINGS*: string {.`static`.}
  SETTINGS_WIFITRACKER2*: string {.`static`.}
  SETTINGS_DO_NOT_RESTORE_PRESERVED*: string {.`static`.}
  SETTINGS_USE_NEW_BACKUP_ELIGIBILITY_RULES*: string {.`static`.}
  SETTINGS_ENABLE_SECURITY_HUB*: string {.`static`.}
  SETTINGS_SUPPORT_LARGE_SCREEN*: string {.`static`.}
  SETTINGS_APP_LOCALE_OPT_IN_ENABLED*: string {.`static`.}
  SETTINGS_VOLUME_PANEL_IN_SYSTEMUI*: string {.`static`.}
  SETTINGS_ENABLE_MONITOR_PHANTOM_PROCS*: string {.`static`.}
  SETTINGS_APP_ALLOW_DARK_THEME_ACTIVATION_AT_BEDTIME*: string {.`static`.}
  SETTINGS_NEED_CONNECTED_BLE_DEVICE_FOR_BROADCAST*: string {.`static`.}
  SETTINGS_NEW_KEYBOARD_MODIFIER_KEY*: string {.`static`.}
  SETTINGS_NEW_KEYBOARD_TRACKPAD*: string {.`static`.}
  SETTINGS_ENABLE_SPA*: string {.`static`.}
  SETTINGS_ENABLE_SPA_PHASE2*: string {.`static`.}
  SETTINGS_ENABLE_SPA_METRICS*: string {.`static`.}
  SETTINGS_ADB_METRICS_WRITER*: string {.`static`.}
  SETTINGS_SHOW_STYLUS_PREFERENCES*: string {.`static`.}
  SETTINGS_BIOMETRICS2_FINGERPRINT_SETTINGS*: string {.`static`.}
  SETTINGS_REMOTEAUTH_ENROLLMENT_SETTINGS*: string {.`static`.}
  SETTINGS_PREFER_ACCESSIBILITY_MENU_IN_SYSTEM*: string {.`static`.}
  SETTINGS_AUDIO_ROUTING*: string {.`static`.}
  SETTINGS_FLASH_NOTIFICATIONS*: string {.`static`.}
  SETTINGS_ENABLE_LOCKSCREEN_TRANSFER_API*: string {.`static`.}
  SETTINGS_REMOTE_DEVICE_CREDENTIAL_VALIDATION*: string {.`static`.}

