import jnim

jclass android.os.SystemClock* of JVMObject:
  proc sleep*(ms: jlong) {.`static`.}
  proc setCurrentTimeMillis*(millis: jlong): jboolean {.`static`.}
  proc uptimeMillis*(): jlong {.`static`.}
  proc uptimeMillis$ravenwood*(): jlong {.`static`.}
  proc uptimeNanos*(): jlong {.`static`.}
  proc uptimeNanos$ravenwood*(): jlong {.`static`.}
  proc uptimeClock*(): Clock {.`static`.}
  proc elapsedRealtime*(): jlong {.`static`.}
  proc elapsedRealtime$ravenwood*(): jlong {.`static`.}
  proc elapsedRealtimeClock*(): Clock {.`static`.}
  proc elapsedRealtimeNanos*(): jlong {.`static`.}
  proc elapsedRealtimeNanos$ravenwood*(): jlong {.`static`.}
  proc currentThreadTimeMillis*(): jlong {.`static`.}
  proc currentThreadTimeMicro*(): jlong {.`static`.}
  proc currentTimeMicro*(): jlong {.`static`.}
  proc currentTimeMicro$ravenwood*(): jlong {.`static`.}
  proc currentNetworkTimeMillis*(): jlong {.`static`.}
  proc currentNetworkTimeClock*(): Clock {.`static`.}
  proc currentGnssTimeClock*(): Clock {.`static`.}

