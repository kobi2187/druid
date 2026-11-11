import jnim

jclass android.os.SystemService* of JVMObject:
  proc start*(name: string) {.`static`.}
  proc stop*(name: string) {.`static`.}
  proc restart*(name: string) {.`static`.}
  proc getState*(service: string): State {.`static`.}
  proc isStopped*(service: string): jboolean {.`static`.}
  proc isRunning*(service: string): jboolean {.`static`.}
  proc waitForState*(service: string, state: State, timeoutMillis: jlong) {.`static`.}
  proc waitForAnyStopped*(services: string) {.`static`.}

