import jnim

jclass android.net.QosCallbackException* of Exception:
  proc createException*(type: jint): QosCallbackException {.`static`.}
  EX_TYPE_FILTER_NONE*: jint {.`static`.}
  EX_TYPE_FILTER_NETWORK_RELEASED*: jint {.`static`.}
  EX_TYPE_FILTER_SOCKET_NOT_BOUND*: jint {.`static`.}
  EX_TYPE_FILTER_NOT_SUPPORTED*: jint {.`static`.}
  EX_TYPE_FILTER_SOCKET_LOCAL_ADDRESS_CHANGED*: jint {.`static`.}
  EX_TYPE_FILTER_SOCKET_NOT_CONNECTED*: jint {.`static`.}
  EX_TYPE_FILTER_SOCKET_REMOTE_ADDRESS_CHANGED*: jint {.`static`.}

