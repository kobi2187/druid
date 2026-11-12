import jnim

jclass android.os.StatsFrameworkInitializer* of JVMObject:
  proc setStatsServiceManager*(statsServiceManager: StatsServiceManager) {.`static`.}
  proc getStatsServiceManager*(): StatsServiceManager {.`static`.}
  proc registerServiceWrappers*() {.`static`.}

