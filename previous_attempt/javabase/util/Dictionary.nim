import jnim

jclass java.util.Dictionary* of JVMObject:
  proc size*(): jint
  proc isEmpty*(): jboolean
  proc keys*(): Enumeration[K]
  proc elements*(): Enumeration[V]
  proc get*(key: JObject): V
  proc put*(key: K, value: V): V
  proc remove*(key: JObject): V

