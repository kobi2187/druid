import jnim

jclass android.media.HwAudioSource* of PlayerBase:
  proc start*()
  proc isPlaying*(): jboolean
  proc stop*()

jclass android.media.HwAudioSource.Builder* of JVMObject:
  proc setAudioAttributes*(attributes: AudioAttributes): Builder
  proc setAudioDeviceInfo*(info: AudioDeviceInfo): Builder
  proc build*(): HwAudioSource

jclass android.media.Builder* of JVMObject:
  proc setAudioAttributes*(attributes: AudioAttributes): Builder
  proc setAudioDeviceInfo*(info: AudioDeviceInfo): Builder
  proc build*(): HwAudioSource

