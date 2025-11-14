import jnim

jclass java.security.PermissionCollection* of JVMObject:
  proc add*(permission: Permission)
  proc implies*(permission: Permission): jboolean
  proc elements*(): Enumeration[Permission]
  proc elementsAsStream*(): Stream[Permission]
  proc setReadOnly*()
  proc isReadOnly*(): jboolean
  proc toString*(): string

