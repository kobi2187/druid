import jnim

jclass android.media.MediaScanner* of JVMObject:
  proc scanSingleFile*(path: string, mimeType: string): Uri
  proc isNoMediaPath*(path: string): jboolean {.`static`.}
  proc close*()

