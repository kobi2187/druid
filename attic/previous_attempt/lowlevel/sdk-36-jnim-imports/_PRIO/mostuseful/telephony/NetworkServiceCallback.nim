import jnim

jclass android.telephony.NetworkServiceCallback* of JVMObject:
  proc onRequestNetworkRegistrationInfoComplete*(result: jint, state: NetworkRegistrationInfo)
  RESULT_SUCCESS*: jint {.`static`.}
  RESULT_ERROR_UNSUPPORTED*: jint {.`static`.}
  RESULT_ERROR_INVALID_ARG*: jint {.`static`.}
  RESULT_ERROR_BUSY*: jint {.`static`.}
  RESULT_ERROR_ILLEGAL_STATE*: jint {.`static`.}
  RESULT_ERROR_FAILED*: jint {.`static`.}

