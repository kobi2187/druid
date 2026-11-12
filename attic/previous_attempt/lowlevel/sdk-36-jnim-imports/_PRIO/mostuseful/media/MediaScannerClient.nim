import jnim

jclass android.media.MediaScannerClient* of JVMObject:
  proc scanFile*(path: string, lastModified: jlong, fileSize: jlong, isDirectory: jboolean, noMedia: jboolean)
  proc handleStringTag*(name: string, value: string)
  proc setMimeType*(mimeType: string)

