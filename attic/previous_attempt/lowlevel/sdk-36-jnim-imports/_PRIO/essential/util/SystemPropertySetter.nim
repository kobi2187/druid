import jnim

jclass android.util.SystemPropertySetter* of JVMObject:
  proc setWithRetry*(key: string, val: string) {.`static`.}
  proc setWithRetry*(key: string, val: string, maxRetry: jint, retryDelayMs: jlong) {.`static`.}
  PROPERTY_FAILURE_RETRY_DELAY_MILLIS*: jint {.`static`.}
  PROPERTY_FAILURE_RETRY_LIMIT*: jint {.`static`.}

