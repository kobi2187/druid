import jnim

jclass android.os.StatsServiceManager* of JVMObject:
  proc getStatsCompanionServiceRegisterer*(): ServiceRegisterer
  proc getStatsManagerServiceRegisterer*(): ServiceRegisterer
  proc getStatsdServiceRegisterer*(): ServiceRegisterer

jclass android.os.StatsServiceManager.ServiceRegisterer* of JVMObject:
  proc get*(): IBinder
  proc getOrThrow*(): IBinder

jclass android.os.ServiceRegisterer* of JVMObject:
  proc get*(): IBinder
  proc getOrThrow*(): IBinder

jclass android.os.ServiceNotFoundException* of ServiceNotFoundException:

