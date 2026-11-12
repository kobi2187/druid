import jnim

jclass android.security.AndroidKeyStoreMaintenance* of JVMObject:
  proc onUserAdded*(userId: jint): jint {.`static`.}
  proc initUserSuperKeys*(userId: jint, password: seq[jbyte], allowExisting: jboolean): jint {.`static`.}
  proc onUserRemoved*(userId: jint): jint {.`static`.}
  proc onUserLskfRemoved*(userId: jint): jint {.`static`.}
  proc clearNamespace*(domain: jint, namespace: jlong): jint {.`static`.}
  proc migrateKeyNamespace*(source: KeyDescriptor, destination: KeyDescriptor): jint {.`static`.}
  proc getAllAppUidsAffectedBySid*(userId: jint, userSecureId: jlong): seq[jlong] {.`static`.}
  proc deleteAllKeys*() {.`static`.}
  SYSTEM_ERROR*: jint {.`static`.}
  INVALID_ARGUMENT*: jint {.`static`.}
  PERMISSION_DENIED*: jint {.`static`.}
  KEY_NOT_FOUND*: jint {.`static`.}

