import jnim

jclass android.util.ExceptionUtils* of JVMObject:
  proc wrap*(e: IOException): RuntimeException {.`static`.}
  proc maybeUnwrapIOException*(e: RuntimeException) {.`static`.}
  proc getCompleteMessage*(msg: string, t: Throwable): string {.`static`.}
  proc getCompleteMessage*(t: Throwable): string {.`static`.}
  proc propagateIfInstanceOf*(t: Throwable, c: Class[E]) {.`static`.}
  proc propagate*(t: Throwable, c: Class[E]): RuntimeException {.`static`.}
  proc propagate*(t: Throwable): RuntimeException {.`static`.}
  proc getRootCause*(t: Throwable): Throwable {.`static`.}
  proc appendCause*(t: Throwable, cause: Throwable): Throwable {.`static`.}

