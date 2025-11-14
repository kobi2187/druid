import jnim

jclass android.os.AppZygote* of JVMObject:
  proc getProcess*(): ChildZygoteProcess
  proc stopZygote*()
  proc getAppInfo*(): ApplicationInfo
  proc startProcess*(processClass: string, niceName: string, uid: jint, gids: seq[jint], runtimeFlags: jint, mountExternal: jint, targetSdkVersion: jint, seInfo: string, abi: string, instructionSet: string, appDataDir: string, packageName: string, isTopApp: jboolean, disabledCompatChanges: seq[jlong], pkgDataInfoMap: Map[string, Pair<String, Long>], allowlistedDataInfoList: Map[string, Pair<String, Long>], zygoteArgs: seq[string]): Process.ProcessStartResult

