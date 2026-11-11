import jnim

jclass java.util.UUID* of JVMObject:
  proc randomUUID*(): UUID {.`static`.}
  proc nameUUIDFromBytes*(name: seq[jbyte]): UUID {.`static`.}
  proc fromString*(name: string): UUID {.`static`.}
  proc getLeastSignificantBits*(): jlong
  proc getMostSignificantBits*(): jlong
  proc version*(): jint
  proc variant*(): jint
  proc timestamp*(): jlong
  proc clockSequence*(): jint
  proc node*(): jlong
  proc toString*(): string
  proc hashCode*(): jint
  proc equals*(obj: JObject): jboolean
  proc compareTo*(val: UUID): jint

