import jnim

jclass android.nfc.ErrorCodes* of JVMObject:
  proc isError*(code: jint): jboolean {.`static`.}
  proc asString*(code: jint): string {.`static`.}
  SUCCESS*: jint {.`static`.}
  ERROR_IO*: jint {.`static`.}
  ERROR_CANCELLED*: jint {.`static`.}
  ERROR_TIMEOUT*: jint {.`static`.}
  ERROR_BUSY*: jint {.`static`.}
  ERROR_CONNECT*: jint {.`static`.}
  ERROR_DISCONNECT*: jint {.`static`.}
  ERROR_READ*: jint {.`static`.}
  ERROR_WRITE*: jint {.`static`.}
  ERROR_INVALID_PARAM*: jint {.`static`.}
  ERROR_INSUFFICIENT_RESOURCES*: jint {.`static`.}
  ERROR_SOCKET_CREATION*: jint {.`static`.}
  ERROR_SOCKET_NOT_CONNECTED*: jint {.`static`.}
  ERROR_BUFFER_TO_SMALL*: jint {.`static`.}
  ERROR_SAP_USED*: jint {.`static`.}
  ERROR_SERVICE_NAME_USED*: jint {.`static`.}
  ERROR_SOCKET_OPTIONS*: jint {.`static`.}
  ERROR_NFC_ON*: jint {.`static`.}
  ERROR_NOT_INITIALIZED*: jint {.`static`.}
  ERROR_SE_ALREADY_SELECTED*: jint {.`static`.}
  ERROR_SE_CONNECTED*: jint {.`static`.}
  ERROR_NO_SE_CONNECTED*: jint {.`static`.}
  ERROR_NOT_SUPPORTED*: jint {.`static`.}

