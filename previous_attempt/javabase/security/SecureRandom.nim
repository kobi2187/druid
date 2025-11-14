import jnim

jclass java.security.SecureRandom* of Random:
  proc getInstance*(algorithm: string): SecureRandom {.`static`.}
  proc getInstance*(algorithm: string, provider: string): SecureRandom {.`static`.}
  proc getInstance*(algorithm: string, provider: Provider): SecureRandom {.`static`.}
  proc getInstance*(algorithm: string, params: SecureRandomParameters): SecureRandom {.`static`.}
  proc getInstance*(algorithm: string, params: SecureRandomParameters, provider: string): SecureRandom {.`static`.}
  proc getInstance*(algorithm: string, params: SecureRandomParameters, provider: Provider): SecureRandom {.`static`.}
  proc getProvider*(): Provider
  proc getAlgorithm*(): string
  proc toString*(): string
  proc getParameters*(): SecureRandomParameters
  proc setSeed*(seed: seq[jbyte])
  proc setSeed*(seed: jlong)
  proc nextBytes*(bytes: seq[jbyte])
  proc nextBytes*(bytes: seq[jbyte], params: SecureRandomParameters)
  proc getSeed*(numBytes: jint): seq[jbyte] {.`static`.}
  proc generateSeed*(numBytes: jint): seq[jbyte]
  proc getInstanceStrong*(): SecureRandom {.`static`.}
  proc reseed*()
  proc reseed*(params: SecureRandomParameters)

