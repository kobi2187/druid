import jnim

jclass android.os.ProfilingFrameworkInitializer* of JVMObject:
  proc setProfilingServiceManager*(profilingServiceManager: ProfilingServiceManager) {.`static`.}
  proc getProfilingServiceManager*(): ProfilingServiceManager {.`static`.}
  proc registerServiceWrappers*() {.`static`.}

