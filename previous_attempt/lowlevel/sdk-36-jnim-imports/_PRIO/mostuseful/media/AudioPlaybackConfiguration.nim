import jnim

jclass android.media.AudioPlaybackConfiguration* of JVMObject:
  proc playerStateToString*(state: jint): string {.`static`.}
  proc init*()
  proc anonymizedCopy*(in: AudioPlaybackConfiguration): AudioPlaybackConfiguration {.`static`.}
  proc getAudioAttributes*(): AudioAttributes
  proc getClientUid*(): jint
  proc getClientPid*(): jint
  proc getAudioDeviceInfo*(): AudioDeviceInfo
  proc getAudioDeviceInfos*(): List[AudioDeviceInfo]
  proc getSessionId*(): jint
  proc isMuted*(): jboolean
  proc getMutedBy*(): jint
  proc getPlayerType*(): jint
  proc getPlayerState*(): jint
  proc getPlayerInterfaceId*(): jint
  proc getPlayerProxy*(): PlayerProxy
  proc isSpatialized*(): jboolean
  proc getSampleRate*(): jint
  proc getChannelMask*(): jint
  proc handleAudioAttributesEvent*(attr: AudioAttributes): jboolean
  proc handleSessionIdEvent*(sessionId: jint): jboolean
  proc handleMutedEvent*(mutedState: jint): jboolean
  proc handleFormatEvent*(fi: FormatInfo): jboolean
  proc handleStateEvent*(event: jint, deviceIds: seq[jint]): jboolean
  proc isActive*(): jboolean
  proc dump*(pw: PrintWriter)
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  proc equals*(o: JObject): jboolean
  proc toString*(): string
  proc toLogFriendlyPlayerType*(type: jint): string {.`static`.}
  proc toLogFriendlyPlayerState*(state: jint): string {.`static`.}
  PLAYER_PIID_INVALID*: jint {.`static`.}
  PLAYER_UPID_INVALID*: jint {.`static`.}
  PLAYER_DEVICEID_INVALID*: jint {.`static`.}
  PLAYER_DEVICEIDS_INVALID*: jint {.`static`.}
  PLAYER_TYPE_UNKNOWN*: jint {.`static`.}
  PLAYER_TYPE_JAM_AUDIOTRACK*: jint {.`static`.}
  PLAYER_TYPE_JAM_MEDIAPLAYER*: jint {.`static`.}
  PLAYER_TYPE_JAM_SOUNDPOOL*: jint {.`static`.}
  PLAYER_TYPE_SLES_AUDIOPLAYER_BUFFERQUEUE*: jint {.`static`.}
  PLAYER_TYPE_SLES_AUDIOPLAYER_URI_FD*: jint {.`static`.}
  PLAYER_TYPE_AAUDIO*: jint {.`static`.}
  PLAYER_TYPE_HW_SOURCE*: jint {.`static`.}
  PLAYER_TYPE_EXTERNAL_PROXY*: jint {.`static`.}
  PLAYER_STATE_UNKNOWN*: jint {.`static`.}
  PLAYER_STATE_RELEASED*: jint {.`static`.}
  PLAYER_STATE_IDLE*: jint {.`static`.}
  PLAYER_STATE_STARTED*: jint {.`static`.}
  PLAYER_STATE_PAUSED*: jint {.`static`.}
  PLAYER_STATE_STOPPED*: jint {.`static`.}
  PLAYER_UPDATE_DEVICE_ID*: jint {.`static`.}
  PLAYER_UPDATE_PORT_ID*: jint {.`static`.}
  PLAYER_UPDATE_MUTED*: jint {.`static`.}
  PLAYER_UPDATE_FORMAT*: jint {.`static`.}
  EXTRA_PLAYER_EVENT_SPATIALIZED*: string {.`static`.}
  EXTRA_PLAYER_EVENT_SAMPLE_RATE*: string {.`static`.}
  EXTRA_PLAYER_EVENT_CHANNEL_MASK*: string {.`static`.}
  EXTRA_PLAYER_EVENT_MUTE*: string {.`static`.}
  MUTED_BY_MASTER*: jint {.`static`.}
  MUTED_BY_STREAM_VOLUME*: jint {.`static`.}
  MUTED_BY_STREAM_MUTED*: jint {.`static`.}
  MUTED_BY_OP_PLAY_AUDIO*: jint {.`static`.}
  MUTED_BY_APP_OPS*: jint {.`static`.}
  MUTED_BY_CLIENT_VOLUME*: jint {.`static`.}
  MUTED_BY_VOLUME_SHAPER*: jint {.`static`.}
  MUTED_BY_PORT_VOLUME*: jint {.`static`.}
  MUTED_BY_OP_CONTROL_AUDIO*: jint {.`static`.}
  sPlayerDeathMonitor*: PlayerDeathMonitor {.`static`.}
  CREATOR*: Parcelable.Creator[AudioPlaybackConfiguration] {.`static`.}

jclass android.media.AudioPlaybackConfiguration.PlayerDeathMonitor* of JVMObject:
  proc playerDeath*(piid: jint)

jclass android.media.AudioPlaybackConfiguration.FormatInfo* of JVMObject:
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)

jclass android.media.PlayerDeathMonitor* of JVMObject:
  proc playerDeath*(piid: jint)

jclass android.media.FormatInfo* of JVMObject:
  proc toString*(): string
  proc equals*(o: JObject): jboolean
  proc hashCode*(): jint
  proc describeContents*(): jint
  proc writeToParcel*(dest: Parcel, flags: jint)
  CREATOR*: Parcelable.Creator[FormatInfo] {.`static`.}

