import jnim

jclass android.provider.DeviceConfigInitializer* of JVMObject:
  proc setDeviceConfigServiceManager*(serviceManager: DeviceConfigServiceManager) {.`static`.}
  proc getDeviceConfigServiceManager*(): DeviceConfigServiceManager {.`static`.}

