import jnim

jclass android.util.SafetyProtectionUtils* of JVMObject:
  proc shouldShowSafetyProtectionResources*(context: Context): jboolean {.`static`.}

