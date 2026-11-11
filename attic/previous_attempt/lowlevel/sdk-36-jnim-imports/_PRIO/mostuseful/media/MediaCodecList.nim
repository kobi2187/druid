import jnim

jclass android.media.MediaCodecList* of JVMObject:
  proc getCodecCount*(): jint {.`static`.}
  proc getCodecInfoAt*(index: jint): MediaCodecInfo {.`static`.}
  proc getInfoFor*(codec: string): MediaCodecInfo {.`static`.}
  proc getCodecInfos*(): seq[MediaCodecInfo]
  proc findDecoderForFormat*(format: MediaFormat): string
  proc findEncoderForFormat*(format: MediaFormat): string
  REGULAR_CODECS*: jint {.`static`.}
  ALL_CODECS*: jint {.`static`.}

