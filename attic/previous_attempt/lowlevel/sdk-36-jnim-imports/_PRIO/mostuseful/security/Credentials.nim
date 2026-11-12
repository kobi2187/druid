import jnim

jclass android.security.Credentials* of JVMObject:
  proc convertToPem*(objects: Certificate): seq[jbyte] {.`static`.}
  proc convertFromPem*(bytes: seq[jbyte]): List[X509Certificate] {.`static`.}
  INSTALL_ACTION*: string {.`static`.}
  INSTALL_AS_USER_ACTION*: string {.`static`.}
  ACTION_MANAGE_CREDENTIALS*: string {.`static`.}
  CA_CERTIFICATE*: string {.`static`.}
  USER_CERTIFICATE*: string {.`static`.}
  USER_PRIVATE_KEY*: string {.`static`.}
  USER_SECRET_KEY*: string {.`static`.}
  VPN*: string {.`static`.}
  PLATFORM_VPN*: string {.`static`.}
  WIFI*: string {.`static`.}
  APP_SOURCE_CERTIFICATE*: string {.`static`.}
  LOCKDOWN_VPN*: string {.`static`.}
  CERTIFICATE_USAGE_CA*: string {.`static`.}
  CERTIFICATE_USAGE_USER*: string {.`static`.}
  CERTIFICATE_USAGE_WIFI*: string {.`static`.}
  CERTIFICATE_USAGE_APP_SOURCE*: string {.`static`.}
  EXTRA_PUBLIC_KEY*: string {.`static`.}
  EXTRA_PRIVATE_KEY*: string {.`static`.}
  EXTENSION_CRT*: string {.`static`.}
  EXTENSION_P12*: string {.`static`.}
  EXTENSION_CER*: string {.`static`.}
  EXTENSION_PFX*: string {.`static`.}
  EXTRA_INSTALL_AS_UID*: string {.`static`.}
  EXTRA_CERTIFICATE_USAGE*: string {.`static`.}
  EXTRA_USER_KEY_ALIAS*: string {.`static`.}
  EXTRA_USER_PRIVATE_KEY_DATA*: string {.`static`.}
  EXTRA_USER_CERTIFICATE_DATA*: string {.`static`.}
  EXTRA_CA_CERTIFICATES_DATA*: string {.`static`.}

