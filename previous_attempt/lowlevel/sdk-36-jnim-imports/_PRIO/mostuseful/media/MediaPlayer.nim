import jnim

jclass android.media.MediaPlayer* of PlayerBase:
  proc newRequest*(): Parcel
  proc invoke*(request: Parcel, reply: Parcel)
  proc setDisplay*(sh: SurfaceHolder)
  proc setSurface*(surface: Surface)
  proc setVideoScalingMode*(mode: jint)
  proc create*(context: Context, uri: Uri): MediaPlayer {.`static`.}
  proc create*(context: Context, uri: Uri, holder: SurfaceHolder): MediaPlayer {.`static`.}
  proc create*(context: Context, uri: Uri, holder: SurfaceHolder, audioAttributes: AudioAttributes, audioSessionId: jint): MediaPlayer {.`static`.}
  proc create*(context: Context, resid: jint): MediaPlayer {.`static`.}
  proc create*(context: Context, resid: jint, audioAttributes: AudioAttributes, audioSessionId: jint): MediaPlayer {.`static`.}
  proc setDataSource*(context: Context, uri: Uri)
  proc setDataSource*(context: Context, uri: Uri, headers: Map[string, string], cookies: List[HttpCookie])
  proc setDataSource*(context: Context, uri: Uri, headers: Map[string, string])
  proc setDataSource*(path: string)
  proc setDataSource*(path: string, headers: Map[string, string])
  proc setDataSource*(afd: AssetFileDescriptor)
  proc setDataSource*(fd: FileDescriptor)
  proc setDataSource*(fd: FileDescriptor, offset: jlong, length: jlong)
  proc setDataSource*(dataSource: MediaDataSource)
  proc prepare*()
  proc prepareAsync*()
  proc start*()
  proc stop*()
  proc pause*()
  proc createVolumeShaper*(configuration: VolumeShaper.Configuration): VolumeShaper
  proc setPreferredDevice*(deviceInfo: AudioDeviceInfo): jboolean
  proc getPreferredDevice*(): AudioDeviceInfo
  proc getRoutedDevice*(): AudioDeviceInfo
  proc getRoutedDevices*(): List[AudioDeviceInfo]
  proc addOnRoutingChangedListener*(listener: AudioRouting.OnRoutingChangedListener, handler: Handler)
  proc removeOnRoutingChangedListener*(listener: AudioRouting.OnRoutingChangedListener)
  proc setWakeMode*(context: Context, mode: jint)
  proc setScreenOnWhilePlaying*(screenOn: jboolean)
  proc getVideoWidth*(): jint
  proc getVideoHeight*(): jint
  proc getMetrics*(): PersistableBundle
  proc isPlaying*(): jboolean
  proc easyPlaybackParams*(rate: jfloat, audioMode: jint): PlaybackParams
  proc setPlaybackParams*(params: PlaybackParams)
  proc getPlaybackParams*(): PlaybackParams
  proc setSyncParams*(params: SyncParams)
  proc getSyncParams*(): SyncParams
  proc seekTo*(msec: jlong, mode: jint)
  proc seekTo*(msec: jint)
  proc getTimestamp*(): MediaTimestamp
  proc getCurrentPosition*(): jint
  proc getDuration*(): jint
  proc getMetadata*(update_only: jboolean, apply_filter: jboolean): Metadata
  proc setMetadataFilter*(allow: Set[Integer], block: Set[Integer]): jint
  proc setNextMediaPlayer*(next: MediaPlayer)
  proc release*()
  proc reset*()
  proc notifyAt*(mediaTimeUs: jlong)
  proc setAudioStreamType*(streamtype: jint)
  proc setAudioAttributes*(attributes: AudioAttributes)
  proc setLooping*(looping: jboolean)
  proc isLooping*(): jboolean
  proc setVolume*(leftVolume: jfloat, rightVolume: jfloat)
  proc setVolume*(volume: jfloat)
  proc setAudioSessionId*(sessionId: jint)
  proc getAudioSessionId*(): jint
  proc attachAuxEffect*(effectId: jint)
  proc setAuxEffectSendLevel*(level: jfloat)
  proc getTrackInfo*(): seq[TrackInfo]
  proc setSubtitleAnchor*(controller: SubtitleController, anchor: SubtitleController.Anchor)
  proc onSubtitleTrackSelected*(track: SubtitleTrack)
  proc addSubtitleSource*(is: InputStream, format: MediaFormat)
  proc addTimedTextSource*(path: string, mimeType: string)
  proc addTimedTextSource*(context: Context, uri: Uri, mimeType: string)
  proc addTimedTextSource*(fd: FileDescriptor, mimeType: string)
  proc addTimedTextSource*(fd: FileDescriptor, offset: jlong, length: jlong, mime: string)
  proc getSelectedTrack*(trackType: jint): jint
  proc selectTrack*(index: jint)
  proc deselectTrack*(index: jint)
  proc native_pullBatteryData*(reply: Parcel): jint {.`static`.}
  proc setRetransmitEndpoint*(endpoint: InetSocketAddress)
  proc getMediaTimeProvider*(): MediaTimeProvider
  proc setOnPreparedListener*(listener: OnPreparedListener)
  proc setOnCompletionListener*(listener: OnCompletionListener)
  proc setOnBufferingUpdateListener*(listener: OnBufferingUpdateListener)
  proc setOnSeekCompleteListener*(listener: OnSeekCompleteListener)
  proc setOnVideoSizeChangedListener*(listener: OnVideoSizeChangedListener)
  proc setOnTimedTextListener*(listener: OnTimedTextListener)
  proc setOnSubtitleDataListener*(listener: OnSubtitleDataListener, handler: Handler)
  proc setOnSubtitleDataListener*(listener: OnSubtitleDataListener)
  proc clearOnSubtitleDataListener*()
  proc setOnMediaTimeDiscontinuityListener*(listener: OnMediaTimeDiscontinuityListener, handler: Handler)
  proc setOnMediaTimeDiscontinuityListener*(listener: OnMediaTimeDiscontinuityListener)
  proc clearOnMediaTimeDiscontinuityListener*()
  proc setOnRtpRxNoticeListener*(context: Context, executor: Executor, listener: OnRtpRxNoticeListener)
  proc setOnTimedMetaDataAvailableListener*(listener: OnTimedMetaDataAvailableListener)
  proc setOnErrorListener*(listener: OnErrorListener)
  proc setOnInfoListener*(listener: OnInfoListener)
  proc setOnDrmConfigHelper*(listener: OnDrmConfigHelper)
  proc setOnDrmInfoListener*(listener: OnDrmInfoListener)
  proc setOnDrmInfoListener*(listener: OnDrmInfoListener, handler: Handler)
  proc setOnDrmPreparedListener*(listener: OnDrmPreparedListener)
  proc setOnDrmPreparedListener*(listener: OnDrmPreparedListener, handler: Handler)
  proc getDrmInfo*(): DrmInfo
  proc prepareDrm*(uuid: UUID)
  proc releaseDrm*()
  proc getKeyRequest*(keySetId: seq[jbyte], initData: seq[jbyte], mimeType: string, keyType: jint, optionalParameters: Map[string, string]): MediaDrm.KeyRequest
  proc provideKeyResponse*(keySetId: seq[jbyte], response: seq[jbyte]): seq[jbyte]
  proc restoreKeys*(keySetId: seq[jbyte])
  proc getDrmPropertyString*(propertyName: string): string
  proc setDrmPropertyString*(propertyName: string, value: string)
  METADATA_UPDATE_ONLY*: jboolean {.`static`.}
  METADATA_ALL*: jboolean {.`static`.}
  APPLY_METADATA_FILTER*: jboolean {.`static`.}
  BYPASS_METADATA_FILTER*: jboolean {.`static`.}
  VIDEO_SCALING_MODE_SCALE_TO_FIT*: jint {.`static`.}
  VIDEO_SCALING_MODE_SCALE_TO_FIT_WITH_CROPPING*: jint {.`static`.}
  PLAYBACK_RATE_AUDIO_MODE_RESAMPLE*: jint {.`static`.}
  PLAYBACK_RATE_AUDIO_MODE_STRETCH*: jint {.`static`.}
  PLAYBACK_RATE_AUDIO_MODE_DEFAULT*: jint {.`static`.}
  SEEK_PREVIOUS_SYNC*: jint {.`static`.}
  SEEK_NEXT_SYNC*: jint {.`static`.}
  SEEK_CLOSEST_SYNC*: jint {.`static`.}
  SEEK_CLOSEST*: jint {.`static`.}
  MEDIA_MIMETYPE_TEXT_SUBRIP*: string {.`static`.}
  MEDIA_MIMETYPE_TEXT_VTT*: string {.`static`.}
  MEDIA_MIMETYPE_TEXT_CEA_608*: string {.`static`.}
  MEDIA_MIMETYPE_TEXT_CEA_708*: string {.`static`.}
  MEDIA_ERROR_UNKNOWN*: jint {.`static`.}
  MEDIA_ERROR_SERVER_DIED*: jint {.`static`.}
  MEDIA_ERROR_NOT_VALID_FOR_PROGRESSIVE_PLAYBACK*: jint {.`static`.}
  MEDIA_ERROR_IO*: jint {.`static`.}
  MEDIA_ERROR_MALFORMED*: jint {.`static`.}
  MEDIA_ERROR_UNSUPPORTED*: jint {.`static`.}
  MEDIA_ERROR_TIMED_OUT*: jint {.`static`.}
  MEDIA_ERROR_SYSTEM*: jint {.`static`.}
  MEDIA_INFO_UNKNOWN*: jint {.`static`.}
  MEDIA_INFO_STARTED_AS_NEXT*: jint {.`static`.}
  MEDIA_INFO_VIDEO_RENDERING_START*: jint {.`static`.}
  MEDIA_INFO_VIDEO_TRACK_LAGGING*: jint {.`static`.}
  MEDIA_INFO_BUFFERING_START*: jint {.`static`.}
  MEDIA_INFO_BUFFERING_END*: jint {.`static`.}
  MEDIA_INFO_NETWORK_BANDWIDTH*: jint {.`static`.}
  MEDIA_INFO_BAD_INTERLEAVING*: jint {.`static`.}
  MEDIA_INFO_NOT_SEEKABLE*: jint {.`static`.}
  MEDIA_INFO_METADATA_UPDATE*: jint {.`static`.}
  MEDIA_INFO_EXTERNAL_METADATA_UPDATE*: jint {.`static`.}
  MEDIA_INFO_AUDIO_NOT_PLAYING*: jint {.`static`.}
  MEDIA_INFO_VIDEO_NOT_PLAYING*: jint {.`static`.}
  MEDIA_INFO_TIMED_TEXT_ERROR*: jint {.`static`.}
  MEDIA_INFO_UNSUPPORTED_SUBTITLE*: jint {.`static`.}
  MEDIA_INFO_SUBTITLE_TIMED_OUT*: jint {.`static`.}
  PREPARE_DRM_STATUS_SUCCESS*: jint {.`static`.}
  PREPARE_DRM_STATUS_PROVISIONING_NETWORK_ERROR*: jint {.`static`.}
  PREPARE_DRM_STATUS_PROVISIONING_SERVER_ERROR*: jint {.`static`.}
  PREPARE_DRM_STATUS_PREPARATION_ERROR*: jint {.`static`.}

jclass android.media.MediaPlayer.TrackInfo* of JVMObject:
  proc getTrackType*(): jint
  proc getLanguage*(): string
  proc hasHapticChannels*(): jboolean
  proc getFormat*(): MediaFormat
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string

jclass android.media.MediaPlayer.OnSeekCompleteListener* of JVMObject:
  proc onSeekComplete*(mp: MediaPlayer)

jclass android.media.MediaPlayer.OnVideoSizeChangedListener* of JVMObject:
  proc onVideoSizeChanged*(mp: MediaPlayer, width: jint, height: jint)

jclass android.media.MediaPlayer.OnTimedTextListener* of JVMObject:
  proc onTimedText*(mp: MediaPlayer, text: TimedText)

jclass android.media.MediaPlayer.OnSubtitleDataListener* of JVMObject:
  proc onSubtitleData*(mp: MediaPlayer, data: SubtitleData)

jclass android.media.MediaPlayer.OnMediaTimeDiscontinuityListener* of JVMObject:
  proc onMediaTimeDiscontinuity*(mp: MediaPlayer, mts: MediaTimestamp)

jclass android.media.MediaPlayer.OnTimedMetaDataAvailableListener* of JVMObject:
  proc onTimedMetaDataAvailable*(mp: MediaPlayer, data: TimedMetaData)

jclass android.media.MediaPlayer.OnDrmConfigHelper* of JVMObject:
  proc onDrmConfig*(mp: MediaPlayer)

jclass android.media.MediaPlayer.OnDrmInfoListener* of JVMObject:
  proc onDrmInfo*(mp: MediaPlayer, drmInfo: DrmInfo)

jclass android.media.MediaPlayer.OnDrmPreparedListener* of JVMObject:
  proc onDrmPrepared*(mp: MediaPlayer, status: jint)

jclass android.media.MediaPlayer.DrmInfo* of JVMObject:
  proc getPssh*(): Map[UUID, seq[jbyte]]
  proc getSupportedSchemes*(): seq[UUID]

jclass android.media.TrackInfo* of JVMObject:
  proc getTrackType*(): jint
  proc getLanguage*(): string
  proc hasHapticChannels*(): jboolean
  proc getFormat*(): MediaFormat
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc toString*(): string
  MEDIA_TRACK_TYPE_UNKNOWN*: jint {.`static`.}
  MEDIA_TRACK_TYPE_VIDEO*: jint {.`static`.}
  MEDIA_TRACK_TYPE_AUDIO*: jint {.`static`.}
  MEDIA_TRACK_TYPE_TIMEDTEXT*: jint {.`static`.}
  MEDIA_TRACK_TYPE_SUBTITLE*: jint {.`static`.}
  MEDIA_TRACK_TYPE_METADATA*: jint {.`static`.}



jclass android.media.OnSeekCompleteListener* of JVMObject:
  proc onSeekComplete*(mp: MediaPlayer)

jclass android.media.OnVideoSizeChangedListener* of JVMObject:
  proc onVideoSizeChanged*(mp: MediaPlayer, width: jint, height: jint)

jclass android.media.OnTimedTextListener* of JVMObject:
  proc onTimedText*(mp: MediaPlayer, text: TimedText)

jclass android.media.OnSubtitleDataListener* of JVMObject:
  proc onSubtitleData*(mp: MediaPlayer, data: SubtitleData)

jclass android.media.OnMediaTimeDiscontinuityListener* of JVMObject:
  proc onMediaTimeDiscontinuity*(mp: MediaPlayer, mts: MediaTimestamp)

jclass android.media.OnTimedMetaDataAvailableListener* of JVMObject:
  proc onTimedMetaDataAvailable*(mp: MediaPlayer, data: TimedMetaData)



jclass android.media.OnDrmConfigHelper* of JVMObject:
  proc onDrmConfig*(mp: MediaPlayer)

jclass android.media.OnDrmInfoListener* of JVMObject:
  proc onDrmInfo*(mp: MediaPlayer, drmInfo: DrmInfo)

jclass android.media.OnDrmPreparedListener* of JVMObject:
  proc onDrmPrepared*(mp: MediaPlayer, status: jint)

jclass android.media.DrmInfo* of JVMObject:
  proc getPssh*(): Map[UUID, seq[jbyte]]
  proc getSupportedSchemes*(): seq[UUID]

jclass android.media.NoDrmSchemeException* of MediaDrmException:

jclass android.media.ProvisioningNetworkErrorException* of MediaDrmException:

jclass android.media.ProvisioningServerErrorException* of MediaDrmException:

jclass android.media.MetricsConstants* of JVMObject:
  MIME_TYPE_VIDEO*: string {.`static`.}
  CODEC_VIDEO*: string {.`static`.}
  WIDTH*: string {.`static`.}
  HEIGHT*: string {.`static`.}
  FRAMES*: string {.`static`.}
  FRAMES_DROPPED*: string {.`static`.}
  MIME_TYPE_AUDIO*: string {.`static`.}
  CODEC_AUDIO*: string {.`static`.}
  DURATION*: string {.`static`.}
  PLAYING*: string {.`static`.}
  ERRORS*: string {.`static`.}
  ERROR_CODE*: string {.`static`.}

