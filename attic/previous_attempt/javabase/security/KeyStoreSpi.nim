import jnim

jclass java.security.KeyStoreSpi* of JVMObject:
  proc engineGetKey*(alias: string, password: seq[jchar]): Key
  proc engineGetCertificateChain*(alias: string): seq[Certificate]
  proc engineGetCertificate*(alias: string): Certificate
  proc engineGetCreationDate*(alias: string): Date
  proc engineSetKeyEntry*(alias: string, key: Key, password: seq[jchar], chain: seq[Certificate])
  proc engineSetKeyEntry*(alias: string, key: seq[jbyte], chain: seq[Certificate])
  proc engineSetCertificateEntry*(alias: string, cert: Certificate)
  proc engineDeleteEntry*(alias: string)
  proc engineAliases*(): Enumeration[string]
  proc engineContainsAlias*(alias: string): jboolean
  proc engineSize*(): jint
  proc engineIsKeyEntry*(alias: string): jboolean
  proc engineIsCertificateEntry*(alias: string): jboolean
  proc engineGetCertificateAlias*(cert: Certificate): string
  proc engineStore*(stream: OutputStream, password: seq[jchar])
  proc engineStore*(param: KeyStore.LoadStoreParameter)
  proc engineLoad*(stream: InputStream, password: seq[jchar])
  proc engineLoad*(param: KeyStore.LoadStoreParameter)
  proc engineGetAttributes*(alias: string): Set[Entry.Attribute]
  proc engineGetEntry*(alias: string, protParam: KeyStore.ProtectionParameter): KeyStore.Entry
  proc engineSetEntry*(alias: string, entry: KeyStore.Entry, protParam: KeyStore.ProtectionParameter)
  proc engineEntryInstanceOf*(alias: string, entryClass: Class[? extends KeyStore.Entry]): jboolean
  proc engineProbe*(stream: InputStream): jboolean

