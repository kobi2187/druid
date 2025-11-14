import jnim

jclass android.media.MediaMuxer* of JVMObject:
  proc setOrientationHint*(degrees: jint)
  proc setLocation*(latitude: jfloat, longitude: jfloat)
  proc start*()
  proc stop*()
  proc addTrack*(format: MediaFormat): jint
  proc writeSampleData*(trackIndex: jint, byteBuf: ByteBuffer, bufferInfo: BufferInfo)
  proc release*()

jclass android.media.OutputFormat* of JVMObject:
  MUXER_OUTPUT_FIRST*: jint {.`static`.}
  MUXER_OUTPUT_MPEG_4*: jint {.`static`.}
  MUXER_OUTPUT_WEBM*: jint {.`static`.}
  MUXER_OUTPUT_3GPP*: jint {.`static`.}
  MUXER_OUTPUT_HEIF*: jint {.`static`.}
  MUXER_OUTPUT_OGG*: jint {.`static`.}
  MUXER_OUTPUT_LAST*: jint {.`static`.}

