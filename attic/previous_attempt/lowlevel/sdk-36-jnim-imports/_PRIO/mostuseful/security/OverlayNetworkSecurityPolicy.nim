import jnim

jclass android.security.OverlayNetworkSecurityPolicy* of NetworkSecurityPolicy:
  proc isCleartextTrafficPermitted*(): jboolean
  proc isCleartextTrafficPermitted*(hostname: string): jboolean
  proc isCertificateTransparencyVerificationRequired*(hostname: string): jboolean

