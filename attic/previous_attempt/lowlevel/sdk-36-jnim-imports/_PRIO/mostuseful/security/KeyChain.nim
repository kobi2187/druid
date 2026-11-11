import jnim

jclass android.security.KeyChain* of JVMObject:
  proc createInstallIntent*(): Intent {.`static`.}
  proc createManageCredentialsIntent*(policy: AppUriAuthenticationPolicy): Intent {.`static`.}
  proc choosePrivateKeyAlias*(activity: Activity, response: KeyChainAliasCallback, keyTypes: seq[string], issuers: seq[Principal], host: string, port: jint, alias: string) {.`static`.}
  proc choosePrivateKeyAlias*(activity: Activity, response: KeyChainAliasCallback, keyTypes: seq[string], issuers: seq[Principal], uri: Uri, alias: string) {.`static`.}
  proc isCredentialManagementApp*(context: Context): jboolean {.`static`.}
  proc getCredentialManagementAppPolicy*(context: Context): AppUriAuthenticationPolicy {.`static`.}
  proc setCredentialManagementApp*(context: Context, packageName: string, authenticationPolicy: AppUriAuthenticationPolicy): jboolean {.`static`.}
  proc removeCredentialManagementApp*(context: Context): jboolean {.`static`.}
  proc getPrivateKey*(context: Context, alias: string): PrivateKey {.`static`.}
  proc getGrantString*(key: KeyDescriptor): string {.`static`.}
  proc getKeyPair*(context: Context, alias: string): KeyPair {.`static`.}
  proc getCertificateChain*(context: Context, alias: string): seq[X509Certificate] {.`static`.}
  proc isKeyAlgorithmSupported*(algorithm: string): jboolean {.`static`.}
  proc isBoundKeyAlgorithm*(algorithm: string): jboolean {.`static`.}
  proc toCertificate*(bytes: seq[jbyte]): X509Certificate {.`static`.}
  proc toCertificates*(bytes: seq[jbyte]): Collection[X509Certificate] {.`static`.}
  proc bind*(context: Context): KeyChainConnection {.`static`.}
  proc bindAsUser*(context: Context, user: UserHandle): KeyChainConnection {.`static`.}
  proc getWifiKeyGrantAsUser*(context: Context, user: UserHandle, alias: string): string {.`static`.}
  proc hasWifiKeyGrantAsUser*(context: Context, user: UserHandle, alias: string): jboolean {.`static`.}
  proc bindAsUser*(context: Context, handler: Handler, user: UserHandle): KeyChainConnection {.`static`.}
  LOG*: string {.`static`.}
  ACCOUNT_TYPE*: string {.`static`.}
  EXTRA_RESPONSE*: string {.`static`.}
  EXTRA_URI*: string {.`static`.}
  EXTRA_ALIAS*: string {.`static`.}
  EXTRA_SENDER*: string {.`static`.}
  EXTRA_KEY_TYPES*: string {.`static`.}
  EXTRA_ISSUERS*: string {.`static`.}
  EXTRA_NAME*: string {.`static`.}
  EXTRA_CERTIFICATE*: string {.`static`.}
  EXTRA_PKCS12*: string {.`static`.}
  EXTRA_AUTHENTICATION_POLICY*: string {.`static`.}
  ACTION_STORAGE_CHANGED*: string {.`static`.}
  ACTION_KEYCHAIN_CHANGED*: string {.`static`.}
  ACTION_TRUST_STORE_CHANGED*: string {.`static`.}
  ACTION_KEY_ACCESS_CHANGED*: string {.`static`.}
  EXTRA_KEY_ALIAS*: string {.`static`.}
  EXTRA_KEY_ACCESSIBLE*: string {.`static`.}
  KEY_GEN_SUCCESS*: jint {.`static`.}
  KEY_GEN_MISSING_ALIAS*: jint {.`static`.}
  KEY_GEN_SUPERFLUOUS_ATTESTATION_CHALLENGE*: jint {.`static`.}
  KEY_GEN_NO_SUCH_ALGORITHM*: jint {.`static`.}
  KEY_GEN_INVALID_ALGORITHM_PARAMETERS*: jint {.`static`.}
  KEY_GEN_NO_KEYSTORE_PROVIDER*: jint {.`static`.}
  KEY_GEN_STRONGBOX_UNAVAILABLE*: jint {.`static`.}
  KEY_GEN_FAILURE*: jint {.`static`.}
  KEY_ATTESTATION_SUCCESS*: jint {.`static`.}
  KEY_ATTESTATION_MISSING_CHALLENGE*: jint {.`static`.}
  KEY_ATTESTATION_CANNOT_COLLECT_DATA*: jint {.`static`.}
  KEY_ATTESTATION_CANNOT_ATTEST_IDS*: jint {.`static`.}
  KEY_ATTESTATION_FAILURE*: jint {.`static`.}
  KEY_ALIAS_SELECTION_DENIED*: string {.`static`.}
  GRANT_ALIAS_PREFIX*: string {.`static`.}

jclass android.security.KeyChain.KeyChainConnection* of JVMObject:
  proc close*()
  proc getService*(): IKeyChainService

jclass android.security.KeyChainConnection* of JVMObject:
  proc close*()
  proc getService*(): IKeyChainService

