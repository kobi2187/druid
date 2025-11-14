import jnim

jclass java.security.KeyPair* of JVMObject:
  proc getPublic*(): PublicKey
  proc getPrivate*(): PrivateKey

