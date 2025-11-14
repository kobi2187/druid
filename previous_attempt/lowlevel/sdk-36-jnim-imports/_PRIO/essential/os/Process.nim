import jnim

jclass android.os.Process* of JVMObject:
  proc start*(processClass: string, niceName: string, uid: jint, gid: jint, gids: seq[jint], runtimeFlags: jint, mountExternal: jint, targetSdkVersion: jint, seInfo: string, abi: string, instructionSet: string, appDataDir: string, invokeWith: string, packageName: string, zygotePolicyFlags: jint, isTopApp: jboolean, disabledCompatChanges: seq[jlong], pkgDataInfoMap: Map[string, Pair<String, Long>], whitelistedDataInfoMap: Map[string, Pair<String, Long>], bindMountAppsData: jboolean, bindMountAppStorageDirs: jboolean, bindMountSystemOverrides: jboolean, zygoteArgs: seq[string]): ProcessStartResult {.`static`.}
  proc startWebView*(processClass: string, niceName: string, uid: jint, gid: jint, gids: seq[jint], runtimeFlags: jint, mountExternal: jint, targetSdkVersion: jint, seInfo: string, abi: string, instructionSet: string, appDataDir: string, invokeWith: string, packageName: string, disabledCompatChanges: seq[jlong], zygoteArgs: seq[string]): ProcessStartResult {.`static`.}
  proc getElapsedCpuTime*(): jlong {.`static`.}
  proc getStartElapsedRealtime*(): jlong {.`static`.}
  proc getStartUptimeMillis*(): jlong {.`static`.}
  proc getStartRequestedElapsedRealtime*(): jlong {.`static`.}
  proc getStartRequestedUptimeMillis*(): jlong {.`static`.}
  proc setStartTimes*(elapsedRealtime: jlong, uptimeMillis: jlong, startRequestedElapsedRealtime: jlong, startRequestedUptime: jlong) {.`static`.}
  proc is64Bit*(): jboolean {.`static`.}
  proc myPid*(): jint {.`static`.}
  proc myPpid*(): jint {.`static`.}
  proc myTid*(): jint {.`static`.}
  proc myUid*(): jint {.`static`.}
  proc myUserHandle*(): UserHandle {.`static`.}
  proc isCoreUid*(uid: jint): jboolean {.`static`.}
  proc isApplicationUid*(uid: jint): jboolean {.`static`.}
  proc isIsolated*(): jboolean {.`static`.}
  proc isIsolated*(uid: jint): jboolean {.`static`.}
  proc isIsolatedUid*(uid: jint): jboolean {.`static`.}
  proc isSdkSandboxUid*(uid: jint): jboolean {.`static`.}
  proc getAppUidForSdkSandboxUid*(uid: jint): jint {.`static`.}
  proc toSdkSandboxUid*(uid: jint): jint {.`static`.}
  proc getSdkSandboxUidForAppUid*(uid: jint): jint {.`static`.}
  proc isSdkSandbox*(): jboolean {.`static`.}
  proc getUidForName*(name: string): jint {.`static`.}
  proc getGidForName*(name: string): jint {.`static`.}
  proc getUidForPid*(pid: jint): jint {.`static`.}
  proc getParentPid*(pid: jint): jint {.`static`.}
  proc getThreadGroupLeader*(tid: jint): jint {.`static`.}
  proc setThreadPriority*(tid: jint, priority: jint) {.`static`.}
  proc setCanSelfBackground*(backgroundOk: jboolean) {.`static`.}
  proc setThreadGroup*(tid: jint, group: jint) {.`static`.}
  proc setThreadGroupAndCpuset*(tid: jint, group: jint) {.`static`.}
  proc setProcessGroup*(pid: jint, group: jint) {.`static`.}
  proc setProcessFrozen*(pid: jint, uid: jint, frozen: jboolean) {.`static`.}
  proc getProcessGroup*(pid: jint): jint {.`static`.}
  proc createProcessGroup*(uid: jint, pid: jint): jint {.`static`.}
  proc getExclusiveCores*(): seq[jint] {.`static`.}
  proc getSchedAffinity*(tid: jint): seq[jlong] {.`static`.}
  proc setThreadPriority*(priority: jint) {.`static`.}
  proc getThreadPriority*(tid: jint): jint {.`static`.}
  proc getThreadScheduler*(tid: jint): jint {.`static`.}
  proc setThreadScheduler*(tid: jint, policy: jint, priority: jint) {.`static`.}
  proc supportsProcesses*(): jboolean {.`static`.}
  proc setArgV0*(text: string) {.`static`.}
  proc myProcessName*(): string {.`static`.}
  proc myProcessName$ravenwood*(): string {.`static`.}
  proc killProcess*(pid: jint) {.`static`.}
  proc checkTid*(tgid: jint, tid: jint) {.`static`.}
  proc checkPid*(pid: jint) {.`static`.}
  proc setUid*(uid: jint): jint {.`static`.}
  proc setGid*(uid: jint): jint {.`static`.}
  proc sendSignal*(pid: jint, signal: jint) {.`static`.}
  proc killProcessQuiet*(pid: jint) {.`static`.}
  proc sendSignalQuiet*(pid: jint, signal: jint) {.`static`.}
  proc getAdvertisedMem*(): jlong {.`static`.}
  proc getFreeMemory*(): jlong {.`static`.}
  proc getTotalMemory*(): jlong {.`static`.}
  proc readProcLines*(path: string, reqFields: seq[string], outSizes: seq[jlong]) {.`static`.}
  proc getPids*(path: string, lastArray: seq[jint]): seq[jint] {.`static`.}
  proc readProcFile*(file: string, format: seq[jint], outStrings: seq[string], outLongs: seq[jlong], outFloats: seq[jfloat]): jboolean {.`static`.}
  proc parseProcLine*(buffer: seq[jbyte], startIndex: jint, endIndex: jint, format: seq[jint], outStrings: seq[string], outLongs: seq[jlong], outFloats: seq[jfloat]): jboolean {.`static`.}
  proc getPidsForCommands*(cmds: seq[string]): seq[jint] {.`static`.}
  proc getPss*(pid: jint): jlong {.`static`.}
  proc getRss*(pid: jint): seq[jlong] {.`static`.}
  proc killProcessGroup*(uid: jint, pid: jint): jint {.`static`.}
  proc sendSignalToProcessGroup*(uid: jint, pid: jint, signal: jint): jboolean {.`static`.}
  proc freezeCgroupUid*(uid: jint, freeze: jboolean) {.`static`.}
  proc removeAllProcessGroups*() {.`static`.}
  proc isThreadInProcess*(tid: jint, pid: jint): jboolean {.`static`.}
  proc waitForProcessDeath*(pid: jint, timeout: jint) {.`static`.}
  proc supportsPidFd*(): jboolean {.`static`.}
  proc openPidFd*(pid: jint, flags: jint): FileDescriptor {.`static`.}
  INVALID_UID*: jint {.`static`.}
  ROOT_UID*: jint {.`static`.}
  SYSTEM_UID*: jint {.`static`.}
  PHONE_UID*: jint {.`static`.}
  SHELL_UID*: jint {.`static`.}
  LOG_UID*: jint {.`static`.}
  WIFI_UID*: jint {.`static`.}
  MEDIA_UID*: jint {.`static`.}
  DRM_UID*: jint {.`static`.}
  SDCARD_RW_GID*: jint {.`static`.}
  VPN_UID*: jint {.`static`.}
  KEYSTORE_UID*: jint {.`static`.}
  CREDSTORE_UID*: jint {.`static`.}
  NFC_UID*: jint {.`static`.}
  CLAT_UID*: jint {.`static`.}
  BLUETOOTH_UID*: jint {.`static`.}
  MEDIA_RW_GID*: jint {.`static`.}
  PACKAGE_INFO_GID*: jint {.`static`.}
  SHARED_RELRO_UID*: jint {.`static`.}
  AUDIOSERVER_UID*: jint {.`static`.}
  CAMERASERVER_UID*: jint {.`static`.}
  DNS_TETHER_UID*: jint {.`static`.}
  WEBVIEW_ZYGOTE_UID*: jint {.`static`.}
  OTA_UPDATE_UID*: jint {.`static`.}
  STATSD_UID*: jint {.`static`.}
  INCIDENTD_UID*: jint {.`static`.}
  SE_UID*: jint {.`static`.}
  NETWORK_STACK_UID*: jint {.`static`.}
  FSVERITY_CERT_UID*: jint {.`static`.}
  EXTERNAL_STORAGE_GID*: jint {.`static`.}
  EXT_DATA_RW_GID*: jint {.`static`.}
  EXT_OBB_RW_GID*: jint {.`static`.}
  UWB_UID*: jint {.`static`.}
  SDK_SANDBOX_VIRTUAL_UID*: jint {.`static`.}
  INET_GID*: jint {.`static`.}
  NOBODY_UID*: jint {.`static`.}
  FIRST_APPLICATION_UID*: jint {.`static`.}
  LAST_APPLICATION_UID*: jint {.`static`.}
  FIRST_SDK_SANDBOX_UID*: jint {.`static`.}
  LAST_SDK_SANDBOX_UID*: jint {.`static`.}
  FIRST_APP_ZYGOTE_ISOLATED_UID*: jint {.`static`.}
  NUM_UIDS_PER_APP_ZYGOTE*: jint {.`static`.}
  LAST_APP_ZYGOTE_ISOLATED_UID*: jint {.`static`.}
  FIRST_ISOLATED_UID*: jint {.`static`.}
  LAST_ISOLATED_UID*: jint {.`static`.}
  SHARED_USER_GID*: jint {.`static`.}
  FIRST_SHARED_APPLICATION_GID*: jint {.`static`.}
  LAST_SHARED_APPLICATION_GID*: jint {.`static`.}
  FIRST_APPLICATION_CACHE_GID*: jint {.`static`.}
  LAST_APPLICATION_CACHE_GID*: jint {.`static`.}
  INVALID_PID*: jint {.`static`.}
  THREAD_PRIORITY_DEFAULT*: jint {.`static`.}
  THREAD_PRIORITY_LOWEST*: jint {.`static`.}
  THREAD_PRIORITY_BACKGROUND*: jint {.`static`.}
  THREAD_PRIORITY_FOREGROUND*: jint {.`static`.}
  THREAD_PRIORITY_DISPLAY*: jint {.`static`.}
  THREAD_PRIORITY_URGENT_DISPLAY*: jint {.`static`.}
  THREAD_PRIORITY_VIDEO*: jint {.`static`.}
  THREAD_PRIORITY_TOP_APP_BOOST*: jint {.`static`.}
  THREAD_PRIORITY_AUDIO*: jint {.`static`.}
  THREAD_PRIORITY_URGENT_AUDIO*: jint {.`static`.}
  THREAD_PRIORITY_MORE_FAVORABLE*: jint {.`static`.}
  THREAD_PRIORITY_LESS_FAVORABLE*: jint {.`static`.}
  SCHED_OTHER*: jint {.`static`.}
  SCHED_FIFO*: jint {.`static`.}
  SCHED_RR*: jint {.`static`.}
  SCHED_BATCH*: jint {.`static`.}
  SCHED_IDLE*: jint {.`static`.}
  SCHED_RESET_ON_FORK*: jint {.`static`.}
  THREAD_GROUP_DEFAULT*: jint {.`static`.}
  THREAD_GROUP_BACKGROUND*: jint {.`static`.}
  THREAD_GROUP_FOREGROUND*: jint {.`static`.}
  THREAD_GROUP_SYSTEM*: jint {.`static`.}
  THREAD_GROUP_AUDIO_APP*: jint {.`static`.}
  THREAD_GROUP_AUDIO_SYS*: jint {.`static`.}
  THREAD_GROUP_TOP_APP*: jint {.`static`.}
  THREAD_GROUP_RT_APP*: jint {.`static`.}
  THREAD_GROUP_RESTRICTED*: jint {.`static`.}
  THREAD_GROUP_FOREGROUND_WINDOW*: jint {.`static`.}
  SIGNAL_DEFAULT*: jint {.`static`.}
  SIGNAL_QUIT*: jint {.`static`.}
  SIGNAL_KILL*: jint {.`static`.}
  SIGNAL_USR1*: jint {.`static`.}
  ZYGOTE_POLICY_FLAG_EMPTY*: jint {.`static`.}
  ZYGOTE_POLICY_FLAG_LATENCY_SENSITIVE*: jint {.`static`.}
  ZYGOTE_POLICY_FLAG_BATCH_LAUNCH*: jint {.`static`.}
  ZYGOTE_POLICY_FLAG_SYSTEM_PROCESS*: jint {.`static`.}
  ZYGOTE_PROCESS*: ZygoteProcess {.`static`.}
  PROC_TERM_MASK*: jint {.`static`.}
  PROC_ZERO_TERM*: jint {.`static`.}
  PROC_SPACE_TERM*: jint {.`static`.}
  PROC_TAB_TERM*: jint {.`static`.}
  PROC_NEWLINE_TERM*: jint {.`static`.}
  PROC_COMBINE*: jint {.`static`.}
  PROC_PARENS*: jint {.`static`.}
  PROC_QUOTES*: jint {.`static`.}
  PROC_CHAR*: jint {.`static`.}
  PROC_OUT_STRING*: jint {.`static`.}
  PROC_OUT_LONG*: jint {.`static`.}
  PROC_OUT_FLOAT*: jint {.`static`.}

jclass android.os.ProcessStartResult* of JVMObject:
  pid*: jint
  usingWrapper*: jboolean

