import jnim

jclass android.security.NetworkSecurityPolicy* of JVMObject:
  proc getInstance*(): NetworkSecurityPolicy {.`static`.}
  proc isCleartextTrafficPermitted*(): jboolean
  proc isCleartextTrafficPermitted*(hostname: string): jboolean
  proc setCleartextTrafficPermitted*(permitted: jboolean)
  proc isCertificateTransparencyVerificationRequired*(hostname: string): jboolean
  proc handleTrustStorageUpdate*()
  proc getApplicationConfigForPackage*(context: Context, packageName: string): ApplicationConfig {.`static`.}

