import jnim

jclass android.os.ProfilingServiceHelper* of JVMObject:
  proc getInstance*(): ProfilingServiceHelper {.`static`.}
  proc onProfilingTriggerOccurred*(uid: jint, packageName: string, triggerType: jint)

