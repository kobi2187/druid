import jnim

jclass android.media.AudioTrack* of PlayerBase:
  proc setOffloadDelayPadding*(delayInFrames: jint, paddingInFrames: jint)
  proc getOffloadDelay*(): jint
  proc getOffloadPadding*(): jint
  proc setOffloadEndOfStream*()
  proc isOffloadedPlayback*(): jboolean
  proc isDirectPlaybackSupported*(format: AudioFormat, attributes: AudioAttributes): jboolean {.`static`.}
  proc setAudioDescriptionMixLeveldB*(level: jfloat): jboolean
  proc getAudioDescriptionMixLeveldB*(): jfloat
  proc setDualMonoMode*(dualMonoMode: jint): jboolean
  proc getDualMonoMode*(): jint
  proc release*()
  proc getMinVolume*(): jfloat {.`static`.}
  proc getMaxVolume*(): jfloat {.`static`.}
  proc getSampleRate*(): jint
  proc getPlaybackRate*(): jint
  proc getPlaybackParams*(): PlaybackParams
  proc getAudioAttributes*(): AudioAttributes
  proc getAudioFormat*(): jint
  proc getStreamType*(): jint
  proc getChannelConfiguration*(): jint
  proc getFormat*(): AudioFormat
  proc getChannelCount*(): jint
  proc getState*(): jint
  proc getPlayState*(): jint
  proc getBufferSizeInFrames*(): jint
  proc setBufferSizeInFrames*(bufferSizeInFrames: jint): jint
  proc getBufferCapacityInFrames*(): jint
  proc setStartThresholdInFrames*(startThresholdInFrames: jint): jint
  proc getStartThresholdInFrames*(): jint
  proc getNotificationMarkerPosition*(): jint
  proc getPositionNotificationPeriod*(): jint
  proc getPlaybackHeadPosition*(): jint
  proc getLatency*(): jint
  proc getUnderrunCount*(): jint
  proc getPerformanceMode*(): jint
  proc getNativeOutputSampleRate*(streamType: jint): jint {.`static`.}
  proc getMinBufferSize*(sampleRateInHz: jint, channelConfig: jint, audioFormat: jint): jint {.`static`.}
  proc getAudioSessionId*(): jint
  proc getTimestamp*(timestamp: AudioTimestamp): jboolean
  proc getTimestampWithStatus*(timestamp: AudioTimestamp): jint
  proc getMetrics*(): PersistableBundle
  proc setPlaybackPositionUpdateListener*(listener: OnPlaybackPositionUpdateListener)
  proc setPlaybackPositionUpdateListener*(listener: OnPlaybackPositionUpdateListener, handler: Handler)
  proc setStereoVolume*(leftGain: jfloat, rightGain: jfloat): jint
  proc setVolume*(gain: jfloat): jint
  proc createVolumeShaper*(configuration: VolumeShaper.Configuration): VolumeShaper
  proc setPlaybackRate*(sampleRateInHz: jint): jint
  proc setPlaybackParams*(params: PlaybackParams)
  proc setNotificationMarkerPosition*(markerInFrames: jint): jint
  proc setPositionNotificationPeriod*(periodInFrames: jint): jint
  proc setPlaybackHeadPosition*(positionInFrames: jint): jint
  proc setLoopPoints*(startInFrames: jint, endInFrames: jint, loopCount: jint): jint
  proc setPresentation*(presentation: AudioPresentation): jint
  proc play*()
  proc stop*()
  proc pause*()
  proc flush*()
  proc write*(audioData: seq[jbyte], offsetInBytes: jint, sizeInBytes: jint): jint
  proc write*(audioData: seq[jbyte], offsetInBytes: jint, sizeInBytes: jint, writeMode: jint): jint
  proc write*(audioData: seq[jshort], offsetInShorts: jint, sizeInShorts: jint): jint
  proc write*(audioData: seq[jshort], offsetInShorts: jint, sizeInShorts: jint, writeMode: jint): jint
  proc write*(audioData: seq[jfloat], offsetInFloats: jint, sizeInFloats: jint, writeMode: jint): jint
  proc write*(audioData: ByteBuffer, sizeInBytes: jint, writeMode: jint): jint
  proc write*(audioData: ByteBuffer, sizeInBytes: jint, writeMode: jint, timestamp: jlong): jint
  proc reloadStaticData*(): jint
  proc attachAuxEffect*(effectId: jint): jint
  proc setAuxEffectSendLevel*(level: jfloat): jint
  proc setPreferredDevice*(deviceInfo: AudioDeviceInfo): jboolean
  proc getPreferredDevice*(): AudioDeviceInfo
  proc getRoutedDevice*(): AudioDeviceInfo
  proc getRoutedDevices*(): List[AudioDeviceInfo]
  proc addOnRoutingChangedListener*(listener: AudioRouting.OnRoutingChangedListener, handler: Handler)
  proc removeOnRoutingChangedListener*(listener: AudioRouting.OnRoutingChangedListener)
  proc addOnRoutingChangedListener*(listener: OnRoutingChangedListener, handler: android.os.Handler)
  proc removeOnRoutingChangedListener*(listener: OnRoutingChangedListener)
  proc addOnCodecFormatChangedListener*(executor: Executor, listener: OnCodecFormatChangedListener)
  proc removeOnCodecFormatChangedListener*(listener: OnCodecFormatChangedListener)
  proc registerStreamEventCallback*(executor: Executor, eventCallback: StreamEventCallback)
  proc unregisterStreamEventCallback*(eventCallback: StreamEventCallback)
  proc setLogSessionId*(logSessionId: LogSessionId)
  proc getLogSessionId*(): LogSessionId
  proc native_release*()
  PLAYSTATE_STOPPED*: jint {.`static`.}
  PLAYSTATE_PAUSED*: jint {.`static`.}
  PLAYSTATE_PLAYING*: jint {.`static`.}
  MODE_STATIC*: jint {.`static`.}
  MODE_STREAM*: jint {.`static`.}
  STATE_UNINITIALIZED*: jint {.`static`.}
  STATE_INITIALIZED*: jint {.`static`.}
  STATE_NO_STATIC_DATA*: jint {.`static`.}
  SUCCESS*: jint {.`static`.}
  ERROR*: jint {.`static`.}
  ERROR_BAD_VALUE*: jint {.`static`.}
  ERROR_INVALID_OPERATION*: jint {.`static`.}
  ERROR_DEAD_OBJECT*: jint {.`static`.}
  ERROR_WOULD_BLOCK*: jint {.`static`.}
  ENCAPSULATION_MODE_NONE*: jint {.`static`.}
  ENCAPSULATION_MODE_ELEMENTARY_STREAM*: jint {.`static`.}
  ENCAPSULATION_MODE_HANDLE*: jint {.`static`.}
  ENCAPSULATION_METADATA_TYPE_NONE*: jint {.`static`.}
  ENCAPSULATION_METADATA_TYPE_FRAMEWORK_TUNER*: jint {.`static`.}
  ENCAPSULATION_METADATA_TYPE_DVB_AD_DESCRIPTOR*: jint {.`static`.}
  ENCAPSULATION_METADATA_TYPE_SUPPLEMENTARY_AUDIO_PLACEMENT*: jint {.`static`.}
  SUPPLEMENTARY_AUDIO_PLACEMENT_NORMAL*: jint {.`static`.}
  SUPPLEMENTARY_AUDIO_PLACEMENT_LEFT*: jint {.`static`.}
  SUPPLEMENTARY_AUDIO_PLACEMENT_RIGHT*: jint {.`static`.}
  DUAL_MONO_MODE_OFF*: jint {.`static`.}
  DUAL_MONO_MODE_LR*: jint {.`static`.}
  DUAL_MONO_MODE_LL*: jint {.`static`.}
  DUAL_MONO_MODE_RR*: jint {.`static`.}
  WRITE_BLOCKING*: jint {.`static`.}
  WRITE_NON_BLOCKING*: jint {.`static`.}
  PERFORMANCE_MODE_NONE*: jint {.`static`.}
  PERFORMANCE_MODE_LOW_LATENCY*: jint {.`static`.}
  PERFORMANCE_MODE_POWER_SAVING*: jint {.`static`.}

jclass android.media.AudioTrack.TunerConfiguration* of JVMObject:
  proc getContentId*(): jint
  proc getSyncId*(): jint

jclass android.media.AudioTrack.Builder* of JVMObject:
  proc setContext*(context: Context): Builder
  proc setAudioAttributes*(attributes: AudioAttributes): Builder
  proc setAudioFormat*(format: AudioFormat): Builder
  proc setBufferSizeInBytes*(bufferSizeInBytes: jint): Builder
  proc setEncapsulationMode*(encapsulationMode: jint): Builder
  proc setTransferMode*(mode: jint): Builder
  proc setSessionId*(sessionId: jint): Builder
  proc setPerformanceMode*(performanceMode: jint): Builder
  proc setOffloadedPlayback*(offload: jboolean): Builder
  proc setTunerConfiguration*(tunerConfiguration: TunerConfiguration): Builder
  proc setCallRedirectionMode*(callRedirectionMode: jint): Builder
  proc build*(): AudioTrack

jclass android.media.AudioTrack.OnRoutingChangedListener* of JVMObject:
  proc onRoutingChanged*(audioTrack: AudioTrack)
  proc onRoutingChanged*(router: AudioRouting)

jclass android.media.AudioTrack.StreamEventCallback* of JVMObject:
  proc onTearDown*(track: AudioTrack)
  proc onPresentationEnded*(track: AudioTrack)
  proc onDataRequest*(track: AudioTrack, sizeInFrames: jint)

jclass android.media.TunerConfiguration* of JVMObject:
  proc getContentId*(): jint
  proc getSyncId*(): jint
  CONTENT_ID_NONE*: jint {.`static`.}

jclass android.media.Builder* of JVMObject:
  proc setContext*(context: Context): Builder
  proc setAudioAttributes*(attributes: AudioAttributes): Builder
  proc setAudioFormat*(format: AudioFormat): Builder
  proc setBufferSizeInBytes*(bufferSizeInBytes: jint): Builder
  proc setEncapsulationMode*(encapsulationMode: jint): Builder
  proc setTransferMode*(mode: jint): Builder
  proc setSessionId*(sessionId: jint): Builder
  proc setPerformanceMode*(performanceMode: jint): Builder
  proc setOffloadedPlayback*(offload: jboolean): Builder
  proc setTunerConfiguration*(tunerConfiguration: TunerConfiguration): Builder
  proc setCallRedirectionMode*(callRedirectionMode: jint): Builder
  proc build*(): AudioTrack

jclass android.media.OnRoutingChangedListener* of OnRoutingChangedListener:
  proc onRoutingChanged*(audioTrack: AudioTrack)
  proc onRoutingChanged*(router: AudioRouting)



jclass android.media.StreamEventCallback* of JVMObject:
  proc onTearDown*(track: AudioTrack)
  proc onPresentationEnded*(track: AudioTrack)
  proc onDataRequest*(track: AudioTrack, sizeInFrames: jint)

jclass android.media.MetricsConstants* of JVMObject:
  STREAMTYPE*: string {.`static`.}
  CONTENTTYPE*: string {.`static`.}
  USAGE*: string {.`static`.}
  SAMPLERATE*: string {.`static`.}
  CHANNELMASK*: string {.`static`.}
  SAMPLE_RATE*: string {.`static`.}
  CHANNEL_MASK*: string {.`static`.}
  ENCODING*: string {.`static`.}
  PORT_ID*: string {.`static`.}
  FRAME_COUNT*: string {.`static`.}
  ATTRIBUTES*: string {.`static`.}

