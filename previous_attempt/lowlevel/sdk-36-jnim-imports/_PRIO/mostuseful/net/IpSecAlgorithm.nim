import jnim

jclass android.net.IpSecAlgorithm* of JVMObject:
  proc getName*(): string
  proc getKey*(): seq[jbyte]
  proc getTruncationLengthBits*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(output:Parcel, flags: jint)
  proc getSupportedAlgorithms*(): Set[string] {.`static`.}
  proc loadAlgos*(systemResources: Resources): Set[string] {.`static`.}
  proc isAuthentication*(): jboolean
  proc isEncryption*(): jboolean
  proc isAead*(): jboolean
  proc toString*(): string
  proc equals*(lhs: IpSecAlgorithm, rhs: IpSecAlgorithm): jboolean {.`static`.}
  CRYPT_NULL*: string {.`static`.}
  CRYPT_AES_CBC*: string {.`static`.}
  CRYPT_AES_CTR*: string {.`static`.}
  AUTH_HMAC_MD5*: string {.`static`.}
  AUTH_HMAC_SHA1*: string {.`static`.}
  AUTH_HMAC_SHA256*: string {.`static`.}
  AUTH_HMAC_SHA384*: string {.`static`.}
  AUTH_HMAC_SHA512*: string {.`static`.}
  AUTH_AES_XCBC*: string {.`static`.}
  AUTH_AES_CMAC*: string {.`static`.}
  AUTH_CRYPT_AES_GCM*: string {.`static`.}
  AUTH_CRYPT_CHACHA20_POLY1305*: string {.`static`.}
  ALGO_TO_REQUIRED_FIRST_SDK*: Map[string, Integer] {.`static`.}
  CREATOR*: Parcelable.Creator[IpSecAlgorithm] {.`static`.}

