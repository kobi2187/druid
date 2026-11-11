import jnim

jclass android.media.SoundPool* of PlayerBase:
  proc release*()
  proc load*(path: string, priority: jint): jint
  proc load*(context: Context, resId: jint, priority: jint): jint
  proc load*(afd: AssetFileDescriptor, priority: jint): jint
  proc load*(fd: FileDescriptor, offset: jlong, length: jlong, priority: jint): jint
  proc unload*(soundID: jint): jboolean
  proc play*(soundID: jint, leftVolume: jfloat, rightVolume: jfloat, priority: jint, loop: jint, rate: jfloat): jint
  proc pause*(streamID: jint)
  proc resume*(streamID: jint)
  proc autoPause*()
  proc autoResume*()
  proc stop*(streamID: jint)
  proc setVolume*(streamID: jint, leftVolume: jfloat, rightVolume: jfloat)
  proc setVolume*(streamID: jint, volume: jfloat)
  proc setPriority*(streamID: jint, priority: jint)
  proc setLoop*(streamID: jint, loop: jint)
  proc setRate*(streamID: jint, rate: jfloat)
  proc setOnLoadCompleteListener*(listener: OnLoadCompleteListener)

jclass android.media.SoundPool.OnLoadCompleteListener* of JVMObject:
  proc onLoadComplete*(soundPool: SoundPool, sampleId: jint, status: jint)

jclass android.media.SoundPool.Builder* of JVMObject:
  proc setMaxStreams*(maxStreams: jint): Builder
  proc setAudioAttributes*(attributes: AudioAttributes): Builder
  proc setAudioSessionId*(sessionId: jint): Builder
  proc setContext*(context: Context): Builder
  proc build*(): SoundPool

jclass android.media.OnLoadCompleteListener* of JVMObject:
  proc onLoadComplete*(soundPool: SoundPool, sampleId: jint, status: jint)

jclass android.media.Builder* of JVMObject:
  proc setMaxStreams*(maxStreams: jint): Builder
  proc setAudioAttributes*(attributes: AudioAttributes): Builder
  proc setAudioSessionId*(sessionId: jint): Builder
  proc setContext*(context: Context): Builder
  proc build*(): SoundPool

