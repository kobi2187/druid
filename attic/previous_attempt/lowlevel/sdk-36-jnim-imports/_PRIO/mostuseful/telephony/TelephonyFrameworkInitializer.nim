import jnim

jclass android.telephony.TelephonyFrameworkInitializer* of JVMObject:
  proc setTelephonyServiceManager*(telephonyServiceManager: TelephonyServiceManager) {.`static`.}
  proc registerServiceWrappers*() {.`static`.}
  proc getTelephonyServiceManager*(): TelephonyServiceManager {.`static`.}

