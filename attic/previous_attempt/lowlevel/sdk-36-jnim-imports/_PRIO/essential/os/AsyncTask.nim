import jnim

jclass android.os.AsyncTask* of JVMObject:
  proc setDefaultExecutor*(exec: Executor) {.`static`.}
  proc getStatus*(): Status
  proc isCancelled*(): jboolean
  proc cancel*(mayInterruptIfRunning: jboolean): jboolean
  proc get*(): Result
  proc get*(timeout: jlong, unit: TimeUnit): Result
  proc execute*(params: Params): AsyncTask[Params, Progress, Result]
  proc executeOnExecutor*(exec: Executor, params: Params): AsyncTask[Params, Progress, Result]
  proc execute*(runnable: Runnable) {.`static`.}
  THREAD_POOL_EXECUTOR*: Executor {.`static`.}
  SERIAL_EXECUTOR*: Executor {.`static`.}

