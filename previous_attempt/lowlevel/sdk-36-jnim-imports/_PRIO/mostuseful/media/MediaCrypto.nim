import jnim

jclass android.media.MediaCrypto* of JVMObject:
  proc isCryptoSchemeSupported*(uuid: UUID): jboolean {.`static`.}
  proc requiresSecureDecoderComponent*(mime: string): jboolean
  proc setMediaDrmSession*(sessionId: seq[jbyte])
  proc release*()

