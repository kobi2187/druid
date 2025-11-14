import jnim

jclass android.os.ZygoteProcess* of JVMObject:
  proc getPrimarySocketAddress*(): LocalSocketAddress
  proc start*(processClass: string, niceName: string, uid: jint, gid: jint, gids: seq[jint], runtimeFlags: jint, mountExternal: jint, targetSdkVersion: jint, seInfo: string, abi: string, instructionSet: string, appDataDir: string, invokeWith: string, packageName: string, zygotePolicyFlags: jint, isTopApp: jboolean, disabledCompatChanges: seq[jlong], pkgDataInfoMap: Map[string, Pair<String, Long>], allowlistedDataInfoList: Map[string, Pair<String, Long>], bindMountAppsData: jboolean, bindMountAppStorageDirs: jboolean, bindOverrideSysprops: jboolean, zygoteArgs: seq[string]): Process.ProcessStartResult
  proc close*()
  proc establishZygoteConnectionForAbi*(abi: string)
  proc getZygotePid*(abi: string): jint
  proc bootCompleted*()
  proc setApiDenylistExemptions*(exemptions: List[string]): jboolean
  proc setHiddenApiAccessLogSampleRate*(rate: jint)
  proc setHiddenApiAccessStatslogSampleRate*(rate: jint)
  proc setAppZygotePreloadTimeout*(timeoutMs: jint) {.`static`.}
  proc preloadApp*(appInfo: ApplicationInfo, abi: string): jboolean
  proc preloadDefault*(abi: string): jboolean
  proc waitForConnectionToZygote*(zygoteSocketName: string) {.`static`.}
  proc waitForConnectionToZygote*(zygoteSocketAddress: LocalSocketAddress) {.`static`.}
  proc startChildZygote*(processClass: string, niceName: string, uid: jint, gid: jint, gids: seq[jint], runtimeFlags: jint, seInfo: string, abi: string, acceptedAbiList: string, instructionSet: string, uidRangeStart: jint, uidRangeEnd: jint): ChildZygoteProcess
  sAppZygotePreloadTimeoutMs*: jint {.`static`.}

