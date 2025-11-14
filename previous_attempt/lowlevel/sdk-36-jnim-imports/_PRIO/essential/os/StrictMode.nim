import jnim

jclass android.os.StrictMode* of JVMObject:
  proc setViolationLogger*(listener: ViolationLogger) {.`static`.}
  proc setThreadPolicy*(policy: ThreadPolicy) {.`static`.}
  proc setThreadPolicyMask*(threadPolicyMask: jint) {.`static`.}
  proc setThreadPolicyMask$ravenwood*(threadPolicyMask: jint) {.`static`.}
  proc getThreadPolicyMask*(): jint {.`static`.}
  proc getThreadPolicyMask$ravenwood*(): jint {.`static`.}
  proc getThreadPolicy*(): ThreadPolicy {.`static`.}
  proc allowThreadDiskWrites*(): ThreadPolicy {.`static`.}
  proc allowThreadDiskWritesMask*(): jint {.`static`.}
  proc allowThreadDiskReads*(): ThreadPolicy {.`static`.}
  proc allowThreadDiskReadsMask*(): jint {.`static`.}
  proc allowThreadViolations*(): ThreadPolicy {.`static`.}
  proc allowVmViolations*(): VmPolicy {.`static`.}
  proc isBundledSystemApp*(ai: ApplicationInfo): jboolean {.`static`.}
  proc initThreadDefaults*(ai: ApplicationInfo) {.`static`.}
  proc initVmDefaults*(ai: ApplicationInfo) {.`static`.}
  proc enableDeathOnFileUriExposure*() {.`static`.}
  proc disableDeathOnFileUriExposure*() {.`static`.}
  proc conditionallyCheckInstanceCounts*() {.`static`.}
  proc setVmPolicy*(policy: VmPolicy) {.`static`.}
  proc getVmPolicy*(): VmPolicy {.`static`.}
  proc enableDefaults*() {.`static`.}
  proc vmSqliteObjectLeaksEnabled*(): jboolean {.`static`.}
  proc vmClosableObjectLeaksEnabled*(): jboolean {.`static`.}
  proc vmRegistrationLeaksEnabled*(): jboolean {.`static`.}
  proc vmFileUriExposureEnabled*(): jboolean {.`static`.}
  proc vmCleartextNetworkEnabled*(): jboolean {.`static`.}
  proc vmContentUriWithoutPermissionEnabled*(): jboolean {.`static`.}
  proc vmUntaggedSocketEnabled*(): jboolean {.`static`.}
  proc vmImplicitDirectBootEnabled*(): jboolean {.`static`.}
  proc vmCredentialProtectedWhileLockedEnabled*(): jboolean {.`static`.}
  proc vmIncorrectContextUseEnabled*(): jboolean {.`static`.}
  proc vmUnsafeIntentLaunchEnabled*(): jboolean {.`static`.}
  proc vmBackgroundActivityLaunchEnabled*(): jboolean {.`static`.}
  proc onSqliteObjectLeaked*(message: string, originStack: Throwable) {.`static`.}
  proc onWebViewMethodCalledOnWrongThread*(originStack: Throwable) {.`static`.}
  proc onIntentReceiverLeaked*(originStack: Throwable) {.`static`.}
  proc onServiceConnectionLeaked*(originStack: Throwable) {.`static`.}
  proc onFileUriExposed*(uri: Uri, location: string) {.`static`.}
  proc onContentUriWithoutPermission*(uri: Uri, location: string) {.`static`.}
  proc onCleartextNetworkDetected*(firstPacket: seq[jbyte]) {.`static`.}
  proc onUntaggedSocket*() {.`static`.}
  proc onImplicitDirectBoot*() {.`static`.}
  proc onIncorrectContextUsed*(message: string, originStack: Throwable) {.`static`.}
  proc assertConfigurationContext*(context: Context, methodName: string) {.`static`.}
  proc assertUiContext*(context: Context, methodName: string) {.`static`.}
  proc onUnsafeIntentLaunch*(intent: Intent) {.`static`.}
  proc onBackgroundActivityLaunchAborted*(message: string) {.`static`.}
  proc onVmPolicyViolation*(originStack: Violation) {.`static`.}
  proc onVmPolicyViolation*(violation: Violation, forceDeath: jboolean) {.`static`.}
  proc enterCriticalSpan*(name: string): Span {.`static`.}
  proc noteSlowCall*(name: string) {.`static`.}
  proc noteUntaggedSocket*() {.`static`.}
  proc noteResourceMismatch*(tag: JObject) {.`static`.}
  proc noteUnbufferedIO*() {.`static`.}
  proc noteDiskRead*() {.`static`.}
  proc noteDiskWrite*() {.`static`.}
  proc trackActivity*(instance: JObject): JObject {.`static`.}
  proc incrementExpectedActivityCount*(klass: Class) {.`static`.}
  proc decrementExpectedActivityCount*(klass: Class) {.`static`.}
  DISABLE_PROPERTY*: string {.`static`.}
  VISUAL_PROPERTY*: string {.`static`.}
  PENALTY_GATHER*: jint {.`static`.}
  PENALTY_LOG*: jint {.`static`.}
  PENALTY_DIALOG*: jint {.`static`.}
  PENALTY_DEATH*: jint {.`static`.}
  PENALTY_FLASH*: jint {.`static`.}
  PENALTY_DROPBOX*: jint {.`static`.}
  PENALTY_DEATH_ON_NETWORK*: jint {.`static`.}
  PENALTY_DEATH_ON_CLEARTEXT_NETWORK*: jint {.`static`.}
  PENALTY_DEATH_ON_FILE_URI_EXPOSURE*: jint {.`static`.}
  PENALTY_ALL*: jint {.`static`.}
  NETWORK_POLICY_ACCEPT*: jint {.`static`.}
  NETWORK_POLICY_LOG*: jint {.`static`.}
  NETWORK_POLICY_REJECT*: jint {.`static`.}

jclass android.os.StrictMode.ThreadPolicy* of JVMObject:
  proc toString*(): string

jclass android.os.StrictMode.VmPolicy* of JVMObject:
  proc toString*(): string

jclass android.os.StrictMode.Span* of JVMObject:
  proc finish*()

jclass android.os.StrictMode.ViolationInfo* of JVMObject:
  proc getStackTrace*(): string
  proc getViolationClass*(): Class[? extends Violation]
  proc getViolationDetails*(): string
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc dump*(pw: Printer, prefix: string)
  proc describeContents*(): jint



jclass android.os.ThreadPolicy* of JVMObject:
  proc toString*(): string
  LAX*: ThreadPolicy {.`static`.}

jclass android.os.ThreadPolicy.Builder* of JVMObject:
  proc detectAll*(): Builder
  proc permitAll*(): Builder
  proc detectNetwork*(): Builder
  proc permitNetwork*(): Builder
  proc detectDiskReads*(): Builder
  proc permitDiskReads*(): Builder
  proc detectCustomSlowCalls*(): Builder
  proc permitCustomSlowCalls*(): Builder
  proc permitResourceMismatches*(): Builder
  proc detectUnbufferedIo*(): Builder
  proc permitUnbufferedIo*(): Builder
  proc detectResourceMismatches*(): Builder
  proc detectDiskWrites*(): Builder
  proc permitDiskWrites*(): Builder
  proc detectExplicitGc*(): Builder
  proc permitExplicitGc*(): Builder
  proc penaltyDialog*(): Builder
  proc penaltyDeath*(): Builder
  proc penaltyDeathOnNetwork*(): Builder
  proc penaltyFlashScreen*(): Builder
  proc penaltyLog*(): Builder
  proc penaltyDropBox*(): Builder
  proc penaltyListener*(executor: Executor, listener: OnThreadViolationListener): Builder
  proc penaltyListener*(listener: OnThreadViolationListener, executor: Executor): Builder
  proc build*(): ThreadPolicy

jclass android.os.Builder* of JVMObject:
  proc detectAll*(): Builder
  proc permitAll*(): Builder
  proc detectNetwork*(): Builder
  proc permitNetwork*(): Builder
  proc detectDiskReads*(): Builder
  proc permitDiskReads*(): Builder
  proc detectCustomSlowCalls*(): Builder
  proc permitCustomSlowCalls*(): Builder
  proc permitResourceMismatches*(): Builder
  proc detectUnbufferedIo*(): Builder
  proc permitUnbufferedIo*(): Builder
  proc detectResourceMismatches*(): Builder
  proc detectDiskWrites*(): Builder
  proc permitDiskWrites*(): Builder
  proc detectExplicitGc*(): Builder
  proc permitExplicitGc*(): Builder
  proc penaltyDialog*(): Builder
  proc penaltyDeath*(): Builder
  proc penaltyDeathOnNetwork*(): Builder
  proc penaltyFlashScreen*(): Builder
  proc penaltyLog*(): Builder
  proc penaltyDropBox*(): Builder
  proc penaltyListener*(executor: Executor, listener: OnThreadViolationListener): Builder
  proc penaltyListener*(listener: OnThreadViolationListener, executor: Executor): Builder
  proc build*(): ThreadPolicy

jclass android.os.VmPolicy* of JVMObject:
  proc toString*(): string
  LAX*: VmPolicy {.`static`.}

jclass android.os.VmPolicy.Builder* of JVMObject:
  proc setClassInstanceLimit*(klass: Class, instanceLimit: jint): Builder
  proc detectActivityLeaks*(): Builder
  proc permitActivityLeaks*(): Builder
  proc detectNonSdkApiUsage*(): Builder
  proc permitNonSdkApiUsage*(): Builder
  proc detectAll*(): Builder
  proc detectLeakedSqlLiteObjects*(): Builder
  proc detectLeakedClosableObjects*(): Builder
  proc detectLeakedRegistrationObjects*(): Builder
  proc detectFileUriExposure*(): Builder
  proc detectCleartextNetwork*(): Builder
  proc detectContentUriWithoutPermission*(): Builder
  proc detectUntaggedSockets*(): Builder
  proc permitUntaggedSockets*(): Builder
  proc detectImplicitDirectBoot*(): Builder
  proc permitImplicitDirectBoot*(): Builder
  proc detectCredentialProtectedWhileLocked*(): Builder
  proc permitCredentialProtectedWhileLocked*(): Builder
  proc detectIncorrectContextUse*(): Builder
  proc permitIncorrectContextUse*(): Builder
  proc detectUnsafeIntentLaunch*(): Builder
  proc permitUnsafeIntentLaunch*(): Builder
  proc detectBlockedBackgroundActivityLaunch*(): Builder
  proc ignoreBlockedBackgroundActivityLaunch*(): Builder
  proc penaltyDeath*(): Builder
  proc penaltyDeathOnCleartextNetwork*(): Builder
  proc penaltyDeathOnFileUriExposure*(): Builder
  proc penaltyLog*(): Builder
  proc penaltyDropBox*(): Builder
  proc penaltyListener*(executor: Executor, listener: OnVmViolationListener): Builder
  proc penaltyListener*(listener: OnVmViolationListener, executor: Executor): Builder
  proc build*(): VmPolicy

jclass android.os.Builder* of JVMObject:
  proc setClassInstanceLimit*(klass: Class, instanceLimit: jint): Builder
  proc detectActivityLeaks*(): Builder
  proc permitActivityLeaks*(): Builder
  proc detectNonSdkApiUsage*(): Builder
  proc permitNonSdkApiUsage*(): Builder
  proc detectAll*(): Builder
  proc detectLeakedSqlLiteObjects*(): Builder
  proc detectLeakedClosableObjects*(): Builder
  proc detectLeakedRegistrationObjects*(): Builder
  proc detectFileUriExposure*(): Builder
  proc detectCleartextNetwork*(): Builder
  proc detectContentUriWithoutPermission*(): Builder
  proc detectUntaggedSockets*(): Builder
  proc permitUntaggedSockets*(): Builder
  proc detectImplicitDirectBoot*(): Builder
  proc permitImplicitDirectBoot*(): Builder
  proc detectCredentialProtectedWhileLocked*(): Builder
  proc permitCredentialProtectedWhileLocked*(): Builder
  proc detectIncorrectContextUse*(): Builder
  proc permitIncorrectContextUse*(): Builder
  proc detectUnsafeIntentLaunch*(): Builder
  proc permitUnsafeIntentLaunch*(): Builder
  proc detectBlockedBackgroundActivityLaunch*(): Builder
  proc ignoreBlockedBackgroundActivityLaunch*(): Builder
  proc penaltyDeath*(): Builder
  proc penaltyDeathOnCleartextNetwork*(): Builder
  proc penaltyDeathOnFileUriExposure*(): Builder
  proc penaltyLog*(): Builder
  proc penaltyDropBox*(): Builder
  proc penaltyListener*(executor: Executor, listener: OnVmViolationListener): Builder
  proc penaltyListener*(listener: OnVmViolationListener, executor: Executor): Builder
  proc build*(): VmPolicy

jclass android.os.Span* of JVMObject:
  proc finish*()

jclass android.os.ViolationInfo* of JVMObject:
  proc getStackTrace*(): string
  proc getViolationClass*(): Class[? extends Violation]
  proc getViolationDetails*(): string
  proc hashCode*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc dump*(pw: Printer, prefix: string)
  proc describeContents*(): jint
  durationMillis*: jint
  numAnimationsRunning*: jint
  tags*: string
  violationNumThisLoop*: jint
  violationUptimeMillis*: jlong
  broadcastIntentAction*: string
  numInstances*: jlong
  CREATOR*: Parcelable.Creator[ViolationInfo] {.`static`.}

