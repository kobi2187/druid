import jnim

jclass android.permission.PermissionUsageHelper* of JVMObject:
  proc tearDown*()
  proc onOpActiveChanged*(op: string, uid: jint, packageName: string, active: jboolean)
  proc onOpActiveChanged*(op: string, uid: jint, packageName: string, attributionTag: string, active: jboolean, attributionFlags: jint, attributionChainId: jint)
  proc onOpStarted*(op: jint, uid: jint, packageName: string, attributionTag: string, flags: jint, result: jint)
  proc onOpStarted*(op: jint, uid: jint, packageName: string, attributionTag: string, flags: jint, result: jint, startedType: jint, attributionFlags: jint, attributionChainId: jint)
  proc getOpUsageDataByDevice*(includeMicrophoneUsage: jboolean, deviceId: string): List[PermissionGroupUsage]
  proc getOpUsageDataForAllDevices*(includeMicrophoneUsage: jboolean): List[PermissionGroupUsage]

