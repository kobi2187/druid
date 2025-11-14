import jnim

jclass java.net.JarURLConnection* of URLConnection:
  proc getJarFileURL*(): URL
  proc getEntryName*(): string
  proc getJarFile*(): JarFile
  proc getManifest*(): Manifest
  proc getJarEntry*(): JarEntry
  proc getAttributes*(): Attributes
  proc getMainAttributes*(): Attributes
  proc getCertificates*(): seq[java.security.cert.Certificate]

