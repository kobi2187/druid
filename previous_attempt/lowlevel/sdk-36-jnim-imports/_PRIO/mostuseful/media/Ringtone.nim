import jnim

jclass android.media.Ringtone* of JVMObject:
  proc setStreamType*(streamType: jint)
  proc getStreamType*(): jint
  proc setAudioAttributes*(attributes: AudioAttributes)
  proc setAudioAttributesField*(attributes: AudioAttributes)
  proc preferBuiltinDevice*(enable: jboolean): jboolean
  proc createLocalMediaPlayer*(): jboolean
  proc hasHapticChannels*(): jboolean
  proc hasLocalPlayer*(): jboolean
  proc getAudioAttributes*(): AudioAttributes
  proc setLooping*(looping: jboolean)
  proc isLooping*(): jboolean
  proc setVolume*(volume: jfloat)
  proc getVolume*(): jfloat
  proc setHapticGeneratorEnabled*(enabled: jboolean): jboolean
  proc isHapticGeneratorEnabled*(): jboolean
  proc getTitle*(context: Context): string
  proc getTitle*(context: Context, uri: Uri, followSettingsUri: jboolean, allowRemote: jboolean): string {.`static`.}
  proc setUri*(uri: Uri)
  proc setVolumeShaperConfig*(volumeShaperConfig: VolumeShaper.Configuration)
  proc setUri*(uri: Uri, volumeShaperConfig: VolumeShaper.Configuration)
  proc getVibrationEffect*(): VibrationEffect
  proc getUri*(): Uri
  proc play*()
  proc stop*()
  proc isPlaying*(): jboolean

