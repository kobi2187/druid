import jnim

jclass java.security.KeyPairGeneratorSpi* of JVMObject:
  proc initialize*(keysize: jint, random: SecureRandom)
  proc initialize*(params: AlgorithmParameterSpec, random: SecureRandom)
  proc generateKeyPair*(): KeyPair

