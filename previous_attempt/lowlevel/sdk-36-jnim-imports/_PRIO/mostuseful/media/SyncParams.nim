import jnim

jclass android.media.SyncParams* of JVMObject:
  proc allowDefaults*(): SyncParams
  proc setAudioAdjustMode*(audioAdjustMode: jint): SyncParams
  proc getAudioAdjustMode*(): jint
  proc setSyncSource*(syncSource: jint): SyncParams
  proc getSyncSource*(): jint
  proc setTolerance*(tolerance: jfloat): SyncParams
  proc getTolerance*(): jfloat
  proc setFrameRate*(frameRate: jfloat): SyncParams
  proc getFrameRate*(): jfloat
  SYNC_SOURCE_DEFAULT*: jint {.`static`.}
  SYNC_SOURCE_SYSTEM_CLOCK*: jint {.`static`.}
  SYNC_SOURCE_AUDIO*: jint {.`static`.}
  SYNC_SOURCE_VSYNC*: jint {.`static`.}
  AUDIO_ADJUST_MODE_DEFAULT*: jint {.`static`.}
  AUDIO_ADJUST_MODE_STRETCH*: jint {.`static`.}
  AUDIO_ADJUST_MODE_RESAMPLE*: jint {.`static`.}

