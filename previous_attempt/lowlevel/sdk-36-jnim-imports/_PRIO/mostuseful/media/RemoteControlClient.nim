import jnim

jclass android.media.RemoteControlClient* of JVMObject:
  proc registerWithSession*(helper: MediaSessionLegacyHelper)
  proc unregisterWithSession*(helper: MediaSessionLegacyHelper)
  proc getMediaSession*(): MediaSession
  proc editMetadata*(startEmpty: jboolean): MetadataEditor
  proc setPlaybackState*(state: jint)
  proc setPlaybackState*(state: jint, timeInMs: jlong, playbackSpeed: jfloat)
  proc setTransportControlFlags*(transportControlFlags: jint)
  proc setMetadataUpdateListener*(l: OnMetadataUpdateListener)
  proc setPlaybackPositionUpdateListener*(l: OnPlaybackPositionUpdateListener)
  proc setOnGetPlaybackPositionListener*(l: OnGetPlaybackPositionListener)
  proc getRcMediaIntent*(): PendingIntent
  PLAYSTATE_STOPPED*: jint {.`static`.}
  PLAYSTATE_PAUSED*: jint {.`static`.}
  PLAYSTATE_PLAYING*: jint {.`static`.}
  PLAYSTATE_FAST_FORWARDING*: jint {.`static`.}
  PLAYSTATE_REWINDING*: jint {.`static`.}
  PLAYSTATE_SKIPPING_FORWARDS*: jint {.`static`.}
  PLAYSTATE_SKIPPING_BACKWARDS*: jint {.`static`.}
  PLAYSTATE_BUFFERING*: jint {.`static`.}
  PLAYSTATE_ERROR*: jint {.`static`.}
  PLAYSTATE_NONE*: jint {.`static`.}
  PLAYBACK_TYPE_LOCAL*: jint {.`static`.}
  PLAYBACK_TYPE_REMOTE*: jint {.`static`.}
  PLAYBACK_VOLUME_FIXED*: jint {.`static`.}
  PLAYBACK_VOLUME_VARIABLE*: jint {.`static`.}
  PLAYBACKINFO_INVALID_VALUE*: jint {.`static`.}
  PLAYBACK_POSITION_INVALID*: jlong {.`static`.}
  PLAYBACK_POSITION_ALWAYS_UNKNOWN*: jlong {.`static`.}
  PLAYBACK_SPEED_1X*: jfloat {.`static`.}
  PLAYBACKINFO_PLAYBACK_TYPE*: jint {.`static`.}
  PLAYBACKINFO_VOLUME*: jint {.`static`.}
  PLAYBACKINFO_VOLUME_MAX*: jint {.`static`.}
  PLAYBACKINFO_VOLUME_HANDLING*: jint {.`static`.}
  PLAYBACKINFO_USES_STREAM*: jint {.`static`.}
  FLAG_KEY_MEDIA_PREVIOUS*: jint {.`static`.}
  FLAG_KEY_MEDIA_REWIND*: jint {.`static`.}
  FLAG_KEY_MEDIA_PLAY*: jint {.`static`.}
  FLAG_KEY_MEDIA_PLAY_PAUSE*: jint {.`static`.}
  FLAG_KEY_MEDIA_PAUSE*: jint {.`static`.}
  FLAG_KEY_MEDIA_STOP*: jint {.`static`.}
  FLAG_KEY_MEDIA_FAST_FORWARD*: jint {.`static`.}
  FLAG_KEY_MEDIA_NEXT*: jint {.`static`.}
  FLAG_KEY_MEDIA_POSITION_UPDATE*: jint {.`static`.}
  FLAG_KEY_MEDIA_RATING*: jint {.`static`.}
  FLAGS_KEY_MEDIA_NONE*: jint {.`static`.}
  FLAG_INFORMATION_REQUEST_METADATA*: jint {.`static`.}
  FLAG_INFORMATION_REQUEST_KEY_MEDIA*: jint {.`static`.}
  FLAG_INFORMATION_REQUEST_PLAYSTATE*: jint {.`static`.}
  FLAG_INFORMATION_REQUEST_ALBUM_ART*: jint {.`static`.}
  MEDIA_POSITION_READABLE*: jint {.`static`.}
  MEDIA_POSITION_WRITABLE*: jint {.`static`.}
  DEFAULT_PLAYBACK_VOLUME_HANDLING*: jint {.`static`.}
  DEFAULT_PLAYBACK_VOLUME*: jint {.`static`.}
  RCSE_ID_UNREGISTERED*: jint {.`static`.}

jclass android.media.RemoteControlClient.MetadataEditor* of JVMObject:
  proc clone*(): JObject
  proc putString*(key: jint, value: string): MetadataEditor
  proc putLong*(key: jint, value: jlong): MetadataEditor
  proc putBitmap*(key: jint, bitmap: Bitmap): MetadataEditor
  proc putObject*(key: jint, object: JObject): MetadataEditor
  proc clear*()
  proc apply*()

jclass android.media.RemoteControlClient.OnMetadataUpdateListener* of JVMObject:
  proc onMetadataUpdate*(key: jint, newValue: JObject)

jclass android.media.MetadataEditor* of MediaMetadataEditor:
  proc clone*(): JObject
  proc putString*(key: jint, value: string): MetadataEditor
  proc putLong*(key: jint, value: jlong): MetadataEditor
  proc putBitmap*(key: jint, bitmap: Bitmap): MetadataEditor
  proc putObject*(key: jint, object: JObject): MetadataEditor
  proc clear*()
  proc apply*()
  BITMAP_KEY_ARTWORK*: jint {.`static`.}
  METADATA_KEY_ARTWORK*: jint {.`static`.}

jclass android.media.OnMetadataUpdateListener* of JVMObject:
  proc onMetadataUpdate*(key: jint, newValue: JObject)


