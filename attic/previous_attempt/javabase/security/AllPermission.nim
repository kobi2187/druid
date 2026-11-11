import jnim

jclass java.security.AllPermission* of Permission:
  proc implies*(p: Permission): jboolean
  proc equals*(obj: JObject): jboolean
  proc hashCode*(): jint
  proc getActions*(): string
  proc newPermissionCollection*(): PermissionCollection

