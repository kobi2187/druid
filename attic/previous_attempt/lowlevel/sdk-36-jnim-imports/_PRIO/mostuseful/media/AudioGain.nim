import jnim

jclass android.media.AudioGain* of JVMObject:
  proc mode*(): jint
  proc channelMask*(): jint
  proc minValue*(): jint
  proc maxValue*(): jint
  proc defaultValue*(): jint
  proc stepValue*(): jint
  proc rampDurationMinMs*(): jint
  proc rampDurationMaxMs*(): jint
  proc buildConfig*(mode: jint, channelMask: jint, values: seq[jint], rampDurationMs: jint): AudioGainConfig
  MODE_JOINT*: jint {.`static`.}
  MODE_CHANNELS*: jint {.`static`.}
  MODE_RAMP*: jint {.`static`.}

