import jnim

jclass android.os.PerfettoTrace* of JVMObject:
  proc instant*(category: Category, eventName: string): PerfettoTrackEventExtra.Builder {.`static`.}
  proc begin*(category: Category, eventName: string): PerfettoTrackEventExtra.Builder {.`static`.}
  proc end*(category: Category): PerfettoTrackEventExtra.Builder {.`static`.}
  proc counter*(category: Category, value: jlong): PerfettoTrackEventExtra.Builder {.`static`.}
  proc counter*(category: Category, value: jlong, trackName: string): PerfettoTrackEventExtra.Builder {.`static`.}
  proc counter*(category: Category, value: jdouble): PerfettoTrackEventExtra.Builder {.`static`.}
  proc counter*(category: Category, value: jdouble, trackName: string): PerfettoTrackEventExtra.Builder {.`static`.}
  proc getFlowId*(): jint {.`static`.}
  proc getGlobalTrackUuid*(): jlong {.`static`.}
  proc getProcessTrackUuid*(): jlong {.`static`.}
  proc getThreadTrackUuid*(tid: jlong): jlong {.`static`.}
  proc activateTrigger*(triggerName: string, ttlMs: jint) {.`static`.}
  proc register*(isBackendInProcess: jboolean) {.`static`.}
  proc registerCategories*() {.`static`.}
  MQ_CATEGORY*: PerfettoTrace.Category {.`static`.}

jclass android.os.PerfettoTrace.Category* of JVMObject:
  proc register*(): Category
  proc unregister*(): Category
  proc isEnabled*(): jboolean
  proc isEnabled$ravenwood*(): jboolean
  proc isRegistered*(): jboolean
  proc getPtr*(): jlong

jclass android.os.PerfettoTrace.Session* of JVMObject:
  proc close*(): seq[jbyte]

jclass android.os.Category* of JVMObject:
  proc register*(): Category
  proc unregister*(): Category
  proc isEnabled*(): jboolean
  proc isEnabled$ravenwood*(): jboolean
  proc isRegistered*(): jboolean
  proc getPtr*(): jlong

jclass android.os.Session* of JVMObject:
  proc close*(): seq[jbyte]

