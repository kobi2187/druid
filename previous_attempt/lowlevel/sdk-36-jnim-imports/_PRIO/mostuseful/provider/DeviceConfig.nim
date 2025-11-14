import jnim

jclass android.provider.DeviceConfig* of JVMObject:
  proc getProperty*(namespace: string, name: string): string {.`static`.}
  proc getProperties*(namespace: string, names: string): Properties {.`static`.}
  proc getAllProperties*(): Set[Properties] {.`static`.}
  proc getString*(namespace: string, name: string, defaultValue: string): string {.`static`.}
  proc getBoolean*(namespace: string, name: string, defaultValue: jboolean): jboolean {.`static`.}
  proc getInt*(namespace: string, name: string, defaultValue: jint): jint {.`static`.}
  proc getLong*(namespace: string, name: string, defaultValue: jlong): jlong {.`static`.}
  proc getFloat*(namespace: string, name: string, defaultValue: jfloat): jfloat {.`static`.}
  proc setLocalOverride*(namespace: string, name: string, value: string): jboolean {.`static`.}
  proc clearAllLocalOverrides*() {.`static`.}
  proc clearLocalOverride*(namespace: string, name: string) {.`static`.}
  proc getUnderlyingValuesForOverriddenFlags*(): Map[string, Map<String, String>] {.`static`.}
  proc setProperty*(namespace: string, name: string, value: string, makeDefault: jboolean): jboolean {.`static`.}
  proc setProperties*(properties: Properties): jboolean {.`static`.}
  proc deleteProperty*(namespace: string, name: string): jboolean {.`static`.}
  proc resetToDefaults*(resetMode: jint, namespace: string) {.`static`.}
  proc setSyncDisabledMode*(syncDisabledMode: jint) {.`static`.}
  proc getSyncDisabledMode*(): jint {.`static`.}
  proc addOnPropertiesChangedListener*(namespace: string, executor: Executor, onPropertiesChangedListener: OnPropertiesChangedListener) {.`static`.}
  proc dump*(printWriter: PrintWriter, dumpPrefix: string, args: seq[string]) {.`static`.}
  proc removeOnPropertiesChangedListener*(onPropertiesChangedListener: OnPropertiesChangedListener) {.`static`.}
  proc setMonitorCallback*(resolver: ContentResolver, executor: Executor, callback: MonitorCallback) {.`static`.}
  proc clearMonitorCallback*(resolver: ContentResolver) {.`static`.}
  proc getPublicNamespaces*(): List[string] {.`static`.}
  proc getAdbWritableFlags*(): Set[string] {.`static`.}
  proc getAdbWritableNamespaces*(): Set[string] {.`static`.}
  SERVICE_NAME*: string {.`static`.}
  NAMESPACE_ACCESSIBILITY*: string {.`static`.}
  NAMESPACE_ACTIVITY_MANAGER*: string {.`static`.}
  NAMESPACE_ACTIVITY_MANAGER_COMPONENT_ALIAS*: string {.`static`.}
  NAMESPACE_AUTO_PIN_CONFIRMATION*: string {.`static`.}
  NAMESPACE_ACTIVITY_MANAGER_NATIVE_BOOT*: string {.`static`.}
  NAMESPACE_ALARM_MANAGER*: string {.`static`.}
  NAMESPACE_APP_COMPAT*: string {.`static`.}
  NAMESPACE_APP_HIBERNATION*: string {.`static`.}
  NAMESPACE_APPSEARCH*: string {.`static`.}
  NAMESPACE_APP_STANDBY*: string {.`static`.}
  NAMESPACE_APP_CLONING*: string {.`static`.}
  NAMESPACE_ATTENTION_MANAGER_SERVICE*: string {.`static`.}
  NAMESPACE_AUTOFILL*: string {.`static`.}
  NAMESPACE_BATTERY_SAVER*: string {.`static`.}
  NAMESPACE_BATTERY_STATS*: string {.`static`.}
  NAMESPACE_BLOBSTORE*: string {.`static`.}
  NAMESPACE_BLUETOOTH*: string {.`static`.}
  NAMESPACE_CORE_EXPERIMENTS_TEAM_INTERNAL*: string {.`static`.}
  NAMESPACE_CAMERA_NATIVE*: string {.`static`.}
  NAMESPACE_CELLULAR_SECURITY*: string {.`static`.}
  NAMESPACE_CLIPBOARD*: string {.`static`.}
  NAMESPACE_CONNECTIVITY*: string {.`static`.}
  NAMESPACE_CAPTIVEPORTALLOGIN*: string {.`static`.}
  NAMESPACE_EDGETPU_NATIVE*: string {.`static`.}
  NAMESPACE_HEALTH_FITNESS*: string {.`static`.}
  NAMESPACE_TETHERING*: string {.`static`.}
  NAMESPACE_NEARBY*: string {.`static`.}
  NAMESPACE_CONTENT_CAPTURE*: string {.`static`.}
  NAMESPACE_CREDENTIAL*: string {.`static`.}
  NAMESPACE_DEVICE_IDLE*: string {.`static`.}
  NAMESPACE_DEX_BOOT*: string {.`static`.}
  NAMESPACE_DISPLAY_MANAGER*: string {.`static`.}
  NAMESPACE_GAME_DRIVER*: string {.`static`.}
  NAMESPACE_HDMI_CONTROL*: string {.`static`.}
  NAMESPACE_INPUT_NATIVE_BOOT*: string {.`static`.}
  NAMESPACE_INTELLIGENCE_ATTENTION*: string {.`static`.}
  NAMESPACE_INTELLIGENCE_CONTENT_SUGGESTIONS*: string {.`static`.}
  NAMESPACE_JOB_SCHEDULER*: string {.`static`.}
  NAMESPACE_LMKD_NATIVE*: string {.`static`.}
  NAMESPACE_LOCATION*: string {.`static`.}
  NAMESPACE_MEDIA*: string {.`static`.}
  NAMESPACE_MEDIA_NATIVE*: string {.`static`.}
  NAMESPACE_MGLRU_NATIVE*: string {.`static`.}
  NAMESPACE_MM*: string {.`static`.}
  NAMESPACE_MMD_NATIVE*: string {.`static`.}
  NAMESPACE_NETD_NATIVE*: string {.`static`.}
  NAMESPACE_NNAPI_NATIVE*: string {.`static`.}
  NAMESPACE_ON_DEVICE_PERSONALIZATION*: string {.`static`.}
  NAMESPACE_PACKAGE_MANAGER_SERVICE*: string {.`static`.}
  NAMESPACE_PROFCOLLECT_NATIVE_BOOT*: string {.`static`.}
  NAMESPACE_REBOOT_READINESS*: string {.`static`.}
  NAMESPACE_REMOTE_KEY_PROVISIONING_NATIVE*: string {.`static`.}
  NAMESPACE_ROLLBACK*: string {.`static`.}
  NAMESPACE_ROLLBACK_BOOT*: string {.`static`.}
  NAMESPACE_ROTATION_RESOLVER*: string {.`static`.}
  NAMESPACE_RUNTIME*: string {.`static`.}
  NAMESPACE_RUNTIME_NATIVE*: string {.`static`.}
  NAMESPACE_RUNTIME_NATIVE_BOOT*: string {.`static`.}
  NAMESPACE_SCHEDULER*: string {.`static`.}
  NAMESPACE_SDK_SANDBOX*: string {.`static`.}
  NAMESPACE_SETTINGS_STATS*: string {.`static`.}
  NAMESPACE_STATSD_JAVA*: string {.`static`.}
  NAMESPACE_STATSD_JAVA_BOOT*: string {.`static`.}
  NAMESPACE_STATSD_NATIVE*: string {.`static`.}
  NAMESPACE_STATSD_NATIVE_BOOT*: string {.`static`.}
  NAMESPACE_STORAGE*: string {.`static`.}
  NAMESPACE_STORAGE_NATIVE_BOOT*: string {.`static`.}
  NAMESPACE_ADSERVICES*: string {.`static`.}
  NAMESPACE_SURFACE_FLINGER_NATIVE_BOOT*: string {.`static`.}
  NAMESPACE_SWCODEC_NATIVE*: string {.`static`.}
  NAMESPACE_SYSTEMUI*: string {.`static`.}
  NAMESPACE_SYSTEM_TIME*: string {.`static`.}
  NAMESPACE_TARE*: string {.`static`.}
  NAMESPACE_TELEPHONY*: string {.`static`.}
  NAMESPACE_TEXTCLASSIFIER*: string {.`static`.}
  NAMESPACE_CONTACTS_PROVIDER*: string {.`static`.}
  NAMESPACE_SETTINGS_UI*: string {.`static`.}
  NAMESPACE_ANDROID*: string {.`static`.}
  NAMESPACE_WINDOW_MANAGER*: string {.`static`.}
  NAMESPACE_WINDOW_MANAGER_NATIVE_BOOT*: string {.`static`.}
  NAMESPACE_SELECTION_TOOLBAR*: string {.`static`.}
  NAMESPACE_VOICE_INTERACTION*: string {.`static`.}
  NAMESPACE_DEVICE_POLICY_MANAGER*: string {.`static`.}
  NAMESPACE_PRIVACY*: string {.`static`.}
  NAMESPACE_BIOMETRICS*: string {.`static`.}
  NAMESPACE_PERMISSIONS*: string {.`static`.}
  NAMESPACE_OTA*: string {.`static`.}
  NAMESPACE_WIDGET*: string {.`static`.}
  NAMESPACE_CONNECTIVITY_THERMAL_POWER_MANAGER*: string {.`static`.}
  NAMESPACE_CONFIGURATION*: string {.`static`.}
  NAMESPACE_LATENCY_TRACKER*: string {.`static`.}
  NAMESPACE_INTERACTION_JANK_MONITOR*: string {.`static`.}
  NAMESPACE_GAME_OVERLAY*: string {.`static`.}
  NAMESPACE_VIRTUALIZATION_FRAMEWORK_NATIVE*: string {.`static`.}
  NAMESPACE_CONSTRAIN_DISPLAY_APIS*: string {.`static`.}
  NAMESPACE_APP_COMPAT_OVERRIDES*: string {.`static`.}
  NAMESPACE_UWB*: string {.`static`.}
  NAMESPACE_AMBIENT_CONTEXT_MANAGER_SERVICE*: string {.`static`.}
  NAMESPACE_WEARABLE_SENSING*: string {.`static`.}
  NAMESPACE_VENDOR_SYSTEM_NATIVE*: string {.`static`.}
  NAMESPACE_VENDOR_SYSTEM_NATIVE_BOOT*: string {.`static`.}
  NAMESPACE_MEMORY_SAFETY_NATIVE_BOOT*: string {.`static`.}
  NAMESPACE_MEMORY_SAFETY_NATIVE*: string {.`static`.}
  NAMESPACE_WEAR*: string {.`static`.}
  NAMESPACE_INPUT_METHOD_MANAGER*: string {.`static`.}
  NAMESPACE_BACKUP_AND_RESTORE*: string {.`static`.}
  NAMESPACE_ARC_APP_COMPAT*: string {.`static`.}
  NAMESPACE_REMOTE_AUTH*: string {.`static`.}
  NAMESPACE_TETHERING_NATIVE*: string {.`static`.}
  NAMESPACE_NFC*: string {.`static`.}
  SYNC_DISABLED_MODE_NONE*: jint {.`static`.}
  SYNC_DISABLED_MODE_PERSISTENT*: jint {.`static`.}
  SYNC_DISABLED_MODE_UNTIL_REBOOT*: jint {.`static`.}
  DUMP_ARG_NAMESPACE*: string {.`static`.}

jclass android.provider.DeviceConfig.Properties* of JVMObject:
  proc getNamespace*(): string
  proc getKeyset*(): Set[string]
  proc getString*(name: string, defaultValue: string): string
  proc getBoolean*(name: string, defaultValue: jboolean): jboolean
  proc getInt*(name: string, defaultValue: jint): jint
  proc getLong*(name: string, defaultValue: jlong): jlong
  proc getFloat*(name: string, defaultValue: jfloat): jfloat
  proc getPropertyValues*(): Map[string, string]



jclass android.provider.BadConfigException* of Exception:

jclass android.provider.Properties* of JVMObject:
  proc getNamespace*(): string
  proc getKeyset*(): Set[string]
  proc getString*(name: string, defaultValue: string): string
  proc getBoolean*(name: string, defaultValue: jboolean): jboolean
  proc getInt*(name: string, defaultValue: jint): jint
  proc getLong*(name: string, defaultValue: jlong): jlong
  proc getFloat*(name: string, defaultValue: jfloat): jfloat
  proc getPropertyValues*(): Map[string, string]

jclass android.provider.Properties.Builder* of JVMObject:
  proc setString*(name: string, value: string): Builder
  proc setBoolean*(name: string, value: jboolean): Builder
  proc setInt*(name: string, value: jint): Builder
  proc setLong*(name: string, value: jlong): Builder
  proc setFloat*(name: string, value: jfloat): Builder
  proc build*(): Properties

jclass android.provider.Builder* of JVMObject:
  proc setString*(name: string, value: string): Builder
  proc setBoolean*(name: string, value: jboolean): Builder
  proc setInt*(name: string, value: jint): Builder
  proc setLong*(name: string, value: jlong): Builder
  proc setFloat*(name: string, value: jfloat): Builder
  proc build*(): Properties

