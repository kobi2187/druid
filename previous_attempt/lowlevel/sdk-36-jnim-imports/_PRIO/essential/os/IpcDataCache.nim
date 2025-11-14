import jnim

jclass android.os.IpcDataCache* of PropertyInvalidatedCache:
  proc disableForCurrentProcess*()
  proc disableForCurrentProcess*(cacheName: string) {.`static`.}
  proc query*(query: Query): Result
  proc invalidateCache*()
  proc invalidateCache*(module: string, api: string) {.`static`.}
  proc forgetDisableLocal*()
  proc isDisabled*(): jboolean
  proc getDisabledState*(): jboolean
  proc disableInstance*()
  proc disableSystemWide*()
  proc setTestMode*(mode: jboolean) {.`static`.}
  proc setCacheTestMode*(mode: jboolean) {.`static`.}
  MODULE_TEST*: string {.`static`.}
  MODULE_SYSTEM*: string {.`static`.}
  MODULE_BLUETOOTH*: string {.`static`.}

jclass android.os.IpcDataCache.QueryHandler* of JVMObject:
  proc apply*(query: Q): R
  proc shouldBypassCache*(query: Q): jboolean

jclass android.os.IpcDataCache.Config* of JVMObject:
  proc child*(name: string): Config
  proc cacheNulls*(enable: jboolean): Config
  proc isolateUids*(enable: jboolean): Config
  proc invalidateCache*()
  proc disableForCurrentProcess*()
  proc disableAllForCurrentProcess*()

jclass android.os.QueryHandler* of QueryHandler:
  proc apply*(query: Q): R
  proc shouldBypassCache*(query: Q): jboolean

jclass android.os.Config* of JVMObject:
  proc child*(name: string): Config
  proc cacheNulls*(enable: jboolean): Config
  proc isolateUids*(enable: jboolean): Config
  proc invalidateCache*()
  proc disableForCurrentProcess*()
  proc disableAllForCurrentProcess*()


