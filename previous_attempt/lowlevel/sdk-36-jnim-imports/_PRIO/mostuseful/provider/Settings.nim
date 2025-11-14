import jnim

jclass android.provider.Settings* of JVMObject:
  proc setInSystemServer*() {.`static`.}
  proc isInSystemServer*(): jboolean {.`static`.}
  proc canDrawOverlays*(context: Context): jboolean {.`static`.}
  proc isCallingPackageAllowedToWriteSettings*(context: Context, uid: jint, callingPackage: string, throwException: jboolean): jboolean {.`static`.}
  proc checkAndNoteWriteSettingsOperation*(context: Context, uid: jint, callingPackage: string, throwException: jboolean): jboolean {.`static`.}
  proc checkAndNoteWriteSettingsOperation*(context: Context, uid: jint, callingPackage: string, callingAttributionTag: string, throwException: jboolean): jboolean {.`static`.}
  proc isCallingPackageAllowedToDrawOverlays*(context: Context, uid: jint, callingPackage: string, throwException: jboolean): jboolean {.`static`.}
  proc checkAndNoteDrawOverlaysOperation*(context: Context, uid: jint, callingPackage: string, callingAttributionTag: string, throwException: jboolean): jboolean {.`static`.}
  proc isCallingPackageAllowedToPerformAppOpsProtectedOperation*(context: Context, uid: jint, callingPackage: string, throwException: jboolean, appOpsOpCode: jint, permissions: seq[string], makeNote: jboolean): jboolean {.`static`.}
  proc isCallingPackageAllowedToPerformAppOpsProtectedOperation*(context: Context, uid: jint, callingPackage: string, callingAttributionTag: string, throwException: jboolean, appOpsOpCode: jint, permissions: seq[string], makeNote: jboolean): jboolean {.`static`.}
  proc getPackageNameForUid*(context: Context, uid: jint): string {.`static`.}
  DEFAULT_OVERRIDEABLE_BY_RESTORE*: jboolean {.`static`.}
  ACTION_SETTINGS*: string {.`static`.}
  ACTION_SATELLITE_SETTING*: string {.`static`.}
  ACTION_APN_SETTINGS*: string {.`static`.}
  ACTION_LOCATION_SOURCE_SETTINGS*: string {.`static`.}
  ACTION_LOCATION_CONTROLLER_EXTRA_PACKAGE_SETTINGS*: string {.`static`.}
  ACTION_LOCATION_SCANNING_SETTINGS*: string {.`static`.}
  ACTION_MANAGE_CLONED_APPS_SETTINGS*: string {.`static`.}
  ACTION_USER_SETTINGS*: string {.`static`.}
  ACTION_WIRELESS_SETTINGS*: string {.`static`.}
  ACTION_TETHER_PROVISIONING_UI*: string {.`static`.}
  ACTION_TETHER_UNSUPPORTED_CARRIER_UI*: string {.`static`.}
  ACTION_AIRPLANE_MODE_SETTINGS*: string {.`static`.}
  ACTION_SHOW_ENABLED_ESIM_PROFILE*: string {.`static`.}
  ACTION_MOBILE_DATA_USAGE*: string {.`static`.}
  EXTRA_NETWORK_TEMPLATE*: string {.`static`.}
  ACTION_ONE_HANDED_SETTINGS*: string {.`static`.}
  ACTION_DOUBLE_TAP_POWER_SETTINGS*: string {.`static`.}
  SET_ALL_RESULT_FAILURE*: jint {.`static`.}
  SET_ALL_RESULT_SUCCESS*: jint {.`static`.}
  SET_ALL_RESULT_DISABLED*: jint {.`static`.}
  KEY_CONFIG_SET_ALL_RETURN*: string {.`static`.}
  KEY_CONFIG_GET_SYNC_DISABLED_MODE_RETURN*: string {.`static`.}
  EXTRA_SUB_ID*: string {.`static`.}
  ACTION_VOICE_CONTROL_AIRPLANE_MODE*: string {.`static`.}
  ACTION_ACCESSIBILITY_SETTINGS*: string {.`static`.}
  ACTION_ACCESSIBILITY_DETAILS_SETTINGS*: string {.`static`.}
  ACTION_ACCESSIBILITY_SHORTCUT_SETTINGS*: string {.`static`.}
  ACTION_ACCESSIBILITY_COLOR_MOTION_SETTINGS*: string {.`static`.}
  ACTION_ACCESSIBILITY_COLOR_CONTRAST_SETTINGS*: string {.`static`.}
  ACTION_REDUCE_BRIGHT_COLORS_SETTINGS*: string {.`static`.}
  ACTION_COLOR_CORRECTION_SETTINGS*: string {.`static`.}
  ACTION_COLOR_INVERSION_SETTINGS*: string {.`static`.}
  ACTION_TEXT_READING_SETTINGS*: string {.`static`.}
  ACTION_USAGE_ACCESS_SETTINGS*: string {.`static`.}
  INTENT_CATEGORY_USAGE_ACCESS_CONFIG*: string {.`static`.}
  METADATA_USAGE_ACCESS_REASON*: string {.`static`.}
  ACTION_SECURITY_SETTINGS*: string {.`static`.}
  ACTION_MANAGE_UNKNOWN_APP_SOURCES*: string {.`static`.}
  ACTION_REQUEST_SCHEDULE_EXACT_ALARM*: string {.`static`.}
  ACTION_REQUEST_MANAGE_MEDIA*: string {.`static`.}
  ACTION_REQUEST_MEDIA_ROUTING_CONTROL*: string {.`static`.}
  ACTION_MANAGE_APP_LONG_RUNNING_JOBS*: string {.`static`.}
  ACTION_MANAGE_CROSS_PROFILE_ACCESS*: string {.`static`.}
  ACTION_APP_OPEN_BY_DEFAULT_SETTINGS*: string {.`static`.}
  ACTION_TRUSTED_CREDENTIALS_USER*: string {.`static`.}
  ACTION_MONITORING_CERT_INFO*: string {.`static`.}
  ACTION_PRIVACY_SETTINGS*: string {.`static`.}
  ACTION_PRIVACY_CONTROLS*: string {.`static`.}
  ACTION_VPN_SETTINGS*: string {.`static`.}
  ACTION_WIFI_SETTINGS*: string {.`static`.}
  ACTION_ADVANCED_MEMORY_PROTECTION_SETTINGS*: string {.`static`.}
  ACTION_WIFI_IP_SETTINGS*: string {.`static`.}
  ACTION_PROCESS_WIFI_EASY_CONNECT_URI*: string {.`static`.}
  EXTRA_EASY_CONNECT_ERROR_CODE*: string {.`static`.}
  EXTRA_EASY_CONNECT_ATTEMPTED_SSID*: string {.`static`.}
  EXTRA_EASY_CONNECT_CHANNEL_LIST*: string {.`static`.}
  EXTRA_EASY_CONNECT_BAND_LIST*: string {.`static`.}
  ACTION_DATA_USAGE_SETTINGS*: string {.`static`.}
  ACTION_BLUETOOTH_SETTINGS*: string {.`static`.}
  ACTION_HEARING_DEVICES_SETTINGS*: string {.`static`.}
  ACTION_APP_SEARCH_SETTINGS*: string {.`static`.}
  ACTION_ASSIST_GESTURE_SETTINGS*: string {.`static`.}
  ACTION_FINGERPRINT_ENROLL*: string {.`static`.}
  ACTION_BIOMETRIC_ENROLL*: string {.`static`.}
  EXTRA_BIOMETRIC_AUTHENTICATORS_ALLOWED*: string {.`static`.}
  ACTION_CAST_SETTINGS*: string {.`static`.}
  ACTION_DATE_SETTINGS*: string {.`static`.}
  ACTION_SOUND_SETTINGS*: string {.`static`.}
  ACTION_DISPLAY_SETTINGS*: string {.`static`.}
  ACTION_AUTO_ROTATE_SETTINGS*: string {.`static`.}
  ACTION_NIGHT_DISPLAY_SETTINGS*: string {.`static`.}
  ACTION_DARK_THEME_SETTINGS*: string {.`static`.}
  ACTION_LOCALE_SETTINGS*: string {.`static`.}
  EXTRA_EXPLICIT_LOCALES*: string {.`static`.}
  ACTION_APP_LOCALE_SETTINGS*: string {.`static`.}
  ACTION_REGIONAL_PREFERENCES_SETTINGS*: string {.`static`.}
  ACTION_REGION_SETTINGS*: string {.`static`.}
  ACTION_FIRST_DAY_OF_WEEK_SETTINGS*: string {.`static`.}
  ACTION_TEMPERATURE_UNIT_SETTINGS*: string {.`static`.}
  ACTION_MEASUREMENT_SYSTEM_SETTINGS*: string {.`static`.}
  ACTION_LOCKSCREEN_SETTINGS*: string {.`static`.}
  ACTION_LOCKSCREEN_NOTIFICATIONS_SETTINGS*: string {.`static`.}
  ACTION_BLUETOOTH_PAIRING_SETTINGS*: string {.`static`.}
  ACTION_HEARING_DEVICE_PAIRING_SETTINGS*: string {.`static`.}
  ACTION_VOICE_INPUT_SETTINGS*: string {.`static`.}
  ACTION_INPUT_METHOD_SETTINGS*: string {.`static`.}
  ACTION_INPUT_METHOD_SUBTYPE_SETTINGS*: string {.`static`.}
  ACTION_USER_DICTIONARY_SETTINGS*: string {.`static`.}
  ACTION_HARD_KEYBOARD_SETTINGS*: string {.`static`.}
  ACTION_USER_DICTIONARY_INSERT*: string {.`static`.}
  ACTION_APPLICATION_SETTINGS*: string {.`static`.}
  ACTION_APPLICATION_DEVELOPMENT_SETTINGS*: string {.`static`.}
  ACTION_QUICK_LAUNCH_SETTINGS*: string {.`static`.}
  ACTION_MANAGE_ADAPTIVE_NOTIFICATIONS*: string {.`static`.}
  ACTION_MANAGE_APPLICATIONS_SETTINGS*: string {.`static`.}
  ACTION_MANAGE_ALL_APPLICATIONS_SETTINGS*: string {.`static`.}
  ACTION_MANAGE_ALL_SIM_PROFILES_SETTINGS*: string {.`static`.}
  ACTION_MANAGE_OVERLAY_PERMISSION*: string {.`static`.}
  ACTION_MANAGE_APP_OVERLAY_PERMISSION*: string {.`static`.}
  ACTION_MANAGE_WRITE_SETTINGS*: string {.`static`.}
  ACTION_APP_USAGE_SETTINGS*: string {.`static`.}
  ACTION_APPLICATION_DETAILS_SETTINGS*: string {.`static`.}
  ACTION_FOREGROUND_SERVICES_SETTINGS*: string {.`static`.}
  ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS*: string {.`static`.}
  ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS*: string {.`static`.}
  ACTION_VIEW_ADVANCED_POWER_USAGE_DETAIL*: string {.`static`.}
  ACTION_IGNORE_BACKGROUND_DATA_RESTRICTIONS_SETTINGS*: string {.`static`.}
  ACTION_APP_OPS_SETTINGS*: string {.`static`.}
  ACTION_SYSTEM_UPDATE_SETTINGS*: string {.`static`.}
  ACTION_MANAGED_PROFILE_SETTINGS*: string {.`static`.}
  ACTION_SYNC_SETTINGS*: string {.`static`.}
  ACTION_ADD_ACCOUNT*: string {.`static`.}
  ACTION_DATA_SAVER_SETTINGS*: string {.`static`.}
  ACTION_NETWORK_OPERATOR_SETTINGS*: string {.`static`.}
  ACTION_NETWORK_PROVIDER_SETTINGS*: string {.`static`.}
  ACTION_DATA_ROAMING_SETTINGS*: string {.`static`.}
  ACTION_INTERNAL_STORAGE_SETTINGS*: string {.`static`.}
  ACTION_MEMORY_CARD_SETTINGS*: string {.`static`.}
  ACTION_SEARCH_SETTINGS*: string {.`static`.}
  ACTION_DEVICE_INFO_SETTINGS*: string {.`static`.}
  ACTION_NFC_SETTINGS*: string {.`static`.}
  ACTION_NFCSHARING_SETTINGS*: string {.`static`.}
  ACTION_NFC_PAYMENT_SETTINGS*: string {.`static`.}
  ACTION_DREAM_SETTINGS*: string {.`static`.}
  ACTION_COMMUNAL_SETTING*: string {.`static`.}
  ACTION_NOTIFICATION_ASSISTANT_SETTINGS*: string {.`static`.}
  ACTION_NOTIFICATION_LISTENER_SETTINGS*: string {.`static`.}
  ACTION_NOTIFICATION_LISTENER_DETAIL_SETTINGS*: string {.`static`.}
  EXTRA_NOTIFICATION_LISTENER_COMPONENT_NAME*: string {.`static`.}
  ACTION_NOTIFICATION_POLICY_ACCESS_SETTINGS*: string {.`static`.}
  ACTION_NOTIFICATION_POLICY_ACCESS_DETAIL_SETTINGS*: string {.`static`.}
  ACTION_CONDITION_PROVIDER_SETTINGS*: string {.`static`.}
  ACTION_AUTOMATIC_ZEN_RULE_SETTINGS*: string {.`static`.}
  EXTRA_AUTOMATIC_ZEN_RULE_ID*: string {.`static`.}
  ACTION_CAPTIONING_SETTINGS*: string {.`static`.}
  ACTION_PRINT_SETTINGS*: string {.`static`.}
  ACTION_ZEN_MODE_SETTINGS*: string {.`static`.}
  ACTION_ZEN_MODE_PRIORITY_SETTINGS*: string {.`static`.}
  ACTION_ZEN_MODE_AUTOMATION_SETTINGS*: string {.`static`.}
  ACTION_VOICE_CONTROL_DO_NOT_DISTURB_MODE*: string {.`static`.}
  ACTION_ZEN_MODE_SCHEDULE_RULE_SETTINGS*: string {.`static`.}
  ACTION_ZEN_MODE_EVENT_RULE_SETTINGS*: string {.`static`.}
  ACTION_ZEN_MODE_EXTERNAL_RULE_SETTINGS*: string {.`static`.}
  ACTION_SHOW_REGULATORY_INFO*: string {.`static`.}
  DEVICE_NAME_SETTINGS*: string {.`static`.}
  ACTION_PAIRING_SETTINGS*: string {.`static`.}
  ACTION_BATTERY_SAVER_SETTINGS*: string {.`static`.}
  ACTION_VOICE_CONTROL_BATTERY_SAVER_MODE*: string {.`static`.}
  ACTION_HOME_SETTINGS*: string {.`static`.}
  ACTION_MANAGE_DEFAULT_APPS_SETTINGS*: string {.`static`.}
  ACTION_MANAGE_MORE_DEFAULT_APPS_SETTINGS*: string {.`static`.}
  ACTION_MANAGE_OTHER_NFC_SERVICES_SETTINGS*: string {.`static`.}
  ACTION_MANAGE_USER_ASPECT_RATIO_SETTINGS*: string {.`static`.}
  ACTION_NOTIFICATION_SETTINGS*: string {.`static`.}
  ACTION_CONVERSATION_SETTINGS*: string {.`static`.}
  ACTION_NOTIFICATION_HISTORY*: string {.`static`.}
  ACTION_ALL_APPS_NOTIFICATION_SETTINGS*: string {.`static`.}
  ACTION_ALL_APPS_NOTIFICATION_SETTINGS_FOR_REVIEW*: string {.`static`.}
  ACTION_APP_NOTIFICATION_PROMOTION_SETTINGS*: string {.`static`.}
  ACTION_APP_NOTIFICATION_SETTINGS*: string {.`static`.}
  ACTION_CHANNEL_NOTIFICATION_SETTINGS*: string {.`static`.}
  ACTION_APP_NOTIFICATION_BUBBLE_SETTINGS*: string {.`static`.}
  ACTION_SIM_PREFERENCE_SETTINGS*: string {.`static`.}
  EXTRA_ENTRYPOINT*: string {.`static`.}
  EXTRA_APP_PACKAGE*: string {.`static`.}
  EXTRA_CHANNEL_ID*: string {.`static`.}
  EXTRA_CONVERSATION_ID*: string {.`static`.}
  EXTRA_CHANNEL_FILTER_LIST*: string {.`static`.}
  ACTION_APP_NOTIFICATION_REDACTION*: string {.`static`.}
  EXTRA_APP_UID*: string {.`static`.}
  ACTION_POWER_MENU_SETTINGS*: string {.`static`.}
  ACTION_DEVICE_CONTROLS_SETTINGS*: string {.`static`.}
  ACTION_MEDIA_CONTROLS_SETTINGS*: string {.`static`.}
  ACTION_SHOW_ADMIN_SUPPORT_DETAILS*: string {.`static`.}
  EXTRA_SUPERVISOR_RESTRICTED_SETTING_KEY*: string {.`static`.}
  SUPERVISOR_VERIFICATION_SETTING_UNKNOWN*: jint {.`static`.}
  SUPERVISOR_VERIFICATION_SETTING_BIOMETRICS*: jint {.`static`.}
  ACTION_MANAGE_SUPERVISOR_RESTRICTED_SETTING*: string {.`static`.}
  ACTION_SHOW_REMOTE_BUGREPORT_DIALOG*: string {.`static`.}
  ACTION_VR_LISTENER_SETTINGS*: string {.`static`.}
  ACTION_PICTURE_IN_PICTURE_SETTINGS*: string {.`static`.}
  ACTION_STORAGE_MANAGER_SETTINGS*: string {.`static`.}
  ACTION_WEBVIEW_SETTINGS*: string {.`static`.}
  ACTION_ENTERPRISE_PRIVACY_SETTINGS*: string {.`static`.}
  ACTION_SHOW_WORK_POLICY_INFO*: string {.`static`.}
  ACTION_REQUEST_SET_AUTOFILL_SERVICE*: string {.`static`.}
  ACTION_CREDENTIAL_PROVIDER*: string {.`static`.}
  ACTION_QUICK_ACCESS_WALLET_SETTINGS*: string {.`static`.}
  ACTION_STORAGE_VOLUME_ACCESS_SETTINGS*: string {.`static`.}
  ACTION_REQUEST_ENABLE_CONTENT_CAPTURE*: string {.`static`.}
  ACTION_MANAGE_DOMAIN_URLS*: string {.`static`.}
  ACTION_TETHER_SETTINGS*: string {.`static`.}
  ACTION_WIFI_TETHER_SETTING*: string {.`static`.}
  ACTION_ENABLE_MMS_DATA_REQUEST*: string {.`static`.}
  ACTION_SHOW_RESTRICTED_SETTING_DIALOG*: string {.`static`.}
  EXTRA_ENABLE_MMS_DATA_REQUEST_REASON*: string {.`static`.}
  ENABLE_MMS_DATA_REQUEST_REASON_INCOMING_MMS*: jint {.`static`.}
  ENABLE_MMS_DATA_REQUEST_REASON_OUTGOING_MMS*: jint {.`static`.}
  ACTION_MMS_MESSAGE_SETTING*: string {.`static`.}
  ACTION_BEDTIME_SETTINGS*: string {.`static`.}
  ACTION_APP_PERMISSIONS_SETTINGS*: string {.`static`.}
  CALL_METHOD_GET_SYSTEM*: string {.`static`.}
  CALL_METHOD_GET_SECURE*: string {.`static`.}
  CALL_METHOD_GET_GLOBAL*: string {.`static`.}
  CALL_METHOD_GET_CONFIG*: string {.`static`.}
  CALL_METHOD_TRACK_GENERATION_KEY*: string {.`static`.}
  CALL_METHOD_GENERATION_INDEX_KEY*: string {.`static`.}
  CALL_METHOD_GENERATION_KEY*: string {.`static`.}
  CALL_METHOD_USER_KEY*: string {.`static`.}
  CALL_METHOD_MAKE_DEFAULT_KEY*: string {.`static`.}
  CALL_METHOD_RESET_MODE_KEY*: string {.`static`.}
  CALL_METHOD_TAG_KEY*: string {.`static`.}
  CALL_METHOD_PREFIX_KEY*: string {.`static`.}
  CALL_METHOD_SYNC_DISABLED_MODE_KEY*: string {.`static`.}
  CALL_METHOD_MONITOR_CALLBACK_KEY*: string {.`static`.}
  CALL_METHOD_FLAGS_KEY*: string {.`static`.}
  CALL_METHOD_OVERRIDEABLE_BY_RESTORE_KEY*: string {.`static`.}
  CALL_METHOD_PUT_SYSTEM*: string {.`static`.}
  CALL_METHOD_PUT_SECURE*: string {.`static`.}
  CALL_METHOD_PUT_GLOBAL*: string {.`static`.}
  CALL_METHOD_PUT_CONFIG*: string {.`static`.}
  CALL_METHOD_SET_ALL_CONFIG*: string {.`static`.}
  CALL_METHOD_DELETE_SYSTEM*: string {.`static`.}
  CALL_METHOD_DELETE_SECURE*: string {.`static`.}
  CALL_METHOD_DELETE_GLOBAL*: string {.`static`.}
  CALL_METHOD_DELETE_CONFIG*: string {.`static`.}
  CALL_METHOD_RESET_SYSTEM*: string {.`static`.}
  CALL_METHOD_RESET_SECURE*: string {.`static`.}
  CALL_METHOD_RESET_GLOBAL*: string {.`static`.}
  CALL_METHOD_RESET_CONFIG*: string {.`static`.}
  CALL_METHOD_LIST_SYSTEM*: string {.`static`.}
  CALL_METHOD_LIST_SECURE*: string {.`static`.}
  CALL_METHOD_LIST_GLOBAL*: string {.`static`.}
  CALL_METHOD_LIST_CONFIG*: string {.`static`.}
  CALL_METHOD_LIST_NAMESPACES_CONFIG*: string {.`static`.}
  CALL_METHOD_SET_SYNC_DISABLED_MODE_CONFIG*: string {.`static`.}
  CALL_METHOD_GET_SYNC_DISABLED_MODE_CONFIG*: string {.`static`.}
  CALL_METHOD_REGISTER_MONITOR_CALLBACK_CONFIG*: string {.`static`.}
  CALL_METHOD_UNREGISTER_MONITOR_CALLBACK_CONFIG*: string {.`static`.}
  EXTRA_MONITOR_CALLBACK_TYPE*: string {.`static`.}
  EXTRA_ACCESS_CALLBACK*: string {.`static`.}
  EXTRA_NAMESPACE_UPDATED_CALLBACK*: string {.`static`.}
  EXTRA_NAMESPACE*: string {.`static`.}
  EXTRA_CALLING_PACKAGE*: string {.`static`.}
  EXTRA_AUTHORITIES*: string {.`static`.}
  EXTRA_ACCOUNT_TYPES*: string {.`static`.}
  EXTRA_INPUT_METHOD_ID*: string {.`static`.}
  EXTRA_INPUT_DEVICE_IDENTIFIER*: string {.`static`.}
  EXTRA_AIRPLANE_MODE_ENABLED*: string {.`static`.}
  EXTRA_BATTERY_SAVER_MODE_ENABLED*: string {.`static`.}
  EXTRA_DO_NOT_DISTURB_MODE_ENABLED*: string {.`static`.}
  EXTRA_DO_NOT_DISTURB_MODE_MINUTES*: string {.`static`.}
  RESET_MODE_PACKAGE_DEFAULTS*: jint {.`static`.}
  RESET_MODE_UNTRUSTED_DEFAULTS*: jint {.`static`.}
  RESET_MODE_UNTRUSTED_CHANGES*: jint {.`static`.}
  RESET_MODE_TRUSTED_DEFAULTS*: jint {.`static`.}
  EXTRA_NUMBER_OF_CERTIFICATES*: string {.`static`.}
  AUTHORITY*: string {.`static`.}
  ACTION_WIFI_ADD_NETWORKS*: string {.`static`.}
  EXTRA_WIFI_NETWORK_LIST*: string {.`static`.}
  EXTRA_WIFI_NETWORK_RESULT_LIST*: string {.`static`.}
  ADD_WIFI_RESULT_SUCCESS*: jint {.`static`.}
  ADD_WIFI_RESULT_ADD_OR_UPDATE_FAILED*: jint {.`static`.}
  ADD_WIFI_RESULT_ALREADY_EXISTS*: jint {.`static`.}
  ACTION_BUGREPORT_HANDLER_SETTINGS*: string {.`static`.}
  ACTION_MANAGE_ALL_FILES_ACCESS_PERMISSION*: string {.`static`.}
  ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION*: string {.`static`.}
  ACTION_MANAGE_APP_USE_FULL_SCREEN_INTENT*: string {.`static`.}
  ACTION_SETTINGS_EMBED_DEEP_LINK_ACTIVITY*: string {.`static`.}
  EXTRA_SETTINGS_EMBEDDED_DEEP_LINK_INTENT_URI*: string {.`static`.}
  EXTRA_SETTINGS_EMBEDDED_DEEP_LINK_HIGHLIGHT_MENU_KEY*: string {.`static`.}

jclass android.provider.Settings.NameValueTable* of JVMObject:
  proc getUriFor*(uri: Uri, name: string): Uri {.`static`.}

jclass android.provider.Settings.System* of JVMObject:
  proc getMovedToGlobalSettings*(outKeySet: Set[string]) {.`static`.}
  proc getMovedToSecureSettings*(outKeySet: Set[string]) {.`static`.}
  proc getNonLegacyMovedKeys*(outKeySet: HashSet[string]) {.`static`.}
  proc clearProviderForTest*() {.`static`.}
  proc getPublicSettings*(allKeys: Set[string], readableKeys: Set[string], readableKeysWithMaxTargetSdk: ArrayMap[string, Integer]) {.`static`.}
  proc getString*(resolver: ContentResolver, name: string): string {.`static`.}
  proc getStringForUser*(resolver: ContentResolver, name: string, userHandle: jint): string {.`static`.}
  proc putString*(resolver: ContentResolver, name: string, value: string): jboolean {.`static`.}
  proc putString*(resolver: ContentResolver, name: string, value: string, overrideableByRestore: jboolean): jboolean {.`static`.}
  proc putString*(resolver: ContentResolver, name: string, value: string, makeDefault: jboolean, overrideableByRestore: jboolean): jboolean {.`static`.}
  proc putStringForUser*(resolver: ContentResolver, name: string, value: string, userHandle: jint): jboolean {.`static`.}
  proc resetToDefaults*(resolver: ContentResolver, tag: string) {.`static`.}
  proc resetToDefaultsAsUser*(resolver: ContentResolver, tag: string, mode: jint, userHandle: jint) {.`static`.}
  proc getUriFor*(name: string): Uri {.`static`.}
  proc getInt*(cr: ContentResolver, name: string, def: jint): jint {.`static`.}
  proc getIntForUser*(cr: ContentResolver, name: string, def: jint, userHandle: jint): jint {.`static`.}
  proc getInt*(cr: ContentResolver, name: string): jint {.`static`.}
  proc getIntForUser*(cr: ContentResolver, name: string, userHandle: jint): jint {.`static`.}
  proc putInt*(cr: ContentResolver, name: string, value: jint): jboolean {.`static`.}
  proc putIntForUser*(cr: ContentResolver, name: string, value: jint, userHandle: jint): jboolean {.`static`.}
  proc getLong*(cr: ContentResolver, name: string, def: jlong): jlong {.`static`.}
  proc getLongForUser*(cr: ContentResolver, name: string, def: jlong, userHandle: jint): jlong {.`static`.}
  proc getLong*(cr: ContentResolver, name: string): jlong {.`static`.}
  proc getLongForUser*(cr: ContentResolver, name: string, userHandle: jint): jlong {.`static`.}
  proc putLong*(cr: ContentResolver, name: string, value: jlong): jboolean {.`static`.}
  proc putLongForUser*(cr: ContentResolver, name: string, value: jlong, userHandle: jint): jboolean {.`static`.}
  proc getFloat*(cr: ContentResolver, name: string, def: jfloat): jfloat {.`static`.}
  proc getFloatForUser*(cr: ContentResolver, name: string, def: jfloat, userHandle: jint): jfloat {.`static`.}
  proc getFloat*(cr: ContentResolver, name: string): jfloat {.`static`.}
  proc getFloatForUser*(cr: ContentResolver, name: string, userHandle: jint): jfloat {.`static`.}
  proc putFloat*(cr: ContentResolver, name: string, value: jfloat): jboolean {.`static`.}
  proc putFloatForUser*(cr: ContentResolver, name: string, value: jfloat, userHandle: jint): jboolean {.`static`.}
  proc getConfiguration*(cr: ContentResolver, outConfig: Configuration) {.`static`.}
  proc adjustConfigurationForUser*(cr: ContentResolver, outConfig: Configuration, userHandle: jint, updateSettingsIfEmpty: jboolean) {.`static`.}
  proc clearConfiguration*(inoutConfig: Configuration) {.`static`.}
  proc putConfiguration*(cr: ContentResolver, config: Configuration): jboolean {.`static`.}
  proc putConfigurationForUser*(cr: ContentResolver, config: Configuration, userHandle: jint): jboolean {.`static`.}
  proc hasInterestingConfigurationChanges*(changes: jint): jboolean {.`static`.}
  proc getShowGTalkServiceStatus*(cr: ContentResolver): jboolean {.`static`.}
  proc getShowGTalkServiceStatusForUser*(cr: ContentResolver, userHandle: jint): jboolean {.`static`.}
  proc setShowGTalkServiceStatus*(cr: ContentResolver, flag: jboolean) {.`static`.}
  proc setShowGTalkServiceStatusForUser*(cr: ContentResolver, flag: jboolean, userHandle: jint) {.`static`.}
  proc getCloneToManagedProfileSettings*(outKeySet: Set[string]) {.`static`.}
  proc getCloneFromParentOnValueSettings*(outMap: Map[string, string]) {.`static`.}
  proc canWrite*(context: Context): jboolean {.`static`.}

jclass android.provider.Settings.Secure* of JVMObject:
  proc getMovedToGlobalSettings*(outKeySet: Set[string]) {.`static`.}
  proc getMovedToSystemSettings*(outKeySet: Set[string]) {.`static`.}
  proc clearProviderForTest*() {.`static`.}
  proc getPublicSettings*(allKeys: Set[string], readableKeys: Set[string], readableKeysWithMaxTargetSdk: ArrayMap[string, Integer]) {.`static`.}
  proc getString*(resolver: ContentResolver, name: string): string {.`static`.}
  proc getStringForUser*(resolver: ContentResolver, name: string, userHandle: jint): string {.`static`.}
  proc putString*(resolver: ContentResolver, name: string, value: string, overrideableByRestore: jboolean): jboolean {.`static`.}
  proc putString*(resolver: ContentResolver, name: string, value: string): jboolean {.`static`.}
  proc putStringForUser*(resolver: ContentResolver, name: string, value: string, userHandle: jint): jboolean {.`static`.}
  proc putStringForUser*(resolver: ContentResolver, name: string, value: string, tag: string, makeDefault: jboolean, userHandle: jint, overrideableByRestore: jboolean): jboolean {.`static`.}
  proc putString*(resolver: ContentResolver, name: string, value: string, tag: string, makeDefault: jboolean): jboolean {.`static`.}
  proc resetToDefaults*(resolver: ContentResolver, tag: string) {.`static`.}
  proc resetToDefaultsAsUser*(resolver: ContentResolver, tag: string, mode: jint, userHandle: jint) {.`static`.}
  proc getUriFor*(name: string): Uri {.`static`.}
  proc getInt*(cr: ContentResolver, name: string, def: jint): jint {.`static`.}
  proc getIntForUser*(cr: ContentResolver, name: string, def: jint, userHandle: jint): jint {.`static`.}
  proc getInt*(cr: ContentResolver, name: string): jint {.`static`.}
  proc getIntForUser*(cr: ContentResolver, name: string, userHandle: jint): jint {.`static`.}
  proc putInt*(cr: ContentResolver, name: string, value: jint): jboolean {.`static`.}
  proc putIntForUser*(cr: ContentResolver, name: string, value: jint, userHandle: jint): jboolean {.`static`.}
  proc getLong*(cr: ContentResolver, name: string, def: jlong): jlong {.`static`.}
  proc getLongForUser*(cr: ContentResolver, name: string, def: jlong, userHandle: jint): jlong {.`static`.}
  proc getLong*(cr: ContentResolver, name: string): jlong {.`static`.}
  proc getLongForUser*(cr: ContentResolver, name: string, userHandle: jint): jlong {.`static`.}
  proc putLong*(cr: ContentResolver, name: string, value: jlong): jboolean {.`static`.}
  proc putLongForUser*(cr: ContentResolver, name: string, value: jlong, userHandle: jint): jboolean {.`static`.}
  proc getFloat*(cr: ContentResolver, name: string, def: jfloat): jfloat {.`static`.}
  proc getFloatForUser*(cr: ContentResolver, name: string, def: jfloat, userHandle: jint): jfloat {.`static`.}
  proc getFloat*(cr: ContentResolver, name: string): jfloat {.`static`.}
  proc getFloatForUser*(cr: ContentResolver, name: string, userHandle: jint): jfloat {.`static`.}
  proc putFloat*(cr: ContentResolver, name: string, value: jfloat): jboolean {.`static`.}
  proc putFloatForUser*(cr: ContentResolver, name: string, value: jfloat, userHandle: jint): jboolean {.`static`.}
  proc getCloneToManagedProfileSettings*(outKeySet: Set[string]) {.`static`.}
  proc isLocationProviderEnabled*(cr: ContentResolver, provider: string): jboolean {.`static`.}
  proc setLocationProviderEnabled*(cr: ContentResolver, provider: string, enabled: jboolean) {.`static`.}

jclass android.provider.Settings.Global* of JVMObject:
  proc zenModeToString*(mode: jint): string {.`static`.}
  proc isValidZenMode*(value: jint): jboolean {.`static`.}
  proc getMovedToSecureSettings*(outKeySet: Set[string]) {.`static`.}
  proc getMovedToSystemSettings*(outKeySet: Set[string]) {.`static`.}
  proc clearProviderForTest*() {.`static`.}
  proc getPublicSettings*(allKeys: Set[string], readableKeys: Set[string], readableKeysWithMaxTargetSdk: ArrayMap[string, Integer]) {.`static`.}
  proc getString*(resolver: ContentResolver, name: string): string {.`static`.}
  proc getStringForUser*(resolver: ContentResolver, name: string, userHandle: jint): string {.`static`.}
  proc putString*(resolver: ContentResolver, name: string, value: string): jboolean {.`static`.}
  proc putString*(resolver: ContentResolver, name: string, value: string, tag: string, makeDefault: jboolean, overrideableByRestore: jboolean): jboolean {.`static`.}
  proc putString*(resolver: ContentResolver, name: string, value: string, tag: string, makeDefault: jboolean): jboolean {.`static`.}
  proc resetToDefaults*(resolver: ContentResolver, tag: string) {.`static`.}
  proc resetToDefaultsAsUser*(resolver: ContentResolver, tag: string, mode: jint, userHandle: jint) {.`static`.}
  proc putStringForUser*(resolver: ContentResolver, name: string, value: string, userHandle: jint): jboolean {.`static`.}
  proc putStringForUser*(resolver: ContentResolver, name: string, value: string, tag: string, makeDefault: jboolean, userHandle: jint, overrideableByRestore: jboolean): jboolean {.`static`.}
  proc getUriFor*(name: string): Uri {.`static`.}
  proc getInt*(cr: ContentResolver, name: string, def: jint): jint {.`static`.}
  proc getInt*(cr: ContentResolver, name: string): jint {.`static`.}
  proc putInt*(cr: ContentResolver, name: string, value: jint): jboolean {.`static`.}
  proc getLong*(cr: ContentResolver, name: string, def: jlong): jlong {.`static`.}
  proc getLong*(cr: ContentResolver, name: string): jlong {.`static`.}
  proc putLong*(cr: ContentResolver, name: string, value: jlong): jboolean {.`static`.}
  proc getFloat*(cr: ContentResolver, name: string, def: jfloat): jfloat {.`static`.}
  proc getFloat*(cr: ContentResolver, name: string): jfloat {.`static`.}
  proc putFloat*(cr: ContentResolver, name: string, value: jfloat): jboolean {.`static`.}

jclass android.provider.Settings.Config* of JVMObject:
  proc getString*(name: string): string {.`static`.}
  proc getStrings*(namespace: string, names: List[string]): Map[string, string] {.`static`.}
  proc getAllStrings*(): Map[string, string] {.`static`.}
  proc getStrings*(resolver: ContentResolver, namespace: string, names: List[string]): Map[string, string] {.`static`.}
  proc putString*(namespace: string, name: string, value: string, makeDefault: jboolean): jboolean {.`static`.}
  proc setStrings*(namespace: string, keyValues: Map[string, string]): jboolean {.`static`.}
  proc setStrings*(resolver: ContentResolver, namespace: string, keyValues: Map[string, string]): jboolean {.`static`.}
  proc deleteString*(namespace: string, name: string): jboolean {.`static`.}
  proc resetToDefaults*(resetMode: jint, namespace: string) {.`static`.}
  proc setSyncDisabledMode*(disableSyncMode: jint) {.`static`.}
  proc getSyncDisabledMode*(): jint {.`static`.}
  proc setMonitorCallback*(resolver: ContentResolver, executor: Executor, callback: DeviceConfig.MonitorCallback) {.`static`.}
  proc clearMonitorCallback*(resolver: ContentResolver) {.`static`.}
  proc registerContentObserver*(namespace: string, notifyForDescendants: jboolean, observer: ContentObserver) {.`static`.}
  proc unregisterContentObserver*(observer: ContentObserver) {.`static`.}
  proc checkCallingOrSelfPermission*(permission: string): jint {.`static`.}
  proc clearProviderForTest*() {.`static`.}

jclass android.provider.Settings.Bookmarks* of JVMObject:
  proc getIntentForShortcut*(cr: ContentResolver, shortcut: jchar): Intent {.`static`.}
  proc add*(cr: ContentResolver, intent: Intent, title: string, folder: string, shortcut: jchar, ordering: jint): Uri {.`static`.}
  proc getLabelForFolder*(r: Resources, folder: string): CharSequence {.`static`.}
  proc getTitle*(context: Context, cursor: Cursor): CharSequence {.`static`.}

jclass android.provider.SettingNotFoundException* of AndroidException:

jclass android.provider.NameValueTable* of JVMObject:
  proc getUriFor*(uri: Uri, name: string): Uri {.`static`.}
  NAME*: string {.`static`.}
  VALUE*: string {.`static`.}
  IS_PRESERVED_IN_RESTORE*: string {.`static`.}

jclass android.provider.System* of NameValueTable:
  proc getMovedToGlobalSettings*(outKeySet: Set[string]) {.`static`.}
  proc getMovedToSecureSettings*(outKeySet: Set[string]) {.`static`.}
  proc getNonLegacyMovedKeys*(outKeySet: HashSet[string]) {.`static`.}
  proc clearProviderForTest*() {.`static`.}
  proc getPublicSettings*(allKeys: Set[string], readableKeys: Set[string], readableKeysWithMaxTargetSdk: ArrayMap[string, Integer]) {.`static`.}
  proc getString*(resolver: ContentResolver, name: string): string {.`static`.}
  proc getStringForUser*(resolver: ContentResolver, name: string, userHandle: jint): string {.`static`.}
  proc putString*(resolver: ContentResolver, name: string, value: string): jboolean {.`static`.}
  proc putString*(resolver: ContentResolver, name: string, value: string, overrideableByRestore: jboolean): jboolean {.`static`.}
  proc putString*(resolver: ContentResolver, name: string, value: string, makeDefault: jboolean, overrideableByRestore: jboolean): jboolean {.`static`.}
  proc putStringForUser*(resolver: ContentResolver, name: string, value: string, userHandle: jint): jboolean {.`static`.}
  proc resetToDefaults*(resolver: ContentResolver, tag: string) {.`static`.}
  proc resetToDefaultsAsUser*(resolver: ContentResolver, tag: string, mode: jint, userHandle: jint) {.`static`.}
  proc getUriFor*(name: string): Uri {.`static`.}
  proc getInt*(cr: ContentResolver, name: string, def: jint): jint {.`static`.}
  proc getIntForUser*(cr: ContentResolver, name: string, def: jint, userHandle: jint): jint {.`static`.}
  proc getInt*(cr: ContentResolver, name: string): jint {.`static`.}
  proc getIntForUser*(cr: ContentResolver, name: string, userHandle: jint): jint {.`static`.}
  proc putInt*(cr: ContentResolver, name: string, value: jint): jboolean {.`static`.}
  proc putIntForUser*(cr: ContentResolver, name: string, value: jint, userHandle: jint): jboolean {.`static`.}
  proc getLong*(cr: ContentResolver, name: string, def: jlong): jlong {.`static`.}
  proc getLongForUser*(cr: ContentResolver, name: string, def: jlong, userHandle: jint): jlong {.`static`.}
  proc getLong*(cr: ContentResolver, name: string): jlong {.`static`.}
  proc getLongForUser*(cr: ContentResolver, name: string, userHandle: jint): jlong {.`static`.}
  proc putLong*(cr: ContentResolver, name: string, value: jlong): jboolean {.`static`.}
  proc putLongForUser*(cr: ContentResolver, name: string, value: jlong, userHandle: jint): jboolean {.`static`.}
  proc getFloat*(cr: ContentResolver, name: string, def: jfloat): jfloat {.`static`.}
  proc getFloatForUser*(cr: ContentResolver, name: string, def: jfloat, userHandle: jint): jfloat {.`static`.}
  proc getFloat*(cr: ContentResolver, name: string): jfloat {.`static`.}
  proc getFloatForUser*(cr: ContentResolver, name: string, userHandle: jint): jfloat {.`static`.}
  proc putFloat*(cr: ContentResolver, name: string, value: jfloat): jboolean {.`static`.}
  proc putFloatForUser*(cr: ContentResolver, name: string, value: jfloat, userHandle: jint): jboolean {.`static`.}
  proc getConfiguration*(cr: ContentResolver, outConfig: Configuration) {.`static`.}
  proc adjustConfigurationForUser*(cr: ContentResolver, outConfig: Configuration, userHandle: jint, updateSettingsIfEmpty: jboolean) {.`static`.}
  proc clearConfiguration*(inoutConfig: Configuration) {.`static`.}
  proc putConfiguration*(cr: ContentResolver, config: Configuration): jboolean {.`static`.}
  proc putConfigurationForUser*(cr: ContentResolver, config: Configuration, userHandle: jint): jboolean {.`static`.}
  proc hasInterestingConfigurationChanges*(changes: jint): jboolean {.`static`.}
  proc getShowGTalkServiceStatus*(cr: ContentResolver): jboolean {.`static`.}
  proc getShowGTalkServiceStatusForUser*(cr: ContentResolver, userHandle: jint): jboolean {.`static`.}
  proc setShowGTalkServiceStatus*(cr: ContentResolver, flag: jboolean) {.`static`.}
  proc setShowGTalkServiceStatusForUser*(cr: ContentResolver, flag: jboolean, userHandle: jint) {.`static`.}
  proc getCloneToManagedProfileSettings*(outKeySet: Set[string]) {.`static`.}
  proc getCloneFromParentOnValueSettings*(outMap: Map[string, string]) {.`static`.}
  proc canWrite*(context: Context): jboolean {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  STAY_ON_WHILE_PLUGGED_IN*: string {.`static`.}
  END_BUTTON_BEHAVIOR*: string {.`static`.}
  END_BUTTON_BEHAVIOR_HOME*: jint {.`static`.}
  END_BUTTON_BEHAVIOR_SLEEP*: jint {.`static`.}
  END_BUTTON_BEHAVIOR_DEFAULT*: jint {.`static`.}
  ADVANCED_SETTINGS*: string {.`static`.}
  ADVANCED_SETTINGS_DEFAULT*: jint {.`static`.}
  WEAR_ACCESSIBILITY_GESTURE_ENABLED*: string {.`static`.}
  WEAR_ACCESSIBILITY_GESTURE_ENABLED_DURING_OOBE*: string {.`static`.}
  WEAR_TTS_PREWARM_ENABLED*: string {.`static`.}
  AIRPLANE_MODE_ON*: string {.`static`.}
  RADIO_BLUETOOTH*: string {.`static`.}
  RADIO_WIFI*: string {.`static`.}
  RADIO_WIMAX*: string {.`static`.}
  RADIO_CELL*: string {.`static`.}
  RADIO_NFC*: string {.`static`.}
  AIRPLANE_MODE_RADIOS*: string {.`static`.}
  AIRPLANE_MODE_TOGGLEABLE_RADIOS*: string {.`static`.}
  WIFI_SLEEP_POLICY*: string {.`static`.}
  WIFI_SLEEP_POLICY_DEFAULT*: jint {.`static`.}
  WIFI_SLEEP_POLICY_NEVER_WHILE_PLUGGED*: jint {.`static`.}
  WIFI_SLEEP_POLICY_NEVER*: jint {.`static`.}
  MODE_RINGER*: string {.`static`.}
  WIFI_USE_STATIC_IP*: string {.`static`.}
  WIFI_STATIC_IP*: string {.`static`.}
  WIFI_STATIC_GATEWAY*: string {.`static`.}
  WIFI_STATIC_NETMASK*: string {.`static`.}
  WIFI_STATIC_DNS1*: string {.`static`.}
  WIFI_STATIC_DNS2*: string {.`static`.}
  BLUETOOTH_DISCOVERABILITY*: string {.`static`.}
  BLUETOOTH_DISCOVERABILITY_TIMEOUT*: string {.`static`.}
  LOCK_PATTERN_ENABLED*: string {.`static`.}
  LOCK_PATTERN_VISIBLE*: string {.`static`.}
  LOCK_PATTERN_TACTILE_FEEDBACK_ENABLED*: string {.`static`.}
  NEXT_ALARM_FORMATTED*: string {.`static`.}
  FONT_SCALE*: string {.`static`.}
  DEFAULT_DEVICE_FONT_SCALE*: string {.`static`.}
  SYSTEM_LOCALES*: string {.`static`.}
  DEBUG_APP*: string {.`static`.}
  WAIT_FOR_DEBUGGER*: string {.`static`.}
  DIM_SCREEN*: string {.`static`.}
  DISPLAY_COLOR_MODE*: string {.`static`.}
  DISPLAY_COLOR_MODE_VENDOR_HINT*: string {.`static`.}
  MIN_REFRESH_RATE*: string {.`static`.}
  PEAK_REFRESH_RATE*: string {.`static`.}
  FOLD_LOCK_BEHAVIOR*: string {.`static`.}
  SCREEN_OFF_TIMEOUT*: string {.`static`.}
  SCREEN_BRIGHTNESS*: string {.`static`.}
  SCREEN_BRIGHTNESS_MODE*: string {.`static`.}
  SCREEN_AUTO_BRIGHTNESS_ADJ*: string {.`static`.}
  SCREEN_BRIGHTNESS_MODE_MANUAL*: jint {.`static`.}
  SCREEN_BRIGHTNESS_MODE_AUTOMATIC*: jint {.`static`.}
  ADAPTIVE_SLEEP*: string {.`static`.}
  SHOW_PROCESSES*: string {.`static`.}
  ALWAYS_FINISH_ACTIVITIES*: string {.`static`.}
  MODE_RINGER_STREAMS_AFFECTED*: string {.`static`.}
  MUTE_STREAMS_AFFECTED*: string {.`static`.}
  VIBRATE_ON*: string {.`static`.}
  APPLY_RAMPING_RINGER*: string {.`static`.}
  VIBRATE_INPUT_DEVICES*: string {.`static`.}
  ALARM_VIBRATION_INTENSITY*: string {.`static`.}
  MEDIA_VIBRATION_INTENSITY*: string {.`static`.}
  NOTIFICATION_VIBRATION_INTENSITY*: string {.`static`.}
  RING_VIBRATION_INTENSITY*: string {.`static`.}
  HAPTIC_FEEDBACK_INTENSITY*: string {.`static`.}
  HARDWARE_HAPTIC_FEEDBACK_INTENSITY*: string {.`static`.}
  KEYBOARD_VIBRATION_ENABLED*: string {.`static`.}
  VOLUME_RING*: string {.`static`.}
  VOLUME_SYSTEM*: string {.`static`.}
  VOLUME_VOICE*: string {.`static`.}
  VOLUME_MUSIC*: string {.`static`.}
  VOLUME_ALARM*: string {.`static`.}
  VOLUME_NOTIFICATION*: string {.`static`.}
  VOLUME_BLUETOOTH_SCO*: string {.`static`.}
  VOLUME_ACCESSIBILITY*: string {.`static`.}
  VOLUME_ASSISTANT*: string {.`static`.}
  VOLUME_MASTER*: string {.`static`.}
  INPUT_GAIN_INDEX_SETTINGS*: string {.`static`.}
  MASTER_MONO*: string {.`static`.}
  MASTER_BALANCE*: string {.`static`.}
  NOTIFICATIONS_USE_RING_VOLUME*: string {.`static`.}
  VIBRATE_IN_SILENT*: string {.`static`.}
  VOLUME_SETTINGS*: string {.`static`.}
  VOLUME_SETTINGS_INT*: string {.`static`.}
  APPEND_FOR_LAST_AUDIBLE*: string {.`static`.}
  RINGTONE*: string {.`static`.}
  DEFAULT_RINGTONE_URI*: Uri {.`static`.}
  RINGTONE_CACHE*: string {.`static`.}
  RINGTONE_CACHE_URI*: Uri {.`static`.}
  NOTIFICATION_SOUND*: string {.`static`.}
  DEFAULT_NOTIFICATION_URI*: Uri {.`static`.}
  NOTIFICATION_SOUND_CACHE*: string {.`static`.}
  NOTIFICATION_SOUND_CACHE_URI*: Uri {.`static`.}
  NOTIFICATION_COOLDOWN_ENABLED*: string {.`static`.}
  NOTIFICATION_COOLDOWN_ALL*: string {.`static`.}
  NOTIFICATION_COOLDOWN_VIBRATE_UNLOCKED*: string {.`static`.}
  ALARM_ALERT*: string {.`static`.}
  DEFAULT_ALARM_ALERT_URI*: Uri {.`static`.}
  ALARM_ALERT_CACHE*: string {.`static`.}
  ALARM_ALERT_CACHE_URI*: Uri {.`static`.}
  MEDIA_BUTTON_RECEIVER*: string {.`static`.}
  TEXT_AUTO_REPLACE*: string {.`static`.}
  TEXT_AUTO_CAPS*: string {.`static`.}
  TEXT_AUTO_PUNCTUATE*: string {.`static`.}
  TEXT_SHOW_PASSWORD*: string {.`static`.}
  SHOW_GTALK_SERVICE_STATUS*: string {.`static`.}
  WALLPAPER_ACTIVITY*: string {.`static`.}
  AUTO_TIME*: string {.`static`.}
  AUTO_TIME_ZONE*: string {.`static`.}
  TIME_12_24*: string {.`static`.}
  DATE_FORMAT*: string {.`static`.}
  SETUP_WIZARD_HAS_RUN*: string {.`static`.}
  WINDOW_ANIMATION_SCALE*: string {.`static`.}
  TRANSITION_ANIMATION_SCALE*: string {.`static`.}
  ANIMATOR_DURATION_SCALE*: string {.`static`.}
  ACCELEROMETER_ROTATION*: string {.`static`.}
  USER_ROTATION*: string {.`static`.}
  HIDE_ROTATION_LOCK_TOGGLE_FOR_ACCESSIBILITY*: string {.`static`.}
  VIBRATE_WHEN_RINGING*: string {.`static`.}
  DEBUG_ENABLE_ENHANCED_CALL_BLOCKING*: string {.`static`.}
  DTMF_TONE_WHEN_DIALING*: string {.`static`.}
  DTMF_TONE_TYPE_WHEN_DIALING*: string {.`static`.}
  HEARING_AID*: string {.`static`.}
  TTY_MODE*: string {.`static`.}
  SOUND_EFFECTS_ENABLED*: string {.`static`.}
  HAPTIC_FEEDBACK_ENABLED*: string {.`static`.}
  SHOW_WEB_SUGGESTIONS*: string {.`static`.}
  NOTIFICATION_LIGHT_PULSE*: string {.`static`.}
  POINTER_LOCATION*: string {.`static`.}
  SHOW_TOUCHES*: string {.`static`.}
  SHOW_KEY_PRESSES*: string {.`static`.}
  TOUCHPAD_VISUALIZER*: string {.`static`.}
  SHOW_ROTARY_INPUT*: string {.`static`.}
  SCREEN_BRIGHTNESS_FOR_ALS*: string {.`static`.}
  SCREEN_BRIGHTNESS_AUTOMATIC_BRIGHT*: jint {.`static`.}
  SCREEN_BRIGHTNESS_AUTOMATIC_NORMAL*: jint {.`static`.}
  SCREEN_BRIGHTNESS_AUTOMATIC_DIM*: jint {.`static`.}
  WINDOW_ORIENTATION_LISTENER_LOG*: string {.`static`.}
  POWER_SOUNDS_ENABLED*: string {.`static`.}
  DOCK_SOUNDS_ENABLED*: string {.`static`.}
  LOCKSCREEN_SOUNDS_ENABLED*: string {.`static`.}
  LOCKSCREEN_DISABLED*: string {.`static`.}
  LOW_BATTERY_SOUND*: string {.`static`.}
  DESK_DOCK_SOUND*: string {.`static`.}
  DESK_UNDOCK_SOUND*: string {.`static`.}
  CAR_DOCK_SOUND*: string {.`static`.}
  CAR_UNDOCK_SOUND*: string {.`static`.}
  LOCK_SOUND*: string {.`static`.}
  UNLOCK_SOUND*: string {.`static`.}
  SIP_RECEIVE_CALLS*: string {.`static`.}
  SIP_CALL_OPTIONS*: string {.`static`.}
  SIP_ALWAYS*: string {.`static`.}
  SIP_ADDRESS_ONLY*: string {.`static`.}
  SIP_ASK_ME_EACH_TIME*: string {.`static`.}
  POINTER_SPEED*: string {.`static`.}
  POINTER_SCALE*: string {.`static`.}
  TOUCHPAD_POINTER_SPEED*: string {.`static`.}
  TOUCHPAD_NATURAL_SCROLLING*: string {.`static`.}
  TOUCHPAD_TAP_TO_CLICK*: string {.`static`.}
  TOUCHPAD_TAP_DRAGGING*: string {.`static`.}
  TOUCHPAD_THREE_FINGER_TAP_CUSTOMIZATION*: string {.`static`.}
  TOUCHPAD_RIGHT_CLICK_ZONE*: string {.`static`.}
  TOUCHPAD_SYSTEM_GESTURES*: string {.`static`.}
  TOUCHPAD_ACCELERATION_ENABLED*: string {.`static`.}
  MOUSE_REVERSE_VERTICAL_SCROLLING*: string {.`static`.}
  MOUSE_SWAP_PRIMARY_BUTTON*: string {.`static`.}
  MOUSE_SCROLLING_ACCELERATION*: string {.`static`.}
  MOUSE_POINTER_ACCELERATION_ENABLED*: string {.`static`.}
  MOUSE_SCROLLING_SPEED*: string {.`static`.}
  POINTER_FILL_STYLE*: string {.`static`.}
  POINTER_STROKE_STYLE*: string {.`static`.}
  LOCK_TO_APP_ENABLED*: string {.`static`.}
  EGG_MODE*: string {.`static`.}
  SHOW_BATTERY_PERCENT*: string {.`static`.}
  MULTI_AUDIO_FOCUS_ENABLED*: string {.`static`.}
  LOCALE_PREFERENCES*: string {.`static`.}
  PREFERRED_REGION*: string {.`static`.}
  CAMERA_FLASH_NOTIFICATION*: string {.`static`.}
  SCREEN_FLASH_NOTIFICATION*: string {.`static`.}
  CV_ENABLED*: string {.`static`.}
  SCREEN_FLASH_NOTIFICATION_COLOR*: string {.`static`.}
  LEGACY_RESTORE_SETTINGS*: string {.`static`.}
  PUBLIC_SETTINGS*: Set[string] {.`static`.}
  PRIVATE_SETTINGS*: Set[string] {.`static`.}
  CLONE_FROM_PARENT_ON_VALUE*: Map[string, string] {.`static`.}
  INSTANT_APP_SETTINGS*: Set[string] {.`static`.}
  WHEN_TO_MAKE_WIFI_CALLS*: string {.`static`.}
  CLOCKWORK_BLUETOOTH_SETTINGS_PREF*: string {.`static`.}
  UNREAD_NOTIFICATION_DOT_INDICATOR*: string {.`static`.}
  AUTO_LAUNCH_MEDIA_CONTROLS*: string {.`static`.}
  ADB_ENABLED*: string {.`static`.}
  ANDROID_ID*: string {.`static`.}
  BLUETOOTH_ON*: string {.`static`.}
  DATA_ROAMING*: string {.`static`.}
  DEVICE_PROVISIONED*: string {.`static`.}
  HTTP_PROXY*: string {.`static`.}
  INSTALL_NON_MARKET_APPS*: string {.`static`.}
  LOCATION_PROVIDERS_ALLOWED*: string {.`static`.}
  LOGGING_ID*: string {.`static`.}
  NETWORK_PREFERENCE*: string {.`static`.}
  PARENTAL_CONTROL_ENABLED*: string {.`static`.}
  PARENTAL_CONTROL_LAST_UPDATE*: string {.`static`.}
  PARENTAL_CONTROL_REDIRECT_URL*: string {.`static`.}
  SETTINGS_CLASSNAME*: string {.`static`.}
  USB_MASS_STORAGE_ENABLED*: string {.`static`.}
  USE_GOOGLE_MAIL*: string {.`static`.}
  WIFI_MAX_DHCP_RETRY_COUNT*: string {.`static`.}
  WIFI_MOBILE_DATA_TRANSITION_WAKELOCK_TIMEOUT_MS*: string {.`static`.}
  WIFI_NETWORKS_AVAILABLE_NOTIFICATION_ON*: string {.`static`.}
  WIFI_NETWORKS_AVAILABLE_REPEAT_DELAY*: string {.`static`.}
  WIFI_NUM_OPEN_NETWORKS_KEPT*: string {.`static`.}
  WIFI_ON*: string {.`static`.}
  WIFI_WATCHDOG_ACCEPTABLE_PACKET_LOSS_PERCENTAGE*: string {.`static`.}
  WIFI_WATCHDOG_AP_COUNT*: string {.`static`.}
  WIFI_WATCHDOG_BACKGROUND_CHECK_DELAY_MS*: string {.`static`.}
  WIFI_WATCHDOG_BACKGROUND_CHECK_ENABLED*: string {.`static`.}
  WIFI_WATCHDOG_BACKGROUND_CHECK_TIMEOUT_MS*: string {.`static`.}
  WIFI_WATCHDOG_INITIAL_IGNORED_PING_COUNT*: string {.`static`.}
  WIFI_WATCHDOG_MAX_AP_CHECKS*: string {.`static`.}
  WIFI_WATCHDOG_ON*: string {.`static`.}
  WIFI_WATCHDOG_PING_COUNT*: string {.`static`.}
  WIFI_WATCHDOG_PING_DELAY_MS*: string {.`static`.}
  WIFI_WATCHDOG_PING_TIMEOUT_MS*: string {.`static`.}

jclass android.provider.Secure* of NameValueTable:
  proc getMovedToGlobalSettings*(outKeySet: Set[string]) {.`static`.}
  proc getMovedToSystemSettings*(outKeySet: Set[string]) {.`static`.}
  proc clearProviderForTest*() {.`static`.}
  proc getPublicSettings*(allKeys: Set[string], readableKeys: Set[string], readableKeysWithMaxTargetSdk: ArrayMap[string, Integer]) {.`static`.}
  proc getString*(resolver: ContentResolver, name: string): string {.`static`.}
  proc getStringForUser*(resolver: ContentResolver, name: string, userHandle: jint): string {.`static`.}
  proc putString*(resolver: ContentResolver, name: string, value: string, overrideableByRestore: jboolean): jboolean {.`static`.}
  proc putString*(resolver: ContentResolver, name: string, value: string): jboolean {.`static`.}
  proc putStringForUser*(resolver: ContentResolver, name: string, value: string, userHandle: jint): jboolean {.`static`.}
  proc putStringForUser*(resolver: ContentResolver, name: string, value: string, tag: string, makeDefault: jboolean, userHandle: jint, overrideableByRestore: jboolean): jboolean {.`static`.}
  proc putString*(resolver: ContentResolver, name: string, value: string, tag: string, makeDefault: jboolean): jboolean {.`static`.}
  proc resetToDefaults*(resolver: ContentResolver, tag: string) {.`static`.}
  proc resetToDefaultsAsUser*(resolver: ContentResolver, tag: string, mode: jint, userHandle: jint) {.`static`.}
  proc getUriFor*(name: string): Uri {.`static`.}
  proc getInt*(cr: ContentResolver, name: string, def: jint): jint {.`static`.}
  proc getIntForUser*(cr: ContentResolver, name: string, def: jint, userHandle: jint): jint {.`static`.}
  proc getInt*(cr: ContentResolver, name: string): jint {.`static`.}
  proc getIntForUser*(cr: ContentResolver, name: string, userHandle: jint): jint {.`static`.}
  proc putInt*(cr: ContentResolver, name: string, value: jint): jboolean {.`static`.}
  proc putIntForUser*(cr: ContentResolver, name: string, value: jint, userHandle: jint): jboolean {.`static`.}
  proc getLong*(cr: ContentResolver, name: string, def: jlong): jlong {.`static`.}
  proc getLongForUser*(cr: ContentResolver, name: string, def: jlong, userHandle: jint): jlong {.`static`.}
  proc getLong*(cr: ContentResolver, name: string): jlong {.`static`.}
  proc getLongForUser*(cr: ContentResolver, name: string, userHandle: jint): jlong {.`static`.}
  proc putLong*(cr: ContentResolver, name: string, value: jlong): jboolean {.`static`.}
  proc putLongForUser*(cr: ContentResolver, name: string, value: jlong, userHandle: jint): jboolean {.`static`.}
  proc getFloat*(cr: ContentResolver, name: string, def: jfloat): jfloat {.`static`.}
  proc getFloatForUser*(cr: ContentResolver, name: string, def: jfloat, userHandle: jint): jfloat {.`static`.}
  proc getFloat*(cr: ContentResolver, name: string): jfloat {.`static`.}
  proc getFloatForUser*(cr: ContentResolver, name: string, userHandle: jint): jfloat {.`static`.}
  proc putFloat*(cr: ContentResolver, name: string, value: jfloat): jboolean {.`static`.}
  proc putFloatForUser*(cr: ContentResolver, name: string, value: jfloat, userHandle: jint): jboolean {.`static`.}
  proc getCloneToManagedProfileSettings*(outKeySet: Set[string]) {.`static`.}
  proc isLocationProviderEnabled*(cr: ContentResolver, provider: string): jboolean {.`static`.}
  proc setLocationProviderEnabled*(cr: ContentResolver, provider: string, enabled: jboolean) {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  ADAPTIVE_SLEEP*: string {.`static`.}
  CAMERA_AUTOROTATE*: string {.`static`.}
  DEVELOPMENT_SETTINGS_ENABLED*: string {.`static`.}
  BUGREPORT_IN_POWER_MENU*: string {.`static`.}
  CUSTOM_BUGREPORT_HANDLER_APP*: string {.`static`.}
  CUSTOM_BUGREPORT_HANDLER_USER*: string {.`static`.}
  ADB_ENABLED*: string {.`static`.}
  ALLOW_MOCK_LOCATION*: string {.`static`.}
  BLUETOOTH_NAME*: string {.`static`.}
  BLUETOOTH_ADDRESS*: string {.`static`.}
  BLUETOOTH_ADDR_VALID*: string {.`static`.}
  BLUETOOTH_LE_BROADCAST_PROGRAM_INFO*: string {.`static`.}
  BLUETOOTH_LE_BROADCAST_NAME*: string {.`static`.}
  BLUETOOTH_LE_BROADCAST_CODE*: string {.`static`.}
  BLUETOOTH_LE_BROADCAST_APP_SOURCE_NAME*: string {.`static`.}
  BLUETOOTH_LE_BROADCAST_IMPROVE_COMPATIBILITY*: string {.`static`.}
  BLUETOOTH_LE_BROADCAST_FALLBACK_ACTIVE_DEVICE_ADDRESS*: string {.`static`.}
  HEARING_AID_RINGTONE_ROUTING*: string {.`static`.}
  HEARING_AID_CALL_ROUTING*: string {.`static`.}
  HEARING_AID_MEDIA_ROUTING*: string {.`static`.}
  HEARING_AID_NOTIFICATION_ROUTING*: string {.`static`.}
  ODI_CAPTIONS_ENABLED*: string {.`static`.}
  ODI_CAPTIONS_VOLUME_UI_ENABLED*: string {.`static`.}
  ANDROID_ID*: string {.`static`.}
  BLUETOOTH_ON*: string {.`static`.}
  DATA_ROAMING*: string {.`static`.}
  DEFAULT_INPUT_METHOD*: string {.`static`.}
  DEFAULT_DEVICE_INPUT_METHOD*: string {.`static`.}
  SELECTED_INPUT_METHOD_SUBTYPE*: string {.`static`.}
  DEFAULT_VOICE_INPUT_METHOD*: string {.`static`.}
  INPUT_METHODS_SUBTYPE_HISTORY*: string {.`static`.}
  INPUT_METHOD_SELECTOR_VISIBILITY*: string {.`static`.}
  STYLUS_HANDWRITING_ENABLED*: string {.`static`.}
  STYLUS_HANDWRITING_DEFAULT_VALUE*: jint {.`static`.}
  VOICE_INTERACTION_SERVICE*: string {.`static`.}
  CREDENTIAL_SERVICE*: string {.`static`.}
  CREDENTIAL_SERVICE_PRIMARY*: string {.`static`.}
  AUTOFILL_SERVICE*: string {.`static`.}
  AUTOFILL_FEATURE_FIELD_CLASSIFICATION*: string {.`static`.}
  DARK_MODE_DIALOG_SEEN*: string {.`static`.}
  DARK_THEME_CUSTOM_START_TIME*: string {.`static`.}
  DARK_THEME_CUSTOM_END_TIME*: string {.`static`.}
  AUTOFILL_USER_DATA_MAX_USER_DATA_SIZE*: string {.`static`.}
  AUTOFILL_USER_DATA_MAX_FIELD_CLASSIFICATION_IDS_SIZE*: string {.`static`.}
  AUTOFILL_USER_DATA_MAX_CATEGORY_COUNT*: string {.`static`.}
  AUTOFILL_USER_DATA_MAX_VALUE_LENGTH*: string {.`static`.}
  AUTOFILL_USER_DATA_MIN_VALUE_LENGTH*: string {.`static`.}
  CONTENT_CAPTURE_ENABLED*: string {.`static`.}
  DEVICE_PROVISIONED*: string {.`static`.}
  MANAGED_PROVISIONING_DPC_DOWNLOADED*: string {.`static`.}
  SECURE_FRP_MODE*: string {.`static`.}
  USER_SETUP_COMPLETE*: string {.`static`.}
  USER_SETUP_PERSONALIZATION_NOT_STARTED*: jint {.`static`.}
  USER_SETUP_PERSONALIZATION_STARTED*: jint {.`static`.}
  USER_SETUP_PERSONALIZATION_PAUSED*: jint {.`static`.}
  USER_SETUP_PERSONALIZATION_COMPLETE*: jint {.`static`.}
  USER_SETUP_PERSONALIZATION_STATE*: string {.`static`.}
  TV_USER_SETUP_COMPLETE*: string {.`static`.}
  COMPLETED_CATEGORY_PREFIX*: string {.`static`.}
  RELEASE_COMPRESS_BLOCKS_ON_INSTALL*: string {.`static`.}
  ENABLED_INPUT_METHODS*: string {.`static`.}
  DISABLED_SYSTEM_INPUT_METHODS*: string {.`static`.}
  SHOW_IME_WITH_HARD_KEYBOARD*: string {.`static`.}
  ACCESSIBILITY_BOUNCE_KEYS*: string {.`static`.}
  ACCESSIBILITY_SLOW_KEYS*: string {.`static`.}
  ACCESSIBILITY_STICKY_KEYS*: string {.`static`.}
  STYLUS_BUTTONS_ENABLED*: string {.`static`.}
  DEFAULT_NOTE_TASK_PROFILE*: string {.`static`.}
  HTTP_PROXY*: string {.`static`.}
  ALWAYS_ON_VPN_APP*: string {.`static`.}
  ALWAYS_ON_VPN_LOCKDOWN*: string {.`static`.}
  ALWAYS_ON_VPN_LOCKDOWN_WHITELIST*: string {.`static`.}
  INSTALL_NON_MARKET_APPS*: string {.`static`.}
  UNKNOWN_SOURCES_DEFAULT_REVERSED*: string {.`static`.}
  LOCATION_PROVIDERS_ALLOWED*: string {.`static`.}
  LOCATION_MODE*: string {.`static`.}
  LOCATION_CHANGER*: string {.`static`.}
  LOCATION_CHANGER_UNKNOWN*: jint {.`static`.}
  LOCATION_CHANGER_SYSTEM_SETTINGS*: jint {.`static`.}
  LOCATION_CHANGER_QUICK_SETTINGS*: jint {.`static`.}
  LOCATION_MODE_OFF*: jint {.`static`.}
  LOCATION_MODE_SENSORS_ONLY*: jint {.`static`.}
  LOCATION_MODE_BATTERY_SAVING*: jint {.`static`.}
  LOCATION_MODE_HIGH_ACCURACY*: jint {.`static`.}
  LOCATION_MODE_ON*: jint {.`static`.}
  LOCATION_TIME_ZONE_DETECTION_ENABLED*: string {.`static`.}
  LOCATION_COARSE_ACCURACY_M*: string {.`static`.}
  LOCATION_SHOW_SYSTEM_OPS*: string {.`static`.}
  LOCK_BIOMETRIC_WEAK_FLAGS*: string {.`static`.}
  LOCK_TO_APP_EXIT_LOCKED*: string {.`static`.}
  LOCK_PATTERN_ENABLED*: string {.`static`.}
  LOCK_PATTERN_VISIBLE*: string {.`static`.}
  LOCK_PATTERN_TACTILE_FEEDBACK_ENABLED*: string {.`static`.}
  LOCK_SCREEN_LOCK_AFTER_TIMEOUT*: string {.`static`.}
  LOCK_SCREEN_OWNER_INFO*: string {.`static`.}
  LOCK_SCREEN_APPWIDGET_IDS*: string {.`static`.}
  LOCK_SCREEN_FALLBACK_APPWIDGET_ID*: string {.`static`.}
  LOCK_SCREEN_STICKY_APPWIDGET*: string {.`static`.}
  LOCK_SCREEN_OWNER_INFO_ENABLED*: string {.`static`.}
  LOCK_SCREEN_ALLOW_PRIVATE_NOTIFICATIONS*: string {.`static`.}
  LOCK_SCREEN_ALLOW_REMOTE_INPUT*: string {.`static`.}
  LOCK_SCREEN_CUSTOM_CLOCK_FACE*: string {.`static`.}
  DOCKED_CLOCK_FACE*: string {.`static`.}
  BROWSER_CONTENT_FILTERS_ENABLED*: string {.`static`.}
  SEARCH_CONTENT_FILTERS_ENABLED*: string {.`static`.}
  SHOW_NOTE_ABOUT_NOTIFICATION_HIDING*: string {.`static`.}
  TRUST_AGENTS_INITIALIZED*: string {.`static`.}
  KNOWN_TRUST_AGENTS_INITIALIZED*: string {.`static`.}
  LOGGING_ID*: string {.`static`.}
  NETWORK_PREFERENCE*: string {.`static`.}
  PARENTAL_CONTROL_ENABLED*: string {.`static`.}
  PARENTAL_CONTROL_LAST_UPDATE*: string {.`static`.}
  PARENTAL_CONTROL_REDIRECT_URL*: string {.`static`.}
  SETTINGS_CLASSNAME*: string {.`static`.}
  USB_MASS_STORAGE_ENABLED*: string {.`static`.}
  USE_GOOGLE_MAIL*: string {.`static`.}
  ACCESSIBILITY_ENABLED*: string {.`static`.}
  ENABLED_ACCESSIBILITY_AUDIO_DESCRIPTION_BY_DEFAULT*: string {.`static`.}
  ACCESSIBILITY_SHORTCUT_ON_LOCK_SCREEN*: string {.`static`.}
  ACCESSIBILITY_SHORTCUT_DIALOG_SHOWN*: string {.`static`.}
  SKIP_ACCESSIBILITY_SHORTCUT_DIALOG_TIMEOUT_RESTRICTION*: string {.`static`.}
  ACCESSIBILITY_SHORTCUT_TARGET_SERVICE*: string {.`static`.}
  ACCESSIBILITY_BUTTON_TARGET_COMPONENT*: string {.`static`.}
  ACCESSIBILITY_BUTTON_TARGETS*: string {.`static`.}
  ACCESSIBILITY_GESTURE_TARGETS*: string {.`static`.}
  ACCESSIBILITY_QS_TARGETS*: string {.`static`.}
  ACCESSIBILITY_KEY_GESTURE_TARGETS*: string {.`static`.}
  ACCESSIBILITY_SHORTCUT_TARGET_MAGNIFICATION_CONTROLLER*: string {.`static`.}
  TOUCH_EXPLORATION_ENABLED*: string {.`static`.}
  ENABLED_ACCESSIBILITY_SERVICES*: string {.`static`.}
  NOTIFIED_NON_ACCESSIBILITY_CATEGORY_SERVICES*: string {.`static`.}
  TOUCH_EXPLORATION_GRANTED_ACCESSIBILITY_SERVICES*: string {.`static`.}
  WEAR_TALKBACK_ENABLED*: string {.`static`.}
  GLOBAL_ACTIONS_PANEL_ENABLED*: string {.`static`.}
  GLOBAL_ACTIONS_PANEL_AVAILABLE*: string {.`static`.}
  GLOBAL_ACTIONS_PANEL_DEBUG_ENABLED*: string {.`static`.}
  HUSH_GESTURE_USED*: string {.`static`.}
  MANUAL_RINGER_TOGGLE_COUNT*: string {.`static`.}
  CHARGING_SOUNDS_ENABLED*: string {.`static`.}
  CHARGING_VIBRATION_ENABLED*: string {.`static`.}
  ZEN_DURATION*: string {.`static`.}
  ZEN_DURATION_PROMPT*: jint {.`static`.}
  ZEN_DURATION_FOREVER*: jint {.`static`.}
  IN_CALL_NOTIFICATION_ENABLED*: string {.`static`.}
  KEYGUARD_SLICE_URI*: string {.`static`.}
  FONT_WEIGHT_ADJUSTMENT*: string {.`static`.}
  ACCESSIBILITY_SPEAK_PASSWORD*: string {.`static`.}
  ACCESSIBILITY_HIGH_TEXT_CONTRAST_ENABLED*: string {.`static`.}
  ACCESSIBILITY_HCT_RECT_PROMPT_STATUS*: string {.`static`.}
  CONTRAST_LEVEL*: string {.`static`.}
  ACCESSIBILITY_DISPLAY_MAGNIFICATION_ENABLED*: string {.`static`.}
  ACCESSIBILITY_DISPLAY_MAGNIFICATION_NAVBAR_ENABLED*: string {.`static`.}
  ACCESSIBILITY_DISPLAY_MAGNIFICATION_SCALE*: string {.`static`.}
  ACCESSIBILITY_DISPLAY_MAGNIFICATION_AUTO_UPDATE*: string {.`static`.}
  ACCESSIBILITY_ALLOW_DIAGONAL_SCROLLING*: string {.`static`.}
  ACCESSIBILITY_SOFT_KEYBOARD_MODE*: string {.`static`.}
  SHOW_MODE_AUTO*: jint {.`static`.}
  SHOW_MODE_HIDDEN*: jint {.`static`.}
  ACCESSIBILITY_CAPTIONING_ENABLED*: string {.`static`.}
  ACCESSIBILITY_CAPTIONING_LOCALE*: string {.`static`.}
  ACCESSIBILITY_CAPTIONING_PRESET*: string {.`static`.}
  ACCESSIBILITY_CAPTIONING_BACKGROUND_COLOR*: string {.`static`.}
  ACCESSIBILITY_CAPTIONING_FOREGROUND_COLOR*: string {.`static`.}
  ACCESSIBILITY_CAPTIONING_EDGE_TYPE*: string {.`static`.}
  ACCESSIBILITY_CAPTIONING_EDGE_COLOR*: string {.`static`.}
  ACCESSIBILITY_CAPTIONING_WINDOW_COLOR*: string {.`static`.}
  ACCESSIBILITY_CAPTIONING_TYPEFACE*: string {.`static`.}
  ACCESSIBILITY_CAPTIONING_FONT_SCALE*: string {.`static`.}
  ACCESSIBILITY_DISPLAY_INVERSION_ENABLED*: string {.`static`.}
  ACCESSIBILITY_FONT_SCALING_HAS_BEEN_CHANGED*: string {.`static`.}
  ACCESSIBILITY_DISPLAY_DALTONIZER_ENABLED*: string {.`static`.}
  ACCESSIBILITY_DISPLAY_DALTONIZER*: string {.`static`.}
  ACCESSIBILITY_DISPLAY_DALTONIZER_SATURATION_LEVEL*: string {.`static`.}
  ACCESSIBILITY_AUTOCLICK_ENABLED*: string {.`static`.}
  ACCESSIBILITY_AUTOCLICK_DELAY*: string {.`static`.}
  ACCESSIBILITY_AUTOCLICK_CURSOR_AREA_SIZE*: string {.`static`.}
  ACCESSIBILITY_AUTOCLICK_IGNORE_MINOR_CURSOR_MOVEMENT*: string {.`static`.}
  ACCESSIBILITY_AUTOCLICK_PANEL_POSITION*: string {.`static`.}
  ACCESSIBILITY_AUTOCLICK_REVERT_TO_LEFT_CLICK*: string {.`static`.}
  ACCESSIBILITY_LARGE_POINTER_ICON*: string {.`static`.}
  LONG_PRESS_TIMEOUT*: string {.`static`.}
  MULTI_PRESS_TIMEOUT*: string {.`static`.}
  KEY_REPEAT_ENABLED*: string {.`static`.}
  KEY_REPEAT_TIMEOUT_MS*: string {.`static`.}
  KEY_REPEAT_DELAY_MS*: string {.`static`.}
  ACCESSIBILITY_NON_INTERACTIVE_UI_TIMEOUT_MS*: string {.`static`.}
  ACCESSIBILITY_INTERACTIVE_UI_TIMEOUT_MS*: string {.`static`.}
  REDUCE_BRIGHT_COLORS_ACTIVATED*: string {.`static`.}
  REDUCE_BRIGHT_COLORS_LEVEL*: string {.`static`.}
  REDUCE_BRIGHT_COLORS_PERSIST_ACROSS_REBOOTS*: string {.`static`.}
  EM_VALUE*: string {.`static`.}
  ENABLED_PRINT_SERVICES*: string {.`static`.}
  DISABLED_PRINT_SERVICES*: string {.`static`.}
  DISPLAY_DENSITY_FORCED*: string {.`static`.}
  TTS_USE_DEFAULTS*: string {.`static`.}
  TTS_DEFAULT_RATE*: string {.`static`.}
  TTS_DEFAULT_PITCH*: string {.`static`.}
  TTS_DEFAULT_SYNTH*: string {.`static`.}
  TTS_DEFAULT_LANG*: string {.`static`.}
  TTS_DEFAULT_COUNTRY*: string {.`static`.}
  TTS_DEFAULT_VARIANT*: string {.`static`.}
  TTS_DEFAULT_LOCALE*: string {.`static`.}
  TTS_ENABLED_PLUGINS*: string {.`static`.}
  WIFI_NETWORKS_AVAILABLE_NOTIFICATION_ON*: string {.`static`.}
  WIFI_NETWORKS_AVAILABLE_REPEAT_DELAY*: string {.`static`.}
  WIFI_NUM_OPEN_NETWORKS_KEPT*: string {.`static`.}
  WIFI_ON*: string {.`static`.}
  WIFI_WATCHDOG_ACCEPTABLE_PACKET_LOSS_PERCENTAGE*: string {.`static`.}
  WIFI_WATCHDOG_AP_COUNT*: string {.`static`.}
  WIFI_WATCHDOG_BACKGROUND_CHECK_DELAY_MS*: string {.`static`.}
  WIFI_WATCHDOG_BACKGROUND_CHECK_ENABLED*: string {.`static`.}
  WIFI_WATCHDOG_BACKGROUND_CHECK_TIMEOUT_MS*: string {.`static`.}
  WIFI_WATCHDOG_INITIAL_IGNORED_PING_COUNT*: string {.`static`.}
  WIFI_WATCHDOG_MAX_AP_CHECKS*: string {.`static`.}
  WIFI_WATCHDOG_ON*: string {.`static`.}
  WIFI_WATCHDOG_WATCH_LIST*: string {.`static`.}
  WIFI_WATCHDOG_PING_COUNT*: string {.`static`.}
  WIFI_WATCHDOG_PING_DELAY_MS*: string {.`static`.}
  WIFI_WATCHDOG_PING_TIMEOUT_MS*: string {.`static`.}
  WIFI_MAX_DHCP_RETRY_COUNT*: string {.`static`.}
  WIFI_MOBILE_DATA_TRANSITION_WAKELOCK_TIMEOUT_MS*: string {.`static`.}
  CONNECTIVITY_RELEASE_PENDING_INTENT_DELAY_MS*: string {.`static`.}
  BACKGROUND_DATA*: string {.`static`.}
  ALLOWED_GEOLOCATION_ORIGINS*: string {.`static`.}
  PREFERRED_TTY_MODE*: string {.`static`.}
  ENHANCED_VOICE_PRIVACY_ENABLED*: string {.`static`.}
  TTY_MODE_ENABLED*: string {.`static`.}
  RTT_CALLING_MODE*: string {.`static`.}
  BACKUP_ENABLED*: string {.`static`.}
  BACKUP_AUTO_RESTORE*: string {.`static`.}
  BACKUP_SCHEDULING_ENABLED*: string {.`static`.}
  BACKUP_PROVISIONED*: string {.`static`.}
  BACKUP_TRANSPORT*: string {.`static`.}
  LAST_SETUP_SHOWN*: string {.`static`.}
  WIFI_IDLE_MS*: string {.`static`.}
  SEARCH_GLOBAL_SEARCH_ACTIVITY*: string {.`static`.}
  SEARCH_NUM_PROMOTED_SOURCES*: string {.`static`.}
  SEARCH_MAX_RESULTS_TO_DISPLAY*: string {.`static`.}
  SEARCH_MAX_RESULTS_PER_SOURCE*: string {.`static`.}
  SEARCH_WEB_RESULTS_OVERRIDE_LIMIT*: string {.`static`.}
  SEARCH_PROMOTED_SOURCE_DEADLINE_MILLIS*: string {.`static`.}
  SEARCH_SOURCE_TIMEOUT_MILLIS*: string {.`static`.}
  SEARCH_PREFILL_MILLIS*: string {.`static`.}
  SEARCH_MAX_STAT_AGE_MILLIS*: string {.`static`.}
  SEARCH_MAX_SOURCE_EVENT_AGE_MILLIS*: string {.`static`.}
  SEARCH_MIN_IMPRESSIONS_FOR_SOURCE_RANKING*: string {.`static`.}
  SEARCH_MIN_CLICKS_FOR_SOURCE_RANKING*: string {.`static`.}
  SEARCH_MAX_SHORTCUTS_RETURNED*: string {.`static`.}
  SEARCH_QUERY_THREAD_CORE_POOL_SIZE*: string {.`static`.}
  SEARCH_QUERY_THREAD_MAX_POOL_SIZE*: string {.`static`.}
  SEARCH_SHORTCUT_REFRESH_CORE_POOL_SIZE*: string {.`static`.}
  SEARCH_SHORTCUT_REFRESH_MAX_POOL_SIZE*: string {.`static`.}
  SEARCH_THREAD_KEEPALIVE_SECONDS*: string {.`static`.}
  SEARCH_PER_SOURCE_CONCURRENT_QUERY_LIMIT*: string {.`static`.}
  MOUNT_PLAY_NOTIFICATION_SND*: string {.`static`.}
  MOUNT_UMS_AUTOSTART*: string {.`static`.}
  MOUNT_UMS_PROMPT*: string {.`static`.}
  MOUNT_UMS_NOTIFY_ENABLED*: string {.`static`.}
  ANR_SHOW_BACKGROUND*: string {.`static`.}
  SHOW_FIRST_CRASH_DIALOG_DEV_OPTION*: string {.`static`.}
  VOICE_RECOGNITION_SERVICE*: string {.`static`.}
  SELECTED_SPELL_CHECKER*: string {.`static`.}
  SELECTED_SPELL_CHECKER_SUBTYPE*: string {.`static`.}
  SPELL_CHECKER_ENABLED*: string {.`static`.}
  INCALL_POWER_BUTTON_BEHAVIOR*: string {.`static`.}
  MINIMAL_POST_PROCESSING_ALLOWED*: string {.`static`.}
  MIRROR_BUILT_IN_DISPLAY*: string {.`static`.}
  MATCH_CONTENT_FRAMERATE_NEVER*: jint {.`static`.}
  MATCH_CONTENT_FRAMERATE_SEAMLESSS_ONLY*: jint {.`static`.}
  MATCH_CONTENT_FRAMERATE_ALWAYS*: jint {.`static`.}
  MATCH_CONTENT_FRAME_RATE*: string {.`static`.}
  INCALL_POWER_BUTTON_BEHAVIOR_SCREEN_OFF*: jint {.`static`.}
  INCALL_POWER_BUTTON_BEHAVIOR_HANGUP*: jint {.`static`.}
  INCALL_POWER_BUTTON_BEHAVIOR_DEFAULT*: jint {.`static`.}
  INCALL_BACK_BUTTON_BEHAVIOR*: string {.`static`.}
  INCALL_BACK_BUTTON_BEHAVIOR_NONE*: jint {.`static`.}
  INCALL_BACK_BUTTON_BEHAVIOR_HANGUP*: jint {.`static`.}
  INCALL_BACK_BUTTON_BEHAVIOR_DEFAULT*: jint {.`static`.}
  WAKE_GESTURE_ENABLED*: string {.`static`.}
  DOZE_ENABLED*: string {.`static`.}
  DOZE_ALWAYS_ON*: string {.`static`.}
  DOZE_ALWAYS_ON_WALLPAPER_ENABLED*: string {.`static`.}
  DOZE_PICK_UP_GESTURE*: string {.`static`.}
  DOZE_PULSE_ON_LONG_PRESS*: string {.`static`.}
  DOZE_DOUBLE_TAP_GESTURE*: string {.`static`.}
  DOZE_TAP_SCREEN_GESTURE*: string {.`static`.}
  DOZE_WAKE_LOCK_SCREEN_GESTURE*: string {.`static`.}
  DOZE_WAKE_DISPLAY_GESTURE*: string {.`static`.}
  DOZE_QUICK_PICKUP_GESTURE*: string {.`static`.}
  SUPPRESS_DOZE*: string {.`static`.}
  SKIP_GESTURE*: string {.`static`.}
  SKIP_GESTURE_COUNT*: string {.`static`.}
  SKIP_TOUCH_COUNT*: string {.`static`.}
  SKIP_DIRECTION*: string {.`static`.}
  SILENCE_GESTURE*: string {.`static`.}
  SILENCE_ALARMS_GESTURE_COUNT*: string {.`static`.}
  SILENCE_TIMER_GESTURE_COUNT*: string {.`static`.}
  SILENCE_CALL_GESTURE_COUNT*: string {.`static`.}
  SILENCE_ALARMS_TOUCH_COUNT*: string {.`static`.}
  SILENCE_TIMER_TOUCH_COUNT*: string {.`static`.}
  SILENCE_CALL_TOUCH_COUNT*: string {.`static`.}
  AWARE_TAP_PAUSE_GESTURE_COUNT*: string {.`static`.}
  AWARE_TAP_PAUSE_TOUCH_COUNT*: string {.`static`.}
  SWIPE_BOTTOM_TO_NOTIFICATION_ENABLED*: string {.`static`.}
  ONE_HANDED_MODE_ACTIVATED*: string {.`static`.}
  ONE_HANDED_MODE_ENABLED*: string {.`static`.}
  ONE_HANDED_MODE_TIMEOUT*: string {.`static`.}
  TAPS_APP_TO_EXIT*: string {.`static`.}
  ONE_HANDED_TUTORIAL_SHOW_COUNT*: string {.`static`.}
  UI_TRANSLATION_ENABLED*: string {.`static`.}
  UI_NIGHT_MODE*: string {.`static`.}
  UI_NIGHT_MODE_CUSTOM_TYPE*: string {.`static`.}
  UI_NIGHT_MODE_OVERRIDE_ON*: string {.`static`.}
  UI_NIGHT_MODE_LAST_COMPUTED*: string {.`static`.}
  UI_NIGHT_MODE_OVERRIDE_OFF*: string {.`static`.}
  SCREENSAVER_ENABLED*: string {.`static`.}
  SCREENSAVER_COMPONENTS*: string {.`static`.}
  SCREENSAVER_ACTIVATE_ON_DOCK*: string {.`static`.}
  SCREENSAVER_ACTIVATE_ON_SLEEP*: string {.`static`.}
  SCREENSAVER_ACTIVATE_ON_POSTURED*: string {.`static`.}
  SCREENSAVER_DEFAULT_COMPONENT*: string {.`static`.}
  SCREENSAVER_COMPLICATIONS_ENABLED*: string {.`static`.}
  GLANCEABLE_HUB_ENABLED*: string {.`static`.}
  GLANCEABLE_HUB_START_NEVER*: jint {.`static`.}
  GLANCEABLE_HUB_START_CHARGING*: jint {.`static`.}
  GLANCEABLE_HUB_START_CHARGING_UPRIGHT*: jint {.`static`.}
  GLANCEABLE_HUB_START_DOCKED*: jint {.`static`.}
  WHEN_TO_START_GLANCEABLE_HUB*: string {.`static`.}
  SCREENSAVER_HOME_CONTROLS_ENABLED*: string {.`static`.}
  DOCK_SETUP_NOT_STARTED*: jint {.`static`.}
  DOCK_SETUP_STARTED*: jint {.`static`.}
  DOCK_SETUP_PAUSED*: jint {.`static`.}
  DOCK_SETUP_PROMPTED*: jint {.`static`.}
  DOCK_SETUP_INCOMPLETE*: jint {.`static`.}
  DOCK_SETUP_COMPLETED*: jint {.`static`.}
  DOCK_SETUP_TIMED_OUT*: jint {.`static`.}
  DOCK_SETUP_STATE*: string {.`static`.}
  HUB_MODE_TUTORIAL_NOT_STARTED*: jint {.`static`.}
  HUB_MODE_TUTORIAL_STARTED*: jint {.`static`.}
  HUB_MODE_TUTORIAL_COMPLETED*: jint {.`static`.}
  HUB_MODE_TUTORIAL_STATE*: string {.`static`.}
  NFC_PAYMENT_DEFAULT_COMPONENT*: string {.`static`.}
  NFC_PAYMENT_FOREGROUND*: string {.`static`.}
  SMS_DEFAULT_APPLICATION*: string {.`static`.}
  DIALER_DEFAULT_APPLICATION*: string {.`static`.}
  CALL_SCREENING_DEFAULT_COMPONENT*: string {.`static`.}
  EMERGENCY_ASSISTANCE_APPLICATION*: string {.`static`.}
  ASSIST_STRUCTURE_ENABLED*: string {.`static`.}
  ASSIST_SCREENSHOT_ENABLED*: string {.`static`.}
  ASSIST_DISCLOSURE_ENABLED*: string {.`static`.}
  SHOW_ROTATION_SUGGESTIONS*: string {.`static`.}
  SHOW_ROTATION_SUGGESTIONS_DISABLED*: jint {.`static`.}
  SHOW_ROTATION_SUGGESTIONS_ENABLED*: jint {.`static`.}
  SHOW_ROTATION_SUGGESTIONS_DEFAULT*: jint {.`static`.}
  NUM_ROTATION_SUGGESTIONS_ACCEPTED*: string {.`static`.}
  ENABLED_NOTIFICATION_ASSISTANT*: string {.`static`.}
  ENABLED_NOTIFICATION_LISTENERS*: string {.`static`.}
  ENABLED_NOTIFICATION_POLICY_ACCESS_PACKAGES*: string {.`static`.}
  SYNC_PARENT_SOUNDS*: string {.`static`.}
  IMMERSIVE_MODE_CONFIRMATIONS*: string {.`static`.}
  PRINT_SERVICE_SEARCH_URI*: string {.`static`.}
  PAYMENT_SERVICE_SEARCH_URI*: string {.`static`.}
  AUTOFILL_SERVICE_SEARCH_URI*: string {.`static`.}
  SKIP_FIRST_USE_HINTS*: string {.`static`.}
  UNSAFE_VOLUME_MUSIC_ACTIVE_MS*: string {.`static`.}
  SPATIAL_AUDIO_ENABLED*: string {.`static`.}
  AUDIO_DEVICE_INVENTORY*: string {.`static`.}
  AUDIO_SAFE_CSD_AS_A_FEATURE_ENABLED*: string {.`static`.}
  LOCK_SCREEN_SHOW_NOTIFICATIONS*: string {.`static`.}
  LOCK_SCREEN_SHOW_SILENT_NOTIFICATIONS*: string {.`static`.}
  LOCK_SCREEN_SHOW_ONLY_UNSEEN_NOTIFICATIONS*: string {.`static`.}
  LOCK_SCREEN_NOTIFICATION_MINIMALISM*: string {.`static`.}
  SHOW_NOTIFICATION_SNOOZE*: string {.`static`.}
  DUAL_SHADE*: string {.`static`.}
  ALLOW_PRIMARY_GAIA_ACCOUNT_REMOVAL_FOR_TESTS*: string {.`static`.}
  TV_INPUT_HIDDEN_INPUTS*: string {.`static`.}
  TV_INPUT_CUSTOM_LABELS*: string {.`static`.}
  TV_APP_USES_NON_SYSTEM_INPUTS*: string {.`static`.}
  USB_AUDIO_AUTOMATIC_ROUTING_DISABLED*: string {.`static`.}
  SLEEP_TIMEOUT*: string {.`static`.}
  ATTENTIVE_TIMEOUT*: string {.`static`.}
  DOUBLE_TAP_TO_WAKE*: string {.`static`.}
  DOUBLE_TAP_TO_SLEEP*: string {.`static`.}
  ASSISTANT*: string {.`static`.}
  CAMERA_GESTURE_DISABLED*: string {.`static`.}
  EMERGENCY_GESTURE_ENABLED*: string {.`static`.}
  EMERGENCY_GESTURE_SOUND_ENABLED*: string {.`static`.}
  EMERGENCY_GESTURE_UI_SHOWING*: string {.`static`.}
  EMERGENCY_GESTURE_UI_LAST_STARTED_MILLIS*: string {.`static`.}
  DOUBLE_TAP_POWER_BUTTON_GESTURE_ENABLED*: string {.`static`.}
  DOUBLE_TAP_POWER_BUTTON_GESTURE*: string {.`static`.}
  CAMERA_DOUBLE_TAP_POWER_GESTURE_DISABLED*: string {.`static`.}
  CAMERA_DOUBLE_TWIST_TO_FLIP_ENABLED*: string {.`static`.}
  CAMERA_LIFT_TRIGGER_ENABLED*: string {.`static`.}
  CAMERA_LIFT_TRIGGER_ENABLED_DEFAULT*: jint {.`static`.}
  FLASHLIGHT_AVAILABLE*: string {.`static`.}
  FLASHLIGHT_ENABLED*: string {.`static`.}
  FACE_UNLOCK_KEYGUARD_ENABLED*: string {.`static`.}
  FACE_UNLOCK_DISMISSES_KEYGUARD*: string {.`static`.}
  SHOW_MEDIA_WHEN_BYPASSING*: string {.`static`.}
  FACE_UNLOCK_ATTENTION_REQUIRED*: string {.`static`.}
  FACE_UNLOCK_DIVERSITY_REQUIRED*: string {.`static`.}
  FACE_UNLOCK_APP_ENABLED*: string {.`static`.}
  FACE_UNLOCK_ALWAYS_REQUIRE_CONFIRMATION*: string {.`static`.}
  FACE_UNLOCK_RE_ENROLL*: string {.`static`.}
  FINGERPRINT_SIDE_FPS_KG_POWER_WINDOW*: string {.`static`.}
  FINGERPRINT_SIDE_FPS_BP_POWER_WINDOW*: string {.`static`.}
  FINGERPRINT_SIDE_FPS_ENROLL_TAP_WINDOW*: string {.`static`.}
  FINGERPRINT_SIDE_FPS_AUTH_DOWNTIME*: string {.`static`.}
  SFPS_PERFORMANT_AUTH_ENABLED*: string {.`static`.}
  SCREEN_OFF_UNLOCK_UDFPS_ENABLED*: string {.`static`.}
  BIOMETRIC_DEBUG_ENABLED*: string {.`static`.}
  BIOMETRIC_VIRTUAL_ENABLED*: string {.`static`.}
  BIOMETRIC_FINGERPRINT_VIRTUAL_ENABLED*: string {.`static`.}
  BIOMETRIC_FACE_VIRTUAL_ENABLED*: string {.`static`.}
  BIOMETRIC_KEYGUARD_ENABLED*: string {.`static`.}
  BIOMETRIC_APP_ENABLED*: string {.`static`.}
  FINGERPRINT_KEYGUARD_ENABLED*: string {.`static`.}
  FINGERPRINT_APP_ENABLED*: string {.`static`.}
  FACE_KEYGUARD_ENABLED*: string {.`static`.}
  FACE_APP_ENABLED*: string {.`static`.}
  MANDATORY_BIOMETRICS*: string {.`static`.}
  MANDATORY_BIOMETRICS_REQUIREMENTS_SATISFIED*: string {.`static`.}
  ACTIVE_UNLOCK_ON_WAKE*: string {.`static`.}
  ACTIVE_UNLOCK_ON_UNLOCK_INTENT*: string {.`static`.}
  ACTIVE_UNLOCK_ON_BIOMETRIC_FAIL*: string {.`static`.}
  ACTIVE_UNLOCK_ON_UNLOCK_INTENT_LEGACY*: string {.`static`.}
  ACTIVE_UNLOCK_ON_FACE_ERRORS*: string {.`static`.}
  ACTIVE_UNLOCK_ON_FACE_ACQUIRE_INFO*: string {.`static`.}
  ACTIVE_UNLOCK_ON_UNLOCK_INTENT_WHEN_BIOMETRIC_ENROLLED*: string {.`static`.}
  ACTIVE_UNLOCK_WAKEUPS_CONSIDERED_UNLOCK_INTENTS*: string {.`static`.}
  ACTIVE_UNLOCK_WAKEUPS_TO_FORCE_DISMISS_KEYGUARD*: string {.`static`.}
  ASSIST_GESTURE_ENABLED*: string {.`static`.}
  ASSIST_GESTURE_SENSITIVITY*: string {.`static`.}
  ASSIST_GESTURE_SILENCE_ALERTS_ENABLED*: string {.`static`.}
  ASSIST_GESTURE_WAKE_ENABLED*: string {.`static`.}
  ASSIST_GESTURE_SETUP_COMPLETE*: string {.`static`.}
  ASSIST_TOUCH_GESTURE_ENABLED*: string {.`static`.}
  ASSIST_LONG_PRESS_HOME_ENABLED*: string {.`static`.}
  SEARCH_ALL_ENTRYPOINTS_ENABLED*: string {.`static`.}
  VISUAL_QUERY_ACCESSIBILITY_DETECTION_ENABLED*: string {.`static`.}
  ON_DEVICE_INTELLIGENCE_UNBIND_TIMEOUT_MS*: string {.`static`.}
  ON_DEVICE_INTELLIGENCE_IDLE_TIMEOUT_MS*: string {.`static`.}
  ON_DEVICE_INFERENCE_UNBIND_TIMEOUT_MS*: string {.`static`.}
  NIGHT_DISPLAY_ACTIVATED*: string {.`static`.}
  NIGHT_DISPLAY_AUTO_MODE*: string {.`static`.}
  NIGHT_DISPLAY_COLOR_TEMPERATURE*: string {.`static`.}
  NIGHT_DISPLAY_CUSTOM_START_TIME*: string {.`static`.}
  NIGHT_DISPLAY_CUSTOM_END_TIME*: string {.`static`.}
  NIGHT_DISPLAY_LAST_ACTIVATED_TIME*: string {.`static`.}
  DISPLAY_WHITE_BALANCE_ENABLED*: string {.`static`.}
  SCREEN_RESOLUTION_MODE*: string {.`static`.}
  RESOLUTION_MODE_UNKNOWN*: jint {.`static`.}
  RESOLUTION_MODE_HIGH*: jint {.`static`.}
  RESOLUTION_MODE_FULL*: jint {.`static`.}
  ENABLED_VR_LISTENERS*: string {.`static`.}
  VR_DISPLAY_MODE*: string {.`static`.}
  VR_DISPLAY_MODE_LOW_PERSISTENCE*: jint {.`static`.}
  VR_DISPLAY_MODE_OFF*: jint {.`static`.}
  CARRIER_APPS_HANDLED*: string {.`static`.}
  MANAGED_PROFILE_CONTACT_REMOTE_SEARCH*: string {.`static`.}
  CROSS_PROFILE_CALENDAR_ENABLED*: string {.`static`.}
  AUTOMATIC_STORAGE_MANAGER_ENABLED*: string {.`static`.}
  AUTOMATIC_STORAGE_MANAGER_DAYS_TO_RETAIN*: string {.`static`.}
  AUTOMATIC_STORAGE_MANAGER_DAYS_TO_RETAIN_DEFAULT*: jint {.`static`.}
  AUTOMATIC_STORAGE_MANAGER_BYTES_CLEARED*: string {.`static`.}
  AUTOMATIC_STORAGE_MANAGER_LAST_RUN*: string {.`static`.}
  AUTOMATIC_STORAGE_MANAGER_TURNED_OFF_BY_POLICY*: string {.`static`.}
  SYSTEM_NAVIGATION_KEYS_ENABLED*: string {.`static`.}
  QS_TILES*: string {.`static`.}
  CONTROLS_ENABLED*: string {.`static`.}
  POWER_MENU_LOCKED_SHOW_CONTENT*: string {.`static`.}
  LOCKSCREEN_SHOW_CONTROLS*: string {.`static`.}
  LOCKSCREEN_ALLOW_TRIVIAL_CONTROLS*: string {.`static`.}
  LOCKSCREEN_SHOW_WALLET*: string {.`static`.}
  LOCKSCREEN_USE_DOUBLE_LINE_CLOCK*: string {.`static`.}
  STATUS_BAR_SHOW_VIBRATE_ICON*: string {.`static`.}
  INSTANT_APPS_ENABLED*: string {.`static`.}
  LOCK_SCREEN_SHOW_QR_CODE_SCANNER*: string {.`static`.}
  SHOW_QR_CODE_SCANNER_SETTING*: string {.`static`.}
  DEVICE_PAIRED*: string {.`static`.}
  CMAS_ADDITIONAL_BROADCAST_PKG*: string {.`static`.}
  NOTIFICATION_BADGING*: string {.`static`.}
  NOTIFICATION_HISTORY_ENABLED*: string {.`static`.}
  BUBBLE_IMPORTANT_CONVERSATIONS*: string {.`static`.}
  NOTIFICATION_BUBBLES*: string {.`static`.}
  NOTIFICATION_DISMISS_RTL*: string {.`static`.}
  QS_AUTO_ADDED_TILES*: string {.`static`.}
  TIMEOUT_TO_DOCK_USER*: string {.`static`.}
  BACKUP_MANAGER_CONSTANTS*: string {.`static`.}
  BACKUP_LOCAL_TRANSPORT_PARAMETERS*: string {.`static`.}
  BLUETOOTH_ON_WHILE_DRIVING*: string {.`static`.}
  VOLUME_DIALOG_DISMISS_TIMEOUT*: string {.`static`.}
  VOLUME_HUSH_GESTURE*: string {.`static`.}
  VOLUME_HUSH_OFF*: jint {.`static`.}
  VOLUME_HUSH_VIBRATE*: jint {.`static`.}
  VOLUME_HUSH_MUTE*: jint {.`static`.}
  LOW_POWER_MANUAL_ACTIVATION_COUNT*: string {.`static`.}
  LOW_POWER_WARNING_ACKNOWLEDGED*: string {.`static`.}
  EXTRA_LOW_POWER_WARNING_ACKNOWLEDGED*: string {.`static`.}
  EMERGENCY_THERMAL_ALERT_DISABLED*: string {.`static`.}
  SUPPRESS_AUTO_BATTERY_SAVER_SUGGESTION*: string {.`static`.}
  PACKAGES_TO_CLEAR_DATA_BEFORE_FULL_RESTORE*: string {.`static`.}
  LOCATION_ACCESS_CHECK_INTERVAL_MILLIS*: string {.`static`.}
  LOCATION_ACCESS_CHECK_DELAY_MILLIS*: string {.`static`.}
  LOCATION_PERMISSIONS_UPGRADE_TO_Q_MODE*: string {.`static`.}
  AUTO_REVOKE_DISABLED*: string {.`static`.}
  THEME_CUSTOMIZATION_OVERLAY_PACKAGES*: string {.`static`.}
  NAV_BAR_FORCE_VISIBLE*: string {.`static`.}
  NAV_BAR_KIDS_MODE*: string {.`static`.}
  NAVIGATION_MODE*: string {.`static`.}
  NAVIGATION_MODE_RESTORE*: string {.`static`.}
  BACK_GESTURE_INSET_SCALE_LEFT*: string {.`static`.}
  BACK_GESTURE_INSET_SCALE_RIGHT*: string {.`static`.}
  NEARBY_SHARING_COMPONENT*: string {.`static`.}
  NEARBY_SHARING_SLICE_URI*: string {.`static`.}
  NEARBY_FAST_PAIR_SETTINGS_DEVICES_COMPONENT*: string {.`static`.}
  AMBIENT_CONTEXT_CONSENT_COMPONENT*: string {.`static`.}
  AMBIENT_CONTEXT_PACKAGE_NAME_EXTRA_KEY*: string {.`static`.}
  AMBIENT_CONTEXT_EVENT_ARRAY_EXTRA_KEY*: string {.`static`.}
  AWARE_ENABLED*: string {.`static`.}
  AWARE_LOCK_ENABLED*: string {.`static`.}
  TAP_GESTURE*: string {.`static`.}
  PEOPLE_STRIP*: string {.`static`.}
  MEDIA_CONTROLS_RESUME*: string {.`static`.}
  MEDIA_CONTROLS_LOCK_SCREEN*: string {.`static`.}
  CAMERA_EXTENSIONS_FALLBACK*: string {.`static`.}
  ACCESSIBILITY_MAGNIFICATION_MODE*: string {.`static`.}
  ACCESSIBILITY_MAGNIFICATION_MODE_NONE*: jint {.`static`.}
  ACCESSIBILITY_MAGNIFICATION_MODE_FULLSCREEN*: jint {.`static`.}
  ACCESSIBILITY_MAGNIFICATION_MODE_WINDOW*: jint {.`static`.}
  ACCESSIBILITY_MAGNIFICATION_MODE_ALL*: jint {.`static`.}
  ACCESSIBILITY_MAGNIFICATION_ALWAYS_ON_ENABLED*: string {.`static`.}
  ACCESSIBILITY_MAGNIFICATION_CURSOR_FOLLOWING_MODE*: string {.`static`.}
  ACCESSIBILITY_MAGNIFICATION_CURSOR_FOLLOWING_MODE_CONTINUOUS*: jint {.`static`.}
  ACCESSIBILITY_MAGNIFICATION_CURSOR_FOLLOWING_MODE_CENTER*: jint {.`static`.}
  ACCESSIBILITY_MAGNIFICATION_CURSOR_FOLLOWING_MODE_EDGE*: jint {.`static`.}
  ACCESSIBILITY_MAGNIFICATION_FOLLOW_TYPING_ENABLED*: string {.`static`.}
  ACCESSIBILITY_MAGNIFICATION_JOYSTICK_ENABLED*: string {.`static`.}
  ACCESSIBILITY_MAGNIFICATION_TWO_FINGER_TRIPLE_TAP_ENABLED*: string {.`static`.}
  ACCESSIBILITY_PINCH_TO_ZOOM_ANYWHERE_ENABLED*: string {.`static`.}
  ACCESSIBILITY_SINGLE_FINGER_PANNING_ENABLED*: string {.`static`.}
  ACCESSIBILITY_MAGNIFICATION_CAPABILITY*: string {.`static`.}
  ACCESSIBILITY_SHOW_WINDOW_MAGNIFICATION_PROMPT*: string {.`static`.}
  ACCESSIBILITY_BUTTON_MODE*: string {.`static`.}
  ACCESSIBILITY_BUTTON_MODE_NAVIGATION_BAR*: jint {.`static`.}
  ACCESSIBILITY_BUTTON_MODE_FLOATING_MENU*: jint {.`static`.}
  ACCESSIBILITY_BUTTON_MODE_GESTURE*: jint {.`static`.}
  ACCESSIBILITY_FLOATING_MENU_SIZE*: string {.`static`.}
  ACCESSIBILITY_FLOATING_MENU_ICON_TYPE*: string {.`static`.}
  ACCESSIBILITY_FLOATING_MENU_FADE_ENABLED*: string {.`static`.}
  ACCESSIBILITY_FLOATING_MENU_OPACITY*: string {.`static`.}
  ACCESSIBILITY_FLOATING_MENU_MIGRATION_TOOLTIP_PROMPT*: string {.`static`.}
  ACCESSIBILITY_FORCE_INVERT_COLOR_ENABLED*: string {.`static`.}
  ACCESSIBILITY_MOUSE_KEYS_ENABLED*: string {.`static`.}
  ADAPTIVE_CONNECTIVITY_ENABLED*: string {.`static`.}
  ADAPTIVE_CONNECTIVITY_WIFI_ENABLED*: string {.`static`.}
  ADAPTIVE_CONNECTIVITY_MOBILE_NETWORK_ENABLED*: string {.`static`.}
  HBM_SETTING_KEY*: string {.`static`.}
  LEGACY_RESTORE_SETTINGS*: string {.`static`.}
  ASSIST_HANDLES_LEARNING_TIME_ELAPSED_MILLIS*: string {.`static`.}
  ASSIST_HANDLES_LEARNING_EVENT_COUNT*: string {.`static`.}
  CLIPBOARD_SHOW_ACCESS_NOTIFICATIONS*: string {.`static`.}
  NAS_SETTINGS_UPDATED*: string {.`static`.}
  GAME_DASHBOARD_ALWAYS_ON*: string {.`static`.}
  DEVICE_STATE_ROTATION_LOCK_IGNORED*: jint {.`static`.}
  DEVICE_STATE_ROTATION_LOCK_LOCKED*: jint {.`static`.}
  DEVICE_STATE_ROTATION_LOCK_UNLOCKED*: jint {.`static`.}
  DEVICE_STATE_ROTATION_KEY_UNKNOWN*: jint {.`static`.}
  DEVICE_STATE_ROTATION_KEY_FOLDED*: jint {.`static`.}
  DEVICE_STATE_ROTATION_KEY_HALF_FOLDED*: jint {.`static`.}
  DEVICE_STATE_ROTATION_KEY_UNFOLDED*: jint {.`static`.}
  DEVICE_STATE_ROTATION_KEY_REAR_DISPLAY*: jint {.`static`.}
  DEVICE_STATE_ROTATION_LOCK*: string {.`static`.}
  COMMUNAL_MODE_ENABLED*: string {.`static`.}
  COMMUNAL_MODE_TRUSTED_NETWORKS*: string {.`static`.}
  HDMI_CEC_SET_MENU_LANGUAGE_DENYLIST*: string {.`static`.}
  LAUNCHER_TASKBAR_EDUCATION_SHOWING*: string {.`static`.}
  COMPAT_UI_EDUCATION_SHOWING*: string {.`static`.}
  ADAPTIVE_CHARGING_ENABLED*: string {.`static`.}
  EXTRA_AUTOMATIC_POWER_SAVE_MODE*: string {.`static`.}
  CONTEXTUAL_SCREEN_TIMEOUT_ENABLED*: string {.`static`.}
  HINGE_ANGLE_LIDEVENT_ENABLED*: string {.`static`.}
  LOCK_SCREEN_WEATHER_ENABLED*: string {.`static`.}
  ACCESSIBILITY_DISPLAY_MAGNIFICATION_EDGE_HAPTIC_ENABLED*: string {.`static`.}
  DND_CONFIGS_MIGRATED*: string {.`static`.}
  HIDE_PRIVATESPACE_ENTRY_POINT*: string {.`static`.}
  DISABLE_SECURE_WINDOWS*: string {.`static`.}
  DISABLE_ADAPTIVE_AUTH_LIMIT_LOCK*: string {.`static`.}
  PRIVATE_SPACE_AUTO_LOCK_ON_DEVICE_LOCK*: jint {.`static`.}
  PRIVATE_SPACE_AUTO_LOCK_AFTER_INACTIVITY*: jint {.`static`.}
  PRIVATE_SPACE_AUTO_LOCK_AFTER_DEVICE_RESTART*: jint {.`static`.}
  PRIVATE_SPACE_AUTO_LOCK*: string {.`static`.}
  STYLUS_POINTER_ICON_ENABLED*: string {.`static`.}
  REDACT_OTP_NOTIFICATION_WHILE_CONNECTED_TO_WIFI*: string {.`static`.}
  OTP_NOTIFICATION_REDACTION_LOCK_TIME*: string {.`static`.}
  INSTANT_APP_SETTINGS*: Set[string] {.`static`.}
  V_TO_U_RESTORE_ALLOWLIST*: string {.`static`.}
  V_TO_U_RESTORE_DENYLIST*: string {.`static`.}
  CHARGE_OPTIMIZATION_MODE*: string {.`static`.}
  CONTEXTUAL_SEARCH_PACKAGE*: string {.`static`.}
  ADVANCED_PROTECTION_MODE*: string {.`static`.}
  AAPM_USB_DATA_PROTECTION*: string {.`static`.}

jclass android.provider.Global* of NameValueTable:
  proc zenModeToString*(mode: jint): string {.`static`.}
  proc isValidZenMode*(value: jint): jboolean {.`static`.}
  proc getMovedToSecureSettings*(outKeySet: Set[string]) {.`static`.}
  proc getMovedToSystemSettings*(outKeySet: Set[string]) {.`static`.}
  proc clearProviderForTest*() {.`static`.}
  proc getPublicSettings*(allKeys: Set[string], readableKeys: Set[string], readableKeysWithMaxTargetSdk: ArrayMap[string, Integer]) {.`static`.}
  proc getString*(resolver: ContentResolver, name: string): string {.`static`.}
  proc getStringForUser*(resolver: ContentResolver, name: string, userHandle: jint): string {.`static`.}
  proc putString*(resolver: ContentResolver, name: string, value: string): jboolean {.`static`.}
  proc putString*(resolver: ContentResolver, name: string, value: string, tag: string, makeDefault: jboolean, overrideableByRestore: jboolean): jboolean {.`static`.}
  proc putString*(resolver: ContentResolver, name: string, value: string, tag: string, makeDefault: jboolean): jboolean {.`static`.}
  proc resetToDefaults*(resolver: ContentResolver, tag: string) {.`static`.}
  proc resetToDefaultsAsUser*(resolver: ContentResolver, tag: string, mode: jint, userHandle: jint) {.`static`.}
  proc putStringForUser*(resolver: ContentResolver, name: string, value: string, userHandle: jint): jboolean {.`static`.}
  proc putStringForUser*(resolver: ContentResolver, name: string, value: string, tag: string, makeDefault: jboolean, userHandle: jint, overrideableByRestore: jboolean): jboolean {.`static`.}
  proc getUriFor*(name: string): Uri {.`static`.}
  proc getInt*(cr: ContentResolver, name: string, def: jint): jint {.`static`.}
  proc getInt*(cr: ContentResolver, name: string): jint {.`static`.}
  proc putInt*(cr: ContentResolver, name: string, value: jint): jboolean {.`static`.}
  proc getLong*(cr: ContentResolver, name: string, def: jlong): jlong {.`static`.}
  proc getLong*(cr: ContentResolver, name: string): jlong {.`static`.}
  proc putLong*(cr: ContentResolver, name: string, value: jlong): jboolean {.`static`.}
  proc getFloat*(cr: ContentResolver, name: string, def: jfloat): jfloat {.`static`.}
  proc getFloat*(cr: ContentResolver, name: string): jfloat {.`static`.}
  proc putFloat*(cr: ContentResolver, name: string, value: jfloat): jboolean {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  NOTIFICATION_BUBBLES*: string {.`static`.}
  ADD_USERS_WHEN_LOCKED*: string {.`static`.}
  REMOVE_GUEST_ON_EXIT*: string {.`static`.}
  APPLY_RAMPING_RINGER*: string {.`static`.}
  ENABLE_ACCESSIBILITY_GLOBAL_GESTURE_ENABLED*: string {.`static`.}
  AIRPLANE_MODE_ON*: string {.`static`.}
  THEATER_MODE_ON*: string {.`static`.}
  RADIO_BLUETOOTH*: string {.`static`.}
  RADIO_WIFI*: string {.`static`.}
  RADIO_WIMAX*: string {.`static`.}
  RADIO_CELL*: string {.`static`.}
  RADIO_NFC*: string {.`static`.}
  RADIO_UWB*: string {.`static`.}
  SATELLITE_MODE_RADIOS*: string {.`static`.}
  SATELLITE_MODE_ENABLED*: string {.`static`.}
  AIRPLANE_MODE_RADIOS*: string {.`static`.}
  AIRPLANE_MODE_TOGGLEABLE_RADIOS*: string {.`static`.}
  BLUETOOTH_CLASS_OF_DEVICE*: string {.`static`.}
  BLUETOOTH_DISABLED_PROFILES*: string {.`static`.}
  BLUETOOTH_INTEROPERABILITY_LIST*: string {.`static`.}
  WIFI_SLEEP_POLICY*: string {.`static`.}
  WIFI_SLEEP_POLICY_DEFAULT*: jint {.`static`.}
  WIFI_SLEEP_POLICY_NEVER_WHILE_PLUGGED*: jint {.`static`.}
  WIFI_SLEEP_POLICY_NEVER*: jint {.`static`.}
  AUTO_TIME*: string {.`static`.}
  AUTO_TIME_ZONE*: string {.`static`.}
  AUTO_TIME_ZONE_EXPLICIT*: string {.`static`.}
  TIME_ZONE_NOTIFICATIONS*: string {.`static`.}
  CAR_DOCK_SOUND*: string {.`static`.}
  CAR_UNDOCK_SOUND*: string {.`static`.}
  DESK_DOCK_SOUND*: string {.`static`.}
  DESK_UNDOCK_SOUND*: string {.`static`.}
  DOCK_SOUNDS_ENABLED*: string {.`static`.}
  DOCK_SOUNDS_ENABLED_WHEN_ACCESSIBILITY*: string {.`static`.}
  LOCK_SOUND*: string {.`static`.}
  UNLOCK_SOUND*: string {.`static`.}
  TRUSTED_SOUND*: string {.`static`.}
  LOW_BATTERY_SOUND*: string {.`static`.}
  POWER_SOUNDS_ENABLED*: string {.`static`.}
  WIRELESS_CHARGING_STARTED_SOUND*: string {.`static`.}
  REVERSE_CHARGING_AUTO_ON*: string {.`static`.}
  CHARGING_STARTED_SOUND*: string {.`static`.}
  CHARGING_SOUNDS_ENABLED*: string {.`static`.}
  CHARGING_VIBRATION_ENABLED*: string {.`static`.}
  STAY_ON_WHILE_PLUGGED_IN*: string {.`static`.}
  BUGREPORT_IN_POWER_MENU*: string {.`static`.}
  CUSTOM_BUGREPORT_HANDLER_APP*: string {.`static`.}
  CUSTOM_BUGREPORT_HANDLER_USER*: string {.`static`.}
  ADB_ENABLED*: string {.`static`.}
  ADB_WIFI_ENABLED*: string {.`static`.}
  ADB_DISCONNECT_SESSIONS_ON_REVOKE*: string {.`static`.}
  DEBUG_VIEW_ATTRIBUTES*: string {.`static`.}
  DEBUG_VIEW_ATTRIBUTES_APPLICATION_PACKAGE*: string {.`static`.}
  ASSISTED_GPS_ENABLED*: string {.`static`.}
  BLUETOOTH_ON*: string {.`static`.}
  CDMA_CELL_BROADCAST_SMS*: string {.`static`.}
  CDMA_ROAMING_MODE*: string {.`static`.}
  CDMA_SUBSCRIPTION_MODE*: string {.`static`.}
  DEFAULT_RESTRICT_BACKGROUND_DATA*: string {.`static`.}
  DATA_ACTIVITY_TIMEOUT_MOBILE*: string {.`static`.}
  DATA_ACTIVITY_TIMEOUT_WIFI*: string {.`static`.}
  DATA_ROAMING*: string {.`static`.}
  MDC_INITIAL_MAX_RETRY*: string {.`static`.}
  FORCE_ALLOW_ON_EXTERNAL*: string {.`static`.}
  DEFAULT_SM_DP_PLUS*: string {.`static`.}
  EUICC_PROVISIONED*: string {.`static`.}
  EUICC_SUPPORTED_COUNTRIES*: string {.`static`.}
  EUICC_UNSUPPORTED_COUNTRIES*: string {.`static`.}
  DEVELOPMENT_FORCE_RESIZABLE_ACTIVITIES*: string {.`static`.}
  DEVELOPMENT_ENABLE_FREEFORM_WINDOWS_SUPPORT*: string {.`static`.}
  DEVELOPMENT_OVERRIDE_DESKTOP_EXPERIENCE_FEATURES*: string {.`static`.}
  DEVELOPMENT_OVERRIDE_DESKTOP_MODE_FEATURES*: string {.`static`.}
  DEVELOPMENT_FORCE_DESKTOP_MODE_ON_EXTERNAL_DISPLAYS*: string {.`static`.}
  DEVELOPMENT_ENABLE_NON_RESIZABLE_MULTI_WINDOW*: string {.`static`.}
  DEVELOPMENT_RENDER_SHADOWS_IN_COMPOSITOR*: string {.`static`.}
  DEVELOPMENT_SHADE_DISPLAY_AWARENESS*: string {.`static`.}
  DEVELOPMENT_WM_DISPLAY_SETTINGS_PATH*: string {.`static`.}
  DEVELOPMENT_SETTINGS_ENABLED*: string {.`static`.}
  DEVICE_PROVISIONED*: string {.`static`.}
  SECURE_FRP_MODE*: string {.`static`.}
  BYPASS_DEVICE_POLICY_MANAGEMENT_ROLE_QUALIFICATIONS*: string {.`static`.}
  ALLOW_WORK_PROFILE_TELEPHONY_FOR_NON_DPM_ROLE_HOLDERS*: string {.`static`.}
  DEVICE_PROVISIONING_MOBILE_DATA_ENABLED*: string {.`static`.}
  DISPLAY_SIZE_FORCED*: string {.`static`.}
  DISPLAY_SCALING_FORCE*: string {.`static`.}
  DOWNLOAD_MAX_BYTES_OVER_MOBILE*: string {.`static`.}
  DOWNLOAD_RECOMMENDED_MAX_BYTES_OVER_MOBILE*: string {.`static`.}
  INSTALL_NON_MARKET_APPS*: string {.`static`.}
  SHOW_MEDIA_ON_QUICK_SETTINGS*: string {.`static`.}
  LOCATION_BACKGROUND_THROTTLE_INTERVAL_MS*: string {.`static`.}
  LOCATION_BACKGROUND_THROTTLE_PROXIMITY_ALERT_INTERVAL_MS*: string {.`static`.}
  LOCATION_BACKGROUND_THROTTLE_PACKAGE_WHITELIST*: string {.`static`.}
  LOCATION_IGNORE_SETTINGS_PACKAGE_WHITELIST*: string {.`static`.}
  LOCATION_ENABLE_STATIONARY_THROTTLE*: string {.`static`.}
  MHL_INPUT_SWITCHING_ENABLED*: string {.`static`.}
  MHL_POWER_CHARGE_ENABLED*: string {.`static`.}
  MOBILE_DATA*: string {.`static`.}
  MOBILE_DATA_ALWAYS_ON*: string {.`static`.}
  DSRM_DURATION_MILLIS*: string {.`static`.}
  DSRM_ENABLED_ACTIONS*: string {.`static`.}
  WIFI_ALWAYS_REQUESTED*: string {.`static`.}
  CONNECTIVITY_METRICS_BUFFER_SIZE*: string {.`static`.}
  NETSTATS_ENABLED*: string {.`static`.}
  NETSTATS_POLL_INTERVAL*: string {.`static`.}
  NETSTATS_TIME_CACHE_MAX_AGE*: string {.`static`.}
  NETSTATS_GLOBAL_ALERT_BYTES*: string {.`static`.}
  NETSTATS_SAMPLE_ENABLED*: string {.`static`.}
  NETSTATS_AUGMENT_ENABLED*: string {.`static`.}
  NETSTATS_COMBINE_SUBTYPE_ENABLED*: string {.`static`.}
  NETSTATS_DEV_BUCKET_DURATION*: string {.`static`.}
  NETSTATS_DEV_PERSIST_BYTES*: string {.`static`.}
  NETSTATS_DEV_ROTATE_AGE*: string {.`static`.}
  NETSTATS_DEV_DELETE_AGE*: string {.`static`.}
  NETSTATS_UID_BUCKET_DURATION*: string {.`static`.}
  NETSTATS_UID_PERSIST_BYTES*: string {.`static`.}
  NETSTATS_UID_ROTATE_AGE*: string {.`static`.}
  NETSTATS_UID_DELETE_AGE*: string {.`static`.}
  NETSTATS_UID_TAG_BUCKET_DURATION*: string {.`static`.}
  NETSTATS_UID_TAG_PERSIST_BYTES*: string {.`static`.}
  NETSTATS_UID_TAG_ROTATE_AGE*: string {.`static`.}
  NETSTATS_UID_TAG_DELETE_AGE*: string {.`static`.}
  NETPOLICY_QUOTA_ENABLED*: string {.`static`.}
  NETPOLICY_QUOTA_UNLIMITED*: string {.`static`.}
  NETPOLICY_QUOTA_LIMITED*: string {.`static`.}
  NETPOLICY_QUOTA_FRAC_JOBS*: string {.`static`.}
  NETPOLICY_QUOTA_FRAC_MULTIPATH*: string {.`static`.}
  NETPOLICY_OVERRIDE_ENABLED*: string {.`static`.}
  NETWORK_PREFERENCE*: string {.`static`.}
  NETWORK_SCORER_APP*: string {.`static`.}
  NIGHT_DISPLAY_FORCED_AUTO_MODE_AVAILABLE*: string {.`static`.}
  NITZ_UPDATE_DIFF*: string {.`static`.}
  NITZ_UPDATE_SPACING*: string {.`static`.}
  NITZ_NETWORK_DISCONNECT_RETENTION*: string {.`static`.}
  NTP_SERVER*: string {.`static`.}
  NTP_TIMEOUT*: string {.`static`.}
  STORAGE_BENCHMARK_INTERVAL*: string {.`static`.}
  SETTINGS_USE_PSD_API*: string {.`static`.}
  SETTINGS_USE_EXTERNAL_PROVIDER_API*: string {.`static`.}
  DNS_RESOLVER_SAMPLE_VALIDITY_SECONDS*: string {.`static`.}
  DNS_RESOLVER_SUCCESS_THRESHOLD_PERCENT*: string {.`static`.}
  DNS_RESOLVER_MIN_SAMPLES*: string {.`static`.}
  DNS_RESOLVER_MAX_SAMPLES*: string {.`static`.}
  OTA_DISABLE_AUTOMATIC_UPDATE*: string {.`static`.}
  ENABLE_16K_PAGES*: string {.`static`.}
  PACKAGE_VERIFIER_TIMEOUT*: string {.`static`.}
  PACKAGE_STREAMING_VERIFIER_TIMEOUT*: string {.`static`.}
  APP_INTEGRITY_VERIFICATION_TIMEOUT*: string {.`static`.}
  PACKAGE_VERIFIER_DEFAULT_RESPONSE*: string {.`static`.}
  PACKAGE_VERIFIER_SETTING_VISIBLE*: string {.`static`.}
  PACKAGE_VERIFIER_INCLUDE_ADB*: string {.`static`.}
  INTEGRITY_CHECK_INCLUDES_RULE_PROVIDER*: string {.`static`.}
  FSTRIM_MANDATORY_INTERVAL*: string {.`static`.}
  PDP_WATCHDOG_POLL_INTERVAL_MS*: string {.`static`.}
  PDP_WATCHDOG_LONG_POLL_INTERVAL_MS*: string {.`static`.}
  PDP_WATCHDOG_ERROR_POLL_INTERVAL_MS*: string {.`static`.}
  PDP_WATCHDOG_TRIGGER_PACKET_COUNT*: string {.`static`.}
  PDP_WATCHDOG_ERROR_POLL_COUNT*: string {.`static`.}
  PDP_WATCHDOG_MAX_PDP_RESET_FAIL_COUNT*: string {.`static`.}
  SETUP_PREPAID_DATA_SERVICE_URL*: string {.`static`.}
  SETUP_PREPAID_DETECTION_TARGET_URL*: string {.`static`.}
  SETUP_PREPAID_DETECTION_REDIR_HOST*: string {.`static`.}
  SMS_OUTGOING_CHECK_INTERVAL_MS*: string {.`static`.}
  SMS_OUTGOING_CHECK_MAX_COUNT*: string {.`static`.}
  SMS_SHORT_CODE_CONFIRMATION*: string {.`static`.}
  SMS_SHORT_CODE_RULE*: string {.`static`.}
  TCP_DEFAULT_INIT_RWND*: string {.`static`.}
  TETHER_SUPPORTED*: string {.`static`.}
  TETHER_DUN_REQUIRED*: string {.`static`.}
  TETHER_DUN_APN*: string {.`static`.}
  TETHER_OFFLOAD_DISABLED*: string {.`static`.}
  TETHER_ENABLE_LEGACY_DHCP_SERVER*: string {.`static`.}
  CARRIER_APP_WHITELIST*: string {.`static`.}
  CARRIER_APP_NAMES*: string {.`static`.}
  USB_MASS_STORAGE_ENABLED*: string {.`static`.}
  USE_GOOGLE_MAIL*: string {.`static`.}
  USER_SWITCHER_ENABLED*: string {.`static`.}
  WEBVIEW_DATA_REDUCTION_PROXY_KEY*: string {.`static`.}
  WEBVIEW_PROVIDER*: string {.`static`.}
  WEBVIEW_MULTIPROCESS*: string {.`static`.}
  NETWORK_SWITCH_NOTIFICATION_DAILY_LIMIT*: string {.`static`.}
  NETWORK_SWITCH_NOTIFICATION_RATE_LIMIT_MILLIS*: string {.`static`.}
  NETWORK_AVOID_BAD_WIFI*: string {.`static`.}
  NETWORK_METERED_MULTIPATH_PREFERENCE*: string {.`static`.}
  NETWORK_DEFAULT_DAILY_MULTIPATH_QUOTA_BYTES*: string {.`static`.}
  NETWORK_WATCHLIST_LAST_REPORT_TIME*: string {.`static`.}
  WIFI_BADGING_THRESHOLDS*: string {.`static`.}
  WIFI_DISPLAY_ON*: string {.`static`.}
  WIFI_DISPLAY_CERTIFICATION_ON*: string {.`static`.}
  WIFI_DISPLAY_WPS_CONFIG*: string {.`static`.}
  WIFI_NETWORKS_AVAILABLE_NOTIFICATION_ON*: string {.`static`.}
  WIMAX_NETWORKS_AVAILABLE_NOTIFICATION_ON*: string {.`static`.}
  WIFI_NETWORKS_AVAILABLE_REPEAT_DELAY*: string {.`static`.}
  WIFI_COUNTRY_CODE*: string {.`static`.}
  WIFI_FRAMEWORK_SCAN_INTERVAL_MS*: string {.`static`.}
  WIFI_IDLE_MS*: string {.`static`.}
  WIFI_NUM_OPEN_NETWORKS_KEPT*: string {.`static`.}
  WIFI_ON*: string {.`static`.}
  WIFI_SCAN_ALWAYS_AVAILABLE*: string {.`static`.}
  WIFI_P2P_PENDING_FACTORY_RESET*: string {.`static`.}
  SOFT_AP_TIMEOUT_ENABLED*: string {.`static`.}
  WIFI_WAKEUP_ENABLED*: string {.`static`.}
  WIFI_MIGRATION_COMPLETED*: string {.`static`.}
  UWB_ENABLED*: string {.`static`.}
  NETWORK_SCORING_UI_ENABLED*: string {.`static`.}
  SPEED_LABEL_CACHE_EVICTION_AGE_MILLIS*: string {.`static`.}
  NETWORK_RECOMMENDATIONS_ENABLED*: string {.`static`.}
  NETWORK_RECOMMENDATIONS_PACKAGE*: string {.`static`.}
  USE_OPEN_WIFI_PACKAGE*: string {.`static`.}
  RECOMMENDED_NETWORK_EVALUATOR_CACHE_EXPIRY_MS*: string {.`static`.}
  WIFI_SCAN_THROTTLE_ENABLED*: string {.`static`.}
  BLE_SCAN_ALWAYS_AVAILABLE*: string {.`static`.}
  BLE_SCAN_LOW_POWER_WINDOW_MS*: string {.`static`.}
  BLE_SCAN_BALANCED_WINDOW_MS*: string {.`static`.}
  BLE_SCAN_LOW_LATENCY_WINDOW_MS*: string {.`static`.}
  BLE_SCAN_LOW_POWER_INTERVAL_MS*: string {.`static`.}
  BLE_SCAN_BALANCED_INTERVAL_MS*: string {.`static`.}
  BLE_SCAN_LOW_LATENCY_INTERVAL_MS*: string {.`static`.}
  BLE_SCAN_BACKGROUND_MODE*: string {.`static`.}
  WIFI_SUPPLICANT_SCAN_INTERVAL_MS*: string {.`static`.}
  WIFI_ENHANCED_AUTO_JOIN*: string {.`static`.}
  WIFI_NETWORK_SHOW_RSSI*: string {.`static`.}
  WIFI_SCAN_INTERVAL_WHEN_P2P_CONNECTED_MS*: string {.`static`.}
  WIFI_WATCHDOG_ON*: string {.`static`.}
  WIFI_WATCHDOG_POOR_NETWORK_TEST_ENABLED*: string {.`static`.}
  WIFI_VERBOSE_LOGGING_ENABLED*: string {.`static`.}
  WIFI_CONNECTED_MAC_RANDOMIZATION_ENABLED*: string {.`static`.}
  WIFI_SCORE_PARAMS*: string {.`static`.}
  WIFI_MAX_DHCP_RETRY_COUNT*: string {.`static`.}
  WIFI_MOBILE_DATA_TRANSITION_WAKELOCK_TIMEOUT_MS*: string {.`static`.}
  WIFI_DEVICE_OWNER_CONFIGS_LOCKDOWN*: string {.`static`.}
  WIFI_FREQUENCY_BAND*: string {.`static`.}
  WIFI_P2P_DEVICE_NAME*: string {.`static`.}
  WIFI_EPHEMERAL_OUT_OF_RANGE_TIMEOUT_MS*: string {.`static`.}
  DATA_STALL_ALARM_NON_AGGRESSIVE_DELAY_IN_MS*: string {.`static`.}
  DATA_STALL_ALARM_AGGRESSIVE_DELAY_IN_MS*: string {.`static`.}
  PROVISIONING_APN_ALARM_DELAY_IN_MS*: string {.`static`.}
  GPRS_REGISTER_CHECK_PERIOD_MS*: string {.`static`.}
  WTF_IS_FATAL*: string {.`static`.}
  MODE_RINGER*: string {.`static`.}
  MUTE_ALARM_STREAM_WITH_RINGER_MODE*: string {.`static`.}
  MUTE_ALARM_STREAM_WITH_RINGER_MODE_USER_PREFERENCE*: string {.`static`.}
  OVERLAY_DISPLAY_DEVICES*: string {.`static`.}
  BATTERY_DISCHARGE_DURATION_THRESHOLD*: string {.`static`.}
  BATTERY_DISCHARGE_THRESHOLD*: string {.`static`.}
  SEND_ACTION_APP_ERROR*: string {.`static`.}
  DROPBOX_AGE_SECONDS*: string {.`static`.}
  DROPBOX_MAX_FILES*: string {.`static`.}
  DROPBOX_QUOTA_KB*: string {.`static`.}
  DROPBOX_QUOTA_PERCENT*: string {.`static`.}
  DROPBOX_RESERVE_PERCENT*: string {.`static`.}
  DROPBOX_TAG_PREFIX*: string {.`static`.}
  ERROR_KERNEL_LOG_PREFIX*: string {.`static`.}
  ERROR_LOGCAT_PREFIX*: string {.`static`.}
  MAX_ERROR_BYTES_PREFIX*: string {.`static`.}
  SYS_FREE_STORAGE_LOG_INTERVAL*: string {.`static`.}
  DISK_FREE_CHANGE_REPORTING_THRESHOLD*: string {.`static`.}
  SYS_STORAGE_THRESHOLD_PERCENTAGE*: string {.`static`.}
  SYS_STORAGE_THRESHOLD_MAX_BYTES*: string {.`static`.}
  SYS_STORAGE_FULL_THRESHOLD_BYTES*: string {.`static`.}
  SYS_STORAGE_CACHE_PERCENTAGE*: string {.`static`.}
  SYNC_MAX_RETRY_DELAY_IN_SECONDS*: string {.`static`.}
  CONNECTIVITY_CHANGE_DELAY*: string {.`static`.}
  CONNECTIVITY_SAMPLING_INTERVAL_IN_SECONDS*: string {.`static`.}
  PAC_CHANGE_DELAY*: string {.`static`.}
  CAPTIVE_PORTAL_MODE_IGNORE*: jint {.`static`.}
  CAPTIVE_PORTAL_MODE_PROMPT*: jint {.`static`.}
  CAPTIVE_PORTAL_MODE_AVOID*: jint {.`static`.}
  CAPTIVE_PORTAL_MODE*: string {.`static`.}
  CAPTIVE_PORTAL_DETECTION_ENABLED*: string {.`static`.}
  CAPTIVE_PORTAL_SERVER*: string {.`static`.}
  CAPTIVE_PORTAL_HTTPS_URL*: string {.`static`.}
  CAPTIVE_PORTAL_HTTP_URL*: string {.`static`.}
  CAPTIVE_PORTAL_FALLBACK_URL*: string {.`static`.}
  CAPTIVE_PORTAL_OTHER_FALLBACK_URLS*: string {.`static`.}
  CAPTIVE_PORTAL_FALLBACK_PROBE_SPECS*: string {.`static`.}
  CAPTIVE_PORTAL_USE_HTTPS*: string {.`static`.}
  CAPTIVE_PORTAL_USER_AGENT*: string {.`static`.}
  DATA_STALL_RECOVERY_ON_BAD_NETWORK*: string {.`static`.}
  MIN_DURATION_BETWEEN_RECOVERY_STEPS_IN_MS*: string {.`static`.}
  SET_INSTALL_LOCATION*: string {.`static`.}
  DEFAULT_INSTALL_LOCATION*: string {.`static`.}
  INET_CONDITION_DEBOUNCE_UP_DELAY*: string {.`static`.}
  INET_CONDITION_DEBOUNCE_DOWN_DELAY*: string {.`static`.}
  READ_EXTERNAL_STORAGE_ENFORCED_DEFAULT*: string {.`static`.}
  HTTP_PROXY*: string {.`static`.}
  GLOBAL_HTTP_PROXY_HOST*: string {.`static`.}
  GLOBAL_HTTP_PROXY_PORT*: string {.`static`.}
  GLOBAL_HTTP_PROXY_EXCLUSION_LIST*: string {.`static`.}
  GLOBAL_HTTP_PROXY_PAC*: string {.`static`.}
  SET_GLOBAL_HTTP_PROXY*: string {.`static`.}
  DEFAULT_DNS_SERVER*: string {.`static`.}
  PRIVATE_DNS_MODE*: string {.`static`.}
  PRIVATE_DNS_SPECIFIER*: string {.`static`.}
  PRIVATE_DNS_DEFAULT_MODE*: string {.`static`.}
  BLUETOOTH_BTSNOOP_DEFAULT_MODE*: string {.`static`.}
  BLUETOOTH_HEADSET_PRIORITY_PREFIX*: string {.`static`.}
  BLUETOOTH_A2DP_SINK_PRIORITY_PREFIX*: string {.`static`.}
  BLUETOOTH_A2DP_SRC_PRIORITY_PREFIX*: string {.`static`.}
  BLUETOOTH_A2DP_SUPPORTS_OPTIONAL_CODECS_PREFIX*: string {.`static`.}
  BLUETOOTH_A2DP_OPTIONAL_CODECS_ENABLED_PREFIX*: string {.`static`.}
  BLUETOOTH_INPUT_DEVICE_PRIORITY_PREFIX*: string {.`static`.}
  BLUETOOTH_MAP_PRIORITY_PREFIX*: string {.`static`.}
  BLUETOOTH_MAP_CLIENT_PRIORITY_PREFIX*: string {.`static`.}
  BLUETOOTH_PBAP_CLIENT_PRIORITY_PREFIX*: string {.`static`.}
  BLUETOOTH_SAP_PRIORITY_PREFIX*: string {.`static`.}
  BLUETOOTH_PAN_PRIORITY_PREFIX*: string {.`static`.}
  BLUETOOTH_HEARING_AID_PRIORITY_PREFIX*: string {.`static`.}
  ENABLE_RADIO_BUG_DETECTION*: string {.`static`.}
  RADIO_BUG_WAKELOCK_TIMEOUT_COUNT_THRESHOLD*: string {.`static`.}
  RADIO_BUG_SYSTEM_ERROR_COUNT_THRESHOLD*: string {.`static`.}
  ACTIVITY_MANAGER_CONSTANTS*: string {.`static`.}
  ACTIVITY_STARTS_LOGGING_ENABLED*: string {.`static`.}
  FOREGROUND_SERVICE_STARTS_LOGGING_ENABLED*: string {.`static`.}
  FORCE_ENABLE_PSS_PROFILING*: string {.`static`.}
  APP_BINDING_CONSTANTS*: string {.`static`.}
  APP_OPS_CONSTANTS*: string {.`static`.}
  DEVICE_IDLE_CONSTANTS*: string {.`static`.}
  BATTERY_SAVER_CONSTANTS*: string {.`static`.}
  BATTERY_SAVER_DEVICE_SPECIFIC_CONSTANTS*: string {.`static`.}
  BATTERY_TIP_CONSTANTS*: string {.`static`.}
  ANOMALY_DETECTION_CONSTANTS*: string {.`static`.}
  ANOMALY_CONFIG_VERSION*: string {.`static`.}
  ANOMALY_CONFIG*: string {.`static`.}
  ALWAYS_ON_DISPLAY_CONSTANTS*: string {.`static`.}
  SYS_UIDCPUPOWER*: string {.`static`.}
  SYS_TRACED*: string {.`static`.}
  FPS_DEVISOR*: string {.`static`.}
  DISPLAY_PANEL_LPM*: string {.`static`.}
  APP_TIME_LIMIT_USAGE_SOURCE*: string {.`static`.}
  ART_VERIFIER_VERIFY_DEBUGGABLE*: string {.`static`.}
  POWER_MANAGER_CONSTANTS*: string {.`static`.}
  SHORTCUT_MANAGER_CONSTANTS*: string {.`static`.}
  DEVICE_POLICY_CONSTANTS*: string {.`static`.}
  TEXT_CLASSIFIER_CONSTANTS*: string {.`static`.}
  BATTERY_STATS_CONSTANTS*: string {.`static`.}
  SYNC_MANAGER_CONSTANTS*: string {.`static`.}
  BROADCAST_FG_CONSTANTS*: string {.`static`.}
  BROADCAST_BG_CONSTANTS*: string {.`static`.}
  BROADCAST_OFFLOAD_CONSTANTS*: string {.`static`.}
  APP_STANDBY_ENABLED*: string {.`static`.}
  ADAPTIVE_BATTERY_MANAGEMENT_ENABLED*: string {.`static`.}
  APP_AUTO_RESTRICTION_ENABLED*: string {.`static`.}
  FORCED_APP_STANDBY_FOR_SMALL_BATTERY_ENABLED*: string {.`static`.}
  USER_ABSENT_RADIOS_OFF_FOR_SMALL_BATTERY_ENABLED*: string {.`static`.}
  USER_ABSENT_TOUCH_OFF_FOR_SMALL_BATTERY_ENABLED*: string {.`static`.}
  WIFI_ON_WHEN_PROXY_DISCONNECTED*: string {.`static`.}
  TIME_ONLY_MODE_CONSTANTS*: string {.`static`.}
  UNGAZE_SLEEP_ENABLED*: string {.`static`.}
  NETWORK_WATCHLIST_ENABLED*: string {.`static`.}
  SHOW_HIDDEN_LAUNCHER_ICON_APPS_ENABLED*: string {.`static`.}
  SHOW_NEW_APP_INSTALLED_NOTIFICATION_ENABLED*: string {.`static`.}
  KEEP_PROFILE_IN_BACKGROUND*: string {.`static`.}
  DEFAULT_ADB_ALLOWED_CONNECTION_TIME*: jlong {.`static`.}
  ADB_ALLOWED_CONNECTION_TIME*: string {.`static`.}
  WINDOW_ANIMATION_SCALE*: string {.`static`.}
  DISABLE_WINDOW_BLURS*: string {.`static`.}
  TRANSITION_ANIMATION_SCALE*: string {.`static`.}
  ANIMATOR_DURATION_SCALE*: string {.`static`.}
  FANCY_IME_ANIMATIONS*: string {.`static`.}
  COMPATIBILITY_MODE*: string {.`static`.}
  EMERGENCY_TONE*: string {.`static`.}
  CALL_AUTO_RETRY*: string {.`static`.}
  EMERGENCY_AFFORDANCE_NEEDED*: string {.`static`.}
  EMERGENCY_GESTURE_POWER_BUTTON_COOLDOWN_PERIOD_MS*: string {.`static`.}
  EMERGENCY_GESTURE_TAP_DETECTION_MIN_TIME_MS*: string {.`static`.}
  EMERGENCY_GESTURE_STICKY_UI_MAX_DURATION_MILLIS*: string {.`static`.}
  ENABLE_AUTOMATIC_SYSTEM_SERVER_HEAP_DUMPS*: string {.`static`.}
  PREFERRED_NETWORK_MODE*: string {.`static`.}
  DEBUG_APP*: string {.`static`.}
  WAIT_FOR_DEBUGGER*: string {.`static`.}
  ENABLE_GPU_DEBUG_LAYERS*: string {.`static`.}
  GPU_DEBUG_APP*: string {.`static`.}
  ANGLE_DEBUG_PACKAGE*: string {.`static`.}
  ANGLE_GL_DRIVER_ALL_ANGLE*: string {.`static`.}
  ANGLE_GL_DRIVER_SELECTION_PKGS*: string {.`static`.}
  ANGLE_GL_DRIVER_SELECTION_VALUES*: string {.`static`.}
  ANGLE_EGL_FEATURES*: string {.`static`.}
  SHOW_ANGLE_IN_USE_DIALOG_BOX*: string {.`static`.}
  UPDATABLE_DRIVER_ALL_APPS*: string {.`static`.}
  UPDATABLE_DRIVER_PRODUCTION_OPT_IN_APPS*: string {.`static`.}
  UPDATABLE_DRIVER_PRERELEASE_OPT_IN_APPS*: string {.`static`.}
  UPDATABLE_DRIVER_PRODUCTION_OPT_OUT_APPS*: string {.`static`.}
  UPDATABLE_DRIVER_PRODUCTION_DENYLIST*: string {.`static`.}
  UPDATABLE_DRIVER_PRODUCTION_DENYLISTS*: string {.`static`.}
  UPDATABLE_DRIVER_PRODUCTION_ALLOWLIST*: string {.`static`.}
  UPDATABLE_DRIVER_SPHAL_LIBRARIES*: string {.`static`.}
  GPU_DEBUG_LAYERS*: string {.`static`.}
  GPU_DEBUG_LAYERS_GLES*: string {.`static`.}
  GPU_DEBUG_LAYER_APP*: string {.`static`.}
  SHOW_PROCESSES*: string {.`static`.}
  LOW_POWER_MODE*: string {.`static`.}
  EXTRA_LOW_POWER_MODE*: string {.`static`.}
  LOW_POWER_MODE_STICKY*: string {.`static`.}
  LOW_POWER_MODE_STICKY_AUTO_DISABLE_LEVEL*: string {.`static`.}
  LOW_POWER_MODE_STICKY_AUTO_DISABLE_ENABLED*: string {.`static`.}
  LOW_POWER_MODE_TRIGGER_LEVEL*: string {.`static`.}
  AUTOMATIC_POWER_SAVE_MODE*: string {.`static`.}
  DYNAMIC_POWER_SAVINGS_DISABLE_THRESHOLD*: string {.`static`.}
  DYNAMIC_POWER_SAVINGS_ENABLED*: string {.`static`.}
  TIME_REMAINING_ESTIMATE_MILLIS*: string {.`static`.}
  TIME_REMAINING_ESTIMATE_BASED_ON_USAGE*: string {.`static`.}
  AVERAGE_TIME_TO_DISCHARGE*: string {.`static`.}
  BATTERY_ESTIMATES_LAST_UPDATE_TIME*: string {.`static`.}
  LOW_POWER_MODE_TRIGGER_LEVEL_MAX*: string {.`static`.}
  LOW_POWER_MODE_SUGGESTION_PARAMS*: string {.`static`.}
  LOW_POWER_MODE_REMINDER_ENABLED*: string {.`static`.}
  ALWAYS_FINISH_ACTIVITIES*: string {.`static`.}
  HIDE_ERROR_DIALOGS*: string {.`static`.}
  DOCK_AUDIO_MEDIA_ENABLED*: string {.`static`.}
  ENCODED_SURROUND_OUTPUT_AUTO*: jint {.`static`.}
  ENCODED_SURROUND_OUTPUT_NEVER*: jint {.`static`.}
  ENCODED_SURROUND_OUTPUT_ALWAYS*: jint {.`static`.}
  ENCODED_SURROUND_OUTPUT_MANUAL*: jint {.`static`.}
  ENCODED_SURROUND_SC_MAX*: jint {.`static`.}
  ENCODED_SURROUND_OUTPUT*: string {.`static`.}
  ENCODED_SURROUND_OUTPUT_ENABLED_FORMATS*: string {.`static`.}
  AUDIO_SAFE_VOLUME_STATE*: string {.`static`.}
  AUDIO_SAFE_CSD_CURRENT_VALUE*: string {.`static`.}
  AUDIO_SAFE_CSD_NEXT_WARNING*: string {.`static`.}
  AUDIO_SAFE_CSD_DOSE_RECORDS*: string {.`static`.}
  TZINFO_UPDATE_CONTENT_URL*: string {.`static`.}
  TZINFO_UPDATE_METADATA_URL*: string {.`static`.}
  SELINUX_UPDATE_CONTENT_URL*: string {.`static`.}
  SELINUX_UPDATE_METADATA_URL*: string {.`static`.}
  SMS_SHORT_CODES_UPDATE_CONTENT_URL*: string {.`static`.}
  SMS_SHORT_CODES_UPDATE_METADATA_URL*: string {.`static`.}
  APN_DB_UPDATE_CONTENT_URL*: string {.`static`.}
  APN_DB_UPDATE_METADATA_URL*: string {.`static`.}
  CERT_PIN_UPDATE_CONTENT_URL*: string {.`static`.}
  CERT_PIN_UPDATE_METADATA_URL*: string {.`static`.}
  INTENT_FIREWALL_UPDATE_CONTENT_URL*: string {.`static`.}
  INTENT_FIREWALL_UPDATE_METADATA_URL*: string {.`static`.}
  LANG_ID_UPDATE_CONTENT_URL*: string {.`static`.}
  LANG_ID_UPDATE_METADATA_URL*: string {.`static`.}
  SMART_SELECTION_UPDATE_CONTENT_URL*: string {.`static`.}
  SMART_SELECTION_UPDATE_METADATA_URL*: string {.`static`.}
  CONVERSATION_ACTIONS_UPDATE_CONTENT_URL*: string {.`static`.}
  CONVERSATION_ACTIONS_UPDATE_METADATA_URL*: string {.`static`.}
  SELINUX_STATUS*: string {.`static`.}
  DEVELOPMENT_FORCE_RTL*: string {.`static`.}
  LOW_BATTERY_SOUND_TIMEOUT*: string {.`static`.}
  WIFI_BOUNCE_DELAY_OVERRIDE_MS*: string {.`static`.}
  POLICY_CONTROL*: string {.`static`.}
  EMULATE_DISPLAY_CUTOUT*: string {.`static`.}
  EMULATE_DISPLAY_CUTOUT_OFF*: jint {.`static`.}
  EMULATE_DISPLAY_CUTOUT_ON*: jint {.`static`.}
  BLOCKED_SLICES*: string {.`static`.}
  ZEN_MODE*: string {.`static`.}
  ZEN_MODE_OFF*: jint {.`static`.}
  ZEN_MODE_IMPORTANT_INTERRUPTIONS*: jint {.`static`.}
  ZEN_MODE_NO_INTERRUPTIONS*: jint {.`static`.}
  ZEN_MODE_ALARMS*: jint {.`static`.}
  USER_DISABLED_HDR_FORMATS*: string {.`static`.}
  ARE_USER_DISABLED_HDR_FORMATS_ALLOWED*: string {.`static`.}
  DEVICE_CONFIG_SYNC_DISABLED*: string {.`static`.}
  CONNECTED_APPS_ALLOWED_PACKAGES*: string {.`static`.}
  CONNECTED_APPS_DISALLOWED_PACKAGES*: string {.`static`.}
  ZEN_MODE_RINGER_LEVEL*: string {.`static`.}
  ZEN_MODE_CONFIG_ETAG*: string {.`static`.}
  ZEN_DURATION*: string {.`static`.}
  ZEN_DURATION_PROMPT*: jint {.`static`.}
  ZEN_DURATION_FOREVER*: jint {.`static`.}
  HEADS_UP_NOTIFICATIONS_ENABLED*: string {.`static`.}
  HEADS_UP_OFF*: jint {.`static`.}
  HEADS_UP_ON*: jint {.`static`.}
  USER_PREFERRED_REFRESH_RATE*: string {.`static`.}
  USER_PREFERRED_RESOLUTION_HEIGHT*: string {.`static`.}
  USER_PREFERRED_RESOLUTION_WIDTH*: string {.`static`.}
  HDR_CONVERSION_MODE*: string {.`static`.}
  HDR_FORCE_CONVERSION_TYPE*: string {.`static`.}
  DEVICE_NAME*: string {.`static`.}
  NETWORK_SCORING_PROVISIONED*: string {.`static`.}
  REQUIRE_PASSWORD_TO_DECRYPT*: string {.`static`.}
  ENHANCED_4G_MODE_ENABLED*: string {.`static`.}
  VT_IMS_ENABLED*: string {.`static`.}
  WFC_IMS_ENABLED*: string {.`static`.}
  WFC_IMS_MODE*: string {.`static`.}
  WFC_IMS_ROAMING_MODE*: string {.`static`.}
  WFC_IMS_ROAMING_ENABLED*: string {.`static`.}
  LTE_SERVICE_FORCED*: string {.`static`.}
  LID_BEHAVIOR*: string {.`static`.}
  EPHEMERAL_COOKIE_MAX_SIZE_BYTES*: string {.`static`.}
  ENABLE_EPHEMERAL_FEATURE*: string {.`static`.}
  INSTANT_APP_DEXOPT_ENABLED*: string {.`static`.}
  INSTALLED_INSTANT_APP_MIN_CACHE_PERIOD*: string {.`static`.}
  INSTALLED_INSTANT_APP_MAX_CACHE_PERIOD*: string {.`static`.}
  UNINSTALLED_INSTANT_APP_MIN_CACHE_PERIOD*: string {.`static`.}
  UNINSTALLED_INSTANT_APP_MAX_CACHE_PERIOD*: string {.`static`.}
  UNUSED_STATIC_SHARED_LIB_MIN_CACHE_PERIOD*: string {.`static`.}
  ALLOW_USER_SWITCHING_WHEN_SYSTEM_USER_LOCKED*: string {.`static`.}
  BOOT_COUNT*: string {.`static`.}
  SAFE_BOOT_DISALLOWED*: string {.`static`.}
  DEVICE_DEMO_MODE*: string {.`static`.}
  DATABASE_DOWNGRADE_REASON*: string {.`static`.}
  DATABASE_CREATION_BUILDID*: string {.`static`.}
  CONTACTS_DATABASE_WAL_ENABLED*: string {.`static`.}
  LOCATION_SETTINGS_LINK_TO_PERMISSIONS_ENABLED*: string {.`static`.}
  EUICC_REMOVING_INVISIBLE_PROFILES_TIMEOUT_MILLIS*: string {.`static`.}
  EUICC_FACTORY_RESET_TIMEOUT_MILLIS*: string {.`static`.}
  EUICC_SWITCH_SLOT_TIMEOUT_MILLIS*: string {.`static`.}
  ENABLE_MULTI_SLOT_TIMEOUT_MILLIS*: string {.`static`.}
  STORAGE_SETTINGS_CLOBBER_THRESHOLD*: string {.`static`.}
  OVERRIDE_SETTINGS_PROVIDER_RESTORE_ANY_VERSION*: string {.`static`.}
  CHAINED_BATTERY_ATTRIBUTION_ENABLED*: string {.`static`.}
  ENABLE_ADB_INCREMENTAL_INSTALL_DEFAULT*: string {.`static`.}
  AUTOFILL_COMPAT_MODE_ALLOWED_PACKAGES*: string {.`static`.}
  AUTOFILL_LOGGING_LEVEL*: string {.`static`.}
  AUTOFILL_MAX_PARTITIONS_SIZE*: string {.`static`.}
  AUTOFILL_MAX_VISIBLE_DATASETS*: string {.`static`.}
  STYLUS_EVER_USED*: string {.`static`.}
  HIDDEN_API_BLACKLIST_EXEMPTIONS*: string {.`static`.}
  HIDDEN_API_POLICY*: string {.`static`.}
  FORCE_NON_DEBUGGABLE_FINAL_BUILD_FOR_COMPAT*: string {.`static`.}
  SIGNED_CONFIG_VERSION*: string {.`static`.}
  SOUND_TRIGGER_DETECTION_SERVICE_OP_TIMEOUT*: string {.`static`.}
  MAX_SOUND_TRIGGER_DETECTION_SERVICE_OPS_PER_DAY*: string {.`static`.}
  CLOCKWORK_HOME_READY*: string {.`static`.}
  AWARE_ALLOWED*: string {.`static`.}
  POWER_BUTTON_SHORT_PRESS*: string {.`static`.}
  POWER_BUTTON_DOUBLE_PRESS*: string {.`static`.}
  POWER_BUTTON_TRIPLE_PRESS*: string {.`static`.}
  POWER_BUTTON_LONG_PRESS*: string {.`static`.}
  POWER_BUTTON_LONG_PRESS_DURATION_MS*: string {.`static`.}
  POWER_BUTTON_VERY_LONG_PRESS*: string {.`static`.}
  STEM_PRIMARY_BUTTON_SHORT_PRESS*: string {.`static`.}
  STEM_PRIMARY_BUTTON_DOUBLE_PRESS*: string {.`static`.}
  STEM_PRIMARY_BUTTON_TRIPLE_PRESS*: string {.`static`.}
  STEM_PRIMARY_BUTTON_LONG_PRESS*: string {.`static`.}
  KEY_CHORD_POWER_VOLUME_UP*: string {.`static`.}
  RECEIVE_EXPLICIT_USER_INTERACTION_AUDIO_ENABLED*: string {.`static`.}
  ONE_HANDED_KEYGUARD_SIDE_LEFT*: jint {.`static`.}
  ONE_HANDED_KEYGUARD_SIDE_RIGHT*: jint {.`static`.}
  ONE_HANDED_KEYGUARD_SIDE*: string {.`static`.}
  HEARING_DEVICE_LOCAL_AMBIENT_VOLUME*: string {.`static`.}
  HEARING_DEVICE_LOCAL_NOTIFICATION*: string {.`static`.}
  TRANSIENT_SETTINGS*: string {.`static`.}
  LEGACY_RESTORE_SETTINGS*: string {.`static`.}
  MULTI_SIM_VOICE_CALL_SUBSCRIPTION*: string {.`static`.}
  MULTI_SIM_VOICE_PROMPT*: string {.`static`.}
  MULTI_SIM_DATA_CALL_SUBSCRIPTION*: string {.`static`.}
  MULTI_SIM_SMS_SUBSCRIPTION*: string {.`static`.}
  MULTI_SIM_SMS_PROMPT*: string {.`static`.}
  MULTI_SIM_USER_PREFERRED_SUBS*: string {.`static`.}
  ENABLED_SUBSCRIPTION_FOR_SLOT*: string {.`static`.}
  MODEM_STACK_ENABLED_FOR_SLOT*: string {.`static`.}
  NEW_CONTACT_AGGREGATOR*: string {.`static`.}
  CONTACT_METADATA_SYNC*: string {.`static`.}
  CONTACT_METADATA_SYNC_ENABLED*: string {.`static`.}
  ENABLE_CELLULAR_ON_BOOT*: string {.`static`.}
  MAX_NOTIFICATION_ENQUEUE_RATE*: string {.`static`.}
  SHOW_NOTIFICATION_CHANNEL_WARNINGS*: string {.`static`.}
  DISABLE_SCREEN_SHARE_PROTECTIONS_FOR_APPS_AND_NOTIFICATIONS*: string {.`static`.}
  CELL_ON*: string {.`static`.}
  INSTANT_APP_SETTINGS*: Set[string] {.`static`.}
  SHOW_TEMPERATURE_WARNING*: string {.`static`.}
  SHOW_USB_TEMPERATURE_ALARM*: string {.`static`.}
  WARNING_TEMPERATURE*: string {.`static`.}
  ENABLE_DISKSTATS_LOGGING*: string {.`static`.}
  ENABLE_CACHE_QUOTA_CALCULATION*: string {.`static`.}
  ENABLE_DELETION_HELPER_NO_THRESHOLD_TOGGLE*: string {.`static`.}
  NOTIFICATION_SNOOZE_OPTIONS*: string {.`static`.}
  NOTIFICATION_FEEDBACK_ENABLED*: string {.`static`.}
  BLOCKING_HELPER_DISMISS_TO_VIEW_RATIO_LIMIT*: string {.`static`.}
  BLOCKING_HELPER_STREAK_LIMIT*: string {.`static`.}
  SQLITE_COMPATIBILITY_WAL_FLAGS*: string {.`static`.}
  ENABLE_GNSS_RAW_MEAS_FULL_TRACKING*: string {.`static`.}
  INSTALL_CARRIER_APP_NOTIFICATION_PERSISTENT*: string {.`static`.}
  INSTALL_CARRIER_APP_NOTIFICATION_SLEEP_MILLIS*: string {.`static`.}
  ZRAM_ENABLED*: string {.`static`.}
  CACHED_APPS_FREEZER_ENABLED*: string {.`static`.}
  SMART_REPLIES_IN_NOTIFICATIONS_FLAGS*: string {.`static`.}
  SMART_SUGGESTIONS_IN_NOTIFICATIONS_FLAGS*: string {.`static`.}
  SHOW_FIRST_CRASH_DIALOG*: string {.`static`.}
  SHOW_RESTART_IN_CRASH_DIALOG*: string {.`static`.}
  SHOW_MUTE_IN_CRASH_DIALOG*: string {.`static`.}
  BACKUP_AGENT_TIMEOUT_PARAMETERS*: string {.`static`.}
  GNSS_SATELLITE_BLOCKLIST*: string {.`static`.}
  GNSS_HAL_LOCATION_REQUEST_DURATION_MILLIS*: string {.`static`.}
  BINDER_CALLS_STATS*: string {.`static`.}
  LOOPER_STATS*: string {.`static`.}
  KERNEL_CPU_THREAD_READER*: string {.`static`.}
  NATIVE_FLAGS_HEALTH_CHECK_ENABLED*: string {.`static`.}
  APPOP_HISTORY_MODE*: string {.`static`.}
  APPOP_HISTORY_BASE_INTERVAL_MILLIS*: string {.`static`.}
  APPOP_HISTORY_INTERVAL_MULTIPLIER*: string {.`static`.}
  APPOP_HISTORY_PARAMETERS*: string {.`static`.}
  AUTO_REVOKE_PARAMETERS*: string {.`static`.}
  BATTERY_CHARGING_STATE_UPDATE_DELAY*: string {.`static`.}
  BATTERY_CHARGING_STATE_ENFORCE_LEVEL*: string {.`static`.}
  TEXT_CLASSIFIER_ACTION_MODEL_PARAMS*: string {.`static`.}
  POWER_BUTTON_SUPPRESSION_DELAY_AFTER_GESTURE_WAKE*: string {.`static`.}
  ADVANCED_BATTERY_USAGE_AMOUNT*: string {.`static`.}
  NR_NSA_TRACKING_SCREEN_OFF_MODE*: string {.`static`.}
  SHOW_PEOPLE_SPACE*: string {.`static`.}
  PEOPLE_SPACE_CONVERSATION_TYPE*: string {.`static`.}
  SHOW_NEW_NOTIF_DISMISS*: string {.`static`.}
  MAXIMUM_OBSCURING_OPACITY_FOR_TOUCH*: string {.`static`.}
  RESTRICTED_NETWORKING_MODE*: string {.`static`.}
  LOW_POWER_STANDBY_ENABLED*: string {.`static`.}
  LOW_POWER_STANDBY_ACTIVE_DURING_MAINTENANCE*: string {.`static`.}
  WATCHDOG_TIMEOUT_MILLIS*: string {.`static`.}
  MANAGED_PROVISIONING_DEFER_PROVISIONING_TO_ROLE_HOLDER*: string {.`static`.}
  REVIEW_PERMISSIONS_NOTIFICATION_STATE*: string {.`static`.}
  REPAIR_MODE_ACTIVE*: string {.`static`.}
  REDACT_OTP_NOTIFICATIONS_FROM_UNTRUSTED_LISTENERS*: string {.`static`.}

jclass android.provider.Wearable* of NameValueTable:
  HAS_PAY_TOKENS*: string {.`static`.}
  GMS_CHECKIN_TIMEOUT_MIN*: string {.`static`.}
  HOTWORD_DETECTION_ENABLED*: string {.`static`.}
  SMART_REPLIES_ENABLED*: string {.`static`.}
  DEFAULT_VIBRATION*: string {.`static`.}
  OBTAIN_PAIRED_DEVICE_LOCATION*: string {.`static`.}
  PHONE_PLAY_STORE_AVAILABILITY*: string {.`static`.}
  PHONE_PLAY_STORE_AVAILABILITY_UNKNOWN*: jint {.`static`.}
  PHONE_PLAY_STORE_AVAILABLE*: jint {.`static`.}
  PHONE_PLAY_STORE_UNAVAILABLE*: jint {.`static`.}
  BUG_REPORT*: string {.`static`.}
  BUG_REPORT_DISABLED*: jint {.`static`.}
  BUG_REPORT_ENABLED*: jint {.`static`.}
  SMART_ILLUMINATE_ENABLED*: string {.`static`.}
  CLOCKWORK_AUTO_TIME*: string {.`static`.}
  SYNC_TIME_FROM_PHONE*: jint {.`static`.}
  SYNC_TIME_FROM_NETWORK*: jint {.`static`.}
  AUTO_TIME_OFF*: jint {.`static`.}
  INVALID_AUTO_TIME_STATE*: jint {.`static`.}
  CLOCKWORK_AUTO_TIME_ZONE*: string {.`static`.}
  SYNC_TIME_ZONE_FROM_PHONE*: jint {.`static`.}
  SYNC_TIME_ZONE_FROM_NETWORK*: jint {.`static`.}
  AUTO_TIME_ZONE_OFF*: jint {.`static`.}
  INVALID_AUTO_TIME_ZONE_STATE*: jint {.`static`.}
  CLOCKWORK_24HR_TIME*: string {.`static`.}
  AUTO_WIFI*: string {.`static`.}
  AUTO_WIFI_DISABLED*: jint {.`static`.}
  AUTO_WIFI_ENABLED*: jint {.`static`.}
  WIFI_POWER_SAVE*: string {.`static`.}
  ALT_BYPASS_WIFI_REQUIREMENT_TIME_MILLIS*: string {.`static`.}
  SETUP_SKIPPED*: string {.`static`.}
  SETUP_SKIPPED_UNKNOWN*: jint {.`static`.}
  SETUP_SKIPPED_YES*: jint {.`static`.}
  SETUP_SKIPPED_NO*: jint {.`static`.}
  LAST_CALL_FORWARD_ACTION*: string {.`static`.}
  CALL_FORWARD_ACTION_ON*: jint {.`static`.}
  CALL_FORWARD_ACTION_OFF*: jint {.`static`.}
  CALL_FORWARD_NO_LAST_ACTION*: jint {.`static`.}
  STEM_1_TYPE*: string {.`static`.}
  STEM_1_DATA*: string {.`static`.}
  STEM_1_DEFAULT_DATA*: string {.`static`.}
  STEM_2_TYPE*: string {.`static`.}
  STEM_2_DATA*: string {.`static`.}
  STEM_2_DEFAULT_DATA*: string {.`static`.}
  STEM_3_TYPE*: string {.`static`.}
  STEM_3_DATA*: string {.`static`.}
  STEM_3_DEFAULT_DATA*: string {.`static`.}
  STEM_TYPE_UNKNOWN*: jint {.`static`.}
  STEM_TYPE_APP_LAUNCH*: jint {.`static`.}
  STEM_TYPE_CONTACT_LAUNCH*: jint {.`static`.}
  MUTE_WHEN_OFF_BODY_ENABLED*: string {.`static`.}
  WEAR_OS_VERSION_STRING*: string {.`static`.}
  SIDE_BUTTON*: string {.`static`.}
  ANDROID_WEAR_VERSION*: string {.`static`.}
  SYSTEM_CAPABILITIES*: string {.`static`.}
  SYSTEM_EDITION*: string {.`static`.}
  WEAR_PLATFORM_MR_NUMBER*: string {.`static`.}
  MOBILE_SIGNAL_DETECTOR*: string {.`static`.}
  AMBIENT_ENABLED*: string {.`static`.}
  AMBIENT_TILT_TO_WAKE*: string {.`static`.}
  AMBIENT_LOW_BIT_ENABLED_DEV*: string {.`static`.}
  AMBIENT_TOUCH_TO_WAKE*: string {.`static`.}
  AMBIENT_TILT_TO_BRIGHT*: string {.`static`.}
  GESTURE_TOUCH_AND_HOLD_WATCH_FACE_ENABLED*: string {.`static`.}
  SCREENSHOT_ENABLED*: string {.`static`.}
  BEDTIME_MODE*: string {.`static`.}
  BEDTIME_HARD_MODE*: string {.`static`.}
  DECOMPOSABLE_WATCHFACE*: string {.`static`.}
  AMBIENT_FORCE_WHEN_DOCKED*: string {.`static`.}
  AMBIENT_LOW_BIT_ENABLED*: string {.`static`.}
  AMBIENT_PLUGGED_TIMEOUT_MIN*: string {.`static`.}
  PAIRED_DEVICE_OS_TYPE*: string {.`static`.}
  PAIRED_DEVICE_OS_TYPE_UNKNOWN*: jint {.`static`.}
  PAIRED_DEVICE_OS_TYPE_ANDROID*: jint {.`static`.}
  PAIRED_DEVICE_OS_TYPE_IOS*: jint {.`static`.}
  PAIRED_DEVICE_OS_TYPE_NONE*: jint {.`static`.}
  COMPANION_BLE_ROLE*: string {.`static`.}
  BLUETOOTH_ROLE_CENTRAL*: jint {.`static`.}
  BLUETOOTH_ROLE_PERIPHERAL*: jint {.`static`.}
  COMPANION_NAME*: string {.`static`.}
  USER_HFP_CLIENT_SETTING*: string {.`static`.}
  HFP_CLIENT_UNSET*: jint {.`static`.}
  HFP_CLIENT_ENABLED*: jint {.`static`.}
  HFP_CLIENT_DISABLED*: jint {.`static`.}
  COMPANION_OS_VERSION*: string {.`static`.}
  COMPANION_OS_VERSION_UNDEFINED*: jint {.`static`.}
  COMPANION_APP_NAME*: string {.`static`.}
  ENABLE_ALL_LANGUAGES*: string {.`static`.}
  SETUP_LOCALE*: string {.`static`.}
  OEM_SETUP_VERSION*: string {.`static`.}
  OEM_SETUP_COMPLETED_STATUS*: string {.`static`.}
  OEM_SETUP_COMPLETED_FAILURE*: jint {.`static`.}
  OEM_SETUP_COMPLETED_SUCCESS*: jint {.`static`.}
  MASTER_GESTURES_ENABLED*: string {.`static`.}
  UNGAZE_ENABLED*: string {.`static`.}
  BATTERY_SAVER_MODE*: string {.`static`.}
  BATTERY_SAVER_MODE_NONE*: jint {.`static`.}
  BATTERY_SAVER_MODE_LIGHT*: jint {.`static`.}
  BATTERY_SAVER_MODE_TRADITIONAL_WATCH*: jint {.`static`.}
  BATTERY_SAVER_MODE_TIME_ONLY*: jint {.`static`.}
  BATTERY_SAVER_MODE_CUSTOM*: jint {.`static`.}
  CONNECTIVITY_KEEP_DATA_ON*: string {.`static`.}
  WEAR_ACTIVITY_AUTO_RESUME_TIMEOUT_MS*: string {.`static`.}
  WEAR_ACTIVITY_AUTO_RESUME_TIMEOUT_SET_BY_USER*: string {.`static`.}
  BURN_IN_PROTECTION_ENABLED*: string {.`static`.}
  COMBINED_LOCATION_ENABLE*: string {.`static`.}
  WRIST_ORIENTATION_MODE*: string {.`static`.}
  LOCK_SCREEN_STATE*: string {.`static`.}
  LOCK_SCREEN_STATE_NONE*: jint {.`static`.}
  LOCK_SCREEN_STATE_PIN*: jint {.`static`.}
  LOCK_SCREEN_STATE_PATTERN*: jint {.`static`.}
  CLOCKWORK_SYSUI_PACKAGE*: string {.`static`.}
  CLOCKWORK_SYSUI_MAIN_ACTIVITY*: string {.`static`.}
  CLOCKWORK_LONG_PRESS_TO_ASSISTANT_ENABLED*: string {.`static`.}
  COOLDOWN_MODE_ON*: string {.`static`.}
  WET_MODE_ON*: string {.`static`.}
  RSB_WAKE_ENABLED*: string {.`static`.}
  SCREEN_UNLOCK_SOUND_ENABLED*: string {.`static`.}
  CHARGING_SOUNDS_ENABLED*: string {.`static`.}
  DYNAMIC_COLOR_THEME_ENABLED*: string {.`static`.}
  ACCESSIBILITY_VIBRATION_WATCH_ENABLED*: string {.`static`.}
  ACCESSIBILITY_VIBRATION_WATCH_TYPE*: string {.`static`.}
  ACCESSIBILITY_VIBRATION_WATCH_TYPE_DIGIT*: jint {.`static`.}
  ACCESSIBILITY_VIBRATION_WATCH_TYPE_TERSE*: jint {.`static`.}
  ACCESSIBILITY_VIBRATION_WATCH_SPEED*: string {.`static`.}
  ACCESSIBILITY_VIBRATION_WATCH_SPEED_VERY_SLOW*: jint {.`static`.}
  ACCESSIBILITY_VIBRATION_WATCH_SPEED_SLOW*: jint {.`static`.}
  ACCESSIBILITY_VIBRATION_WATCH_SPEED_MEDIUM*: jint {.`static`.}
  ACCESSIBILITY_VIBRATION_WATCH_SPEED_FAST*: jint {.`static`.}
  ACCESSIBILITY_VIBRATION_WATCH_SPEED_VERY_FAST*: jint {.`static`.}
  UPGRADE_DATA_MIGRATION_STATUS*: string {.`static`.}
  UPGRADE_DATA_MIGRATION_NOT_NEEDED*: jint {.`static`.}
  UPGRADE_DATA_MIGRATION_PENDING*: jint {.`static`.}
  UPGRADE_DATA_MIGRATION_DONE*: jint {.`static`.}
  DISABLE_AOD_WHILE_PLUGGED*: string {.`static`.}
  NETWORK_LOCATION_OPT_IN*: string {.`static`.}
  VIBRATE_FOR_ACTIVE_UNLOCK*: string {.`static`.}
  CUSTOM_COLOR_FOREGROUND*: string {.`static`.}
  CUSTOM_COLOR_BACKGROUND*: string {.`static`.}
  PHONE_SWITCHING_STATUS*: string {.`static`.}
  PHONE_SWITCHING_STATUS_NOT_STARTED*: jint {.`static`.}
  PHONE_SWITCHING_STATUS_STARTED*: jint {.`static`.}
  PHONE_SWITCHING_STATUS_SUCCESS*: jint {.`static`.}
  PHONE_SWITCHING_STATUS_CANCELLED*: jint {.`static`.}
  PHONE_SWITCHING_STATUS_FAILED*: jint {.`static`.}
  PHONE_SWITCHING_STATUS_IN_PROGRESS_ADVERTISING*: jint {.`static`.}
  PHONE_SWITCHING_STATUS_IN_PROGRESS_BONDED*: jint {.`static`.}
  PHONE_SWITCHING_STATUS_IN_PROGRESS_PHONE_COMPLETE*: jint {.`static`.}
  PHONE_SWITCHING_STATUS_IN_PROGRESS_MIGRATION*: jint {.`static`.}
  PHONE_SWITCHING_STATUS_IN_PROGRESS_MIGRATION_FAILED*: jint {.`static`.}
  PHONE_SWITCHING_STATUS_IN_PROGRESS_MIGRATION_CANCELLED*: jint {.`static`.}
  PHONE_SWITCHING_STATUS_IN_PROGRESS_MIGRATION_SUCCESS*: jint {.`static`.}
  PHONE_SWITCHING_STATUS_ACCOUNTS_MATCHED*: jint {.`static`.}
  PHONE_SWITCHING_REQUEST_SOURCE*: string {.`static`.}
  PHONE_SWITCHING_REQUEST_SOURCE_NONE*: jint {.`static`.}
  PHONE_SWITCHING_REQUEST_SOURCE_WATCH*: jint {.`static`.}
  PHONE_SWITCHING_REQUEST_SOURCE_COMPANION_USER_CONFIRMATION*: jint {.`static`.}
  PHONE_SWITCHING_REQUEST_SOURCE_COMPANION*: jint {.`static`.}
  REDUCE_MOTION*: string {.`static`.}
  RTL_SWIPE_TO_DISMISS_ENABLED_DEV*: string {.`static`.}
  TETHER_CONFIG_STATE*: string {.`static`.}
  TETHERED_CONFIG_UNKNOWN*: jint {.`static`.}
  TETHERED_CONFIG_STANDALONE*: jint {.`static`.}
  TETHERED_CONFIG_TETHERED*: jint {.`static`.}
  TETHERED_CONFIG_RESTRICTED*: jint {.`static`.}
  WEAR_MEDIA_CONTROLS_PACKAGE*: string {.`static`.}
  WEAR_MEDIA_SESSIONS_PACKAGE*: string {.`static`.}
  WEAR_LAUNCHER_UI_MODE*: string {.`static`.}
  GESTURE_PRIMARY_ACTION_USER_PREFERENCE*: string {.`static`.}
  GESTURE_DISMISS_ACTION_USER_PREFERENCE*: string {.`static`.}
  WEAR_POWER_ANOMALY_SERVICE_ENABLED*: string {.`static`.}
  WRIST_DETECTION_AUTO_LOCKING_ENABLED*: string {.`static`.}
  CONSISTENT_NOTIFICATION_BLOCKING_ENABLED*: string {.`static`.}
  AUTO_BEDTIME_MODE*: string {.`static`.}
  STATUS_TRAY_CONFIGURATION_DEFAULT*: jint {.`static`.}
  STATUS_TRAY_CONFIGURATION_SYSTEM_HIDDEN*: jint {.`static`.}
  WEAR_SYSTEM_STATUS_TRAY_CONFIGURATION*: string {.`static`.}

jclass android.provider.Config* of NameValueTable:
  proc getString*(name: string): string {.`static`.}
  proc getStrings*(namespace: string, names: List[string]): Map[string, string] {.`static`.}
  proc getAllStrings*(): Map[string, string] {.`static`.}
  proc getStrings*(resolver: ContentResolver, namespace: string, names: List[string]): Map[string, string] {.`static`.}
  proc putString*(namespace: string, name: string, value: string, makeDefault: jboolean): jboolean {.`static`.}
  proc setStrings*(namespace: string, keyValues: Map[string, string]): jboolean {.`static`.}
  proc setStrings*(resolver: ContentResolver, namespace: string, keyValues: Map[string, string]): jboolean {.`static`.}
  proc deleteString*(namespace: string, name: string): jboolean {.`static`.}
  proc resetToDefaults*(resetMode: jint, namespace: string) {.`static`.}
  proc setSyncDisabledMode*(disableSyncMode: jint) {.`static`.}
  proc getSyncDisabledMode*(): jint {.`static`.}
  proc setMonitorCallback*(resolver: ContentResolver, executor: Executor, callback: DeviceConfig.MonitorCallback) {.`static`.}
  proc clearMonitorCallback*(resolver: ContentResolver) {.`static`.}
  proc registerContentObserver*(namespace: string, notifyForDescendants: jboolean, observer: ContentObserver) {.`static`.}
  proc unregisterContentObserver*(observer: ContentObserver) {.`static`.}
  proc checkCallingOrSelfPermission*(permission: string): jint {.`static`.}
  proc clearProviderForTest*() {.`static`.}
  SYNC_DISABLED_MODE_NONE*: jint {.`static`.}
  SYNC_DISABLED_MODE_PERSISTENT*: jint {.`static`.}
  SYNC_DISABLED_MODE_UNTIL_REBOOT*: jint {.`static`.}
  CONTENT_URI*: Uri {.`static`.}

jclass android.provider.Bookmarks* of JVMObject:
  proc getIntentForShortcut*(cr: ContentResolver, shortcut: jchar): Intent {.`static`.}
  proc add*(cr: ContentResolver, intent: Intent, title: string, folder: string, shortcut: jchar, ordering: jint): Uri {.`static`.}
  proc getLabelForFolder*(r: Resources, folder: string): CharSequence {.`static`.}
  proc getTitle*(context: Context, cursor: Cursor): CharSequence {.`static`.}
  CONTENT_URI*: Uri {.`static`.}
  ID*: string {.`static`.}
  TITLE*: string {.`static`.}
  FOLDER*: string {.`static`.}
  INTENT*: string {.`static`.}
  SHORTCUT*: string {.`static`.}
  ORDERING*: string {.`static`.}

jclass android.provider.Panel* of JVMObject:
  ACTION_INTERNET_CONNECTIVITY*: string {.`static`.}
  ACTION_NFC*: string {.`static`.}
  ACTION_WIFI*: string {.`static`.}
  ACTION_VOLUME*: string {.`static`.}

