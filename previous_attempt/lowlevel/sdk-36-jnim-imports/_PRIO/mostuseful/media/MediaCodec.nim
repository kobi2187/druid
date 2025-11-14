import jnim

jclass android.media.MediaCodec* of JVMObject:
  proc createDecoderByType*(type: string): MediaCodec {.`static`.}
  proc createEncoderByType*(type: string): MediaCodec {.`static`.}
  proc createByCodecName*(name: string): MediaCodec {.`static`.}
  proc createByCodecNameForClient*(name: string, clientPid: jint, clientUid: jint): MediaCodec {.`static`.}
  proc reset*()
  proc release*()
  proc getGloballyAvailableResources*(): List[GlobalResourceInfo] {.`static`.}
  proc configure*(format: MediaFormat, surface: Surface, crypto: MediaCrypto, flags: jint)
  proc configure*(format: MediaFormat, surface: Surface, flags: jint, descrambler: MediaDescrambler)
  proc getRequiredResources*(): List[InstanceResourceInfo]
  proc setOutputSurface*(surface: Surface)
  proc detachOutputSurface*()
  proc createPersistentInputSurface*(): Surface {.`static`.}
  proc setInputSurface*(surface: Surface)
  proc createInputSurface*(): Surface
  proc start*()
  proc stop*()
  proc flush*()
  proc queueInputBuffer*(index: jint, offset: jint, size: jint, presentationTimeUs: jlong, flags: jint)
  proc queueInputBuffers*(index: jint, bufferInfos: ArrayDeque[BufferInfo])
  proc queueSecureInputBuffer*(index: jint, offset: jint, info: CryptoInfo, presentationTimeUs: jlong, flags: jint)
  proc queueSecureInputBuffers*(index: jint, bufferInfos: ArrayDeque[BufferInfo], cryptoInfos: ArrayDeque[CryptoInfo])
  proc dequeueInputBuffer*(timeoutUs: jlong): jint
  proc mapHardwareBuffer*(hardwareBuffer: HardwareBuffer): Image {.`static`.}
  proc getQueueRequest*(index: jint): QueueRequest
  proc dequeueOutputBuffer*(info: BufferInfo, timeoutUs: jlong): jint
  proc releaseOutputBuffer*(index: jint, render: jboolean)
  proc releaseOutputBuffer*(index: jint, renderTimestampNs: jlong)
  proc signalEndOfInputStream*()
  proc getOutputFormat*(): MediaFormat
  proc getInputFormat*(): MediaFormat
  proc getOutputFormat*(index: jint): MediaFormat
  proc getInputBuffers*(): seq[ByteBuffer]
  proc getOutputBuffers*(): seq[ByteBuffer]
  proc getInputBuffer*(index: jint): ByteBuffer
  proc getInputImage*(index: jint): Image
  proc getOutputBuffer*(index: jint): ByteBuffer
  proc getOutputImage*(index: jint): Image
  proc getOutputFrame*(index: jint): OutputFrame
  proc setVideoScalingMode*(mode: jint)
  proc setAudioPresentation*(presentation: AudioPresentation)
  proc getName*(): string
  proc getCanonicalName*(): string
  proc getMetrics*(): PersistableBundle
  proc setParameters*(params: Bundle)
  proc setCallback*(cb: Callback, handler: Handler)
  proc setCallback*(cb: Callback)
  proc setOnFirstTunnelFrameReadyListener*(handler: Handler, listener: OnFirstTunnelFrameReadyListener)
  proc setOnFrameRenderedListener*(listener: OnFrameRenderedListener, handler: Handler)
  proc getSupportedVendorParameters*(): List[string]
  proc getParameterDescriptor*(name: string): ParameterDescriptor
  proc subscribeToVendorParameters*(names: List[string])
  proc unsubscribeFromVendorParameters*(names: List[string])
  proc getCodecInfo*(): MediaCodecInfo
  BUFFER_FLAG_SYNC_FRAME*: jint {.`static`.}
  BUFFER_FLAG_KEY_FRAME*: jint {.`static`.}
  BUFFER_FLAG_CODEC_CONFIG*: jint {.`static`.}
  BUFFER_FLAG_END_OF_STREAM*: jint {.`static`.}
  BUFFER_FLAG_PARTIAL_FRAME*: jint {.`static`.}
  BUFFER_FLAG_MUXER_DATA*: jint {.`static`.}
  BUFFER_FLAG_DECODE_ONLY*: jint {.`static`.}
  CONFIGURE_FLAG_ENCODE*: jint {.`static`.}
  CONFIGURE_FLAG_USE_BLOCK_MODEL*: jint {.`static`.}
  CONFIGURE_FLAG_USE_CRYPTO_ASYNC*: jint {.`static`.}
  CONFIGURE_FLAG_DETACHED_SURFACE*: jint {.`static`.}
  CRYPTO_MODE_UNENCRYPTED*: jint {.`static`.}
  CRYPTO_MODE_AES_CTR*: jint {.`static`.}
  CRYPTO_MODE_AES_CBC*: jint {.`static`.}
  INFO_TRY_AGAIN_LATER*: jint {.`static`.}
  INFO_OUTPUT_FORMAT_CHANGED*: jint {.`static`.}
  INFO_OUTPUT_BUFFERS_CHANGED*: jint {.`static`.}
  VIDEO_SCALING_MODE_SCALE_TO_FIT*: jint {.`static`.}
  VIDEO_SCALING_MODE_SCALE_TO_FIT_WITH_CROPPING*: jint {.`static`.}
  PARAMETER_KEY_VIDEO_BITRATE*: string {.`static`.}
  PARAMETER_KEY_SUSPEND*: string {.`static`.}
  PARAMETER_KEY_SUSPEND_TIME*: string {.`static`.}
  PARAMETER_KEY_OFFSET_TIME*: string {.`static`.}
  PARAMETER_KEY_REQUEST_SYNC_FRAME*: string {.`static`.}
  PARAMETER_KEY_HDR10_PLUS_INFO*: string {.`static`.}
  PARAMETER_KEY_LOW_LATENCY*: string {.`static`.}
  PARAMETER_KEY_TUNNEL_PEEK*: string {.`static`.}
  PARAMETER_KEY_QP_OFFSET_MAP*: string {.`static`.}
  PARAMETER_KEY_QP_OFFSET_RECTS*: string {.`static`.}

jclass android.media.MediaCodec.BufferInfo* of JVMObject:
  proc set*(newOffset: jint, newSize: jint, newTimeUs: jlong, newFlags: jint)
  proc dup*(): BufferInfo

jclass android.media.MediaCodec.GlobalResourceInfo* of JVMObject:
  proc getName*(): string
  proc getCapacity*(): jlong
  proc getAvailable*(): jlong

jclass android.media.MediaCodec.InstanceResourceInfo* of JVMObject:
  proc getName*(): string
  proc getStaticCount*(): jlong
  proc getPerFrameCount*(): jlong

jclass android.media.MediaCodec.CodecException* of JVMObject:
  proc isTransient*(): jboolean
  proc isRecoverable*(): jboolean
  proc getErrorCode*(): jint
  proc getDiagnosticInfo*(): string

jclass android.media.MediaCodec.CryptoException* of JVMObject:
  proc getErrorCode*(): jint
  proc getCryptoInfo*(): CryptoInfo
  proc getVendorError*(): jint
  proc getOemError*(): jint
  proc getErrorContext*(): jint

jclass android.media.MediaCodec.CryptoInfo* of JVMObject:
  proc set*(newNumSubSamples: jint, newNumBytesOfClearData: seq[jint], newNumBytesOfEncryptedData: seq[jint], newKey: seq[jbyte], newIV: seq[jbyte], newMode: jint)
  proc getPattern*(): Pattern
  proc setPattern*(newPattern: Pattern)
  proc toString*(): string

jclass android.media.MediaCodec.LinearBlock* of JVMObject:
  proc isMappable*(): jboolean
  proc map*(): ByteBuffer
  proc recycle*()
  proc isCodecCopyFreeCompatible*(codecNames: seq[string]): jboolean {.`static`.}
  proc obtain*(capacity: jint, codecNames: seq[string]): LinearBlock {.`static`.}

jclass android.media.MediaCodec.QueueRequest* of JVMObject:
  proc setLinearBlock*(block: LinearBlock, offset: jint, size: jint): QueueRequest
  proc setMultiFrameLinearBlock*(block: LinearBlock, infos: ArrayDeque[BufferInfo]): QueueRequest
  proc setEncryptedLinearBlock*(block: LinearBlock, offset: jint, size: jint, cryptoInfo: MediaCodec.CryptoInfo): QueueRequest
  proc setMultiFrameEncryptedLinearBlock*(block: LinearBlock, bufferInfos: ArrayDeque[MediaCodec.BufferInfo], cryptoInfos: ArrayDeque[MediaCodec.CryptoInfo]): QueueRequest
  proc setHardwareBuffer*(buffer: HardwareBuffer): QueueRequest
  proc setPresentationTimeUs*(presentationTimeUs: jlong): QueueRequest
  proc setFlags*(flags: jint): QueueRequest
  proc setIntegerParameter*(key: string, value: jint): QueueRequest
  proc setLongParameter*(key: string, value: jlong): QueueRequest
  proc setFloatParameter*(key: string, value: jfloat): QueueRequest
  proc setByteBufferParameter*(key: string, value: ByteBuffer): QueueRequest
  proc setStringParameter*(key: string, value: string): QueueRequest
  proc queue*()

jclass android.media.MediaCodec.OutputFrame* of JVMObject:
  proc getLinearBlock*(): LinearBlock
  proc getHardwareBuffer*(): HardwareBuffer
  proc getPresentationTimeUs*(): jlong
  proc getFlags*(): jint
  proc getBufferInfos*(): ArrayDeque[BufferInfo]
  proc getFormat*(): MediaFormat
  proc getChangedKeys*(): Set[string]

jclass android.media.MediaCodec.OnFrameRenderedListener* of JVMObject:
  proc onFrameRendered*(codec: MediaCodec, presentationTimeUs: jlong, nanoTime: jlong)

jclass android.media.MediaCodec.ParameterDescriptor* of JVMObject:
  proc getName*(): string
  proc getType*(): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.media.MediaCodec.Callback* of JVMObject:
  proc onInputBufferAvailable*(codec: MediaCodec, index: jint)
  proc onOutputBufferAvailable*(codec: MediaCodec, index: jint, info: BufferInfo)
  proc onOutputBuffersAvailable*(codec: MediaCodec, index: jint, infos: ArrayDeque[BufferInfo])
  proc onError*(codec: MediaCodec, e: CodecException)
  proc onCryptoError*(codec: MediaCodec, e: CryptoException)
  proc onOutputFormatChanged*(codec: MediaCodec, format: MediaFormat)
  proc onMetricsFlushed*(codec: MediaCodec, metrics: PersistableBundle)
  proc onRequiredResourcesChanged*(codec: MediaCodec)

jclass android.media.MediaCodec.MediaImage* of JVMObject:
  proc getFormat*(): jint
  proc getHeight*(): jint
  proc getWidth*(): jint
  proc getTransform*(): jint
  proc getScalingMode*(): jint
  proc getTimestamp*(): jlong
  proc getPlanes*(): seq[Plane]
  proc close*()
  proc setCropRect*(cropRect: Rect)

jclass android.media.BufferInfo* of JVMObject:
  proc set*(newOffset: jint, newSize: jint, newTimeUs: jlong, newFlags: jint)
  proc dup*(): BufferInfo
  offset*: jint
  size*: jint
  presentationTimeUs*: jlong
  flags*: jint

jclass android.media.IncompatibleWithBlockModelException* of RuntimeException:

jclass android.media.InvalidBufferFlagsException* of RuntimeException:

jclass android.media.GlobalResourceInfo* of JVMObject:
  proc getName*(): string
  proc getCapacity*(): jlong
  proc getAvailable*(): jlong

jclass android.media.InstanceResourceInfo* of JVMObject:
  proc getName*(): string
  proc getStaticCount*(): jlong
  proc getPerFrameCount*(): jlong

jclass android.media.CodecException* of IllegalStateException:
  proc isTransient*(): jboolean
  proc isRecoverable*(): jboolean
  proc getErrorCode*(): jint
  proc getDiagnosticInfo*(): string
  ERROR_INSUFFICIENT_RESOURCE*: jint {.`static`.}
  ERROR_RECLAIMED*: jint {.`static`.}

jclass android.media.CryptoException* of RuntimeException:
  proc getErrorCode*(): jint
  proc getCryptoInfo*(): CryptoInfo
  proc getVendorError*(): jint
  proc getOemError*(): jint
  proc getErrorContext*(): jint
  ERROR_NO_KEY*: jint {.`static`.}
  ERROR_KEY_EXPIRED*: jint {.`static`.}
  ERROR_RESOURCE_BUSY*: jint {.`static`.}
  ERROR_INSUFFICIENT_OUTPUT_PROTECTION*: jint {.`static`.}
  ERROR_SESSION_NOT_OPENED*: jint {.`static`.}
  ERROR_UNSUPPORTED_OPERATION*: jint {.`static`.}
  ERROR_INSUFFICIENT_SECURITY*: jint {.`static`.}
  ERROR_FRAME_TOO_LARGE*: jint {.`static`.}
  ERROR_LOST_STATE*: jint {.`static`.}

jclass android.media.CryptoInfo* of JVMObject:
  proc set*(newNumSubSamples: jint, newNumBytesOfClearData: seq[jint], newNumBytesOfEncryptedData: seq[jint], newKey: seq[jbyte], newIV: seq[jbyte], newMode: jint)
  proc getPattern*(): Pattern
  proc setPattern*(newPattern: Pattern)
  proc toString*(): string
  numSubSamples*: jint
  numBytesOfClearData*: jint
  numBytesOfEncryptedData*: jint
  key*: jbyte
  iv*: jbyte
  mode*: jint

jclass android.media.CryptoInfo.Pattern* of JVMObject:
  proc set*(blocksToEncrypt: jint, blocksToSkip: jint)
  proc getSkipBlocks*(): jint
  proc getEncryptBlocks*(): jint

jclass android.media.Pattern* of JVMObject:
  proc set*(blocksToEncrypt: jint, blocksToSkip: jint)
  proc getSkipBlocks*(): jint
  proc getEncryptBlocks*(): jint

jclass android.media.LinearBlock* of JVMObject:
  proc isMappable*(): jboolean
  proc map*(): ByteBuffer
  proc recycle*()
  proc isCodecCopyFreeCompatible*(codecNames: seq[string]): jboolean {.`static`.}
  proc obtain*(capacity: jint, codecNames: seq[string]): LinearBlock {.`static`.}

jclass android.media.QueueRequest* of JVMObject:
  proc setLinearBlock*(block: LinearBlock, offset: jint, size: jint): QueueRequest
  proc setMultiFrameLinearBlock*(block: LinearBlock, infos: ArrayDeque[BufferInfo]): QueueRequest
  proc setEncryptedLinearBlock*(block: LinearBlock, offset: jint, size: jint, cryptoInfo: MediaCodec.CryptoInfo): QueueRequest
  proc setMultiFrameEncryptedLinearBlock*(block: LinearBlock, bufferInfos: ArrayDeque[MediaCodec.BufferInfo], cryptoInfos: ArrayDeque[MediaCodec.CryptoInfo]): QueueRequest
  proc setHardwareBuffer*(buffer: HardwareBuffer): QueueRequest
  proc setPresentationTimeUs*(presentationTimeUs: jlong): QueueRequest
  proc setFlags*(flags: jint): QueueRequest
  proc setIntegerParameter*(key: string, value: jint): QueueRequest
  proc setLongParameter*(key: string, value: jlong): QueueRequest
  proc setFloatParameter*(key: string, value: jfloat): QueueRequest
  proc setByteBufferParameter*(key: string, value: ByteBuffer): QueueRequest
  proc setStringParameter*(key: string, value: string): QueueRequest
  proc queue*()

jclass android.media.OutputFrame* of JVMObject:
  proc getLinearBlock*(): LinearBlock
  proc getHardwareBuffer*(): HardwareBuffer
  proc getPresentationTimeUs*(): jlong
  proc getFlags*(): jint
  proc getBufferInfos*(): ArrayDeque[BufferInfo]
  proc getFormat*(): MediaFormat
  proc getChangedKeys*(): Set[string]


jclass android.media.OnFrameRenderedListener* of JVMObject:
  proc onFrameRendered*(codec: MediaCodec, presentationTimeUs: jlong, nanoTime: jlong)

jclass android.media.ParameterDescriptor* of JVMObject:
  proc getName*(): string
  proc getType*(): jint
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint

jclass android.media.Callback* of JVMObject:
  proc onInputBufferAvailable*(codec: MediaCodec, index: jint)
  proc onOutputBufferAvailable*(codec: MediaCodec, index: jint, info: BufferInfo)
  proc onOutputBuffersAvailable*(codec: MediaCodec, index: jint, infos: ArrayDeque[BufferInfo])
  proc onError*(codec: MediaCodec, e: CodecException)
  proc onCryptoError*(codec: MediaCodec, e: CryptoException)
  proc onOutputFormatChanged*(codec: MediaCodec, format: MediaFormat)
  proc onMetricsFlushed*(codec: MediaCodec, metrics: PersistableBundle)
  proc onRequiredResourcesChanged*(codec: MediaCodec)

jclass android.media.MediaImage* of Image:
  proc getFormat*(): jint
  proc getHeight*(): jint
  proc getWidth*(): jint
  proc getTransform*(): jint
  proc getScalingMode*(): jint
  proc getTimestamp*(): jlong
  proc getPlanes*(): seq[Plane]
  proc close*()
  proc setCropRect*(cropRect: Rect)

jclass android.media.MetricsConstants* of JVMObject:
  CODEC*: string {.`static`.}
  MIME_TYPE*: string {.`static`.}
  MODE*: string {.`static`.}
  MODE_AUDIO*: string {.`static`.}
  MODE_VIDEO*: string {.`static`.}
  ENCODER*: string {.`static`.}
  SECURE*: string {.`static`.}
  WIDTH*: string {.`static`.}
  HEIGHT*: string {.`static`.}
  ROTATION*: string {.`static`.}

