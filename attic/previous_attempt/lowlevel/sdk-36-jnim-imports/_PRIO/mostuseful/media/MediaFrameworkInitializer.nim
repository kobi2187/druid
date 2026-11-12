import jnim

jclass android.media.MediaFrameworkInitializer* of JVMObject:
  proc setMediaServiceManager*(mediaServiceManager: MediaServiceManager) {.`static`.}
  proc getMediaServiceManager*(): MediaServiceManager {.`static`.}
  proc registerServiceWrappers*() {.`static`.}

