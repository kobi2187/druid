import jnim

jclass android.nfc.T4tNdefNfcee* of JVMObject:
  proc getInstance*(): T4tNdefNfcee {.`static`.}
  proc writeData*(fileId: jint, data: seq[jbyte]): jint
  proc readData*(fileId: jint): seq[jbyte]
  proc clearData*(): jint
  proc isOperationOngoing*(): jboolean
  proc isSupported*(): jboolean
  proc readCcfile*(): T4tNdefNfceeCcFileInfo
  WRITE_DATA_SUCCESS*: jint {.`static`.}
  WRITE_DATA_ERROR_INTERNAL*: jint {.`static`.}
  WRITE_DATA_ERROR_RF_ACTIVATED*: jint {.`static`.}
  WRITE_DATA_ERROR_NFC_NOT_ON*: jint {.`static`.}
  WRITE_DATA_ERROR_INVALID_FILE_ID*: jint {.`static`.}
  WRITE_DATA_ERROR_INVALID_LENGTH*: jint {.`static`.}
  WRITE_DATA_ERROR_CONNECTION_FAILED*: jint {.`static`.}
  WRITE_DATA_ERROR_EMPTY_PAYLOAD*: jint {.`static`.}
  WRITE_DATA_ERROR_NDEF_VALIDATION_FAILED*: jint {.`static`.}
  WRITE_DATA_ERROR_DEVICE_BUSY*: jint {.`static`.}
  CLEAR_DATA_SUCCESS*: jint {.`static`.}
  CLEAR_DATA_FAILED_INTERNAL*: jint {.`static`.}
  CLEAR_DATA_FAILED_DEVICE_BUSY*: jint {.`static`.}

