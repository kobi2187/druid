import jnim

jclass android.window.ConfigurationHelper* of JVMObject:
  proc freeTextLayoutCachesIfNeeded*(configDiff: jint) {.`static`.}
  proc shouldUpdateResources*(token: IBinder, config: Configuration, newConfig: Configuration, overrideConfig: Configuration, displayChanged: jboolean, configChanged: Boolean): jboolean {.`static`.}
  proc isDifferentDisplay*(displayId: jint, newDisplayId: jint): jboolean {.`static`.}

