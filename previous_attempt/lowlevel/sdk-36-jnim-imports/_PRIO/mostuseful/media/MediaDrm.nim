import jnim

jclass android.media.MediaDrm* of JVMObject:
  proc isCryptoSchemeSupported*(uuid: UUID): jboolean {.`static`.}
  proc isCryptoSchemeSupported*(uuid: UUID, mimeType: string): jboolean {.`static`.}
  proc isCryptoSchemeSupported*(uuid: UUID, mimeType: string, securityLevel: jint): jboolean {.`static`.}
  proc getSupportedCryptoSchemes*(): List[UUID] {.`static`.}
  proc setOnExpirationUpdateListener*(listener: OnExpirationUpdateListener, handler: Handler)
  proc setOnExpirationUpdateListener*(executor: Executor, listener: OnExpirationUpdateListener)
  proc clearOnExpirationUpdateListener*()
  proc setOnKeyStatusChangeListener*(listener: OnKeyStatusChangeListener, handler: Handler)
  proc setOnKeyStatusChangeListener*(executor: Executor, listener: OnKeyStatusChangeListener)
  proc clearOnKeyStatusChangeListener*()
  proc setOnSessionLostStateListener*(listener: OnSessionLostStateListener, handler: Handler)
  proc setOnSessionLostStateListener*(executor: Executor, listener: OnSessionLostStateListener)
  proc clearOnSessionLostStateListener*()
  proc setOnEventListener*(listener: OnEventListener)
  proc setOnEventListener*(listener: OnEventListener, handler: Handler)
  proc setOnEventListener*(executor: Executor, listener: OnEventListener)
  proc clearOnEventListener*()
  proc openSession*(): seq[jbyte]
  proc openSession*(level: jint): seq[jbyte]
  proc closeSession*(sessionId: seq[jbyte])
  proc getKeyRequest*(scope: seq[jbyte], init: seq[jbyte], mimeType: string, keyType: jint, optionalParameters: HashMap[string, string]): KeyRequest
  proc provideKeyResponse*(scope: seq[jbyte], response: seq[jbyte]): seq[jbyte]
  proc restoreKeys*(sessionId: seq[jbyte], keySetId: seq[jbyte])
  proc removeKeys*(sessionId: seq[jbyte])
  proc queryKeyStatus*(sessionId: seq[jbyte]): HashMap[string, string]
  proc getProvisionRequest*(): ProvisionRequest
  proc provideProvisionResponse*(response: seq[jbyte])
  proc getOfflineLicenseKeySetIds*(): List[seq[jbyte]]
  proc removeOfflineLicense*(keySetId: seq[jbyte])
  proc getOfflineLicenseState*(keySetId: seq[jbyte]): jint
  proc getSecureStops*(): List[seq[jbyte]]
  proc getSecureStopIds*(): List[seq[jbyte]]
  proc getSecureStop*(ssid: seq[jbyte]): seq[jbyte]
  proc releaseSecureStops*(ssRelease: seq[jbyte])
  proc removeSecureStop*(ssid: seq[jbyte])
  proc removeAllSecureStops*()
  proc releaseAllSecureStops*()
  proc getConnectedHdcpLevel*(): jint
  proc getMaxHdcpLevel*(): jint
  proc getOpenSessionCount*(): jint
  proc getMaxSessionCount*(): jint
  proc getMaxSecurityLevel*(): jint {.`static`.}
  proc getSecurityLevel*(sessionId: seq[jbyte]): jint
  proc getPropertyString*(propertyName: string): string
  proc setPropertyString*(propertyName: string, value: string)
  proc getPropertyByteArray*(propertyName: string): seq[jbyte]
  proc setPropertyByteArray*(propertyName: string, value: seq[jbyte])
  proc getMetrics*(): PersistableBundle
  proc getCryptoSession*(sessionId: seq[jbyte], cipherAlgorithm: string, macAlgorithm: string): CryptoSession
  proc getCertificateRequest*(certType: jint, certAuthority: string): CertificateRequest
  proc provideCertificateResponse*(response: seq[jbyte]): Certificate
  proc signRSA*(sessionId: seq[jbyte], algorithm: string, wrappedKey: seq[jbyte], message: seq[jbyte]): seq[jbyte]
  proc requiresSecureDecoder*(mime: string): jboolean
  proc requiresSecureDecoder*(mime: string, level: jint): jboolean
  proc close*()
  proc release*()
  proc native_release*()
  proc getPlaybackComponent*(sessionId: seq[jbyte]): PlaybackComponent
  proc getLogMessages*(): List[LogMessage]
  CERTIFICATE_TYPE_NONE*: jint {.`static`.}
  CERTIFICATE_TYPE_X509*: jint {.`static`.}
  EVENT_PROVISION_REQUIRED*: jint {.`static`.}
  EVENT_KEY_REQUIRED*: jint {.`static`.}
  EVENT_KEY_EXPIRED*: jint {.`static`.}
  EVENT_VENDOR_DEFINED*: jint {.`static`.}
  EVENT_SESSION_RECLAIMED*: jint {.`static`.}
  KEY_TYPE_STREAMING*: jint {.`static`.}
  KEY_TYPE_OFFLINE*: jint {.`static`.}
  KEY_TYPE_RELEASE*: jint {.`static`.}
  OFFLINE_LICENSE_STATE_UNKNOWN*: jint {.`static`.}
  OFFLINE_LICENSE_STATE_USABLE*: jint {.`static`.}
  OFFLINE_LICENSE_STATE_RELEASED*: jint {.`static`.}
  HDCP_LEVEL_UNKNOWN*: jint {.`static`.}
  HDCP_NONE*: jint {.`static`.}
  HDCP_V1*: jint {.`static`.}
  HDCP_V2*: jint {.`static`.}
  HDCP_V2_1*: jint {.`static`.}
  HDCP_V2_2*: jint {.`static`.}
  HDCP_V2_3*: jint {.`static`.}
  HDCP_NO_DIGITAL_OUTPUT*: jint {.`static`.}
  SECURITY_LEVEL_UNKNOWN*: jint {.`static`.}
  SECURITY_LEVEL_SW_SECURE_CRYPTO*: jint {.`static`.}
  SECURITY_LEVEL_SW_SECURE_DECODE*: jint {.`static`.}
  SECURITY_LEVEL_HW_SECURE_CRYPTO*: jint {.`static`.}
  SECURITY_LEVEL_HW_SECURE_DECODE*: jint {.`static`.}
  SECURITY_LEVEL_HW_SECURE_ALL*: jint {.`static`.}
  SECURITY_LEVEL_MAX*: jint {.`static`.}
  PROPERTY_VENDOR*: string {.`static`.}
  PROPERTY_VERSION*: string {.`static`.}
  PROPERTY_DESCRIPTION*: string {.`static`.}
  PROPERTY_ALGORITHMS*: string {.`static`.}
  PROPERTY_DEVICE_UNIQUE_ID*: string {.`static`.}

jclass android.media.MediaDrm.MediaDrmStateException* of JVMObject:
  proc getErrorCode*(): jint
  proc getVendorError*(): jint
  proc getOemError*(): jint
  proc getErrorContext*(): jint
  proc isTransient*(): jboolean
  proc getDiagnosticInfo*(): string

jclass android.media.MediaDrm.SessionException* of JVMObject:
  proc getErrorCode*(): jint
  proc getVendorError*(): jint
  proc getOemError*(): jint
  proc getErrorContext*(): jint
  proc isTransient*(): jboolean

jclass android.media.MediaDrm.KeyStatus* of JVMObject:
  proc getStatusCode*(): jint
  proc getKeyId*(): seq[jbyte]

jclass android.media.MediaDrm.KeyRequest* of JVMObject:
  proc getData*(): seq[jbyte]
  proc getDefaultUrl*(): string
  proc getRequestType*(): jint

jclass android.media.MediaDrm.ProvisionRequest* of JVMObject:
  proc getData*(): seq[jbyte]
  proc getDefaultUrl*(): string

jclass android.media.MediaDrm.CryptoSession* of JVMObject:
  proc encrypt*(keyid: seq[jbyte], input: seq[jbyte], iv: seq[jbyte]): seq[jbyte]
  proc decrypt*(keyid: seq[jbyte], input: seq[jbyte], iv: seq[jbyte]): seq[jbyte]
  proc sign*(keyid: seq[jbyte], message: seq[jbyte]): seq[jbyte]
  proc verify*(keyid: seq[jbyte], message: seq[jbyte], signature: seq[jbyte]): jboolean

jclass android.media.MediaDrm.CertificateRequest* of JVMObject:
  proc getData*(): seq[jbyte]
  proc getDefaultUrl*(): string

jclass android.media.MediaDrm.Certificate* of JVMObject:
  proc getWrappedPrivateKey*(): seq[jbyte]
  proc getContent*(): seq[jbyte]

jclass android.media.MediaDrm.PlaybackComponent* of JVMObject:
  proc setLogSessionId*(logSessionId: LogSessionId)
  proc getLogSessionId*(): LogSessionId

jclass android.media.MediaDrm.LogMessage* of JVMObject:
  proc getTimestampMillis*(): jlong
  proc getPriority*(): jint
  proc getMessage*(): string
  proc toString*(): string

jclass android.media.ErrorCodes* of JVMObject:
  ERROR_UNKNOWN*: jint {.`static`.}
  ERROR_NO_KEY*: jint {.`static`.}
  ERROR_KEY_EXPIRED*: jint {.`static`.}
  ERROR_RESOURCE_BUSY*: jint {.`static`.}
  ERROR_INSUFFICIENT_OUTPUT_PROTECTION*: jint {.`static`.}
  ERROR_SESSION_NOT_OPENED*: jint {.`static`.}
  ERROR_UNSUPPORTED_OPERATION*: jint {.`static`.}
  ERROR_INSUFFICIENT_SECURITY*: jint {.`static`.}
  ERROR_FRAME_TOO_LARGE*: jint {.`static`.}
  ERROR_LOST_STATE*: jint {.`static`.}
  ERROR_CERTIFICATE_MALFORMED*: jint {.`static`.}
  ERROR_CERTIFICATE_MISSING*: jint {.`static`.}
  ERROR_CRYPTO_LIBRARY*: jint {.`static`.}
  ERROR_GENERIC_OEM*: jint {.`static`.}
  ERROR_GENERIC_PLUGIN*: jint {.`static`.}
  ERROR_INIT_DATA*: jint {.`static`.}
  ERROR_KEY_NOT_LOADED*: jint {.`static`.}
  ERROR_LICENSE_PARSE*: jint {.`static`.}
  ERROR_LICENSE_POLICY*: jint {.`static`.}
  ERROR_LICENSE_RELEASE*: jint {.`static`.}
  ERROR_LICENSE_REQUEST_REJECTED*: jint {.`static`.}
  ERROR_LICENSE_RESTORE*: jint {.`static`.}
  ERROR_LICENSE_STATE*: jint {.`static`.}
  ERROR_MEDIA_FRAMEWORK*: jint {.`static`.}
  ERROR_PROVISIONING_CERTIFICATE*: jint {.`static`.}
  ERROR_PROVISIONING_CONFIG*: jint {.`static`.}
  ERROR_PROVISIONING_PARSE*: jint {.`static`.}
  ERROR_PROVISIONING_REQUEST_REJECTED*: jint {.`static`.}
  ERROR_PROVISIONING_RETRY*: jint {.`static`.}
  ERROR_RESOURCE_CONTENTION*: jint {.`static`.}
  ERROR_SECURE_STOP_RELEASE*: jint {.`static`.}
  ERROR_STORAGE_READ*: jint {.`static`.}
  ERROR_STORAGE_WRITE*: jint {.`static`.}
  ERROR_ZERO_SUBSAMPLES*: jint {.`static`.}

jclass android.media.MediaDrmStateException* of IllegalStateException:
  proc getErrorCode*(): jint
  proc getVendorError*(): jint
  proc getOemError*(): jint
  proc getErrorContext*(): jint
  proc isTransient*(): jboolean
  proc getDiagnosticInfo*(): string

jclass android.media.SessionException* of RuntimeException:
  proc getErrorCode*(): jint
  proc getVendorError*(): jint
  proc getOemError*(): jint
  proc getErrorContext*(): jint
  proc isTransient*(): jboolean
  ERROR_UNKNOWN*: jint {.`static`.}
  ERROR_RESOURCE_CONTENTION*: jint {.`static`.}



jclass android.media.KeyStatus* of JVMObject:
  proc getStatusCode*(): jint
  proc getKeyId*(): seq[jbyte]
  STATUS_USABLE*: jint {.`static`.}
  STATUS_EXPIRED*: jint {.`static`.}
  STATUS_OUTPUT_NOT_ALLOWED*: jint {.`static`.}
  STATUS_PENDING*: jint {.`static`.}
  STATUS_INTERNAL_ERROR*: jint {.`static`.}
  STATUS_USABLE_IN_FUTURE*: jint {.`static`.}


jclass android.media.KeyRequest* of JVMObject:
  proc getData*(): seq[jbyte]
  proc getDefaultUrl*(): string
  proc getRequestType*(): jint
  REQUEST_TYPE_INITIAL*: jint {.`static`.}
  REQUEST_TYPE_RENEWAL*: jint {.`static`.}
  REQUEST_TYPE_RELEASE*: jint {.`static`.}
  REQUEST_TYPE_NONE*: jint {.`static`.}
  REQUEST_TYPE_UPDATE*: jint {.`static`.}

jclass android.media.ProvisionRequest* of JVMObject:
  proc getData*(): seq[jbyte]
  proc getDefaultUrl*(): string

jclass android.media.CryptoSession* of JVMObject:
  proc encrypt*(keyid: seq[jbyte], input: seq[jbyte], iv: seq[jbyte]): seq[jbyte]
  proc decrypt*(keyid: seq[jbyte], input: seq[jbyte], iv: seq[jbyte]): seq[jbyte]
  proc sign*(keyid: seq[jbyte], message: seq[jbyte]): seq[jbyte]
  proc verify*(keyid: seq[jbyte], message: seq[jbyte], signature: seq[jbyte]): jboolean

jclass android.media.CertificateRequest* of JVMObject:
  proc getData*(): seq[jbyte]
  proc getDefaultUrl*(): string

jclass android.media.Certificate* of JVMObject:
  proc getWrappedPrivateKey*(): seq[jbyte]
  proc getContent*(): seq[jbyte]

jclass android.media.MetricsConstants* of JVMObject:
  OPEN_SESSION_OK_COUNT*: string {.`static`.}
  OPEN_SESSION_ERROR_COUNT*: string {.`static`.}
  OPEN_SESSION_ERROR_LIST*: string {.`static`.}
  CLOSE_SESSION_OK_COUNT*: string {.`static`.}
  CLOSE_SESSION_ERROR_COUNT*: string {.`static`.}
  CLOSE_SESSION_ERROR_LIST*: string {.`static`.}
  SESSION_START_TIMES_MS*: string {.`static`.}
  SESSION_END_TIMES_MS*: string {.`static`.}
  GET_KEY_REQUEST_OK_COUNT*: string {.`static`.}
  GET_KEY_REQUEST_ERROR_COUNT*: string {.`static`.}
  GET_KEY_REQUEST_ERROR_LIST*: string {.`static`.}
  GET_KEY_REQUEST_OK_TIME_MICROS*: string {.`static`.}
  PROVIDE_KEY_RESPONSE_OK_COUNT*: string {.`static`.}
  PROVIDE_KEY_RESPONSE_ERROR_COUNT*: string {.`static`.}
  PROVIDE_KEY_RESPONSE_ERROR_LIST*: string {.`static`.}
  PROVIDE_KEY_RESPONSE_OK_TIME_MICROS*: string {.`static`.}
  GET_PROVISION_REQUEST_OK_COUNT*: string {.`static`.}
  GET_PROVISION_REQUEST_ERROR_COUNT*: string {.`static`.}
  GET_PROVISION_REQUEST_ERROR_LIST*: string {.`static`.}
  PROVIDE_PROVISION_RESPONSE_OK_COUNT*: string {.`static`.}
  PROVIDE_PROVISION_RESPONSE_ERROR_COUNT*: string {.`static`.}
  PROVIDE_PROVISION_RESPONSE_ERROR_LIST*: string {.`static`.}
  GET_DEVICE_UNIQUE_ID_OK_COUNT*: string {.`static`.}
  GET_DEVICE_UNIQUE_ID_ERROR_COUNT*: string {.`static`.}
  GET_DEVICE_UNIQUE_ID_ERROR_LIST*: string {.`static`.}
  KEY_STATUS_EXPIRED_COUNT*: string {.`static`.}
  KEY_STATUS_INTERNAL_ERROR_COUNT*: string {.`static`.}
  KEY_STATUS_OUTPUT_NOT_ALLOWED_COUNT*: string {.`static`.}
  KEY_STATUS_PENDING_COUNT*: string {.`static`.}
  KEY_STATUS_USABLE_COUNT*: string {.`static`.}
  EVENT_PROVISION_REQUIRED_COUNT*: string {.`static`.}
  EVENT_KEY_NEEDED_COUNT*: string {.`static`.}
  EVENT_KEY_EXPIRED_COUNT*: string {.`static`.}
  EVENT_VENDOR_DEFINED_COUNT*: string {.`static`.}
  EVENT_SESSION_RECLAIMED_COUNT*: string {.`static`.}

jclass android.media.PlaybackComponent* of JVMObject:
  proc setLogSessionId*(logSessionId: LogSessionId)
  proc getLogSessionId*(): LogSessionId

jclass android.media.LogMessage* of JVMObject:
  proc getTimestampMillis*(): jlong
  proc getPriority*(): jint
  proc getMessage*(): string
  proc toString*(): string

