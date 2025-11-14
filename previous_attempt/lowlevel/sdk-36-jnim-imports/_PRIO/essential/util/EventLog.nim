import jnim

jclass android.util.EventLog* of JVMObject:
  proc writeEvent*(tag: jint, value: jint): jint {.`static`.}
  proc writeEvent*(tag: jint, value: jlong): jint {.`static`.}
  proc writeEvent*(tag: jint, value: jfloat): jint {.`static`.}
  proc writeEvent*(tag: jint, str: string): jint {.`static`.}
  proc writeEvent*(tag: jint, list: JObject): jint {.`static`.}
  proc readEvents*(tags: seq[jint], output: Collection[Event]) {.`static`.}
  proc readEventsOnWrapping*(tags: seq[jint], timestamp: jlong, output: Collection[Event]) {.`static`.}
  proc getTagName*(tag: jint): string {.`static`.}
  proc getTagCode*(name: string): jint {.`static`.}

jclass android.util.EventLog.Event* of JVMObject:
  proc getProcessId*(): jint
  proc getUid*(): jint
  proc getThreadId*(): jint
  proc getTimeNanos*(): jlong
  proc getTag*(): jint
  proc getData*(): JObject
  proc withNewData*(object: JObject): Event
  proc fromBytes*(data: seq[jbyte]): Event {.`static`.}
  proc getBytes*(): seq[jbyte]
  proc getLastError*(): Exception
  proc clearError*()
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.util.Event* of JVMObject:
  proc getProcessId*(): jint
  proc getUid*(): jint
  proc getThreadId*(): jint
  proc getTimeNanos*(): jlong
  proc getTag*(): jint
  proc getData*(): JObject
  proc withNewData*(object: JObject): Event
  proc fromBytes*(data: seq[jbyte]): Event {.`static`.}
  proc getBytes*(): seq[jbyte]
  proc getLastError*(): Exception
  proc clearError*()
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

