import jnim

jclass android.ondevicepersonalization.OnDevicePersonalizationSystemServiceManager* of JVMObject:
  proc getService*(): IOnDevicePersonalizationSystemService
  ON_DEVICE_PERSONALIZATION_SYSTEM_SERVICE*: string {.`static`.}

