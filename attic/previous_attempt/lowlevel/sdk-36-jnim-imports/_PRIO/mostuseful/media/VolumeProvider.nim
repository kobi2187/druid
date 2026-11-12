import jnim

jclass android.media.VolumeProvider* of JVMObject:
  proc getVolumeControl*(): jint
  proc getMaxVolume*(): jint
  proc getCurrentVolume*(): jint
  proc setCurrentVolume*(currentVolume: jint)
  proc getVolumeControlId*(): string
  proc onSetVolumeTo*(volume: jint)
  proc onAdjustVolume*(direction: jint)
  proc setCallback*(callback: Callback)
  VOLUME_CONTROL_FIXED*: jint {.`static`.}
  VOLUME_CONTROL_RELATIVE*: jint {.`static`.}
  VOLUME_CONTROL_ABSOLUTE*: jint {.`static`.}

jclass android.media.VolumeProvider.Callback* of JVMObject:
  proc onVolumeChanged*(volumeProvider: VolumeProvider)

jclass android.media.Callback* of JVMObject:
  proc onVolumeChanged*(volumeProvider: VolumeProvider)

