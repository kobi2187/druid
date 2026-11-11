import jnim

jclass android.security.KeyStoreAuthorization* of JVMObject:
  proc getInstance*(): KeyStoreAuthorization {.`static`.}
  proc addAuthToken*(authToken: HardwareAuthToken): jint
  proc addAuthToken*(authToken: seq[jbyte]): jint
  proc onDeviceUnlocked*(userId: jint, password: seq[jbyte]): jint
  proc onDeviceLocked*(userId: jint, unlockingSids: seq[jlong], weakUnlockEnabled: jboolean): jint
  proc getLastAuthTime*(userId: jlong, authenticatorTypes: seq[jint]): jlong
  SYSTEM_ERROR*: jint {.`static`.}

