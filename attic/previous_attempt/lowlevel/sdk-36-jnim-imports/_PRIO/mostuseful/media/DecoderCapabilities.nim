import jnim

jclass android.media.DecoderCapabilities* of JVMObject:
  proc getVideoDecoders*(): List[VideoDecoder] {.`static`.}
  proc getAudioDecoders*(): List[AudioDecoder] {.`static`.}

