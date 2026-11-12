import jnim

jclass java.security.Policy* of JVMObject:
  proc getPolicy*(): Policy {.`static`.}
  proc setPolicy*(p: Policy) {.`static`.}
  proc getInstance*(type: string, params: Policy.Parameters): Policy {.`static`.}
  proc getInstance*(type: string, params: Policy.Parameters, provider: string): Policy {.`static`.}
  proc getInstance*(type: string, params: Policy.Parameters, provider: Provider): Policy {.`static`.}
  proc getProvider*(): Provider
  proc getType*(): string
  proc getParameters*(): Policy.Parameters
  proc getPermissions*(codesource: CodeSource): PermissionCollection
  proc getPermissions*(domain: ProtectionDomain): PermissionCollection
  proc implies*(domain: ProtectionDomain, permission: Permission): jboolean
  proc refresh*()
  UNSUPPORTED_EMPTY_COLLECTION*: PermissionCollection {.`static`.}

jclass java.security.Policy.Parameters* of JVMObject:

jclass java.security.Parameters* of JVMObject:

