import jnim

jclass java.security.ProtectionDomain* of JVMObject:
  proc getCodeSource*(): CodeSource
  proc getClassLoader*(): ClassLoader
  proc getPrincipals*(): seq[Principal]
  proc getPermissions*(): PermissionCollection
  proc staticPermissionsOnly*(): jboolean
  proc implies*(perm: Permission): jboolean
  proc toString*(): string

