import jnim

jclass android.net.NetworkStatsAccess* of JVMObject:
  proc checkAccessLevel*(context: Context, callingPid: jint, callingUid: jint, callingPackage: string): jint {.`static`.}
  proc isAccessibleToUser*(uid: jint, callerUid: jint, accessLevel: jint): jboolean {.`static`.}

