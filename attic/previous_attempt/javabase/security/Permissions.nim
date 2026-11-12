import jnim

jclass java.security.Permissions* of PermissionCollection:
  proc add*(permission: Permission)
  proc implies*(permission: Permission): jboolean
  proc elements*(): Enumeration[Permission]

