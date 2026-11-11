import jnim

jclass android.util.Log* of JVMObject:
  proc v*(tag: string, msg: string): jint {.`static`.}
  proc v*(tag: string, msg: string, tr: Throwable): jint {.`static`.}
  proc d*(tag: string, msg: string): jint {.`static`.}
  proc d*(tag: string, msg: string, tr: Throwable): jint {.`static`.}
  proc i*(tag: string, msg: string): jint {.`static`.}
  proc i*(tag: string, msg: string, tr: Throwable): jint {.`static`.}
  proc w*(tag: string, msg: string): jint {.`static`.}
  proc w*(tag: string, msg: string, tr: Throwable): jint {.`static`.}
  proc isLoggable*(tag: string, level: jint): jboolean {.`static`.}
  proc w*(tag: string, tr: Throwable): jint {.`static`.}
  proc e*(tag: string, msg: string): jint {.`static`.}
  proc e*(tag: string, msg: string, tr: Throwable): jint {.`static`.}
  proc wtf*(tag: string, msg: string): jint {.`static`.}
  proc wtfStack*(tag: string, msg: string): jint {.`static`.}
  proc wtf*(tag: string, tr: Throwable): jint {.`static`.}
  proc wtf*(tag: string, msg: string, tr: Throwable): jint {.`static`.}
  proc setWtfHandler*(handler: TerribleFailureHandler): TerribleFailureHandler {.`static`.}
  proc getStackTraceString*(tr: Throwable): string {.`static`.}
  proc println*(priority: jint, tag: string, msg: string): jint {.`static`.}
  proc println_native*(bufID: jint, priority: jint, tag: string, msg: string): jint {.`static`.}
  proc logToRadioBuffer*(priority: jint, tag: string, message: string): jint {.`static`.}
  proc printlns*(bufID: jint, priority: jint, tag: string, msg: string, tr: Throwable): jint {.`static`.}
  VERBOSE*: jint {.`static`.}
  DEBUG*: jint {.`static`.}
  INFO*: jint {.`static`.}
  WARN*: jint {.`static`.}
  ERROR*: jint {.`static`.}
  ASSERT*: jint {.`static`.}
  LOG_ID_MAIN*: jint {.`static`.}
  LOG_ID_RADIO*: jint {.`static`.}
  LOG_ID_EVENTS*: jint {.`static`.}
  LOG_ID_SYSTEM*: jint {.`static`.}
  LOG_ID_CRASH*: jint {.`static`.}

jclass android.util.TerribleFailure* of Exception:

