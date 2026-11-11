import jnim

jclass java.lang.Record* of JVMObject:
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc toString*(): string

