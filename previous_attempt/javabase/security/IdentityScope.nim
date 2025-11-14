import jnim

jclass java.security.IdentityScope* of Identity:
  proc getSystemScope*(): IdentityScope {.`static`.}
  proc size*(): jint
  proc getIdentity*(name: string): Identity
  proc getIdentity*(principal: Principal): Identity
  proc getIdentity*(key: PublicKey): Identity
  proc addIdentity*(identity: Identity)
  proc removeIdentity*(identity: Identity)
  proc identities*(): Enumeration[Identity]
  proc toString*(): string

