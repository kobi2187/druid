import jnim

jclass android.provider.DeviceConfigServiceManager* of JVMObject:
  proc getDeviceConfigUpdatableServiceRegisterer*(): ServiceRegisterer

jclass android.provider.DeviceConfigServiceManager.ServiceRegisterer* of JVMObject:
  proc register*(service: IBinder)
  proc get*(): IBinder
  proc getOrThrow*(): IBinder
  proc tryGet*(): IBinder

jclass android.provider.ServiceRegisterer* of JVMObject:
  proc register*(service: IBinder)
  proc get*(): IBinder
  proc getOrThrow*(): IBinder
  proc tryGet*(): IBinder

jclass android.provider.ServiceNotFoundException* of ServiceNotFoundException:

