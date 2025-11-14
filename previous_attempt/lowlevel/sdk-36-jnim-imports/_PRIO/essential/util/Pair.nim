import jnim

jclass android.util.Pair* of JVMObject:
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string
  proc create*(a: A, b: B): Pair[A, B] {.`static`.}
  first*: F
  second*: S

