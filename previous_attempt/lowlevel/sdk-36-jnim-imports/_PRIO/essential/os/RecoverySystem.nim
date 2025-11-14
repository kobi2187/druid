import jnim

jclass android.os.RecoverySystem* of JVMObject:
  proc verifyPackage*(packageFile: File, listener: ProgressListener, deviceCertsZipFile: File) {.`static`.}
  proc verifyPackageCompatibility*(compatibilityFile: File): jboolean {.`static`.}
  proc processPackage*(context: Context, packageFile: File, listener: ProgressListener, handler: Handler) {.`static`.}
  proc processPackage*(context: Context, packageFile: File, listener: ProgressListener) {.`static`.}
  proc installPackage*(context: Context, packageFile: File) {.`static`.}
  proc installPackage*(context: Context, packageFile: File, processed: jboolean) {.`static`.}
  proc prepareForUnattendedUpdate*(context: Context, updateToken: string, intentSender: IntentSender) {.`static`.}
  proc clearPrepareForUnattendedUpdate*(context: Context) {.`static`.}
  proc rebootAndApply*(context: Context, updateToken: string, reason: string) {.`static`.}
  proc isPreparedForUnattendedUpdate*(context: Context): jboolean {.`static`.}
  proc rebootAndApply*(context: Context, reason: string, slotSwitch: jboolean): jint {.`static`.}
  proc scheduleUpdateOnBoot*(context: Context, packageFile: File) {.`static`.}
  proc cancelScheduledUpdate*(context: Context) {.`static`.}
  proc rebootWipeUserData*(context: Context) {.`static`.}
  proc rebootWipeUserData*(context: Context, reason: string) {.`static`.}
  proc rebootWipeUserData*(context: Context, shutdown: jboolean) {.`static`.}
  proc rebootWipeUserData*(context: Context, shutdown: jboolean, reason: string, force: jboolean) {.`static`.}
  proc rebootWipeUserData*(context: Context, shutdown: jboolean, reason: string, force: jboolean, wipeEuicc: jboolean) {.`static`.}
  proc rebootWipeUserData*(context: Context, shutdown: jboolean, reason: string, force: jboolean, wipeEuicc: jboolean, keepMemtagMode: jboolean) {.`static`.}
  proc wipeEuiccData*(context: Context, packageName: string): jboolean {.`static`.}
  proc rebootPromptAndWipeUserData*(context: Context, reason: string) {.`static`.}
  proc rebootWipeCache*(context: Context) {.`static`.}
  proc rebootWipeCache*(context: Context, reason: string) {.`static`.}
  proc rebootWipeAb*(context: Context, packageFile: File, reason: string) {.`static`.}
  proc wipePartitionToExt4*()
  proc handleAftermath*(context: Context): string {.`static`.}
  BLOCK_MAP_FILE*: File {.`static`.}
  UNCRYPT_PACKAGE_FILE*: File {.`static`.}
  UNCRYPT_STATUS_FILE*: File {.`static`.}
  RESUME_ON_REBOOT_REBOOT_ERROR_NONE*: jint {.`static`.}
  RESUME_ON_REBOOT_REBOOT_ERROR_UNSPECIFIED*: jint {.`static`.}
  RESUME_ON_REBOOT_REBOOT_ERROR_INVALID_PACKAGE_NAME*: jint {.`static`.}
  RESUME_ON_REBOOT_REBOOT_ERROR_LSKF_NOT_CAPTURED*: jint {.`static`.}
  RESUME_ON_REBOOT_REBOOT_ERROR_SLOT_MISMATCH*: jint {.`static`.}
  RESUME_ON_REBOOT_REBOOT_ERROR_PROVIDER_PREPARATION_FAILURE*: jint {.`static`.}

jclass android.os.RecoverySystem.ProgressListener* of JVMObject:
  proc onProgress*(progress: jint)

jclass android.os.ProgressListener* of JVMObject:
  proc onProgress*(progress: jint)

