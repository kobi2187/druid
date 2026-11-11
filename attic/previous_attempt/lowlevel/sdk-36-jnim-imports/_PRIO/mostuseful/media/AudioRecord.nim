import jnim

jclass android.media.AudioRecord* of JVMObject:
  proc getAudioAttributes*(): AudioAttributes
  proc release*()
  proc getSampleRate*(): jint
  proc getAudioSource*(): jint
  proc getAudioFormat*(): jint
  proc getChannelConfiguration*(): jint
  proc getFormat*(): AudioFormat
  proc getChannelCount*(): jint
  proc getState*(): jint
  proc getRecordingState*(): jint
  proc getBufferSizeInFrames*(): jint
  proc getNotificationMarkerPosition*(): jint
  proc getPositionNotificationPeriod*(): jint
  proc getTimestamp*(outTimestamp: AudioTimestamp, timebase: jint): jint
  proc getMinBufferSize*(sampleRateInHz: jint, channelConfig: jint, audioFormat: jint): jint {.`static`.}
  proc getAudioSessionId*(): jint
  proc isPrivacySensitive*(): jboolean
  proc isHotwordStream*(): jboolean
  proc isHotwordLookbackStream*(): jboolean
  proc startRecording*()
  proc startRecording*(syncEvent: MediaSyncEvent)
  proc stop*()
  proc read*(audioData: seq[jbyte], offsetInBytes: jint, sizeInBytes: jint): jint
  proc read*(audioData: seq[jbyte], offsetInBytes: jint, sizeInBytes: jint, readMode: jint): jint
  proc read*(audioData: seq[jshort], offsetInShorts: jint, sizeInShorts: jint): jint
  proc read*(audioData: seq[jshort], offsetInShorts: jint, sizeInShorts: jint, readMode: jint): jint
  proc read*(audioData: seq[jfloat], offsetInFloats: jint, sizeInFloats: jint, readMode: jint): jint
  proc read*(audioBuffer: ByteBuffer, sizeInBytes: jint): jint
  proc read*(audioBuffer: ByteBuffer, sizeInBytes: jint, readMode: jint): jint
  proc getMetrics*(): PersistableBundle
  proc setRecordPositionUpdateListener*(listener: OnRecordPositionUpdateListener)
  proc setRecordPositionUpdateListener*(listener: OnRecordPositionUpdateListener, handler: Handler)
  proc setNotificationMarkerPosition*(markerInFrames: jint): jint
  proc getRoutedDevice*(): AudioDeviceInfo
  proc getRoutedDevices*(): List[AudioDeviceInfo]
  proc getMaxSharedAudioHistoryMillis*(): jlong {.`static`.}
  proc shareAudioHistory*(sharedPackage: string, startFromMillis: jlong): MediaSyncEvent
  proc addOnRoutingChangedListener*(listener: AudioRouting.OnRoutingChangedListener, handler: android.os.Handler)
  proc removeOnRoutingChangedListener*(listener: AudioRouting.OnRoutingChangedListener)
  proc addOnRoutingChangedListener*(listener: OnRoutingChangedListener, handler: android.os.Handler)
  proc removeOnRoutingChangedListener*(listener: OnRoutingChangedListener)
  proc setPositionNotificationPeriod*(periodInFrames: jint): jint
  proc setPreferredDevice*(deviceInfo: AudioDeviceInfo): jboolean
  proc getPreferredDevice*(): AudioDeviceInfo
  proc getActiveMicrophones*(): List[MicrophoneInfo]
  proc registerAudioRecordingCallback*(executor: Executor, cb: AudioManager.AudioRecordingCallback)
  proc unregisterAudioRecordingCallback*(cb: AudioManager.AudioRecordingCallback)
  proc getActiveRecordingConfiguration*(): AudioRecordingConfiguration
  proc getPortId*(): jint
  proc setPreferredMicrophoneDirection*(direction: jint): jboolean
  proc setPreferredMicrophoneFieldDimension*(zoom: jfloat): jboolean
  proc setLogSessionId*(logSessionId: LogSessionId)
  proc getLogSessionId*(): LogSessionId
  proc native_release*()
  STATE_UNINITIALIZED*: jint {.`static`.}
  STATE_INITIALIZED*: jint {.`static`.}
  RECORDSTATE_STOPPED*: jint {.`static`.}
  RECORDSTATE_RECORDING*: jint {.`static`.}
  SUCCESS*: jint {.`static`.}
  ERROR*: jint {.`static`.}
  ERROR_BAD_VALUE*: jint {.`static`.}
  ERROR_INVALID_OPERATION*: jint {.`static`.}
  ERROR_DEAD_OBJECT*: jint {.`static`.}
  SUBMIX_FIXED_VOLUME*: string {.`static`.}
  READ_BLOCKING*: jint {.`static`.}
  READ_NON_BLOCKING*: jint {.`static`.}

jclass android.media.AudioRecord.Builder* of JVMObject:
  proc setAudioSource*(source: jint): Builder
  proc setContext*(context: Context): Builder
  proc setAudioAttributes*(attributes: AudioAttributes): Builder
  proc setAudioFormat*(format: AudioFormat): Builder
  proc setBufferSizeInBytes*(bufferSizeInBytes: jint): Builder
  proc setAudioPlaybackCaptureConfig*(config: AudioPlaybackCaptureConfiguration): Builder
  proc setPrivacySensitive*(privacySensitive: jboolean): Builder
  proc setSessionId*(sessionId: jint): Builder
  proc setCallRedirectionMode*(callRedirectionMode: jint): Builder
  proc setMaxSharedAudioHistoryMillis*(maxSharedAudioHistoryMillis: jlong): Builder
  proc setSharedAudioEvent*(event: MediaSyncEvent): Builder
  proc setRequestHotwordStream*(hotwordContent: jboolean): Builder
  proc setRequestHotwordLookbackStream*(hotwordLookbackContent: jboolean): Builder
  proc build*(): AudioRecord

jclass android.media.AudioRecord.OnRoutingChangedListener* of JVMObject:
  proc onRoutingChanged*(audioRecord: AudioRecord)
  proc onRoutingChanged*(router: AudioRouting)

jclass android.media.Builder* of JVMObject:
  proc setAudioSource*(source: jint): Builder
  proc setContext*(context: Context): Builder
  proc setAudioAttributes*(attributes: AudioAttributes): Builder
  proc setAudioFormat*(format: AudioFormat): Builder
  proc setBufferSizeInBytes*(bufferSizeInBytes: jint): Builder
  proc setAudioPlaybackCaptureConfig*(config: AudioPlaybackCaptureConfiguration): Builder
  proc setPrivacySensitive*(privacySensitive: jboolean): Builder
  proc setSessionId*(sessionId: jint): Builder
  proc setCallRedirectionMode*(callRedirectionMode: jint): Builder
  proc setMaxSharedAudioHistoryMillis*(maxSharedAudioHistoryMillis: jlong): Builder
  proc setSharedAudioEvent*(event: MediaSyncEvent): Builder
  proc setRequestHotwordStream*(hotwordContent: jboolean): Builder
  proc setRequestHotwordLookbackStream*(hotwordLookbackContent: jboolean): Builder
  proc build*(): AudioRecord

jclass android.media.OnRoutingChangedListener* of OnRoutingChangedListener:
  proc onRoutingChanged*(audioRecord: AudioRecord)
  proc onRoutingChanged*(router: AudioRouting)


jclass android.media.MetricsConstants* of JVMObject:
  ENCODING*: string {.`static`.}
  SOURCE*: string {.`static`.}
  LATENCY*: string {.`static`.}
  SAMPLERATE*: string {.`static`.}
  CHANNELS*: string {.`static`.}
  CHANNEL_MASK*: string {.`static`.}
  PORT_ID*: string {.`static`.}
  FRAME_COUNT*: string {.`static`.}
  ATTRIBUTES*: string {.`static`.}
  DURATION_MS*: string {.`static`.}
  START_COUNT*: string {.`static`.}

