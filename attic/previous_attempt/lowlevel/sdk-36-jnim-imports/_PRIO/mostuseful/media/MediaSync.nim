import jnim

jclass android.media.MediaSync* of JVMObject:
  proc release*()
  proc setCallback*(cb: Callback, handler: Handler)
  proc setOnErrorListener*(listener: OnErrorListener, handler: Handler)
  proc setSurface*(surface: Surface)
  proc setAudioTrack*(audioTrack: AudioTrack)
  proc createInputSurface*(): Surface
  proc setPlaybackParams*(params: PlaybackParams)
  proc getPlaybackParams*(): PlaybackParams
  proc setSyncParams*(params: SyncParams)
  proc getSyncParams*(): SyncParams
  proc flush*()
  proc getTimestamp*(): MediaTimestamp
  proc queueAudio*(audioData: ByteBuffer, bufferId: jint, presentationTimeUs: jlong)
  MEDIASYNC_ERROR_AUDIOTRACK_FAIL*: jint {.`static`.}
  MEDIASYNC_ERROR_SURFACE_FAIL*: jint {.`static`.}

jclass android.media.MediaSync.Callback* of JVMObject:
  proc onAudioBufferConsumed*(sync: MediaSync, audioBuffer: ByteBuffer, bufferId: jint)

jclass android.media.Callback* of JVMObject:
  proc onAudioBufferConsumed*(sync: MediaSync, audioBuffer: ByteBuffer, bufferId: jint)

