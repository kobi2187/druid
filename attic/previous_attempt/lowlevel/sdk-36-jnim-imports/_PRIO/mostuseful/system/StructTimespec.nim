import jnim

jclass android.system.StructTimespec* of JVMObject:
  proc compareTo*(other: StructTimespec): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  tv_sec*: jlong
  tv_nsec*: jlong

