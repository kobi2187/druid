import jnim

jclass android.media.PlayerProxy* of JVMObject:
  proc start*()
  proc pause*()
  proc stop*()
  proc setVolume*(vol: jfloat)
  proc setPan*(pan: jfloat)
  proc setStartDelayMs*(delayMs: jint)
  proc applyVolumeShaper*(configuration: VolumeShaper.Configuration, operation: VolumeShaper.Operation)

