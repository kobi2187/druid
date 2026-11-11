import jnim

jclass android.net.InvalidPacketException* of Exception:
  proc getError*(): jint
  ERROR_INVALID_IP_ADDRESS*: jint {.`static`.}
  ERROR_INVALID_PORT*: jint {.`static`.}
  ERROR_INVALID_LENGTH*: jint {.`static`.}

