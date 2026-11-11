import jnim

jclass android.media.MediaExtractor* of JVMObject:
  proc setDataSource*(dataSource: MediaDataSource)
  proc setDataSource*(context: Context, uri: Uri, headers: Map[string, string])
  proc setDataSource*(path: string, headers: Map[string, string])
  proc setDataSource*(path: string)
  proc setDataSource*(afd: AssetFileDescriptor)
  proc setDataSource*(fd: FileDescriptor)
  proc setDataSource*(fd: FileDescriptor, offset: jlong, length: jlong)
  proc setMediaCas*(mediaCas: MediaCas)
  proc getCasInfo*(index: jint): CasInfo
  proc release*()
  proc getTrackCount*(): jint
  proc getDrmInitData*(): DrmInitData
  proc getAudioPresentations*(trackIndex: jint): List[AudioPresentation]
  proc getPsshInfo*(): Map[UUID, seq[jbyte]]
  proc getTrackFormat*(index: jint): MediaFormat
  proc selectTrack*(index: jint)
  proc unselectTrack*(index: jint)
  proc seekTo*(timeUs: jlong, mode: jint)
  proc advance*(): jboolean
  proc readSampleData*(byteBuf: ByteBuffer, offset: jint): jint
  proc getSampleTrackIndex*(): jint
  proc getSampleTime*(): jlong
  proc getSampleSize*(): jlong
  proc getSampleFlags*(): jint
  proc getSampleCryptoInfo*(info: MediaCodec.CryptoInfo): jboolean
  proc getCachedDuration*(): jlong
  proc hasCacheReachedEndOfStream*(): jboolean
  proc setLogSessionId*(logSessionId: LogSessionId)
  proc getLogSessionId*(): LogSessionId
  proc getMetrics*(): PersistableBundle
  SEEK_TO_PREVIOUS_SYNC*: jint {.`static`.}
  SEEK_TO_NEXT_SYNC*: jint {.`static`.}
  SEEK_TO_CLOSEST_SYNC*: jint {.`static`.}
  SAMPLE_FLAG_SYNC*: jint {.`static`.}
  SAMPLE_FLAG_ENCRYPTED*: jint {.`static`.}
  SAMPLE_FLAG_PARTIAL_FRAME*: jint {.`static`.}

jclass android.media.MediaExtractor.CasInfo* of JVMObject:
  proc getSystemId*(): jint
  proc getPrivateData*(): seq[jbyte]
  proc getSession*(): MediaCas.Session

jclass android.media.CasInfo* of JVMObject:
  proc getSystemId*(): jint
  proc getPrivateData*(): seq[jbyte]
  proc getSession*(): MediaCas.Session

jclass android.media.MetricsConstants* of JVMObject:
  FORMAT*: string {.`static`.}
  MIME_TYPE*: string {.`static`.}
  TRACKS*: string {.`static`.}

