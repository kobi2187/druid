import jnim

jclass android.app.ProcessMemoryState* of JVMObject:
  proc describeContents*(): jint
  proc writeToParcel*(parcel: Parcel, i: jint)
  HOSTING_COMPONENT_TYPE_EMPTY*: jint {.`static`.}
  HOSTING_COMPONENT_TYPE_SYSTEM*: jint {.`static`.}
  HOSTING_COMPONENT_TYPE_PERSISTENT*: jint {.`static`.}
  HOSTING_COMPONENT_TYPE_BACKUP*: jint {.`static`.}
  HOSTING_COMPONENT_TYPE_INSTRUMENTATION*: jint {.`static`.}
  HOSTING_COMPONENT_TYPE_ACTIVITY*: jint {.`static`.}
  HOSTING_COMPONENT_TYPE_BROADCAST_RECEIVER*: jint {.`static`.}
  HOSTING_COMPONENT_TYPE_PROVIDER*: jint {.`static`.}
  HOSTING_COMPONENT_TYPE_STARTED_SERVICE*: jint {.`static`.}
  HOSTING_COMPONENT_TYPE_FOREGROUND_SERVICE*: jint {.`static`.}
  HOSTING_COMPONENT_TYPE_BOUND_SERVICE*: jint {.`static`.}
  uid*: jint
  pid*: jint
  processName*: string
  oomScore*: jint
  hasForegroundServices*: jboolean
  mHostingComponentTypes*: jint
  mHistoricalHostingComponentTypes*: jint
  CREATOR*: Creator[ProcessMemoryState] {.`static`.}

