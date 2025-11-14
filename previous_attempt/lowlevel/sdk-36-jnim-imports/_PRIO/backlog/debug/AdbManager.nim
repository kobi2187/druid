import jnim

jclass android.debug.AdbManager* of JVMObject:
  proc isAdbWifiSupported*(): jboolean
  proc isAdbWifiQrSupported*(): jboolean
  WIRELESS_DEBUG_STATE_CHANGED_ACTION*: string {.`static`.}
  WIRELESS_DEBUG_PAIRED_DEVICES_ACTION*: string {.`static`.}
  WIRELESS_DEBUG_PAIRING_RESULT_ACTION*: string {.`static`.}
  WIRELESS_DEVICES_EXTRA*: string {.`static`.}
  WIRELESS_STATUS_EXTRA*: string {.`static`.}
  WIRELESS_PAIR_DEVICE_EXTRA*: string {.`static`.}
  WIRELESS_PAIRING_CODE_EXTRA*: string {.`static`.}
  WIRELESS_DEBUG_PORT_EXTRA*: string {.`static`.}
  WIRELESS_STATUS_FAIL*: jint {.`static`.}
  WIRELESS_STATUS_SUCCESS*: jint {.`static`.}
  WIRELESS_STATUS_CANCELLED*: jint {.`static`.}
  WIRELESS_STATUS_PAIRING_CODE*: jint {.`static`.}
  WIRELESS_STATUS_CONNECTED*: jint {.`static`.}
  WIRELESS_STATUS_DISCONNECTED*: jint {.`static`.}

