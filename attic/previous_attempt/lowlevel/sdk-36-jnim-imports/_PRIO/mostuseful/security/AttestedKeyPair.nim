import jnim

jclass android.security.AttestedKeyPair* of JVMObject:
  proc getKeyPair*(): KeyPair
  proc getAttestationRecord*(): List[Certificate]

