import jnim

jclass android.media.MediaRecorder* of JVMObject:
  proc setLogSessionId*(id: LogSessionId)
  proc getLogSessionId*(): LogSessionId
  proc setCamera*(c: Camera)
  proc getSurface*(): Surface
  proc setInputSurface*(surface: Surface)
  proc setPreviewDisplay*(sv: Surface)
  proc isSystemOnlyAudioSource*(source: jint): jboolean {.`static`.}
  proc isValidAudioSource*(source: jint): jboolean {.`static`.}
  proc toLogFriendlyAudioSource*(source: jint): string {.`static`.}
  proc setAudioSource*(audioSource: jint)
  proc getAudioSourceMax*(): jint {.`static`.}
  proc setPrivacySensitive*(privacySensitive: jboolean)
  proc isPrivacySensitive*(): jboolean
  proc setVideoSource*(video_source: jint)
  proc setProfile*(profile: CamcorderProfile)
  proc setAudioProfile*(profile: EncoderProfiles.AudioProfile)
  proc setVideoProfile*(profile: EncoderProfiles.VideoProfile)
  proc setCaptureRate*(fps: jdouble)
  proc setOrientationHint*(degrees: jint)
  proc setLocation*(latitude: jfloat, longitude: jfloat)
  proc setOutputFormat*(output_format: jint)
  proc setVideoSize*(width: jint, height: jint)
  proc setVideoFrameRate*(rate: jint)
  proc setMaxDuration*(max_duration_ms: jint)
  proc setMaxFileSize*(max_filesize_bytes: jlong)
  proc setAudioEncoder*(audio_encoder: jint)
  proc setVideoEncoder*(video_encoder: jint)
  proc setAudioSamplingRate*(samplingRate: jint)
  proc setAudioChannels*(numChannels: jint)
  proc setAudioEncodingBitRate*(bitRate: jint)
  proc setVideoEncodingBitRate*(bitRate: jint)
  proc setVideoEncodingProfileLevel*(profile: jint, level: jint)
  proc setAuxiliaryOutputFile*(fd: FileDescriptor)
  proc setAuxiliaryOutputFile*(path: string)
  proc setOutputFile*(fd: FileDescriptor)
  proc setOutputFile*(file: File)
  proc setNextOutputFile*(fd: FileDescriptor)
  proc setOutputFile*(path: string)
  proc setNextOutputFile*(file: File)
  proc prepare*()
  proc start*()
  proc stop*()
  proc pause*()
  proc resume*()
  proc reset*()
  proc getMaxAmplitude*(): jint
  proc setOnErrorListener*(l: OnErrorListener)
  proc setOnInfoListener*(listener: OnInfoListener)
  proc setPreferredDevice*(deviceInfo: AudioDeviceInfo): jboolean
  proc getPreferredDevice*(): AudioDeviceInfo
  proc getRoutedDevice*(): AudioDeviceInfo
  proc getRoutedDevices*(): List[AudioDeviceInfo]
  proc addOnRoutingChangedListener*(listener: AudioRouting.OnRoutingChangedListener, handler: Handler)
  proc removeOnRoutingChangedListener*(listener: AudioRouting.OnRoutingChangedListener)
  proc getActiveMicrophones*(): List[MicrophoneInfo]
  proc setPreferredMicrophoneDirection*(direction: jint): jboolean
  proc setPreferredMicrophoneFieldDimension*(zoom: jfloat): jboolean
  proc registerAudioRecordingCallback*(executor: Executor, cb: AudioManager.AudioRecordingCallback)
  proc unregisterAudioRecordingCallback*(cb: AudioManager.AudioRecordingCallback)
  proc getActiveRecordingConfiguration*(): AudioRecordingConfiguration
  proc getPortId*(): jint
  proc release*()
  proc getMetrics*(): PersistableBundle
  MEDIA_RECORDER_ERROR_UNKNOWN*: jint {.`static`.}
  MEDIA_ERROR_SERVER_DIED*: jint {.`static`.}
  MEDIA_RECORDER_INFO_UNKNOWN*: jint {.`static`.}
  MEDIA_RECORDER_INFO_MAX_DURATION_REACHED*: jint {.`static`.}
  MEDIA_RECORDER_INFO_MAX_FILESIZE_REACHED*: jint {.`static`.}
  MEDIA_RECORDER_INFO_MAX_FILESIZE_APPROACHING*: jint {.`static`.}
  MEDIA_RECORDER_INFO_NEXT_OUTPUT_FILE_STARTED*: jint {.`static`.}
  MEDIA_RECORDER_TRACK_INFO_LIST_START*: jint {.`static`.}
  MEDIA_RECORDER_TRACK_INFO_COMPLETION_STATUS*: jint {.`static`.}
  MEDIA_RECORDER_TRACK_INFO_PROGRESS_IN_TIME*: jint {.`static`.}
  MEDIA_RECORDER_TRACK_INFO_TYPE*: jint {.`static`.}
  MEDIA_RECORDER_TRACK_INFO_DURATION_MS*: jint {.`static`.}
  MEDIA_RECORDER_TRACK_INFO_MAX_CHUNK_DUR_MS*: jint {.`static`.}
  MEDIA_RECORDER_TRACK_INFO_ENCODED_FRAMES*: jint {.`static`.}
  MEDIA_RECORDER_TRACK_INTER_CHUNK_TIME_MS*: jint {.`static`.}
  MEDIA_RECORDER_TRACK_INFO_INITIAL_DELAY_MS*: jint {.`static`.}
  MEDIA_RECORDER_TRACK_INFO_START_OFFSET_MS*: jint {.`static`.}
  MEDIA_RECORDER_TRACK_INFO_DATA_KBYTES*: jint {.`static`.}
  MEDIA_RECORDER_TRACK_INFO_LIST_END*: jint {.`static`.}

jclass android.media.AudioSource* of JVMObject:
  AUDIO_SOURCE_INVALID*: jint {.`static`.}
  DEFAULT*: jint {.`static`.}
  MIC*: jint {.`static`.}
  VOICE_UPLINK*: jint {.`static`.}
  VOICE_DOWNLINK*: jint {.`static`.}
  VOICE_CALL*: jint {.`static`.}
  CAMCORDER*: jint {.`static`.}
  VOICE_RECOGNITION*: jint {.`static`.}
  VOICE_COMMUNICATION*: jint {.`static`.}
  REMOTE_SUBMIX*: jint {.`static`.}
  UNPROCESSED*: jint {.`static`.}
  VOICE_PERFORMANCE*: jint {.`static`.}
  ECHO_REFERENCE*: jint {.`static`.}
  RADIO_TUNER*: jint {.`static`.}
  HOTWORD*: jint {.`static`.}
  ULTRASOUND*: jint {.`static`.}

jclass android.media.VideoSource* of JVMObject:
  DEFAULT*: jint {.`static`.}
  CAMERA*: jint {.`static`.}
  SURFACE*: jint {.`static`.}

jclass android.media.OutputFormat* of JVMObject:
  DEFAULT*: jint {.`static`.}
  THREE_GPP*: jint {.`static`.}
  MPEG_4*: jint {.`static`.}
  RAW_AMR*: jint {.`static`.}
  AMR_NB*: jint {.`static`.}
  AMR_WB*: jint {.`static`.}
  AAC_ADIF*: jint {.`static`.}
  AAC_ADTS*: jint {.`static`.}
  OUTPUT_FORMAT_RTP_AVP*: jint {.`static`.}
  MPEG_2_TS*: jint {.`static`.}
  WEBM*: jint {.`static`.}
  HEIF*: jint {.`static`.}
  OGG*: jint {.`static`.}

jclass android.media.AudioEncoder* of JVMObject:
  DEFAULT*: jint {.`static`.}
  AMR_NB*: jint {.`static`.}
  AMR_WB*: jint {.`static`.}
  AAC*: jint {.`static`.}
  HE_AAC*: jint {.`static`.}
  AAC_ELD*: jint {.`static`.}
  VORBIS*: jint {.`static`.}
  OPUS*: jint {.`static`.}

jclass android.media.VideoEncoder* of JVMObject:
  DEFAULT*: jint {.`static`.}
  H263*: jint {.`static`.}
  H264*: jint {.`static`.}
  MPEG_4_SP*: jint {.`static`.}
  VP8*: jint {.`static`.}
  HEVC*: jint {.`static`.}
  VP9*: jint {.`static`.}
  DOLBY_VISION*: jint {.`static`.}
  AV1*: jint {.`static`.}



jclass android.media.MetricsConstants* of JVMObject:
  AUDIO_BITRATE*: string {.`static`.}
  AUDIO_CHANNELS*: string {.`static`.}
  AUDIO_SAMPLERATE*: string {.`static`.}
  AUDIO_TIMESCALE*: string {.`static`.}
  CAPTURE_FPS*: string {.`static`.}
  CAPTURE_FPS_ENABLE*: string {.`static`.}
  FRAMERATE*: string {.`static`.}
  HEIGHT*: string {.`static`.}
  MOVIE_TIMESCALE*: string {.`static`.}
  ROTATION*: string {.`static`.}
  VIDEO_BITRATE*: string {.`static`.}
  VIDEO_IFRAME_INTERVAL*: string {.`static`.}
  VIDEO_LEVEL*: string {.`static`.}
  VIDEO_PROFILE*: string {.`static`.}
  VIDEO_TIMESCALE*: string {.`static`.}
  WIDTH*: string {.`static`.}

