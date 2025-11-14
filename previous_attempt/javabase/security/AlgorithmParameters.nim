import jnim

jclass java.security.AlgorithmParameters* of JVMObject:
  proc getAlgorithm*(): string
  proc getInstance*(algorithm: string): AlgorithmParameters {.`static`.}
  proc getInstance*(algorithm: string, provider: string): AlgorithmParameters {.`static`.}
  proc getInstance*(algorithm: string, provider: Provider): AlgorithmParameters {.`static`.}
  proc getProvider*(): Provider
  proc init*(paramSpec: AlgorithmParameterSpec)
  proc init*(params: seq[jbyte])
  proc init*(params: seq[jbyte], format: string)
  proc getParameterSpec*(paramSpec: Class[T]): T
  proc getEncoded*(): seq[jbyte]
  proc getEncoded*(format: string): seq[jbyte]
  proc toString*(): string

