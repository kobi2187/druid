import jnim

jclass java.security.Signer* of Identity:
  proc getPrivateKey*(): PrivateKey
  proc setKeyPair*(pair: KeyPair)
  proc toString*(): string

