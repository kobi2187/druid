import jnim

jclass android.bluetooth.BluetoothSocketException* of IOException:
  proc getErrorCode*(): jint
  UNSPECIFIED*: jint {.`static`.}
  L2CAP_UNKNOWN*: jint {.`static`.}
  L2CAP_ACL_FAILURE*: jint {.`static`.}
  L2CAP_CLIENT_SECURITY_FAILURE*: jint {.`static`.}
  L2CAP_INSUFFICIENT_AUTHENTICATION*: jint {.`static`.}
  L2CAP_INSUFFICIENT_AUTHORIZATION*: jint {.`static`.}
  L2CAP_INSUFFICIENT_ENCRYPT_KEY_SIZE*: jint {.`static`.}
  L2CAP_INSUFFICIENT_ENCRYPTION*: jint {.`static`.}
  L2CAP_INVALID_SOURCE_CID*: jint {.`static`.}
  L2CAP_SOURCE_CID_ALREADY_ALLOCATED*: jint {.`static`.}
  L2CAP_UNACCEPTABLE_PARAMETERS*: jint {.`static`.}
  L2CAP_INVALID_PARAMETERS*: jint {.`static`.}
  L2CAP_NO_RESOURCES*: jint {.`static`.}
  L2CAP_NO_PSM_AVAILABLE*: jint {.`static`.}
  L2CAP_TIMEOUT*: jint {.`static`.}
  BLUETOOTH_OFF_FAILURE*: jint {.`static`.}
  SOCKET_MANAGER_FAILURE*: jint {.`static`.}
  SOCKET_CLOSED*: jint {.`static`.}
  SOCKET_CONNECTION_FAILURE*: jint {.`static`.}
  NULL_DEVICE*: jint {.`static`.}
  RPC_FAILURE*: jint {.`static`.}
  UNIX_FILE_SOCKET_CREATION_FAILURE*: jint {.`static`.}

