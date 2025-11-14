import jnim

jclass android.telephony.Rlog* of JVMObject:
  proc v*(tag: string, msg: string): jint {.`static`.}
  proc v*(tag: string, msg: string, tr: Throwable): jint {.`static`.}
  proc d*(tag: string, msg: string): jint {.`static`.}
  proc d*(tag: string, msg: string, tr: Throwable): jint {.`static`.}
  proc i*(tag: string, msg: string): jint {.`static`.}
  proc i*(tag: string, msg: string, tr: Throwable): jint {.`static`.}
  proc w*(tag: string, msg: string): jint {.`static`.}
  proc w*(tag: string, msg: string, tr: Throwable): jint {.`static`.}
  proc w*(tag: string, tr: Throwable): jint {.`static`.}
  proc e*(tag: string, msg: string): jint {.`static`.}
  proc e*(tag: string, msg: string, tr: Throwable): jint {.`static`.}
  proc println*(priority: jint, tag: string, msg: string): jint {.`static`.}
  proc isLoggable*(tag: string, level: jint): jboolean {.`static`.}
  proc pii*(tag: string, pii: JObject): string {.`static`.}
  proc pii*(enablePiiLogging: jboolean, pii: JObject): string {.`static`.}

