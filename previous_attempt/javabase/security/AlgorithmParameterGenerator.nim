import jnim

jclass java.security.AlgorithmParameterGenerator* of JVMObject:
  proc getAlgorithm*(): string
  proc getInstance*(algorithm: string): AlgorithmParameterGenerator {.`static`.}
  proc getInstance*(algorithm: string, provider: string): AlgorithmParameterGenerator {.`static`.}
  proc getInstance*(algorithm: string, provider: Provider): AlgorithmParameterGenerator {.`static`.}
  proc getProvider*(): Provider
  proc init*(size: jint)
  proc init*(size: jint, random: SecureRandom)
  proc init*(genParamSpec: AlgorithmParameterSpec)
  proc init*(genParamSpec: AlgorithmParameterSpec, random: SecureRandom)
  proc generateParameters*(): AlgorithmParameters

