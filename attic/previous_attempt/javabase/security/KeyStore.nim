import jnim

jclass java.security.KeyStore* of JVMObject:
  proc getInstance*(type: string): KeyStore {.`static`.}
  proc getInstance*(type: string, provider: string): KeyStore {.`static`.}
  proc getInstance*(type: string, provider: Provider): KeyStore {.`static`.}
  proc getDefaultType*(): string {.`static`.}
  proc getProvider*(): Provider
  proc getType*(): string
  proc getAttributes*(alias: string): Set[Entry.Attribute]
  proc getKey*(alias: string, password: seq[jchar]): Key
  proc getCertificateChain*(alias: string): seq[Certificate]
  proc getCertificate*(alias: string): Certificate
  proc getCreationDate*(alias: string): Date
  proc setKeyEntry*(alias: string, key: Key, password: seq[jchar], chain: seq[Certificate])
  proc setKeyEntry*(alias: string, key: seq[jbyte], chain: seq[Certificate])
  proc setCertificateEntry*(alias: string, cert: Certificate)
  proc deleteEntry*(alias: string)
  proc aliases*(): Enumeration[string]
  proc containsAlias*(alias: string): jboolean
  proc size*(): jint
  proc isKeyEntry*(alias: string): jboolean
  proc isCertificateEntry*(alias: string): jboolean
  proc getCertificateAlias*(cert: Certificate): string
  proc store*(stream: OutputStream, password: seq[jchar])
  proc store*(param: LoadStoreParameter)
  proc load*(stream: InputStream, password: seq[jchar])
  proc load*(param: LoadStoreParameter)
  proc getEntry*(alias: string, protParam: ProtectionParameter): Entry
  proc setEntry*(alias: string, entry: Entry, protParam: ProtectionParameter)
  proc entryInstanceOf*(alias: string, entryClass: Class[? extends KeyStore.Entry]): jboolean
  proc getInstance*(file: File, password: seq[jchar]): KeyStore {.`static`.}
  proc getInstance*(file: File, param: LoadStoreParameter): KeyStore {.`static`.}

jclass java.security.KeyStore.LoadStoreParameter* of JVMObject:

jclass java.security.KeyStore.ProtectionParameter* of JVMObject:

jclass java.security.KeyStore.PasswordProtection* of JVMObject:
  proc getProtectionAlgorithm*(): string
  proc getProtectionParameters*(): AlgorithmParameterSpec
  proc getPassword*(): seq[jchar]
  proc destroy*()
  proc isDestroyed*(): jboolean

jclass java.security.KeyStore.CallbackHandlerProtection* of JVMObject:
  proc getCallbackHandler*(): CallbackHandler

jclass java.security.KeyStore.Entry* of JVMObject:

jclass java.security.KeyStore.PrivateKeyEntry* of JVMObject:
  proc getPrivateKey*(): PrivateKey
  proc getCertificateChain*(): seq[Certificate]
  proc getCertificate*(): Certificate
  proc getAttributes*(): Set[Attribute]
  proc toString*(): string

jclass java.security.KeyStore.SecretKeyEntry* of JVMObject:
  proc getSecretKey*(): SecretKey
  proc getAttributes*(): Set[Attribute]
  proc toString*(): string

jclass java.security.KeyStore.TrustedCertificateEntry* of JVMObject:
  proc getTrustedCertificate*(): Certificate
  proc getAttributes*(): Set[Attribute]
  proc toString*(): string

jclass java.security.KeyStore.Builder* of JVMObject:
  proc getKeyStore*(): KeyStore
  proc getProtectionParameter*(alias: string): ProtectionParameter
  proc newInstance*(keyStore: KeyStore, protectionParameter: ProtectionParameter): Builder {.`static`.}
  proc newInstance*(type: string, provider: Provider, file: File, protection: ProtectionParameter): Builder {.`static`.}
  proc newInstance*(file: File, protection: ProtectionParameter): Builder {.`static`.}
  proc newInstance*(type: string, provider: Provider, protection: ProtectionParameter): Builder {.`static`.}

jclass java.security.LoadStoreParameter* of JVMObject:

jclass java.security.ProtectionParameter* of JVMObject:

jclass java.security.PasswordProtection* of JVMObject:
  proc getProtectionAlgorithm*(): string
  proc getProtectionParameters*(): AlgorithmParameterSpec
  proc getPassword*(): seq[jchar]
  proc destroy*()
  proc isDestroyed*(): jboolean

jclass java.security.CallbackHandlerProtection* of JVMObject:
  proc getCallbackHandler*(): CallbackHandler

jclass java.security.Entry* of JVMObject:

jclass java.security.PrivateKeyEntry* of JVMObject:
  proc getPrivateKey*(): PrivateKey
  proc getCertificateChain*(): seq[Certificate]
  proc getCertificate*(): Certificate
  proc getAttributes*(): Set[Attribute]
  proc toString*(): string

jclass java.security.SecretKeyEntry* of JVMObject:
  proc getSecretKey*(): SecretKey
  proc getAttributes*(): Set[Attribute]
  proc toString*(): string

jclass java.security.TrustedCertificateEntry* of JVMObject:
  proc getTrustedCertificate*(): Certificate
  proc getAttributes*(): Set[Attribute]
  proc toString*(): string

jclass java.security.Builder* of JVMObject:
  proc getKeyStore*(): KeyStore
  proc getProtectionParameter*(alias: string): ProtectionParameter
  proc newInstance*(keyStore: KeyStore, protectionParameter: ProtectionParameter): Builder {.`static`.}
  proc newInstance*(type: string, provider: Provider, file: File, protection: ProtectionParameter): Builder {.`static`.}
  proc newInstance*(file: File, protection: ProtectionParameter): Builder {.`static`.}
  proc newInstance*(type: string, provider: Provider, protection: ProtectionParameter): Builder {.`static`.}

