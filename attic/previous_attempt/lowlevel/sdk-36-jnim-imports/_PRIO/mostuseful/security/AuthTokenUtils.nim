import jnim

jclass android.security.AuthTokenUtils* of JVMObject:
  proc toHardwareAuthToken*(array: seq[jbyte]): HardwareAuthToken {.`static`.}

