import jnim

jclass android.net.SocketKeepalive* of JVMObject:
  proc start*(intervalSec: jint)
  proc start*(intervalSec: jint, flags: jint, underpinnedNetwork: Network)
  proc stop*()
  proc close*()
  SUCCESS*: jint {.`static`.}
  SUCCESS_PAUSED*: jint {.`static`.}
  NO_KEEPALIVE*: jint {.`static`.}
  DATA_RECEIVED*: jint {.`static`.}
  BINDER_DIED*: jint {.`static`.}
  ERROR_INVALID_NETWORK*: jint {.`static`.}
  ERROR_INVALID_IP_ADDRESS*: jint {.`static`.}
  ERROR_INVALID_PORT*: jint {.`static`.}
  ERROR_INVALID_LENGTH*: jint {.`static`.}
  ERROR_INVALID_INTERVAL*: jint {.`static`.}
  ERROR_INVALID_SOCKET*: jint {.`static`.}
  ERROR_SOCKET_NOT_IDLE*: jint {.`static`.}
  ERROR_STOP_REASON_UNINITIALIZED*: jint {.`static`.}
  ERROR_UNSUPPORTED*: jint {.`static`.}
  ERROR_HARDWARE_ERROR*: jint {.`static`.}
  ERROR_INSUFFICIENT_RESOURCES*: jint {.`static`.}
  ERROR_NO_SUCH_SLOT*: jint {.`static`.}
  FLAG_AUTOMATIC_ON_OFF*: jint {.`static`.}
  MIN_INTERVAL_SEC*: jint {.`static`.}
  MAX_INTERVAL_SEC*: jint {.`static`.}

jclass android.net.SocketKeepalive.Callback* of JVMObject:
  proc onStarted*()
  proc onResumed*()
  proc onStopped*()
  proc onPaused*()
  proc onError*(error: jint)
  proc onDataReceived*()

jclass android.net.ErrorCodeException* of Exception:
  error*: jint

jclass android.net.InvalidSocketException* of ErrorCodeException:

jclass android.net.Callback* of JVMObject:
  proc onStarted*()
  proc onResumed*()
  proc onStopped*()
  proc onPaused*()
  proc onError*(error: jint)
  proc onDataReceived*()

