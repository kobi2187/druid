import jnim

jclass android.media.MediaFrameworkPlatformInitializer* of JVMObject:
  proc setMediaServiceManager*(mediaServiceManager: MediaServiceManager) {.`static`.}
  proc getMediaServiceManager*(): MediaServiceManager {.`static`.}
  proc registerServiceWrappers*() {.`static`.}

