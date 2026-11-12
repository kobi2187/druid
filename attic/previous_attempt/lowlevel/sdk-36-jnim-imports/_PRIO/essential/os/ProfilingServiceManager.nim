import jnim

jclass android.os.ProfilingServiceManager* of JVMObject:
  proc getProfilingServiceRegisterer*(): ServiceRegisterer

jclass android.os.ProfilingServiceManager.ServiceRegisterer* of JVMObject:
  proc get*(): IBinder
  proc getOrThrow*(): IBinder

jclass android.os.ServiceRegisterer* of JVMObject:
  proc get*(): IBinder
  proc getOrThrow*(): IBinder

jclass android.os.ServiceNotFoundException* of ServiceNotFoundException:

