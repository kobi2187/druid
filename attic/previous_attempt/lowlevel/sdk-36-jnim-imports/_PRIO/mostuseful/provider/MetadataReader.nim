import jnim

jclass android.provider.MetadataReader* of JVMObject:
  proc isSupportedMimeType*(mimeType: string): jboolean {.`static`.}
  proc getMetadata*(metadata: Bundle, stream: InputStream, mimeType: string, tags: seq[string]) {.`static`.}

