import jnim

jclass android.system.StructTimeval* of JVMObject:
  proc fromMillis*(millis: jlong): StructTimeval {.`static`.}
  proc toMillis*(): jlong
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  tv_sec*: jlong
  tv_usec*: jlong

