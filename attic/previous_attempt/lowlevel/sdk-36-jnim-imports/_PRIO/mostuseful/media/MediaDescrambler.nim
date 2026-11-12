import jnim

jclass android.media.MediaDescrambler* of JVMObject:
  proc isAidlHal*(): jboolean
  proc requiresSecureDecoderComponent*(mime: string): jboolean
  proc setMediaCasSession*(session: MediaCas.Session)
  proc descramble*(srcBuf: ByteBuffer, dstBuf: ByteBuffer, cryptoInfo: MediaCodec.CryptoInfo): jint
  proc close*()
  SCRAMBLE_CONTROL_UNSCRAMBLED*: jbyte {.`static`.}
  SCRAMBLE_CONTROL_RESERVED*: jbyte {.`static`.}
  SCRAMBLE_CONTROL_EVEN_KEY*: jbyte {.`static`.}
  SCRAMBLE_CONTROL_ODD_KEY*: jbyte {.`static`.}
  SCRAMBLE_FLAG_PES_HEADER*: jbyte {.`static`.}

