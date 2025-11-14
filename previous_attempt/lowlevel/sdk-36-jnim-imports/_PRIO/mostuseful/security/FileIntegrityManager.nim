import jnim

jclass android.security.FileIntegrityManager* of JVMObject:
  proc isApkVeritySupported*(): jboolean
  proc setupFsVerity*(file: File)
  proc getFsVerityDigest*(file: File): seq[jbyte]
  proc isAppSourceCertificateTrusted*(certificate: X509Certificate): jboolean

