import jnim

jclass android.security.KeyStore2* of JVMObject:
  proc getInstance*(): KeyStore2 {.`static`.}
  proc list*(domain: jint, namespace: jlong): seq[KeyDescriptor]
  proc listBatch*(domain: jint, namespace: jlong, startPastAlias: string): seq[KeyDescriptor]
  proc makeKeystoreEngineGrantString*(grantId: jlong): string {.`static`.}
  proc keystoreEngineGrantString2KeyDescriptor*(grantString: string): KeyDescriptor {.`static`.}
  proc grant*(descriptor: KeyDescriptor, granteeUid: jint, accessVector: jint): KeyDescriptor
  proc ungrant*(descriptor: KeyDescriptor, granteeUid: jint)
  proc getKeyEntry*(descriptor: KeyDescriptor): KeyEntryResponse
  proc getSecurityLevel*(securityLevel: jint): KeyStoreSecurityLevel
  proc updateSubcomponents*(key: KeyDescriptor, publicCert: seq[jbyte], publicCertChain: seq[jbyte])
  proc deleteKey*(descriptor: KeyDescriptor)
  proc getNumberOfEntries*(domain: jint, namespace: jlong): jint
  proc getSupplementaryAttestationInfo*(tag: jint): seq[jbyte]

