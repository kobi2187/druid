import jnim

jclass android.util.Slog* of JVMObject:
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
  proc wtf*(tag: string, msg: string): jint {.`static`.}
  proc wtfQuiet*(tag: string, msg: string) {.`static`.}
  proc wtfStack*(tag: string, msg: string): jint {.`static`.}
  proc wtf*(tag: string, tr: Throwable): jint {.`static`.}
  proc wtf*(tag: string, msg: string, tr: Throwable): jint {.`static`.}
  proc println*(priority: jint, tag: string, msg: string): jint {.`static`.}

