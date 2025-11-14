import jnim

jclass java.security.Permission* of JVMObject:
  proc checkGuard*(object: JObject)
  proc implies*(permission: Permission): jboolean
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc getName*(): string
  proc getActions*(): string
  proc newPermissionCollection*(): PermissionCollection
  proc toString*(): string

