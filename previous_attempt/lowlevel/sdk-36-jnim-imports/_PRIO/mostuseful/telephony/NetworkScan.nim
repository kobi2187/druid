import jnim

jclass android.telephony.NetworkScan* of JVMObject:
  proc stopScan*()
  proc stop*()
  SUCCESS*: jint {.`static`.}
  ERROR_MODEM_ERROR*: jint {.`static`.}
  ERROR_INVALID_SCAN*: jint {.`static`.}
  ERROR_MODEM_UNAVAILABLE*: jint {.`static`.}
  ERROR_UNSUPPORTED*: jint {.`static`.}
  ERROR_RADIO_INTERFACE_ERROR*: jint {.`static`.}
  ERROR_INVALID_SCANID*: jint {.`static`.}
  ERROR_INTERRUPTED*: jint {.`static`.}

