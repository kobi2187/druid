import jnim

jclass android.security.KeyPairGeneratorSpec* of JVMObject:
  proc getContext*(): Context
  proc getKeystoreAlias*(): string
  proc getKeyType*(): string
  proc getKeySize*(): jint
  proc getAlgorithmParameterSpec*(): AlgorithmParameterSpec
  proc getSubjectDN*(): X500Principal
  proc getSerialNumber*(): BigInteger
  proc getStartDate*(): Date
  proc getEndDate*(): Date
  proc getFlags*(): jint
  proc isEncryptionRequired*(): jboolean

jclass android.security.KeyPairGeneratorSpec.Builder* of JVMObject:
  proc setAlias*(alias: string): Builder
  proc setKeyType*(keyType: string): Builder
  proc setKeySize*(keySize: jint): Builder
  proc setAlgorithmParameterSpec*(spec: AlgorithmParameterSpec): Builder
  proc setSubject*(subject: X500Principal): Builder
  proc setSerialNumber*(serialNumber: BigInteger): Builder
  proc setStartDate*(startDate: Date): Builder
  proc setEndDate*(endDate: Date): Builder
  proc setEncryptionRequired*(): Builder
  proc build*(): KeyPairGeneratorSpec

jclass android.security.Builder* of JVMObject:
  proc setAlias*(alias: string): Builder
  proc setKeyType*(keyType: string): Builder
  proc setKeySize*(keySize: jint): Builder
  proc setAlgorithmParameterSpec*(spec: AlgorithmParameterSpec): Builder
  proc setSubject*(subject: X500Principal): Builder
  proc setSerialNumber*(serialNumber: BigInteger): Builder
  proc setStartDate*(startDate: Date): Builder
  proc setEndDate*(endDate: Date): Builder
  proc setEncryptionRequired*(): Builder
  proc build*(): KeyPairGeneratorSpec

