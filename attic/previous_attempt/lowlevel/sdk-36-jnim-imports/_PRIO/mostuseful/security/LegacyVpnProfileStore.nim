import jnim

jclass android.security.LegacyVpnProfileStore* of JVMObject:
  proc put*(alias: string, profile: seq[jbyte]): jboolean {.`static`.}
  proc get*(alias: string): seq[jbyte] {.`static`.}
  proc remove*(alias: string): jboolean {.`static`.}
  proc list*(prefix: string): seq[string] {.`static`.}
  SYSTEM_ERROR*: jint {.`static`.}
  PROFILE_NOT_FOUND*: jint {.`static`.}

