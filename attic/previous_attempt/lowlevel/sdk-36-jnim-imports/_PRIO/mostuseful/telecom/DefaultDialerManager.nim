import jnim

jclass android.telecom.DefaultDialerManager* of JVMObject:
  proc setDefaultDialerApplication*(context: Context, packageName: string): jboolean {.`static`.}
  proc setDefaultDialerApplication*(context: Context, packageName: string, user: jint): jboolean {.`static`.}
  proc getDefaultDialerApplication*(context: Context): string {.`static`.}
  proc getDefaultDialerApplication*(context: Context, user: jint): string {.`static`.}
  proc getInstalledDialerApplications*(context: Context, userId: jint): List[string] {.`static`.}
  proc getInstalledDialerApplications*(context: Context): List[string] {.`static`.}
  proc isDefaultOrSystemDialer*(context: Context, packageName: string): jboolean {.`static`.}

