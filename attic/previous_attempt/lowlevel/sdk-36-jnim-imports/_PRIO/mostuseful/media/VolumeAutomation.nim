import jnim

jclass android.media.VolumeAutomation* of JVMObject:
  proc createVolumeShaper*(configuration: VolumeShaper.Configuration): VolumeShaper

