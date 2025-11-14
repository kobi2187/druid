import jnim

jclass android.nearby.NearbyDevice* of JVMObject:
  proc isValidMedium*(medium: jint): jboolean {.`static`.}
  proc getName*(): string
  proc getMediums*(): List[Integer]
  proc getRssi*(): jint
  proc toString*(): string
  proc equals*(other: JObject): jboolean
  proc hashCode*(): jint

