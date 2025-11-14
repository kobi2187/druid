import jnim

jclass android.os.EventLogTags* of JVMObject:
  proc writeServiceManagerStats*(callCount: jint, totalTime: jint, duration: jint) {.`static`.}
  proc writeServiceManagerSlow*(time: jint, service: string) {.`static`.}
  SERVICE_MANAGER_STATS*: jint {.`static`.}
  SERVICE_MANAGER_SLOW*: jint {.`static`.}

